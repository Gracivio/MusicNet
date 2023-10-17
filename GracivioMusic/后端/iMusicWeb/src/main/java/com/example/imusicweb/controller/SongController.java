package com.example.imusicweb.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.imusicweb.database.Singer;
import com.example.imusicweb.database.Song;
import com.example.imusicweb.service.SingerService;
import com.example.imusicweb.service.SongService;
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

import static jdk.nashorn.internal.objects.Global.print;

@RestController
@RequestMapping("/song")
public class SongController {
    @Autowired
    private SongService songService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addSong(HttpServletRequest request, @RequestParam("file")MultipartFile mpFile){
        JSONObject jsonObject = new JSONObject();
        String singer_id = request.getParameter("singerId").trim();
        String name = request.getParameter("name").trim();
        String introduction = request.getParameter("introduction").trim();
        String pic = "/img/SingerPic/xzq.png";
        String lyric = request.getParameter("lyric").trim();
        if(mpFile.isEmpty()){
            jsonObject.put("code",0);
            jsonObject.put("msg","文件上传失败");
            return jsonObject;
        }
        String fileName = System.currentTimeMillis()+mpFile.getOriginalFilename(); // 防止文件同名
        String filePath = System.getProperty("user.dir")+"/src/main/resources/static/song";
        File file1 = new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }
        File dest = new File(filePath+"/"+fileName);
        String storagePath = "/song/" + fileName;
        try {
            mpFile.transferTo(dest);
            Song song = new Song();
            song.setSinger_id(Integer.valueOf(singer_id));
            song.setName(name);
            song.setIntroduction(introduction);
            song.setPic(pic);
            song.setLyric(lyric);
            song.setUrl(storagePath);
            boolean flag = songService.insert(song);
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
            System.out.print("catch运行");
            e.printStackTrace();
            jsonObject.put("code",0);
            jsonObject.put("msg","文件上传失败"+e.getMessage());
            return jsonObject;
        }
        finally {;
        }
    }

    @RequestMapping(value = "/singer/detail",method = RequestMethod.GET)
    public Object songOfSinger(HttpServletRequest request){
        String singerId = request.getParameter("singerId").trim();
        return songService.SongOfSinger(Integer.parseInt(singerId));
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public Object updateSong(HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        String username = request.getParameter("name").trim();
        String introduction = request.getParameter("introduction").trim();
        String lyric = request.getParameter("lyric").trim();
        Date birthDate = new Date();
        Song song = new Song();
        song.setId(Integer.valueOf(id));
        song.setName(username);
        song.setIntroduction(introduction);
        song.setLyric(lyric);
        boolean flag = songService.update(song);
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
    public Object deleteSong(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        boolean flag = songService.delete(Integer.parseInt(id));
        return flag;
    }

    @RequestMapping(value = "/updateSongPic",method = RequestMethod.POST)
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
            Song song = new Song();
            song.setId(id);
            song.setPic(storagePath);
            boolean flag = songService.update(song);
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

    @RequestMapping(value = "/updateSongUrl",method = RequestMethod.POST)
    public Object updateSong(@RequestParam("file") MultipartFile avatorFile, @RequestParam("id")int id){
        JSONObject jsonObject = new JSONObject();
        if(avatorFile.isEmpty()){
            jsonObject.put("code",0);
            jsonObject.put("msg","文件上传失败");
            return jsonObject;
        }
        String fileName = System.currentTimeMillis()+avatorFile.getOriginalFilename(); // 防止文件同名
        String filePath = System.getProperty("user.dir")+"/src/main/resources/static/song";
        File file1 = new File(filePath);
        if(!file1.exists()){
            file1.mkdir();
        }
        File dest = new File(filePath+"/"+fileName);
        String storagePath = "/song/" + fileName;
        try {
            avatorFile.transferTo(dest);
            Song song = new Song();
            song.setId(id);
            song.setUrl(storagePath);
            boolean flag = songService.update(song);
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

    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public Object songOfSingerId(HttpServletRequest request){
        String songId = request.getParameter("songId").trim();
        return songService.selectByPrimaryKey(Integer.parseInt(songId));
    }

    @RequestMapping(value = "/songOfSongName",method = RequestMethod.GET)
    public Object songOfSongName(HttpServletRequest request){
        String name = request.getParameter("songName").trim();
        return songService.SongName(name);
    }

    @RequestMapping(value = "/allSong",method = RequestMethod.GET)
    public Object allSong(HttpServletRequest request){
        return songService.allSong();
    }

    @RequestMapping(value = "/likeSongOfName",method = RequestMethod.GET)
    public Object SongLikeName(HttpServletRequest request){
        String name = request.getParameter("songName").trim();
        return songService.SongOfName(name);
    }

    @RequestMapping(value = "/countTimes",method = RequestMethod.GET)
    public Object countTimes(HttpServletRequest request){
        String id = request.getParameter("songId").trim();
        return songService.countTimes(Integer.valueOf(id));
    }

}
