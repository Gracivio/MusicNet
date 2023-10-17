package com.example.imusicweb.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.imusicweb.database.Client;
import com.example.imusicweb.service.ClientService;
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
@RequestMapping("/client")
public class ClientController {
    @Autowired
    private ClientService clientService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object addClient(HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = new JSONObject();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String sex = request.getParameter("sex").trim();
        String phoneNum = request.getParameter("phoneNum");
        String email = request.getParameter("email");
        String birthday = request.getParameter("birthday").trim();
        String introduction = request.getParameter("introduction").trim();
        String location = request.getParameter("location").trim();
        String avator = request.getParameter("avator").trim();

        if(username==null||username.equals("")||password==null||password.equals("")){
            jsonObject.put("code",0);
            jsonObject.put("msg","添加失败");
            return jsonObject;
        }
        Client client1 = clientService.getByUsername(email);
        if(client1 != null){
            jsonObject.put("code",0);
            jsonObject.put("msg","用户名已存在");
            return jsonObject;
        }
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = new Date();
        try{
            birthDate = dateFormat.parse(birthday);
        }catch (ParseException e){
            e.printStackTrace();
        }
        Client client = new Client();
        client.setUsername(username);
        client.setPassword(password);
        client.setSex(Byte.valueOf(sex));
        client.setPhoneNum(phoneNum);
        client.setEmail(email);
        client.setBirthday(birthDate);
        client.setIntroduction(introduction);
        client.setLocation(location);
        client.setAvator(avator);
        boolean flag = clientService.insert(client);
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
    public Object updateClient(HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String sex = request.getParameter("sex").trim();
        String phoneNum = request.getParameter("phoneNum");
        String email = request.getParameter("email");
        String birthday = request.getParameter("birthday").trim();
        String introduction = request.getParameter("introduction").trim();
        String location = request.getParameter("location").trim();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = new Date();
        try{
            birthDate = dateFormat.parse(birthday);
        }catch (ParseException e){
            e.printStackTrace();
        }
        Client client = new Client();
        client.setId(Integer.valueOf(id));
        client.setUsername(username);
        client.setPassword(password);
        client.setSex(Byte.valueOf(sex));
        client.setPhoneNum(phoneNum);
        client.setEmail(email);
        client.setBirthday(birthDate);
        client.setIntroduction(introduction);
        client.setLocation(location);
        boolean flag = clientService.update(client);
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
    public Object deleteClient(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        String id = request.getParameter("id").trim();
        boolean flag = clientService.delete(Integer.valueOf(id));
        return flag;
    }

    @RequestMapping(value = "/selectByPrimaryKey",method = RequestMethod.GET)
    public Object selectByPrimaryKey(HttpServletRequest request){
        String id = request.getParameter("id").trim();
        return clientService.selectByPrimaryKey(Integer.valueOf(id));
    }

    @RequestMapping(value = "/allClient",method = RequestMethod.GET)
    public Object allClient(HttpServletRequest request){
        return clientService.allClient();
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
            Client client = new Client();
            client.setId(id);
            client.setAvator(storagePath);
            boolean flag = clientService.update(client);
            if(flag){
                jsonObject.put("code",1);
                jsonObject.put("msg","文件上传成功");
                jsonObject.put("avator",storagePath);
            }else{
                jsonObject.put("code",0);
                jsonObject.put("msg","文件上传失败");
                jsonObject.put("avator",storagePath);
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

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public Object checkClient(HttpServletRequest request) throws ParseException {
        JSONObject jsonObject = new JSONObject();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        if(username==null||username.equals("")||password==null||password.equals("")){
            jsonObject.put("code",0);
            jsonObject.put("msg","登录失败");
            return jsonObject;
        }

        Client client = new Client();
        client.setUsername(username);
        client.setPassword(password);
        boolean flag = clientService.verifyPassword(username,password);
        if(flag){
            jsonObject.put("code",1);
            jsonObject.put("msg","登录成功");
            jsonObject.put("userMsg",clientService.getByUsername(username));
        }
        else{
            jsonObject.put("code",0);
            jsonObject.put("msg","用户名或密码错误");
        }
        return jsonObject;
    }
}
