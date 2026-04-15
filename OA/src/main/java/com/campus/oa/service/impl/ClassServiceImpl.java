package com.campus.oa.service.impl;

import com.campus.oa.entity.Class;
import com.campus.oa.mapper.ClassMapper;
import com.campus.oa.service.ClassService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class ClassServiceImpl extends ServiceImpl<ClassMapper, Class> implements ClassService {
}
