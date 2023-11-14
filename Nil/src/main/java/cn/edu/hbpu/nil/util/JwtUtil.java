package cn.edu.hbpu.nil.util;

import cn.edu.hbpu.nil.entity.User;
import io.jsonwebtoken.*;

import java.util.Date;
import java.util.UUID;

public class JwtUtil {
    private static final long EXPIRE_TIME = 1000L * 60 * 60 * 24 * 30;
    //JWT密钥
    private static final String signature = "&miLQN6nfV^y7J2#x0m8OKMlriz5c-";
    private static final String subjectStr = "USER_TOKEN_";

    public static String  createUserToken(User u) {
        try {
            JwtBuilder jwtBuilder = Jwts.builder();
            String jwtToken = jwtBuilder
                    //header
                    .setHeaderParam("typ", "JWT")
                    .setHeaderParam("alg", "HS256")
                    //paload
                    .claim("userNum", u.getUserNum())
                    .claim("uid", u.getUid())
                    .claim("type", u.getType())
                    .setSubject(subjectStr + u.getUid())
                    .setExpiration(new Date(System.currentTimeMillis() + EXPIRE_TIME))
                    .setId(UUID.randomUUID().toString())
                    //设置签名 signature
                    .signWith(SignatureAlgorithm.HS256, signature)
                    .compact();
            return jwtToken;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static User parseUser(String token) {
        try {
            JwtParser jwtParser = Jwts.parser();
            Jws<Claims> claimsJws = jwtParser.setSigningKey(signature).parseClaimsJws(token);
            Claims body = claimsJws.getBody();
            User u = new User();
            u.setUserNum((String) body.get("userNum"));
            u.setUid((Integer) body.get("uid"));
            u.setType((Integer) body.get("type"));
            return u;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String getTokenSubject(String token) {
        try {
            JwtParser jwtParser = Jwts.parser();
            Jws<Claims> claimsJws = jwtParser.setSigningKey(signature).parseClaimsJws(token);
            Claims body = claimsJws.getBody();
            return body.getSubject();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
