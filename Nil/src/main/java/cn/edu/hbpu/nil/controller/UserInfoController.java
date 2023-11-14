package cn.edu.hbpu.nil.controller;

import cn.edu.hbpu.nil.entity.UserInfo;
import cn.edu.hbpu.nil.service.UserInfoService;
import cn.hutool.core.io.file.FileNameUtil;
import cn.hutool.core.lang.UUID;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hbpu
 * @since 2022-07-02
 */
@RestController
@RequestMapping("/userInfo")
public class UserInfoController {
    @Resource
    private UserInfoService userInfoService;

    @Value("${web.nil_pic}")
    private String nil_pic;

    @PostMapping("/uploadBgImg")
    public String uploadBgImg(Integer uid, MultipartFile imgFile) {
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
        }
        //修改数据库信息
        QueryWrapper<UserInfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("uid", uid);
        UserInfo userInfo = userInfoService.getOne(queryWrapper);
        if (userInfo == null) {
            userInfo = new UserInfo();
            userInfo.setUid(uid);
            userInfo.setBgImg(newImgFileName);
            userInfoService.save(userInfo);
        } else {
            userInfo.setBgImg(newImgFileName);
            userInfoService.updateById(userInfo);
        }
        return "success";
    }

    @GetMapping("/getUserBackground")
    public String getUserBackground(int uid) {
        QueryWrapper<UserInfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("bgImg").eq("uid", uid);
        return userInfoService.getOne(queryWrapper).getBgImg();
    }

    @GetMapping("/modifySignature")
    public void modifySignature(int uid, String newSignature) {
        UpdateWrapper<UserInfo> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("uid", uid).set("signature", newSignature);
        boolean updated = userInfoService.update(updateWrapper);
        //如果没有发生修改，说明数据库表还没有该用户的其他信息，则创建
        if (!updated) {
            UserInfo userInfo = new UserInfo();
            userInfo.setSignature(newSignature);
            userInfo.setUid(uid);
            userInfoService.save(userInfo);
        }
    }

    @PostMapping("/modifyInfo")
    public void modifyInfo(@RequestBody UserInfo userInfo) {
        UpdateWrapper<UserInfo> updateWrapper = new UpdateWrapper<>();
        updateWrapper
                .eq("uid", userInfo.getUid())
                .set("sex", userInfo.getSex())
                .set("province", userInfo.getProvince())
                .set("city", userInfo.getCity())
                .set("birth", userInfo.getBirth());
        boolean updated = userInfoService.update(updateWrapper);
        //如果没有发生修改，说明数据库表还没有该用户的其他信息，则创建
        if (!updated) {
            userInfoService.save(userInfo);
        }
    }
}

