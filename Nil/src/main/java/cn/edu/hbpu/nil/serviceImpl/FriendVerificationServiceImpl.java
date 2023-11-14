package cn.edu.hbpu.nil.serviceImpl;

import cn.edu.hbpu.nil.entity.FriendVerification;
import cn.edu.hbpu.nil.mapper.FriendVerificationMapper;
import cn.edu.hbpu.nil.service.FriendVerificationService;
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
 * @since 2022-07-18
 */
@Service
public class FriendVerificationServiceImpl extends ServiceImpl<FriendVerificationMapper, FriendVerification> implements FriendVerificationService {

    @Resource
    private FriendVerificationMapper verificationMapper;

    @Override
    public List<FriendVerification> getVerificationsByUid(int uid, int vid) {
        return verificationMapper.getVerificationsByUid(uid, vid);
    }
}
