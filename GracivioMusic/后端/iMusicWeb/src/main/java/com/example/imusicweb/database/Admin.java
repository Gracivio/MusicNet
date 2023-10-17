package com.example.imusicweb.database;

import java.io.Serializable;

public class Admin implements Serializable {
    private Integer id;
    private String username;
    private String password; // 此处一一对应数据库中管理员表内的三个变量

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
