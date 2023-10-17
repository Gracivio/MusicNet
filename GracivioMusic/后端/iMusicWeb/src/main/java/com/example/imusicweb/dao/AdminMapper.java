package com.example.imusicweb.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
    public int checkAccount(String username,String password);
}
