package cn.edu.hbpu.nil.mapper;

import cn.edu.hbpu.nil.entity.Log;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author hbpu
 * @since 2022-08-20
 */
@Mapper
public interface LogMapper extends BaseMapper<Log> {
    @Select("select * " +
            "from log " +
            "where concat(logId, logTime, logContent, uid) " +
            "like concat('%', #{keyword}, '%') " +
            "order by logTime desc")
    IPage<Log> searchLog(IPage<Log> page, String keyword);
}
