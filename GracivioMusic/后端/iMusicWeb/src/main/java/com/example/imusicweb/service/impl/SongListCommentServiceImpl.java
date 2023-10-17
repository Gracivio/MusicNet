package com.example.imusicweb.service.impl;

import com.example.imusicweb.dao.SongListCommentMapper;
import com.example.imusicweb.database.SongListComment;
import com.example.imusicweb.service.SongListCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongListCommentServiceImpl implements SongListCommentService {
    @Autowired
    private SongListCommentMapper songListCommentMapper;

    @Override
    public boolean insert(SongListComment SongListComment) {
        return songListCommentMapper.insert(SongListComment)>0;
    }

    @Override
    public List<SongListComment> allComment(Integer songListId) {
        return songListCommentMapper.allComment(songListId);
    }
}
