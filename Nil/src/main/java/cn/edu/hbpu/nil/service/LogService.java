package cn.edu.hbpu.nil.service;

import cn.edu.hbpu.nil.entity.Log;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hbpu
 * @since 2022-08-20
 */
public interface LogService extends IService<Log> {
    IPage<Log> searchLog(IPage<Log> page, String keyword);
}
