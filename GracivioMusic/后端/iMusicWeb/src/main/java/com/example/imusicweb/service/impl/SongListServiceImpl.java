package com.example.imusicweb.service.impl;

import com.example.imusicweb.dao.SongListMapper;
import com.example.imusicweb.database.SongList;
import com.example.imusicweb.service.SongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SongListServiceImpl implements SongListService {
    @Autowired
    private SongListMapper songListMapper;
    @Override
    public boolean insert(SongList songList) {
        return songListMapper.insert(songList)>0;
    }

    @Override
    public boolean update(SongList songList) {
        return songListMapper.update(songList)>0;
    }

    @Override
    public boolean delete(Integer id) {
        return songListMapper.delete(id)>0;
    }

    @Override
    public SongList selectByPrimaryKey(Integer id) {
        return songListMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<SongList> allSongList() {
        return songListMapper.allSongList();
    }

    @Override
    public List<SongList> SongListOfTitle(String name) {
        return songListMapper.SongListOfTitle(name);
    }

    @Override
    public List<SongList> SongListLikeTitle(String name) {
        return songListMapper.SongListLikeTitle(name);
    }

    @Override
    public List<SongList> SongListOfStyle(String style) {
        return songListMapper.SongListOfStyle(style);
    }

}
