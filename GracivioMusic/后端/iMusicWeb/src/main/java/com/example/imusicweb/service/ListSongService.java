package com.example.imusicweb.service;

import com.example.imusicweb.database.ListSong;

import java.util.List;

public interface ListSongService {
    public boolean insert(ListSong listSong);
    public boolean update(ListSong listSong);
    public boolean delete(Integer id);
    public ListSong selectByPrimaryKey(Integer id);
    public List<ListSong> allListSong();
    public List<ListSong> ListSongOfId(Integer songList_id);
}
