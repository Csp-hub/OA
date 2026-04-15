package com.campus.oa.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("permission")
public class Permission {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String permName;
    private String permCode;
    private String url;
    private Long parentId;
    private Integer type; // 0:菜单, 1:按钮
    private Integer sort;
    private Date createTime;
    private Date updateTime;
}
