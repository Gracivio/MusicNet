package com.example.imusicweb.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.imusicweb.database.SongComment;
import com.example.imusicweb.database.SongListComment;
import com.example.imusicweb.service.SongCommentService;
import com.example.imusicweb.service.SongListCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/SongListComment")
public class SongListCommentController {
    @Autowired
    private SongListCommentService songListCommentService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addCollect(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String songListId = request.getParameter("songListId").trim();
        String comment = request.getParameter("comment").trim();
        SongListComment songListComment = new SongListComment();
        songListComment.setSongListId(Integer.valueOf(songListId));
        songListComment.setComment(comment);
        boolean flag = songListCommentService.insert(songListComment);
        if(flag){
            jsonObject.put("code",1);
            jsonObject.put("msg","评价成功");
        }else{
            jsonObject.put("code",0);
            jsonObject.put("msg","评价失败");
        }
        return jsonObject;
    }


    @RequestMapping(value = "/allComment",method = RequestMethod.GET)
    public Object allCollect(HttpServletRequest request){
        String songListId = request.getParameter("songListId").trim();
        return songListCommentService.allComment(Integer.valueOf(songListId));
    }



}
