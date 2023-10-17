
package com.example.imusicweb.service;

import com.example.imusicweb.database.SongListComment;

import java.util.List;

public interface SongListCommentService {
    public boolean insert(SongListComment songListComment);
    public List<SongListComment> allComment(Integer songListId);
}
