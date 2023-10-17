package com.example.imusicweb.service.impl;

import com.example.imusicweb.dao.CollectMapper;
import com.example.imusicweb.dao.SongCommentMapper;
import com.example.imusicweb.database.Collect;
import com.example.imusicweb.database.SongComment;
import com.example.imusicweb.service.CollectService;
import com.example.imusicweb.service.SongCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongCommentServiceImpl implements SongCommentService {
    @Autowired
    private SongCommentMapper songCommentMapper;

    @Override
    public boolean insert(SongComment songComment) {
        return songCommentMapper.insert(songComment)>0;
    }

    @Override
    public List<SongComment> allComment(Integer songId) {
        return songCommentMapper.allComment(songId);
    }
}
