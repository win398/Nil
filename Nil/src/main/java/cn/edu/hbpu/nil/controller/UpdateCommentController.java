package cn.edu.hbpu.nil.controller;


import cn.edu.hbpu.nil.entity.UpdateComment;
import cn.edu.hbpu.nil.service.UpdateCommentService;
import cn.edu.hbpu.nil.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hbpu
 * @since 2022-08-16
 */
@RestController
@RequestMapping("/updateComment")
public class UpdateCommentController {
    @Resource
    private UpdateCommentService updateCommentService;
    @Resource
    private UserService userService;

    @GetMapping("/submitComment")
    public String submitComment(int uid, int sid, String content) {
        UpdateComment comment = new UpdateComment();
        comment.setSid(sid);
        comment.setUid(uid);
        comment.setContentText(content);
        if (updateCommentService.save(comment)) {
            return userService.getById(uid).getUserName();
        } else {
            return "fail";
        }
    }
}

