package cn.edu.hbpu.nil.config;

import cn.edu.hbpu.nil.util.JwtInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Configuration
public class MyWebMvcConfig extends WebMvcConfigurationSupport {

    @Value("${web.nil_pic}")
    private String nil_pic;

    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/npic/**")
                .addResourceLocations("file:" + nil_pic);
    }
    //配置跨域
    @Override
    protected void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**").allowedOrigins("*");
    }

    @Override
    protected void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.stream()
                // 过滤出StringHttpMessageConverter类型实例
                .filter(StringHttpMessageConverter.class::isInstance)
                .map(c -> (StringHttpMessageConverter) c)
                // 这里将转换器的默认编码设置为utf-8
                .forEach(c -> c.setDefaultCharset(StandardCharsets.UTF_8));
    }

    @Resource
    private JwtInterceptor jwtInterceptor;

    @Override
    protected void addInterceptors(InterceptorRegistry registry) {
        List<String> paths = new ArrayList<>();
        paths.add("/user/getManInfo");
        paths.add("/user/getUserList");
        paths.add("/user/disableUser");
        paths.add("/user/searchUser");
        paths.add("/user/getTotalRegisters");
        paths.add("/user/getCountRegisters");
        paths.add("/converse/getCurrentOnline");
        paths.add("/converse/getCountMsg");
        paths.add("/user/getWeekCounts");
        paths.add("/log/getLogs");
        paths.add("/log/searchLog");
        registry.addInterceptor(jwtInterceptor)
                .addPathPatterns(paths);
    }
}

