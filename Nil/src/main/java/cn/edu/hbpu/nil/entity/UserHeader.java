package cn.edu.hbpu.nil.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author hbpu
 * @since 2022-08-12
 */
@Getter
@Setter
@TableName("user_header")
public class UserHeader implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "headerId", type = IdType.AUTO)
    private Integer headerId;

    @TableField("picName")
    private String picName;

    @TableField("uid")
    private Integer uid;

    @TableField("setTime")
    private LocalDateTime setTime;


}
