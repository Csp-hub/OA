package com.campus.oa.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("leave")
public class Leave {
    @TableId(type = IdType.AUTO)
    private Long id;
    private Long studentId;
    private Date startTime;
    private Date endTime;
    private String reason;
    private Integer status;
    private Long approverId;
    private Date approvalTime;
    private String approvalRemark;
    private Date createTime;
    private Date updateTime;
}
