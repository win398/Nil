package cn.edu.hbpu.nil.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author hbpu
 * @since 2022-07-13
 */
@Getter
@Setter
@TableName("contact_group")
public class ContactGroup implements Serializable {

    private static final long serialVersionUID = 1L;
    //在线人数和总人数
    private transient int online;
    private transient int total;

    /**
     * 分组编号
     */
    @TableId(value = "groupId", type = IdType.AUTO)
    private Integer groupId;

    /**
     * 分组名
     */
    @TableField("groupName")
    private String groupName;

    /**
     * 用户编号
     */
    @TableField("uid")
    private Integer uid;

    /**
     * 分组下标
     */
    @TableField("groupIndex")
    private Integer groupIndex;


}
