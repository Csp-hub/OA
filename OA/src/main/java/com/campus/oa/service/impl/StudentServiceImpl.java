package com.campus.oa.service.impl;

import com.campus.oa.entity.Student;
import com.campus.oa.mapper.StudentMapper;
import com.campus.oa.service.StudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {
}
