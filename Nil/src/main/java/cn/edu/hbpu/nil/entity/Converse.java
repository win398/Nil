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
 * @since 2022-08-09
 */
@Getter
@Setter
@ToString
@TableName("converse")
public class Converse implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableField(exist = false)
    private String senderHeader;
    @TableField(exist = false)
    private String senderName;
    @TableField(exist = false)
    private String nameMem;

    @TableId(value = "msgId", type = IdType.AUTO)
    private Integer msgId;

    @TableField("sendAccount")
    private String sendAccount;

    @TableField("receiveAccount")
    private String receiveAccount;

    @TableField("sendTime")
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime sendTime;

    @TableField("msgContent")
    private String msgContent;

    /**
     * 1为已发送  2为未发送
     */
    @TableField("msgState")
    private Integer msgState;


}
