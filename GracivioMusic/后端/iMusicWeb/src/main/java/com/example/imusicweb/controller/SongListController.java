package com.example.imusicweb.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.imusicweb.database.SongList;
import com.example.imusicweb.service.SongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@RestController
@RequestMapping("/SongList")
public class SongListController {
    @Autowired
    private SongListService songListService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addSongList(HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = new JSONObject();
        String title = request.getParameter("title").trim();
        String pic = request.getParameter("pic").trim();
        String introduction = request.getParameter("introduction").trim();
        String style = request.getParameter("style").trim();
        System.out.println(title);
        SongList songList = new SongList();
        songList.setTitle(title);
        songList.setPic(pic);
        songList.setIntroduction(introduction);
        songList.setStyle(style);
        boolean flag = songListService.insert(songList);
        if(flag){
            jsonObject.put("code",1);
            jsonObject.put("msg","添加成功");
        }
        else{
            jsonObject.put("code",0);
            jsonObject.put("msg","添加失败");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public Object updateSongList(HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        String title = request.getParameter("title").trim();
        String introduction = request.getParameter("introduction").trim();
        String style = request.getParameter("style").trim();
        SongList songList = new SongList();
        songList.setId(Integer.valueOf(id));
        songList.setTitle(title);
        songList.setIntroduction(introduction);
        songList.setStyle(style);
        boolean flag = songListService.update(songList);
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
    public Object deleteSongList(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        boolean flag = songListService.delete(Integer.valueOf(id));
        return flag;
    }

    @RequestMapping(value = "/selectByPrimaryKey",method = RequestMethod.POST)
    public Object selectByPrimaryKey(HttpServletRequest request){
        String id = request.getParameter("id").trim();
        return songListService.selectByPrimaryKey(Integer.valueOf(id));
    }

    @RequestMapping(value = "/allSongList",method = RequestMethod.GET)
    public Object allSongList(HttpServletRequest request){
        return songListService.allSongList();
    }

    @RequestMapping(value = "/songListOfTitle",method = RequestMethod.GET)
    public Object SongListOfTitle(HttpServletRequest request){
        String title = request.getParameter("title").trim();
        return songListService.SongListOfTitle(title);
    }

    @RequestMapping(value = "/songListLikeTitle",method = RequestMethod.GET)
    public Object SongListLikeTitle(HttpServletRequest request){
        String title = request.getParameter("title").trim();
        return songListService.SongListLikeTitle("%"+title+"%");
    }

    @RequestMapping(value = "/songListOfStyle",method = RequestMethod.GET)
    public Object SongListLikeStyle(HttpServletRequest request){
        String style = request.getParameter("style").trim();
        return songListService.SongListOfStyle("%"+style+"%");
    }

    // 更新歌手图片
    @RequestMapping(value = "/updatePic",method = RequestMethod.POST)
    public Object updatePic(@RequestParam("file") MultipartFile avatorFile, @RequestParam("id")int id){
        JSONObject jsonObject = new JSONObject();
        if(avatorFile.isEmpty()){
            jsonObject.put("code",0);
            jsonObject.put("msg","文件上传失败");
            return jsonObject;
        }
        String fileName = System.currentTimeMillis()+avatorFile.getOriginalFilename(); // 防止文件同名
        String filePath = System.getProperty("user.dir")+"/src/main/resources/static/img/SingerPic";
        File file1 = new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }
        File dest = new File(filePath+"/"+fileName);
        String storagePath = "/img/SingerPic/" + fileName;
        try {
            avatorFile.transferTo(dest);
            SongList SongList = new SongList();
            SongList.setId(id);
            SongList.setPic(storagePath);
            boolean flag = songListService.update(SongList);
            if(flag){
                jsonObject.put("code",1);
                jsonObject.put("msg","文件上传成功");
                jsonObject.put("pic",storagePath);
            }else{
                jsonObject.put("code",0);
                jsonObject.put("msg","文件上传失败");
                jsonObject.put("pic",storagePath);
            }
            return jsonObject;
        } catch (IOException e) {
            e.printStackTrace();
            jsonObject.put("code",0);
            jsonObject.put("msg","文件上传失败"+e.getMessage());
        }
        finally {
            return jsonObject;
        }
    }
}
