package com.example.imusicweb.service.impl;

import com.example.imusicweb.dao.ClientMapper;
import com.example.imusicweb.database.Client;
import com.example.imusicweb.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {
    @Autowired
    private ClientMapper clientMapper;

    @Override
    public boolean insert(Client client) {
        return clientMapper.insert(client)>0;
    }

    @Override
    public boolean update(Client client) {
        return clientMapper.update(client)>0;
    }

    @Override
    public boolean delete(Integer id) {
        return clientMapper.delete(id)>0;
    }

    @Override
    public Client selectByPrimaryKey(Integer id) {
        return clientMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Client> allClient() {
        return clientMapper.allClient();
    }

    @Override
    public boolean verifyPassword(String username, String password) {
        return clientMapper.verifyPassword(username,password)>0;
    }

    @Override
    public Client getByUsername(String username) {
        return clientMapper.getByUsername(username);
    }
}
