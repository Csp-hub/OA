package com.campus.oa.service.impl;

import com.campus.oa.entity.Teacher;
import com.campus.oa.mapper.TeacherMapper;
import com.campus.oa.service.TeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements TeacherService {
}
