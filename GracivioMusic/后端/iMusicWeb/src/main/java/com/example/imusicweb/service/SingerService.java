package com.example.imusicweb.service;

import com.example.imusicweb.database.Singer;

import java.util.List;

public interface SingerService {
    public boolean insert(Singer singer);
    public boolean update(Singer singer);
    public boolean delete(Integer id);
    public int getId(String name);
    public Singer selectByPrimaryKey(Integer id);
    public List<Singer> allSinger();
    public List<Singer> singerOfName(String Name);
}
