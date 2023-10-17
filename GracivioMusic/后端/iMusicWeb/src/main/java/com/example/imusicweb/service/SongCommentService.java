
package com.example.imusicweb.service;

import com.example.imusicweb.database.Collect;
import com.example.imusicweb.database.SongComment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SongCommentService {
    public boolean insert(SongComment songComment);
    public List<SongComment> allComment(Integer songId);
}
