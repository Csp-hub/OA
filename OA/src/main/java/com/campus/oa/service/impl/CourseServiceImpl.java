package com.campus.oa.service.impl;

import com.campus.oa.entity.Course;
import com.campus.oa.mapper.CourseMapper;
import com.campus.oa.service.CourseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements CourseService {
}
