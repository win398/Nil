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
@TableName("friend_verification")
public class FriendVerification implements Serializable {

    private static final long serialVersionUID = 1L;

    private transient String userName;
    private transient String header;
    private transient String toUserName;
    private transient String toUserHeader;
    /**
     * 验证信息编号
     */
    @TableId(value = "verificationId", type = IdType.AUTO)
    private Integer verificationId;

    /**
     * 发送用户编号
     */
    @TableField("fromUid")
    private Integer fromUid;

    /**
     * 接受用户编号
     */
    @TableField("toUid")
    private Integer toUid;

    /**
     * 验证消息
     */
    @TableField("content")
    private String content;

    /**
     * 发送时间
     */
    @TableField("sendTime")
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime sendTime;

    /**
     * 状态 1未验证 2已读 3通过 4拒绝
     */
    @TableField("verify_state")
    private Integer verifyState;

    /**
     * 分组下标
     */
    @TableField("groupIndex")
    private Integer groupIndex;

    /**
     * 备注
     */
    @TableField("nameMem")
    private String nameMem;


}
