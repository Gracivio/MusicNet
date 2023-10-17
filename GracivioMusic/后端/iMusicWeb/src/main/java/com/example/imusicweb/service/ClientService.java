package com.example.imusicweb.service;

import com.example.imusicweb.database.Client;

import java.util.List;

public interface ClientService {
    public boolean insert(Client client);
    public boolean update(Client client);
    public boolean delete(Integer id);
    public Client selectByPrimaryKey(Integer id);
    public List<Client> allClient();
    public boolean verifyPassword(String username,String password);
    public Client getByUsername(String username);
}
