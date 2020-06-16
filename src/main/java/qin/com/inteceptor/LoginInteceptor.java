package qin.com.inteceptor;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import qin.com.entity.Users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Controller
public class LoginInteceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        System.out.println("Handler执行之前调用这个方法");
        //获取请求的URL
        String url = request.getRequestURI();
        //URL:login是公开的;这个demo是除了包含有“login”是可以公开访问的，其它的URL都进行拦截控制
        if(url.indexOf("login")>=0){
            return true;
        }
        //获取Session
        HttpSession session = request.getSession();
        //把用户访问地址保存，于便登录成功后跳转一此页面
        session.setAttribute("backurl",url);
        //获取用户信息
        Users user = (Users)session.getAttribute("usercode");
        //若用户为空表示没有登录，若不为空则表示已经微博vi，可以使用
        if(user != null){
            return true;
        }
        //不符合条件的，跳转到登录界面
        request.getRequestDispatcher("login").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("Handler执行完成之后调用这个方法");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        System.out.println("Handler执行之后，ModelAndView返回之前调用这个方法");
    }
}