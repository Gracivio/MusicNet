package com.example.imusicweb.service.impl;

import com.example.imusicweb.dao.SongMapper;
import com.example.imusicweb.database.Song;
import com.example.imusicweb.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongServiceImpl implements SongService {
    @Autowired
    private SongMapper songMapper;

    @Override
    public boolean insert(Song song) {
        return songMapper.insert(song)>0;
    }

    @Override
    public boolean update(Song song) {
        return songMapper.update(song)>0;
    }

    @Override
    public boolean delete(Integer id) {
        return songMapper.delete(id)>0;
    }

    @Override
    public Song selectByPrimaryKey(Integer id) {
        return songMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Song> allSong() {
        return songMapper.allSong();
    }

    @Override
    public List<Song> SongOfName(String name) {
        return songMapper.SongOfName("%"+name+"%");
    }

    @Override
    public List<Song> SongName(String name) {
        return songMapper.SongName(name);
    }

    @Override
    public List<Song> SongOfSinger(int singer_id) {
        return songMapper.SongOfSinger(singer_id);
    }

    @Override
    public boolean countTimes(Integer id) {
        return songMapper.countTimes(id)>0;
    }
}
