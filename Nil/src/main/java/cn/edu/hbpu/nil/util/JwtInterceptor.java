package cn.edu.hbpu.nil.util;

import cn.hutool.core.util.StrUtil;
import com.alibaba.druid.util.StringUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

@Component
public class JwtInterceptor implements HandlerInterceptor {
    @Resource
    private RedisTemplate<String, String> redisTemplate;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //如果不是映射到方法直接通过
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        String token = request.getHeader("token");
        if(StringUtils.isEmpty(token)){
            throw new RuntimeException("token不能为空");
        }
        String redisToken = redisTemplate.opsForValue().get(Objects.requireNonNull(JwtUtil.getTokenSubject(token)));
        if (redisToken == null) System.out.println("redis中无此token数据");
        return !StrUtil.isEmpty(redisToken);
    }
}
