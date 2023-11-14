package cn.edu.hbpu.nil.serviceImpl;

import cn.edu.hbpu.nil.entity.Friend;
import cn.edu.hbpu.nil.entity.User;
import cn.edu.hbpu.nil.mapper.UserMapper;
import cn.edu.hbpu.nil.service.FriendService;
import cn.edu.hbpu.nil.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hbpu
 * @since 2022-05-17
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Resource
    private UserMapper userMapper;
    @Resource
    private FriendService friendService;

    @Override
    public User getUser(int uid) {
        return userMapper.getUser(uid);
    }

    @Override
    public User getUserByAccountOrPhoneNum(String queryNum, int uid) {
        User user = userMapper.getUserByAccountOrPhoneNum(queryNum);
        if (user != null && uid != -1) {
            QueryWrapper<Friend> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("userId", uid).eq("contactId", user.getUid());
            if (friendService.getOne(queryWrapper) != null) {
                user.setFriend(true);
            }
            return user;
         } else {
            return null;
        }
    }


    @Override
    public IPage<User> getUserList(IPage<User> page) {
        return userMapper.getUserList(page);
    }

    @Override
    public IPage<User> searchUser(IPage<User> page, String keyword) {
        return userMapper.searchUser(page, keyword);
    }

    @Override
    public User disableUser(User u) {
        switch (u.getType()) {
            //0表示普通用户禁用状态 1表示普通用户正常状态 2为管理员用户
            case 0:
                u.setType(1);
                break;
            case 1:
                u.setType(0);
                break;
            default:
                return null;
        }
        UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("type", u.getType()).eq("uid", u.getUid());
        update(updateWrapper);
        return u;
    }

    @Override
    public long getTodayRegisters() {
        return userMapper.getTodayRegisters();
    }

    @Override
    public Map<String, Long> getWeekCounts() {
        List<Map<String, Object>> map = userMapper.getWeekCounts();
        Map<String, Long> res = new TreeMap<>();
        System.out.println(map);
        int k = 0; //结果集指示器
        for (int i = 6; i > 0; i--) {
            //格式化数据，将无结果置为0加入结果集
            String day_i = LocalDate.now().minusDays(i).format(DateTimeFormatter.ofPattern("MM-dd"));   //第前i天
            if (k >= map.size() || !map.get(k).get("days").equals(day_i)) {
                res.put(day_i, 0L);
            } else {
                res.put(day_i, (Long) map.get(k++).get("count"));
            }
        }
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("MM-dd"));
        if (k >= map.size() || !map.get(k).get("days").equals(today)) {
            res.put("今天", 0L);
        } else {
            res.put("今天", (Long) map.get(k).get("count"));
        }
        return res;
    }


}
