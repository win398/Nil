package cn.edu.hbpu.nil.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * <p>
 * 
 * </p>
 *
 * @author hbpu
 * @since 2022-05-17
 */
@Getter
@Setter
@ToString
@TableName("user")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    private transient String sex;
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private transient LocalDateTime birth;
    private transient String province;
    private transient String city;
    private transient String signature;
    private transient String bgImg;
    //是否已经是好友
    @JsonProperty("isFriend")
    private transient boolean isFriend;

    /**
     * 用户ID
     */
    @TableId(value = "uid", type = IdType.AUTO)
    private Integer uid;

    /**
     * 用户名
     */
    @TableField("userName")
    private String userName;

    /**
     * 用户账号
     */
    @TableField("userNum")
    private String userNum;

    /**
     * 用户密码
     */
    @TableField("password")
    private String password;

    /**
     * 注册时间
     */
    @TableField("registerTime")
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime registerTime;

    /**
     * 头像
     */
    @TableField("header")
    private String header;

    /**
     * 电话号码
     */
    @TableField("phoneNum")
    private String phoneNum;

    /**
     * 用户类型 1普通用户 2管理员 0封禁
     */
    @TableField("type")
    private Integer type;


}
