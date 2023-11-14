package cn.edu.hbpu.nil.serviceImpl;

import cn.edu.hbpu.nil.entity.UpdateComment;
import cn.edu.hbpu.nil.mapper.UpdateCommentMapper;
import cn.edu.hbpu.nil.service.UpdateCommentService;
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
 * @since 2022-08-16
 */
@Service
public class UpdateCommentServiceImpl extends ServiceImpl<UpdateCommentMapper, UpdateComment> implements UpdateCommentService {

    @Resource
    private UpdateCommentMapper updateCommentMapper;

    @Override
    public List<UpdateComment> getComments(int sid) {
        return updateCommentMapper.getComments(sid);
    }
}
