package cn.edu.hbpu.nil.controller;


import cn.edu.hbpu.nil.entity.ContactGroup;
import cn.edu.hbpu.nil.entity.Friend;
import cn.edu.hbpu.nil.service.ContactGroupService;
import cn.edu.hbpu.nil.service.FriendService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
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
@RequestMapping("/friend")
public class FriendController {
    @Resource
    private FriendService friendService;

    @GetMapping("/getContactsByGroupIndex")
    public List<Friend> getContactsByGroupIndex(int uid, int groupIndex) {
        return friendService.getContactsByGroupIndex(uid, groupIndex);
    }

    @Resource
    private ContactGroupService contactGroupService;

    @PostMapping("/setContactGroupAndName")
    public String setContactGroupAndName(@RequestBody Friend friend) {
        QueryWrapper<Friend> wrapper = new QueryWrapper<>();
        wrapper.eq("userId", friend.getUserId()).eq("contactId", friend.getContactId());
        Friend friendRes = friendService.getOne(wrapper);

        QueryWrapper<ContactGroup> groupQueryWrapper = new QueryWrapper<>();
        groupQueryWrapper.select("groupId").eq("uid", friend.getUserId()).eq("groupIndex", friend.getGroupIndex());
        ContactGroup group = contactGroupService.getOne(groupQueryWrapper);
        if (friendRes != null && group != null) {
            friendRes.setNameMem(friend.getNameMem());
            friendRes.setContactGroupId(group.getGroupId());
            friendService.updateById(friendRes);
            return "success";
        } else {
            return "fail";
        }
    }
}

