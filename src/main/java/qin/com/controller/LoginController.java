package qin.com.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import qin.com.entity.Users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@Controller
public class LoginController
{
    //当前控制器的login方法映射到地址
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    //当前控制器的logincheck方法映射到地址
    @RequestMapping("/logincheck")
    @ResponseBody
    public void logincheck(@RequestBody Users user, HttpServletResponse response,HttpServletRequest request) throws IOException {
        if("qin".equals(user.getName()) && "qin".equals(user.getPass())){
            //登录成功把用户登录的信息保存起来
            HttpSession session = request.getSession();
            session.setAttribute("usercode",user);
            //session.getAttribute("backurl")这是保存跳转到上一个页面,backurl属性值是在拦截器中设置的。
            response.getWriter().println("{\"success\":true,\"url\":\""+session.getAttribute("backurl")+"\"}");
        }else{
            response.getWriter().println("{\"success\":false}");
        }
    }
}