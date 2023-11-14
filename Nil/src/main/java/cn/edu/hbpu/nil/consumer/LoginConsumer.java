package cn.edu.hbpu.nil.consumer;

import cn.edu.hbpu.nil.entity.Log;
import cn.edu.hbpu.nil.entity.User;
import cn.edu.hbpu.nil.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDateTime;

@Slf4j
@Component
@RocketMQMessageListener(topic = "nil-login-log", consumerGroup = "nil-log-consumer")
public class LoginConsumer implements RocketMQListener<User> {

    @Resource
    private LogService logService;

    @Override
    public void onMessage(User user) {
        Log log = new Log();
        log.setLogContent("用户"+ user.getUserName() + "登录，账号：" + user.getUserNum());
        log.setLogTime(LocalDateTime.now());
        log.setUid(user.getUid());
        System.out.println("log-----" + log);
        logService.save(log);
    }
}
