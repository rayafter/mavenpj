package qin.com.controller;

import com.fasterxml.jackson.core.JsonGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import qin.com.entity.Users;

@Controller
@RequestMapping("json")
public class JsonControlle {

    @RequestMapping("/sendjson")
    public String sendjson(){
        return "sendjson";
    }

    //请求为json,返回json
    @RequestMapping("/requestJson")
    //@RequestBody将请求信息的json串转成user对象
    //@ResponseBody将user对象转成json输出
    @ResponseBody
    public Users requestJson(@RequestBody Users user) throws Exception{
        System.out.println(user);
        return user;//由于@ResponseBody注解，将user转成json格式返回
    }
}