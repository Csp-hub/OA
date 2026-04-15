package com.campus.oa.service.impl;

import com.campus.oa.entity.Role;
import com.campus.oa.mapper.RoleMapper;
import com.campus.oa.service.RoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
}
