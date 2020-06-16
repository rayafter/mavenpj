package qin.com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import qin.com.entity.Users;
import qin.com.mapper.UsersMapper;
import qin.com.service.UsersService;

@Service("usersServiceImpl") //表示它是一个业务类，我们可以在控制器中调用它
public class UsersServiceImpl implements UsersService {
    @Autowired  //表示紧跟它定义的变量会被自动的进行封装。
    private UsersMapper usersMapper; //即usersMapper变量不用进行get和set设置
    //下面的方法用于向UsersMapper进行对数据表users进行操作。
    public int deleteByPrimaryKey(Long id) {
        return 0;
    }
    public int insert(Users record) {
        return 0;
    }
    public int insertSelective(Users record) {
        return 0;
    }
    public Users selectByPrimaryKey(Long id) {
        return usersMapper.selectByPrimaryKey(id);//根据users数据表的id进行查询
    }
    public int updateByPrimaryKeySelective(Users record) {
        return 0;
    }
    public int updateByPrimaryKey(Users record) {
        return 0;
    }
}
