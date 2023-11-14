package cn.edu.hbpu.nil.serviceImpl;

import cn.edu.hbpu.nil.entity.Converse;
import cn.edu.hbpu.nil.mapper.ConverseMapper;
import cn.edu.hbpu.nil.service.ConverseService;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hbpu
 * @since 2022-08-09
 */
@Service
public class ConverseServiceImpl extends ServiceImpl<ConverseMapper, Converse> implements ConverseService {
    @Resource
    private ConverseMapper converseMapper;

    @Override
    public List<Converse> refreshConverse(String receiveAccount) {
        return converseMapper.refreshConverse(receiveAccount);
    }
}
