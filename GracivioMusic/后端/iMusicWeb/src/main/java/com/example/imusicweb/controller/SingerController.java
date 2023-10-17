package com.example.imusicweb.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.imusicweb.database.Singer;
import com.example.imusicweb.service.SingerService;
import javafx.scene.input.DataFormat;
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
@RequestMapping("/singer")
public class SingerController {
    @Autowired
    private SingerService singerService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addSinger(HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = new JSONObject();
        String username = request.getParameter("username").trim();
        String sex = request.getParameter("sex").trim();
        String pic = request.getParameter("pic").trim();
        String birthday = request.getParameter("birthday").trim();
        String location = request.getParameter("location").trim();
        String introduction = request.getParameter("introduction").trim();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = new Date();
        try{
            birthDate = dateFormat.parse(birthday);
        }catch (ParseException e){
            e.printStackTrace();
        }
        Singer singer = new Singer();
        singer.setname(username);
        singer.setSex(Byte.valueOf(sex));
        singer.setPic(pic);
        singer.setLocation(location);
        singer.setBirthday(birthDate);
        singer.setIntroduction(introduction);
        boolean flag = singerService.insert(singer);
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
    public Object updateSinger(HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        String username = request.getParameter("username").trim();
        String sex = request.getParameter("sex").trim();
        String birthday = request.getParameter("birthday").trim();
        String location = request.getParameter("location").trim();
        String introduction = request.getParameter("introduction").trim();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = new Date();
        try{
            birthDate = dateFormat.parse(birthday);
        }catch (ParseException e){
            e.printStackTrace();
        }
        Singer singer = new Singer();
        singer.setId(Integer.valueOf(id));
        singer.setname(username);
        singer.setSex(Byte.valueOf(sex));
        singer.setLocation(location);
        singer.setBirthday(birthDate);
        singer.setIntroduction(introduction);
        boolean flag = singerService.update(singer);
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
    public Object deleteSinger(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        boolean flag = singerService.delete(Integer.valueOf(id));
        return flag;
    }

    @RequestMapping(value = "/selectByPrimaryKey",method = RequestMethod.POST)
    public Object selectByPrimaryKey(HttpServletRequest request){
        String id = request.getParameter("id").trim();
        return singerService.selectByPrimaryKey(Integer.valueOf(id));
    }

    @RequestMapping(value = "/allSinger",method = RequestMethod.GET)
    public Object allSinger(HttpServletRequest request){
        return singerService.allSinger();
    }

    @RequestMapping(value = "/singerOfName",method = RequestMethod.GET)
    public Object singerOfName(HttpServletRequest request){
        String name = request.getParameter("name").trim();
        return singerService.singerOfName("%"+name+"%");
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
            Singer singer = new Singer();
            singer.setId(id);
            singer.setPic(storagePath);
            boolean flag = singerService.update(singer);
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
