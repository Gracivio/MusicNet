package com.example.imusicweb.dao;

import com.example.imusicweb.database.Collect;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollectMapper {
    public int insert(Collect collect);
    public int delete(Integer userId, Integer songId);
    public List<Collect> allCollect();
    public List<Collect> collectOfUserId(Integer songId);
    public int existSongId(@Param("userId")Integer userId, @Param("songId") Integer songId);

}
