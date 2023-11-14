package cn.edu.hbpu.nil.mapper;

import cn.edu.hbpu.nil.entity.UpdateComment;
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
 * @since 2022-08-16
 */
@Mapper
public interface UpdateCommentMapper extends BaseMapper<UpdateComment> {
    @Select("select *, u.userName username from update_comment c " +
            "left join user u " +
            "on u.uid = c.uid " +
            "where c.sid = #{sid}")
    List<UpdateComment> getComments(int sid);
}
