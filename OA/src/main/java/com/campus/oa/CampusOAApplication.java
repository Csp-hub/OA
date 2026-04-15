package com.campus.oa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("com.campus.oa.mapper")
public class CampusOAApplication {
    public static void main(String[] args) {
        SpringApplication.run(CampusOAApplication.class, args);
    }
}
