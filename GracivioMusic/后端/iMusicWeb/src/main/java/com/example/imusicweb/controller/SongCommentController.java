package com.example.imusicweb.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.imusicweb.database.Collect;
import com.example.imusicweb.database.SongComment;
import com.example.imusicweb.service.CollectService;
import com.example.imusicweb.service.SongCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/SongComment")
public class SongCommentController {
    @Autowired
    private SongCommentService songCommentService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addCollect(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String songId = request.getParameter("songId").trim();
        String comment = request.getParameter("comment").trim();
        SongComment songComment = new SongComment();
        songComment.setSongId(Integer.valueOf(songId));
        songComment.setComment(comment);
        boolean flag = songCommentService.insert(songComment);
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
        String songId = request.getParameter("songId").trim();
        return songCommentService.allComment(Integer.valueOf(songId));
    }



}
