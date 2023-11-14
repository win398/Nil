package cn.edu.hbpu.nil.mapper;

import cn.edu.hbpu.nil.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author hbpu
 * @since 2022-05-17
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
    @Select("select u.uid, u.userName, u.userNum, u.header, u.phoneNum, u.type, o.* " +
            "from user u " +
            "left join user_info o on u.uid = o.uid " +
            "where u.uid = #{uid}")
    User getUser(int uid);

    @Select("select u.uid, u.userName, u.userNum, u.header, u.phoneNum, u.type, " +
            "o.* " +
            "from user u " +
            "left join user_info o on u.uid = o.uid " +
            "where u.userNum = #{queryNum}")
    User getUserByAccountOrPhoneNum(String queryNum);

    @Select("select u.uid, u.userName, u.header " +
            "from user u " +
            "where u.userNum = #{queryNum}")
    User getUserByAccount(String queryNum);

    @Select("select u.uid, u.userName, u.userNum, u.registerTime, u.header, u.phoneNum, u.type, i.* " +
            "from user u left join user_info i " +
            "on u.uid = i.uid " +
            "order by u.registerTime desc")
    IPage<User> getUserList(IPage<User> page);

    @Select("select u.uid, u.userName, u.userNum, u.registerTime, u.header, u.phoneNum, u.type, i.* " +
            "from user u left join user_info i " +
            "on u.uid = i.uid " +
            "where concat(u.uid, u.userName, u.userNum, u.phoneNum, u.registerTime) " +
            "like concat('%', #{keyword}, '%') " +
            "order by u.registerTime desc")
    IPage<User> searchUser(IPage<User> page, String keyword);

    @Select("select count(uid) todayRegisters " +
            "from user " +
            "where to_days(registerTime) = to_days(now()) and (type = 1 or type = 0)")
    long getTodayRegisters();

    @Select("select DATE_FORMAT( registerTime, '%m-%d' ) days, count(*) count " +
            "from user " +
            "where DATE_SUB( CURDATE(), INTERVAL 6 DAY) <= registerTime " +
            "group by days")
    List<Map<String, Object>> getWeekCounts();
}
