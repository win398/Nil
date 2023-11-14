package cn.edu.hbpu.nil.controller;

import cn.edu.hbpu.nil.service.LikeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/like")
public class LikeController {
    @Resource
    private LikeService likeService;
    @GetMapping("/likeDynamic")
    public boolean likeDynamic(Long userId, Long dynamicId) {
        System.out.println("-----" + userId + " " + dynamicId);
        //点赞，将用户点赞相关信息封装成文档形式存入mongoDB集合中
        return likeService.likeDynamic(userId, dynamicId);
    }
    @GetMapping("/cancelLike")
    public boolean cancelFavor(Long userId, Long dynamicId) {
        //取消点赞，删除mongoDB中对应数据文档
        return likeService.cancelLike(userId, dynamicId);
    }

}
