package com.example.imusicweb.dao;

import com.example.imusicweb.database.Client;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientMapper {
    public int insert(Client client);
    public int update(Client client);
    public int delete(Integer id);
    public Client selectByPrimaryKey(Integer id);
    public List<Client> allClient();
    public int verifyPassword(String username,String password);
    public Client getByUsername(String username);

}
