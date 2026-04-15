package com.campus.oa.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("course")
public class Course {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String courseName;
    private String courseCode;
    private Double credits;
    private Integer hours;
    private String description;
    private Integer status;
    private Date createTime;
    private Date updateTime;
}
