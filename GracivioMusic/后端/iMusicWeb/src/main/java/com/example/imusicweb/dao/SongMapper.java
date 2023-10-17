package com.example.imusicweb.dao;

import com.example.imusicweb.database.Song;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongMapper {
    public int insert(Song song);
    public int update(Song song);
    public int delete(Integer id);
    public Song selectByPrimaryKey(Integer id);
    public List<Song> allSong();
    public List<Song> SongOfName(String name);
    public List<Song> SongName(String name);
    public List<Song> SongOfSinger(Integer singer_id);
    public List<Song> likeSongOfName(String name);
    public int countTimes(Integer id);
}
