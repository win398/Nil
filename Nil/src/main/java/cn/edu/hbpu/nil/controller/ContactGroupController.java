package cn.edu.hbpu.nil.controller;


import cn.edu.hbpu.nil.entity.ContactGroup;
import cn.edu.hbpu.nil.entity.Friend;
import cn.edu.hbpu.nil.service.ContactGroupService;
import cn.edu.hbpu.nil.service.FriendService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hbpu
 * @since 2022-07-13
 */
@RestController
@RequestMapping("/contactGroup")
public class ContactGroupController {
    @Resource
    private ContactGroupService groupService;
    @Resource
    private FriendService friendService;

@GetMapping("/getUserGroupInfo")
public List<ContactGroup> getUserGroupInfo(int uid) {
    QueryWrapper<ContactGroup> wrapper = new QueryWrapper<>();
    wrapper.select("groupName", "groupIndex").eq("uid", uid).orderByAsc("groupIndex");
    List<ContactGroup> list = groupService.list(wrapper);
    //总人数和在线人数
    List<ContactGroup> res = new ArrayList<>();
    for (ContactGroup group : list) {
        List<Friend> friends = friendService.getContactsByGroupIndex(uid, group.getGroupIndex());
        group.setTotal(friends.size());
        int online = 0;
        for (Friend friend : friends) {
            if (friend.getState().equals("在线")) {
                online++;
            }
        }
        group.setOnline(online);
        res.add(group);
    }
    return res;
}
}

