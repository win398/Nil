package cn.edu.hbpu.nil.service;

import cn.edu.hbpu.nil.entity.UpdatePic;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hbpu
 * @since 2022-08-16
 */
public interface UpdatePicService extends IService<UpdatePic> {
    String uploadImages(int sid, List<MultipartFile> fileList);
}
