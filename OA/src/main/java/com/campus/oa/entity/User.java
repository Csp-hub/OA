package com.campus.oa.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("user")
public class User {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String username;
    private String password;
    private String name;
    private Integer type; // 0:管理员, 1:教师, 2:学生
    private Integer status; // 0:禁用, 1:启用
    private Date createTime;
    private Date updateTime;
}
