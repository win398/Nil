package cn.edu.hbpu.nil.controller;


import cn.edu.hbpu.nil.entity.Log;
import cn.edu.hbpu.nil.service.LogService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hbpu
 * @since 2022-08-20
 */
@RestController
@RequestMapping("/log")
public class LogController {
    @Resource
    private LogService logService;
    @GetMapping("getLogs")
    public IPage<Log> getLogs(Page<Log> page) {
        QueryWrapper<Log> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("logTime");
        return logService.page(page, queryWrapper);
    }

    @GetMapping("searchLog")
    public IPage<Log> searchLog(Page<Log> page, String keyword){
        return logService.searchLog(page, keyword);
    }
}

