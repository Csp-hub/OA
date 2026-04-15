package com.campus.oa.controller;

import com.campus.oa.common.Response;
import com.campus.oa.entity.Course;
import com.campus.oa.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService courseService;

    @GetMapping("/list")
    public Response list() {
        List<Course> courses = courseService.list();
        return Response.success(courses);
    }

    @PostMapping("/add")
    public Response add(@RequestBody Course course) {
        courseService.save(course);
        return Response.success(null);
    }

    @PutMapping("/update")
    public Response update(@RequestBody Course course) {
        courseService.updateById(course);
        return Response.success(null);
    }

    @DeleteMapping("/delete/{id}")
    public Response delete(@PathVariable Long id) {
        courseService.removeById(id);
        return Response.success(null);
    }
}
