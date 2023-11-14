package cn.edu.hbpu.nil.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;
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
@TableName("update_pic")
public class UpdatePic implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "picId", type = IdType.AUTO)
    private Integer picId;

    @TableField("picName")
    private String picName;

    @TableField("sid")
    private Integer sid;


}
