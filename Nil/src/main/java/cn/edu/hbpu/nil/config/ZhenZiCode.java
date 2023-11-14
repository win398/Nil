package cn.edu.hbpu.nil.config;

import com.zhenzi.sms.ZhenziSmsClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Component
public class ZhenZiCode {
    @Value("${sms.apiUrl}")
    private String apiUrl;

    @Value("${sms.appId}")
    private String appId;

    @Value("${sms.appSecret}")
    private String appSecret;

    public String sendMessage(String randNum,String phoneNum) throws Exception {
        ZhenziSmsClient client = new ZhenziSmsClient(apiUrl, appId, appSecret);
        Map<String, Object> params = new HashMap<>();
        params.put("number", phoneNum);
        params.put("templateId","10178");
        String[] templateParams = new String[2];
        templateParams[0] = randNum;
        templateParams[1] = "5分钟";
        params.put("templateParams", templateParams);
        return client.send(params);
    }
}
