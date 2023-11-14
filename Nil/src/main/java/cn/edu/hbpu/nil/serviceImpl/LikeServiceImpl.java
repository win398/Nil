package cn.edu.hbpu.nil.serviceImpl;

import cn.edu.hbpu.nil.entity.Like;
import cn.edu.hbpu.nil.entity.LikeDynamic;
import cn.edu.hbpu.nil.service.LikeService;
import cn.edu.hbpu.nil.service.UserService;
import com.mongodb.client.result.DeleteResult;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class LikeServiceImpl implements LikeService {

    @Resource
    private MongoTemplate mongoTemplate;
    @Resource
    private RedisTemplate<String, String> redisTemplate;
    private static final String LIKE_USER_KEY = "LIKE_USER_KEY_";

    private String getUserKey(Long userId) {
        return LIKE_USER_KEY + userId;
    }

    @Override
    public boolean likeDynamic(Long userId, Long dynamicId) {
        Query query = Query.query(Criteria.where("userId").is(userId)
                .and("dynamicId").is(dynamicId));
        List<LikeDynamic> likeDynamics = mongoTemplate.find(query, LikeDynamic.class);
        if (!likeDynamics.isEmpty()) return true;
        LikeDynamic likeDynamic = new LikeDynamic();
        likeDynamic.setId(ObjectId.get());
        likeDynamic.setUserId(userId);
        likeDynamic.setDynamicId(dynamicId);
        likeDynamic.setCreatedTime(LocalDateTime.now());
        try {
            mongoTemplate.save(likeDynamic);
            redisTemplate.opsForHash().put(getUserKey(userId), String.valueOf(dynamicId), "1");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean cancelLike(Long userId, Long dynamicId) {
        Query query = Query.query(Criteria.where("userId").is(userId)
                .and("dynamicId").is(dynamicId));
        DeleteResult result = mongoTemplate.remove(query, LikeDynamic.class);
        if (result.getDeletedCount() > 0) {
            redisTemplate.opsForHash().delete(getUserKey(userId), String.valueOf(dynamicId));
            return true;
        }
        return false;
    }

    @Override
    public boolean isLikeDynamic(Long userId, Long dynamicId) {
        return redisTemplate.opsForHash().hasKey(getUserKey(userId), String.valueOf(dynamicId));
    }

    @Resource
    private UserService userService;

    @Override
    public List<Like> getLikeList(Long dynamicId) {
        Query query = new Query(Criteria.where("dynamicId").is(dynamicId));
        List<LikeDynamic> likeDynamics = mongoTemplate.find(query, LikeDynamic.class);
        List<Like> res = new ArrayList<>();
        if (likeDynamics.isEmpty()) return res;
        for (LikeDynamic dynamic : likeDynamics) {
            String userName = userService.getById(dynamic.getUserId()).getUserName();
            Like like = new Like();
            like.setUid(Math.toIntExact(dynamic.getUserId()));
            like.setUsername(userName);
            like.setSid(Math.toIntExact(dynamicId));
            res.add(like);
        }
        return res;
    }
}
