package cn.edu.hbpu.nil.controller;


import cn.edu.hbpu.nil.config.ZhenZiCode;
import cn.edu.hbpu.nil.entity.ContactGroup;
import cn.edu.hbpu.nil.entity.User;
import cn.edu.hbpu.nil.entity.UserHeader;
import cn.edu.hbpu.nil.service.ContactGroupService;
import cn.edu.hbpu.nil.service.UserHeaderService;
import cn.edu.hbpu.nil.service.UserService;
import cn.edu.hbpu.nil.util.JwtUtil;
import cn.hutool.core.io.file.FileNameUtil;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.Objects;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hbpu
 * @since 2022-05-17
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @GetMapping("/ping")
    public String test() {
        return "accessible!";
    }

    @Resource
    private UserService userService;
    @Resource
    private RedisTemplate<String, String> redisTemplate;
    @Resource
    private RocketMQTemplate rocketMQTemplate;
    @PostMapping("/login")
    public String login(@RequestBody User u) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.select().eq("userNum", u.getUserNum()).eq("password", u.getPassword());
        User user = userService.getOne(wrapper);
        if (user != null){
            if (user.getType() == 0) return "account_forbade";
            String token = JwtUtil.createUserToken(user);
            //token保存30天
            if (token != null) {
                redisTemplate.opsForValue().set( Objects.requireNonNull(JwtUtil.getTokenSubject(token)), token, Duration.ofDays(30));
                rocketMQTemplate.convertAndSend("nil-login-log", user);
                //System.out.println(token);
                return token;
            }
        }
        return null;
    }



    @Resource
    private ContactGroupService groupService;

    @PostMapping("/register")
    public String register(@RequestBody User u, String checkCode) {
        String code = redisTemplate.opsForValue().get(u.getPhoneNum());
        System.out.println(u);
        if (code == null) {
            return "code_expired";
        } else if (!code.equals(checkCode)) {
            return "error_code";
        }
        String randomUserNum;
        try {
            //普通用户
            u.setType(1);
            //默认图片default.jpg
            u.setHeader("default.jpg");
            u.setRegisterTime(LocalDateTime.now());
            //账号长度5-10位
            int len = RandomUtil.randomChar("456789") - '0';
            //System.out.println(len);
            QueryWrapper<User> wrapper;
            do {
                randomUserNum = RandomUtil.randomChar("123456789") + RandomUtil.randomString("0123456789", len);
                wrapper = new QueryWrapper<>();
                wrapper.eq("userNum", randomUserNum);
            } while (userService.getOne(wrapper) != null);

            u.setUserNum(randomUserNum);
            //System.out.println(u.toString());
            userService.save(u);
            //添加默认分组
            //用户默认有特别关心和我的好友两个分组
            ContactGroup group1 = new ContactGroup();
            group1.setUid(u.getUid());
            group1.setGroupIndex(0);
            group1.setGroupName("特别关心");
            groupService.save(group1);
            ContactGroup group2 = new ContactGroup();
            group2.setUid(u.getUid());
            group2.setGroupIndex(1);
            group2.setGroupName("我的好友");
            groupService.save(group2);
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
        return randomUserNum;
    }

    @Value("${web.nil_pic}")
    private String imagePath;
    @GetMapping(value = "/getHeaderByAccount",produces = MediaType.IMAGE_PNG_VALUE)
    public byte[] getHeaderByAccount(String account) throws Exception {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("header").eq("userNum", account);
        User u = userService.getOne(queryWrapper);

        if (u != null) {
            String header = u.getHeader();
            //System.out.println(imagePath + header);
            File file = new File(imagePath + "/" + header);
            BufferedImage bufferedImage = ImageIO.read(new FileInputStream(file));
            //System.out.println(bufferedImage);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, "JPEG", out);

            out.close();
            return out.toByteArray();
        }
        return null;
    }

    @GetMapping("/getUserInfo")
    public User getUserInfo(@RequestHeader("token") String token) {
        User u = JwtUtil.parseUser(token);
        assert u != null;
        return userService.getUser(u.getUid());
    }

    @GetMapping("getUserByAccountOrPhoneNum")
    public User getUserByAccountOrPhoneNum(String queryNum, int uid) {
        return userService.getUserByAccountOrPhoneNum(queryNum, uid);
    }

    @GetMapping("/modifyUsername")
    public void modifyUsername(int uid, String newUsername) {
        UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("uid", uid).set("userName", newUsername);
        boolean updated = userService.update(updateWrapper);
    }


    @Value("${web.nil_pic}")
    private String nil_pic;
    @Resource
    private UserHeaderService userHeaderService;

    @PostMapping("/modifyHeader")
    public String modifyHeader(Integer uid, MultipartFile imgFile) {
        if (imgFile.isEmpty()) {
            return "imgEmpty";
        }
        //保存图片
        String imgFileName = imgFile.getOriginalFilename();
        String newImgFileName = UUID.fastUUID().toString(true) + '.' + FileNameUtil.extName(imgFileName);
        File saveFile = new File(nil_pic + newImgFileName);
        try {
            imgFile.transferTo(saveFile);
        } catch (IOException e) {
            e.printStackTrace();
            return "fail";
        }
        //修改数据库信息
        UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("uid", uid).set("header", newImgFileName);
        userService.update(updateWrapper);
        //记录到头像表
        UserHeader header = new UserHeader();
        header.setUid(uid);
        header.setPicName(newImgFileName);
        header.setSetTime(LocalDateTime.now());
        userHeaderService.save(header);
        return newImgFileName;
    }

    //发送验证码
    @Resource
    private ZhenZiCode zhenZiCode;
    @PostMapping("/getCheckCode")
    public String getCheckCode(String phoneNum) {
        String checkCode =  RandomUtil.randomNumbers(6);
        if (redisTemplate.opsForValue().get(phoneNum) == null) {
            try {
                String res = zhenZiCode.sendMessage(checkCode, phoneNum);
                System.out.println("-----sendCode-----" + checkCode + " result:" + res);
                //有效期5分钟
                redisTemplate.opsForValue().set(phoneNum, checkCode, Duration.ofMinutes(5));
                return res;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "hasSent";
    }

    @PostMapping("/manLogin")
    public String manLogin(@RequestBody User u) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.select().eq("userNum", u.getUserNum()).eq("password", u.getPassword()).eq("type", 2);
        User user = userService.getOne(wrapper);
        if (user != null){
            String token = JwtUtil.createUserToken(user);
            //token保存30天
            if (!StrUtil.isEmpty(token)) {
                redisTemplate.opsForValue().set( Objects.requireNonNull(JwtUtil.getTokenSubject(token)), token, Duration.ofDays(30));
                rocketMQTemplate.convertAndSend("nil-login-log", user);
                return token;
            }
        }
        return null;
    }

    @GetMapping("/getManInfo")
    public User getManInfo(@RequestHeader("token") String token) {
        User u = JwtUtil.parseUser(token);
        assert u != null;
        return userService.getUser(u.getUid());
    }

    @GetMapping("/getUserList")
    public IPage<User> getUserList(Page<User> page) {
        return userService.getUserList(page);
    }

    @GetMapping("/searchUser")
    public IPage<User> searchUser(Page<User> page, String keyword) {
        return userService.searchUser(page, keyword);
    }

    @PostMapping("/disableUser")
    public User disableUser(@RequestBody User u) {
        return userService.disableUser(u);
    }

    @GetMapping("getTodayRegisters")
    public long getTodayRegisters() {
        return userService.getTodayRegisters();
    }

    @GetMapping("getCountRegisters")
    public long getCountRegisters() {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type", 0).or().eq("type", 1);
        return userService.count(queryWrapper);
    }

    @GetMapping("/getWeekCounts")
    public Map<String, Long> getWeekCounts() {
        return userService.getWeekCounts();
    }
}

