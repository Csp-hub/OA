package com.campus.oa.controller;

import com.campus.oa.common.Response;
import com.campus.oa.entity.User;
import com.campus.oa.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public Response list() {
        List<User> users = userService.list();
        return Response.success(users);
    }

    @PostMapping("/add")
    public Response add(@RequestBody User user) {
        userService.save(user);
        return Response.success(null);
    }

    @PutMapping("/update")
    public Response update(@RequestBody User user) {
        userService.updateById(user);
        return Response.success(null);
    }

    @DeleteMapping("/delete/{id}")
    public Response delete(@PathVariable Long id) {
        userService.removeById(id);
        return Response.success(null);
    }
}
