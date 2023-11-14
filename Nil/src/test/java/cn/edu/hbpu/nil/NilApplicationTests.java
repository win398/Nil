package cn.edu.hbpu.nil;

import io.jsonwebtoken.*;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.UUID;

@SpringBootTest
class NilApplicationTests {

    private final Long time = 1000L * 60 * 60 * 24 * 30;
    private String signature = "ordinaryUser";

    @Test
    void contextLoads() {
        JwtBuilder jwtBuilder = Jwts.builder();
        String jwtToken = jwtBuilder
                //header
                .setHeaderParam("typ", "JWT")
                .setHeaderParam("alg", "HS256")
                //paload
                .claim("userNum", "1824591386")
                .claim("role", "ordinaryUser")
                .setSubject("ordinaryUser-test")
                .setExpiration(new Date(System.currentTimeMillis() + time))
                .setId(UUID.randomUUID().toString())
                //设置签名 signature
                .signWith(SignatureAlgorithm.HS256, signature)
                .compact();
        System.out.println(jwtToken);
    }

    @Test
    public void parse() {
        String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyTnVtIjoiMTgyNDU5MTM4NiIsInJvbGUiOiJvcmRpbmFyeVVzZXIiLCJzdWIiOiJvcmRpbmFyeVVzZXItdGVzdCIsImV4cCI6MTY1MzcyMzg3NSwianRpIjoiYjA0MTQ1ZTUtYjlmNy00MGJjLWEzN2EtMzY4OTNmNWFkMDRiIn0.P0qASsT4qCDtBltVZkMNHBwD3-dDCEv1VV8hZlvdqTs";
        JwtParser jwtParser = Jwts.parser();
        Jws<Claims> claimsJws = jwtParser.setSigningKey(signature).parseClaimsJws(token);
        Claims body = claimsJws.getBody();
        System.out.println(body.get("userNum"));
        System.out.println(body.get("role"));
        System.out.println(body.getId());
        System.out.println(body.getSubject());
        System.out.println(body.getExpiration());
    }
}
