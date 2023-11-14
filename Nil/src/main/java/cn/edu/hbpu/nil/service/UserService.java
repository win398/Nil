package cn.edu.hbpu.nil.service;

import cn.edu.hbpu.nil.entity.User;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hbpu
 * @since 2022-05-17
 */
public interface UserService extends IService<User> {
    User getUser(int uid);
    User getUserByAccountOrPhoneNum(String queryNum, int uid);
    IPage<User> getUserList(IPage<User> page);
    IPage<User> searchUser(IPage<User> page, String keyword);
    User disableUser(User u);
    long getTodayRegisters();
    Map<String, Long> getWeekCounts();
}
