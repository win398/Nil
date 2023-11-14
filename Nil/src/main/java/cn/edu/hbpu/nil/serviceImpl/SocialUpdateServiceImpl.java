package cn.edu.hbpu.nil.serviceImpl;

import cn.edu.hbpu.nil.entity.SocialUpdate;
import cn.edu.hbpu.nil.entity.UpdatePic;
import cn.edu.hbpu.nil.mapper.SocialUpdateMapper;
import cn.edu.hbpu.nil.service.SocialUpdateService;
import cn.edu.hbpu.nil.service.UpdatePicService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.time.LocalDateTime;
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
public class SocialUpdateServiceImpl extends ServiceImpl<SocialUpdateMapper, SocialUpdate> implements SocialUpdateService {

    @Resource
    private UpdatePicService updatePicService;

    //需要事务（默认）。若当前无事务，新建一个事务；若当前有事务，加入此事务中。 如图片出现异常 //必须加上括号内的属性，否则事务无法回滚
    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor=Exception.class)
    public String addUpdate(List<MultipartFile> parts, int uid, String content) {
        SocialUpdate update = new SocialUpdate();
        update.setUid(uid);
        update.setContentText(content);
        update.setSendTime(LocalDateTime.now());
        save(update);
        return updatePicService.uploadImages(update.getSid(), parts);
    }
}