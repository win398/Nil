package cn.edu.hbpu.nil.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author hbpu
 * @since 2022-08-16
 */
@Getter
@Setter
@TableName("update_comment")
public class UpdateComment implements Serializable {

    private static final long serialVersionUID = 1L;

    private transient String username;

    @TableId(value = "commentId", type = IdType.AUTO)
    private Integer commentId;

    @TableField("contentText")
    private String contentText;

    @TableField("sid")
    private Integer sid;

    @TableField("uid")
    private Integer uid;


}
