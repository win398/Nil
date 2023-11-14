package cn.edu.hbpu.nil.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author hbpu
 * @since 2022-08-17
 */
@Getter
@Setter
@TableName("social_update")
public class SocialUpdate implements Serializable {

    private static final long serialVersionUID = 1L;

    @JsonProperty("isLike")
    private transient boolean isLike;
    private transient List<String> pics;
    private transient List<Like> likes;
    private transient List<UpdateComment> comments;
    private transient String username;
    private transient String header;

    @TableId(value = "sid", type = IdType.AUTO)
    private Integer sid;

    @TableField("contentText")
    private String contentText;

    @TableField("uid")
    private Integer uid;

    @TableField("sendTime")
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime sendTime;


}
