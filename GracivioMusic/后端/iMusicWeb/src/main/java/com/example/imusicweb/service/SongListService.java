package com.example.imusicweb.service;

import com.example.imusicweb.database.SongList;

import java.util.List;

public interface SongListService {
    public boolean insert(SongList SongList);
    public boolean update(SongList SongList);
    public boolean delete(Integer id);
    public SongList selectByPrimaryKey(Integer id);
    public List<SongList> allSongList();
    public List<SongList> SongListOfTitle(String name);
    public List<SongList> SongListLikeTitle(String name);
    public List<SongList> SongListOfStyle(String style);
}
