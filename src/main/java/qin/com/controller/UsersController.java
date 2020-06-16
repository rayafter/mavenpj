package qin.com.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import qin.com.entity.Users;
import qin.com.service.UsersService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/users")
public class UsersController {
    @Resource(name="usersServiceImpl")  //这里引用了在业务实现类中创建的业务
    private UsersService usersService; //业务接口
    public UsersService getUsersService() {
        return usersService;
    }
    public void setUsersService(UsersService usersService) {
        this.usersService = usersService;
    }
    @RequestMapping(value="/suser",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public void suser(HttpServletRequest request, HttpServletResponse response) throws IOException     {
        Users users=usersService.selectByPrimaryKey(1l);
        response.getWriter().println(users.getName());
    }
    @RequestMapping("/ulist")  //映射地址
    public String ulist() {
        return "userlist";
    }

}