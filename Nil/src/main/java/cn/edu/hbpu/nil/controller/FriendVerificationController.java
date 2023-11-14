package cn.edu.hbpu.nil.controller;


import cn.edu.hbpu.nil.entity.ContactGroup;
import cn.edu.hbpu.nil.entity.Friend;
import cn.edu.hbpu.nil.entity.FriendVerification;
import cn.edu.hbpu.nil.service.ContactGroupService;
import cn.edu.hbpu.nil.service.FriendService;
import cn.edu.hbpu.nil.service.FriendVerificationService;
import cn.edu.hbpu.nil.service.UserService;
import cn.edu.hbpu.nil.util.WebSocketServer;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hbpu
 * @since 2022-07-18
 */
@RestController
@RequestMapping("/friendVerification")
public class FriendVerificationController {
    private static final int WAIT_VER = 1;
    private static final int HAS_READ = 2;
    private static final int HAS_AGREED = 3;
    private static final int HAS_REFUSED = 4;

    @Resource
    private FriendVerificationService friendVerificationService;
    @Resource
    private UserService userService;

    @PostMapping("/sendInfo")
    public String sendInfo(@RequestBody FriendVerification verification) {
        verification.setSendTime(LocalDateTime.now());
        //状态 1未验证 2已读 3通过 4拒绝
        verification.setVerifyState(WAIT_VER);
        if (friendVerificationService.save(verification)) {
            //推送消息给对方客户端
            //准备消息
            List<String> list = new ArrayList<>();
            list.add(WebSocketServer.VER_MESSAGE);
            list.add("有新的验证信息");
            String msg = JSONUtil.toJsonStr(list);
            //准备账户
            HashSet<String> accounts = new HashSet<>();
            String toAccount = userService.getById(verification.getToUid()).getUserNum();
            accounts.add(toAccount);
            try {
                WebSocketServer.sendMessage(msg, accounts);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "success";
        } else {
            return "fail";
        }
    }

    @GetMapping("/refuseVerification")
    public String refuseVerification(int fromUid, int toUid) {
        QueryWrapper<FriendVerification> wrapper = new QueryWrapper<>();
        wrapper.eq("fromUid", fromUid).eq("toUid", toUid);
        List<FriendVerification> list = friendVerificationService.list(wrapper);
        if (list == null || list.isEmpty()) return "fail";
        UpdateWrapper<FriendVerification> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("fromUid", list.get(0).getFromUid()).eq("toUid", list.get(0).getToUid()).set("verify_state", HAS_REFUSED);
        friendVerificationService.update(updateWrapper);
        return "success";
    }

    @Resource
    private FriendService friendService;
    @Resource
    private ContactGroupService groupService;

    @GetMapping("/agreeVerification")
    public String agreeVerification(int fromUid, int toUid) {
        QueryWrapper<FriendVerification> wrapper = new QueryWrapper<>();
        wrapper.eq("fromUid", fromUid).eq("toUid", toUid);
        List<FriendVerification> verifications = friendVerificationService.list(wrapper);
        if (verifications == null || verifications.isEmpty()) return "fail";
        UpdateWrapper<FriendVerification> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("fromUid", verifications.get(0).getFromUid()).eq("toUid", verifications.get(0).getToUid()).set("verify_state", HAS_AGREED);
        friendVerificationService.update(updateWrapper);
        //为双方添加联系人 以最后一个好友请求信息为准
        FriendVerification verification = verifications.get(verifications.size() - 1);
        //如果已经添加
        QueryWrapper<Friend> friendQueryWrapper = new QueryWrapper<>();
        friendQueryWrapper.eq("userId", verification.getFromUid()).eq("contactId", verification.getToUid());
        if (friendService.getOne(friendQueryWrapper) != null) {
            return "success";
        }
        LocalDateTime now = LocalDateTime.now();
        //添加方 fromUid
        Friend friend = new Friend();
        friend.setUserId(verification.getFromUid());
        friend.setContactId(verification.getToUid());
        QueryWrapper<ContactGroup> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("groupId").eq("uid", verification.getFromUid()).eq("groupIndex", verification.getGroupIndex());
        List<ContactGroup> list = groupService.list(queryWrapper);
        friend.setContactGroupId(list.get(0).getGroupId());
        friend.setCreatedTime(now);
        friend.setNameMem(verification.getNameMem());
        friend.setIsFavor(false);
        friendService.save(friend);
        //接受方 toUid
        Friend toFriend = new Friend();
        toFriend.setUserId(verification.getToUid());
        toFriend.setContactId(verification.getFromUid());
        QueryWrapper<ContactGroup> queryWrapper1 = new QueryWrapper<>();
        queryWrapper.eq("uid", verification.getToUid());
        toFriend.setCreatedTime(now);
        List<ContactGroup> groups = groupService.list(queryWrapper1);
        toFriend.setContactGroupId(groups.get(1).getGroupId());
        toFriend.setIsFavor(false);
        friendService.save(toFriend);

        //通知发送方刷新验证消息和好友列表
        //准备消息
        List<String> msgList = new ArrayList<>();
        msgList.add(WebSocketServer.VER_AGREED);
        msgList.add("同意好友请求");
        String msg = JSONUtil.toJsonStr(msgList);
        //准备账户
        HashSet<String> accounts = new HashSet<>();
        String toAccount = userService.getById(fromUid).getUserNum();
        accounts.add(toAccount);
        try {
            WebSocketServer.sendMessage(msg, accounts);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }

    @GetMapping("/getVerificationsByUid")
    public List<FriendVerification> getVerificationsByUid(int uid, int vid) {
        return friendVerificationService.getVerificationsByUid(uid, vid);
    }

    @GetMapping("/setFlagHasRead")
    public void setFlagHasRead(int uid) {
        UpdateWrapper<FriendVerification> wrapper = new UpdateWrapper<>();
        wrapper.set("verify_state", HAS_READ).eq("verify_state", WAIT_VER).eq("toUid", uid);
        friendVerificationService.update(wrapper);
    }

    @GetMapping("/updateLocalVerifications")
    public List<FriendVerification> updateLocalVerifications(int uid, int startVid, int endVid) {
        QueryWrapper<FriendVerification> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("verificationId", "verify_state").and(wrapper -> wrapper.eq("fromUid", uid).or().eq("toUid", uid)).ge("verificationId", startVid).le("verificationId", endVid);
        return friendVerificationService.list(queryWrapper);
    }

}

