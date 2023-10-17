package com.example.imusicweb.dao;

import com.example.imusicweb.database.SongComment;
import com.example.imusicweb.database.SongListComment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongListCommentMapper {
    public int insert(SongListComment songListComment);
    public List<SongListComment> allComment(Integer songListId);
}
