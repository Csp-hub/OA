package com.campus.oa.service;

import com.campus.oa.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

public interface UserService extends IService<User> {
    User login(String username, String password);
}
