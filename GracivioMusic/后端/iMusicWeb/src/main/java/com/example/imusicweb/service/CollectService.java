package com.example.imusicweb.service;

import com.example.imusicweb.database.Collect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollectService {
    public boolean insert(Collect collect);
    public boolean delete(Integer userId, Integer songId);
    public List<Collect> allCollect();
    public List<Collect> collectOfUserId(Integer songId);
    public boolean existSongId(@Param("userId")Integer userId, @Param("songId") Integer songId);
}
