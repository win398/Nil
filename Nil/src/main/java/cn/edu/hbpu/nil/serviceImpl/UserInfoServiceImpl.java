package cn.edu.hbpu.nil.serviceImpl;

import cn.edu.hbpu.nil.entity.UserInfo;
import cn.edu.hbpu.nil.mapper.UserInfoMapper;
import cn.edu.hbpu.nil.service.UserInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hbpu
 * @since 2022-07-02
 */
@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements UserInfoService {

}
