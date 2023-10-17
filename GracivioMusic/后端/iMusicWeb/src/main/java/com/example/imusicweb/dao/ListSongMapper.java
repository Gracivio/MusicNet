package com.example.imusicweb.dao;

import com.example.imusicweb.database.ListSong;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ListSongMapper {
    public int insert(ListSong listSong);
    public int update(ListSong listSong);
    public int delete(Integer id);
    public ListSong selectByPrimaryKey(Integer id);
    public List<ListSong> allListSong();
    public List<ListSong> ListSongOfId(Integer songList_id);
}
