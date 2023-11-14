package cn.edu.hbpu.nil.mapper;

import cn.edu.hbpu.nil.entity.Converse;
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
 * @since 2022-08-09
 */
@Mapper
public interface ConverseMapper extends BaseMapper<Converse> {
    @Select("select c.*, u.userName senderName, u.header senderHeader " +
            "from converse c " +
            "left join user u " +
            "on c.sendAccount = u.userNum " +
            "where c.receiveAccount = #{receiveAccount} and c.msgState = 2")
    List<Converse> refreshConverse(String receiveAccount);
}
