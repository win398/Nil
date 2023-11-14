package cn.edu.hbpu.nil.service;

import cn.edu.hbpu.nil.entity.Converse;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hbpu
 * @since 2022-08-09
 */
public interface ConverseService extends IService<Converse> {
    List<Converse> refreshConverse(String receiveAccount);
}
