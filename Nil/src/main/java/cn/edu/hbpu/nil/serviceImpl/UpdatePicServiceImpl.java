package cn.edu.hbpu.nil.serviceImpl;

import cn.edu.hbpu.nil.entity.UpdatePic;
import cn.edu.hbpu.nil.mapper.UpdatePicMapper;
import cn.edu.hbpu.nil.service.UpdatePicService;
import cn.hutool.core.io.file.FileNameUtil;
import cn.hutool.core.lang.UUID;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
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
public class UpdatePicServiceImpl extends ServiceImpl<UpdatePicMapper, UpdatePic> implements UpdatePicService {

    @Value("${web.nil_pic}")
    private String nil_pic;

    @Override
    public String uploadImages(int sid, List<MultipartFile> parts) {
        for (MultipartFile multipartFile : parts) {
            if (multipartFile == null || multipartFile.isEmpty()) {
                //手动抛出异常，捕获异常事务回滚将自动开启
                try {
                    throw new Exception("imgEmpty");
                } catch (Exception e) {
                    e.printStackTrace();
                    return "fail";
                }
            }
            //保存图片
            String imgFileName = multipartFile.getOriginalFilename();
            String newImgFileName = UUID.fastUUID().toString(true) + '.' + FileNameUtil.extName(imgFileName);
            File saveFile = new File(nil_pic + newImgFileName);
            try {
                multipartFile.transferTo(saveFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
            //修改数据库信息
            UpdatePic updatePic = new UpdatePic();
            updatePic.setPicName(newImgFileName);
            updatePic.setSid(sid);
            save(updatePic);
        }
        return "success";
    }
}
