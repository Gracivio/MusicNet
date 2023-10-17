package com.example.imusicweb.dao;

import com.example.imusicweb.database.Singer;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SingerMapper {
    public int insert(Singer singer);
    public int update(Singer singer);
    public int delete(Integer id);
    public int getId(String name);
    public Singer selectByPrimaryKey(Integer id);
    public List<Singer> allSinger();
    public List<Singer> singerOfName(String name);

}
