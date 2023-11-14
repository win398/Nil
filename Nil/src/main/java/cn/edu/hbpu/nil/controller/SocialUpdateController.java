package cn.edu.hbpu.nil.controller;


import cn.edu.hbpu.nil.entity.*;
import cn.edu.hbpu.nil.service.*;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

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
 * @since 2022-08-16
 */
@RestController
@RequestMapping("/socialUpdate")
public class SocialUpdateController {
    @Resource
    private SocialUpdateService socialUpdateService;

    @PostMapping("/addUpdate")
    public String addUpdate(@RequestParam("parts") List<MultipartFile> parts, int uid, String content) {
        return socialUpdateService.addUpdate(parts, uid, content);
    }

    @GetMapping("/addUpdateWithNoPart")
    public String addUpdateWithNoPart(int uid, String content) {
        SocialUpdate update = new SocialUpdate();
        update.setUid(uid);
        update.setSendTime(LocalDateTime.now());
        update.setContentText(content);
        if (socialUpdateService.save(update)) {
            return "success";
        } else {
            return "fail";
        }
    }

    @Resource
    private FriendService friendService;
    @Resource
    private UpdatePicService updatePicService;
    @Resource
    private UpdateCommentService updateCommentService;
    @Resource
    private UserService userService;
    @Resource
    private LikeService likeService;

    @GetMapping("/getUpdates")
    public Page<SocialUpdate> getUpdates(Page<SocialUpdate> page, int uid) {
        QueryWrapper<Friend> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userId", uid);
        List<Friend> friends = friendService.list(queryWrapper);
        //该用户需要显示动态的用户id列表
        List<Integer> userIds = new ArrayList<>();
        userIds.add(uid);
        for (Friend friend : friends) {
            userIds.add(friend.getContactId());
        }
        QueryWrapper<SocialUpdate> updateQueryWrapper = new QueryWrapper<>();
        updateQueryWrapper.in("uid", userIds).orderByDesc("sendTime");
        return getSocialUpdatePage(page, uid, updateQueryWrapper);
    }

    @GetMapping("/deleteSocialUpdate")
    public void deleteSocialUpdate(int sid) {
        QueryWrapper<UpdatePic> picQueryWrapper = new QueryWrapper<>();
        picQueryWrapper.eq("sid", sid);
        updatePicService.remove(picQueryWrapper);

        QueryWrapper<UpdateComment> commentQueryWrapper = new QueryWrapper<>();
        commentQueryWrapper.eq("sid", sid);
        updateCommentService.remove(commentQueryWrapper);

        socialUpdateService.removeById(sid);
    }


    @GetMapping("/getUpdatesByUid")
    public Page<SocialUpdate> getUpdatesByUid(Page<SocialUpdate> page, int uid) {
        QueryWrapper<SocialUpdate> updateQueryWrapper = new QueryWrapper<>();
        updateQueryWrapper.eq("uid", uid).orderByDesc("sendTime");
        return getSocialUpdatePage(page, uid, updateQueryWrapper);
    }

    @Resource
    private MongoTemplate mongoTemplate;

    @GetMapping("/getPersonalUpdatesOtherInfo")
    public String getPersonalUpdatesOtherInfo(int uid) {
        QueryWrapper<SocialUpdate> updateQueryWrapper = new QueryWrapper<>();
        updateQueryWrapper.select("sid").eq("uid", uid);
        List<SocialUpdate> list = socialUpdateService.list(updateQueryWrapper);

        List<Integer> sids = new ArrayList<>();
        for (SocialUpdate socialUpdate : list) {
            sids.add(socialUpdate.getSid());
        }

        Query query = new Query(Criteria.where("dynamicId").in(sids));
        long favorsNum = mongoTemplate.count(query, "likeDynamic");
        long updatesNum = sids.size();

        System.out.println("favors:" + favorsNum);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("favorsNum", favorsNum);
        jsonObject.put("updatesNum", updatesNum);
        return jsonObject.toJSONString();
    }

    //根据想要获取的动态列表的搜索条件获取目标分页列表
    private Page<SocialUpdate> getSocialUpdatePage(Page<SocialUpdate> page, long uid, QueryWrapper<SocialUpdate> updateQueryWrapper) {
        Page<SocialUpdate> res = socialUpdateService.page(page, updateQueryWrapper);
        int size = res.getRecords().size();
        for (int i = 0; i < size; i++) {
            int sid = res.getRecords().get(i).getSid();
            //图片
            QueryWrapper<UpdatePic> updatePicQueryWrapper = new QueryWrapper<>();
            updatePicQueryWrapper.eq("sid", sid);
            List<UpdatePic> updatePics = updatePicService.list(updatePicQueryWrapper);
            List<String> pics = new ArrayList<>();
            for (UpdatePic updatePic : updatePics) {
                pics.add(updatePic.getPicName());
            }
            res.getRecords().get(i).setPics(pics);
            //评论
            res.getRecords().get(i).setComments(updateCommentService.getComments(sid));
            //点赞列表
            res.getRecords().get(i).setLikes(likeService.getLikeList((long) sid));
            res.getRecords().get(i).setLike(likeService.isLikeDynamic(uid, (long) sid));
            //用户信息
            User user = userService.getById(res.getRecords().get(i).getUid());
            res.getRecords().get(i).setUsername(user.getUserName());
            res.getRecords().get(i).setHeader(user.getHeader());
        }
        return res;
    }

}



