package com.example.imusicweb.dao;

import com.example.imusicweb.database.SongComment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongCommentMapper {
    public int insert(SongComment songComment);
    public List<SongComment> allComment(Integer songId);
}
