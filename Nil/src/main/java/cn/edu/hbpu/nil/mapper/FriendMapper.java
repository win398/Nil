package cn.edu.hbpu.nil.mapper;

import cn.edu.hbpu.nil.entity.Friend;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author hbpu
 * @since 2022-07-18
 */
@Mapper
public interface FriendMapper extends BaseMapper<Friend> {
    @Select("select u.uid, u.userName, u.header, u.userNum, f.createdTime, f.isFavor, f.nameMem, i.*, g.groupIndex " +
            "from friend f " +
            "left join user u on f.contactId = u.uid " +
            "left join user_info i on u.uid = i.uid " +
            "left join contact_group g on f.contactGroupId = g.groupId " +
            "where f.userId = #{uid} and g.groupIndex = #{groupIndex}")
    List<Friend> getContactsByGroupIndex(int uid, int groupIndex);

    @Select("select u.uid, u.userName, u.header, u.userNum, f.createdTime, f.isFavor, f.nameMem, i.*, g.groupIndex " +
            "from friend f " +
            "left join user u on f.contactId = u.uid " +
            "left join user_info i on u.uid = i.uid " +
            "left join contact_group g on f.contactGroupId = g.groupId " +
            "where f.userId = #{uid} and f.isFavor = 1")
    List<Friend> getFavorContacts(int uid);
}
