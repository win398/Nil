package cn.edu.hbpu.nil.controller;


import cn.edu.hbpu.nil.entity.Converse;
import cn.edu.hbpu.nil.service.ConverseService;
import cn.edu.hbpu.nil.util.WebSocketServer;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hbpu
 * @since 2022-08-09
 */
@RestController
@RequestMapping("/converse")
public class ConverseController {
    @Resource
    private ConverseService converseService;

    @GetMapping("/refreshConverse")
    public List<Converse> refreshConverse(String receiveAccount) {
        List<Converse> converses = converseService.refreshConverse(receiveAccount);
        if (converses.size() > 0) {
            UpdateWrapper<Converse> wrapper = new UpdateWrapper<>();
            wrapper.eq("receiveAccount", receiveAccount).set("msgState", 1);
            converseService.update(wrapper);
        }
        return converses;
    }

    @GetMapping("/getCurrentOnline")
    public long getCurrentOnline() {
        return WebSocketServer.getWebSocketSet().size();
    }

    @GetMapping("/getCountMsg")
    public long getCountMsg() {
        return converseService.count();
    }
}

