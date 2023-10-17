package com.example.imusicweb.service;

import com.example.imusicweb.database.Song;

import java.util.List;

public interface SongService {
    public boolean insert(Song Song);
    public boolean update(Song Song);
    public boolean delete(Integer id);

    public Song selectByPrimaryKey(Integer id);
    public List<Song> allSong();
    public List<Song> SongOfName(String name);
    public List<Song> SongName(String name);
    public List<Song> SongOfSinger(int singer_id);
    public boolean countTimes(Integer id);
}
