package cn.edu.hbpu.nil.controller;


import cn.edu.hbpu.nil.entity.User;
import cn.edu.hbpu.nil.entity.UserHeader;
import cn.edu.hbpu.nil.service.UserHeaderService;
import cn.edu.hbpu.nil.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hbpu
 * @since 2022-08-12
 */
@RestController
@RequestMapping("/userHeader")
public class UserHeaderController {
    @Resource
    private UserHeaderService userHeaderService;

    @GetMapping("/getHistoryHeader")
    public List<String> getHistoryHeader(int uid) {
        QueryWrapper<UserHeader> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("uid", uid).orderByDesc("setTime");
        List<UserHeader> list = userHeaderService.list(queryWrapper);
        List<String> res = new ArrayList<>();
        //第一个为当前头像
        int size = list.size();
        for (int i = 1; i < size; i++) {
            res.add(list.get(i).getPicName());
        }
        System.out.println(res);
        return res;
    }

    @Resource
    private UserService userService;

    @GetMapping("/modifyHeaderByHistory")
    public void modifyHeaderByHistory(int uid, String picName) {
        UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("uid", uid).set("header", picName);
        userService.update(updateWrapper);
        UpdateWrapper<UserHeader> userHeaderUpdateWrapper = new UpdateWrapper<>();
        //picName已建立索引
        userHeaderUpdateWrapper.eq("picName", picName).set("setTime", LocalDateTime.now());
        userHeaderService.update(userHeaderUpdateWrapper);
    }

}

