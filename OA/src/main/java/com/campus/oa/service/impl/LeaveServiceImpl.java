package com.campus.oa.service.impl;

import com.campus.oa.entity.Leave;
import com.campus.oa.mapper.LeaveMapper;
import com.campus.oa.service.LeaveService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class LeaveServiceImpl extends ServiceImpl<LeaveMapper, Leave> implements LeaveService {
}
