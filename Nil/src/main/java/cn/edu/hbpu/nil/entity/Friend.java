package cn.edu.hbpu.nil.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * <p>
 * 
 * </p>
 *
 * @author hbpu
 * @since 2022-07-18
 */
@Getter
@Setter
@ToString
@TableName("friend")
public class Friend implements Serializable {

    private static final long serialVersionUID = 1L;

    private transient String state;
    private transient String userName;
    private transient String header;
    private transient String userNum;
    private transient Integer uid;
    private transient String signature;
    private transient String sex;
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private transient LocalDateTime birth;
    private transient String province;
    private transient String city;
    private transient String bgImg;
    private transient Integer groupIndex;


    /**
     * 好友编号
     */
    @TableId(value = "friendId", type = IdType.AUTO)
    private Integer friendId;

    /**
     * 用户编号
     */
    @TableField("userId")
    private Integer userId;

    /**
     * 联系人编号
     */
    @TableField("contactId")
    private Integer contactId;

    /**
     * 联系人分组编号
     */
    @TableField("contactGroupId")
    private Integer contactGroupId;

    /**
     * 添加好友时间
     */
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("createdTime")
    private LocalDateTime createdTime;

    /**
     * 是否特别关心
     */
    @TableField("isFavor")
    private Boolean isFavor;

    /**
     * 备注
     */
    @TableField("nameMem")
    private String nameMem;


}
