package com.campus.oa.service.impl;

import com.campus.oa.entity.User;
import com.campus.oa.mapper.UserMapper;
import com.campus.oa.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Override
    public User login(String username, String password) {
        // 这里需要实现密码加密验证，暂时简单实现
        User user = baseMapper.selectOne(null); // 实际应该根据username查询
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}
