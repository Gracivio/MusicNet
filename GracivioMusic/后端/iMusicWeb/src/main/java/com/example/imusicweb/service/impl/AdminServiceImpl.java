package com.example.imusicweb.service.impl;

import com.example.imusicweb.dao.AdminMapper;
import com.example.imusicweb.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public boolean checkAccount(String username, String password) {
        boolean flag = false;
        if(adminMapper.checkAccount(username,password)>0){
            flag = true;
        }
        return flag;
    }
}
