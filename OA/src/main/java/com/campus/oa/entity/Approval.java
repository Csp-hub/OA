package com.campus.oa.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("approval")
public class Approval {
    @TableId(type = IdType.AUTO)
    private Long id;
    private Long applicantId;
    private Integer type;
    private String title;
    private String content;
    private Integer status;
    private Long approverId;
    private Date approvalTime;
    private String approvalRemark;
    private Date createTime;
    private Date updateTime;
}
