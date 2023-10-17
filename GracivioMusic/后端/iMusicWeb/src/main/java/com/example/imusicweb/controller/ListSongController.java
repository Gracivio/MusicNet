package com.example.imusicweb.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.imusicweb.database.ListSong;
import com.example.imusicweb.service.ListSongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/listSong")
public class ListSongController {
    @Autowired
    private ListSongService listSongService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addListSong(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String song_id = request.getParameter("songId").trim();
        String songList_id = request.getParameter("songListId").trim();
        ListSong listSong = new ListSong();
        listSong.setSong_id(Integer.parseInt(song_id));
        listSong.setSongList_id(Integer.parseInt(songList_id));
        boolean flag = listSongService.insert(listSong);
        if(flag){
            jsonObject.put("code",1);
            jsonObject.put("msg","保存成功");
        }else{
            jsonObject.put("code",0);
            jsonObject.put("msg","保存失败");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public Object ListSongOfId(HttpServletRequest request){
        String songList_id = request.getParameter("songListId").trim();
        return listSongService.ListSongOfId(Integer.parseInt(songList_id));
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public Object updateListSong(HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        String song_id = request.getParameter("songId").trim();
        String songList_id = request.getParameter("songListId").trim();
        ListSong listSong = new ListSong();
        listSong.setId(Integer.valueOf(id));
        listSong.setSong_id(Integer.parseInt(song_id));
        listSong.setSongList_id(Integer.parseInt(songList_id));
        boolean flag = listSongService.update(listSong);
        if(flag){
            jsonObject.put("code",1);
            jsonObject.put("msg","修改成功");
        }
        else{
            jsonObject.put("code",0);
            jsonObject.put("msg","修改失败");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public Object deleteListSong(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("songListId").trim();
        boolean flag = listSongService.delete(Integer.parseInt(id));
        return flag;
    }

}
