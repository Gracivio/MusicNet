package com.example.imusicweb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
@EnableWebMvc
@MapperScan("com.example.imusicweb.dao")
public class IMusicWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(IMusicWebApplication.class, args);
    }

}
