package com.example.imusicweb.dao;

import com.example.imusicweb.database.SongList;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongListMapper {
    public int insert(SongList SongList);
    public int update(SongList SongList);
    public int delete(Integer id);
    public SongList selectByPrimaryKey(Integer id);
    public List<SongList> allSongList();
    public List<SongList> SongListOfTitle(String name);
    public List<SongList> SongListLikeTitle(String name);
    public List<SongList> SongListOfStyle(String style);
}
