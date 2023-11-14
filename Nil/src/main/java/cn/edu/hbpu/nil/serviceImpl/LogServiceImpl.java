package cn.edu.hbpu.nil.serviceImpl;

import cn.edu.hbpu.nil.entity.Log;
import cn.edu.hbpu.nil.mapper.LogMapper;
import cn.edu.hbpu.nil.service.LogService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hbpu
 * @since 2022-08-20
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements LogService {

    @Resource
    private LogMapper logMapper;
    @Override
    public IPage<Log> searchLog(IPage<Log> page, String keyword) {
        return logMapper.searchLog(page, keyword);
    }
}
