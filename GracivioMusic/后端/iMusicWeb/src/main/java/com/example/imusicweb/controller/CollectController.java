package com.example.imusicweb.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.imusicweb.database.Collect;
import com.example.imusicweb.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;

@RestController
@RequestMapping("/Collect")
public class CollectController {
    @Autowired
    private CollectService collectService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addCollect(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId").trim();
        String type = request.getParameter("type").trim();
        String songId = request.getParameter("songId").trim();
        System.out.println("收藏获得的userId："+userId);
        if(songId == null || songId.equals("")){
            jsonObject.put("code",0);
            jsonObject.put("msg","收藏失败");
            return jsonObject;
        }
        if (collectService.existSongId(Integer.valueOf(userId), Integer.valueOf(songId))){
            jsonObject.put("code",2);
            jsonObject.put("msg","收藏失败");
            return jsonObject;
        }
        Collect collect = new Collect();
        collect.setUserId(Integer.valueOf(userId));
        collect.setType(Byte.valueOf(type));
        collect.setSongId(Integer.valueOf(songId));
        boolean flag = collectService.insert(collect);
        if(flag){
            jsonObject.put("code",1);
            jsonObject.put("msg","收藏成功");
        }else{
            jsonObject.put("code",0);
            jsonObject.put("msg","收藏失败");
        }
        return jsonObject;
    }


    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Object deleteCollect(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String userId = request.getParameter("userId").trim();
        userId = userId.replace("userId=","");
        System.out.println("得到的id是："+userId);
        String songId = request.getParameter("songId").trim();
        boolean flag =  collectService.delete(Integer.valueOf(userId), Integer.valueOf(songId));
        return flag;
    }

    @RequestMapping(value = "/allCollect",method = RequestMethod.GET)
    public Object allCollect(HttpServletRequest request){
        return collectService.allCollect();
    }

    @RequestMapping(value = "/CollectOfUserId",method = RequestMethod.GET)
    public Object CollectOfSongId(HttpServletRequest request){
        String userId = request.getParameter("userId");
        return collectService.collectOfUserId(Integer.valueOf(userId));
    }



}
