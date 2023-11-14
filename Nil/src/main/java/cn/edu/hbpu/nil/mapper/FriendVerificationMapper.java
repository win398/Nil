package cn.edu.hbpu.nil.mapper;

import cn.edu.hbpu.nil.entity.FriendVerification;
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
public interface FriendVerificationMapper extends BaseMapper<FriendVerification> {
    @Select("select v.*, u.userName, u.header, u1.userName toUserName, u1.header toUserHeader " +
            "from friend_verification v " +
            "left join user u " +
            "on u.uid = v.fromUid " +
            "left join user u1 " +
            "on u1.uid = v.toUid " +
            "where (v.toUid = #{uid} or v.fromUid = #{uid}) and v.verify_state = 1 and v.verificationId > #{vid} " +
            "order by v.sendTime desc"
    )
    List<FriendVerification> getVerificationsByUid(int uid, int vid);

}
