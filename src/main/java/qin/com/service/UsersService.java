package qin.com.service;
import qin.com.entity.Users;

public interface UsersService {
    int deleteByPrimaryKey(Long id);
    int insert(Users record);
    int insertSelective(Users record);
    Users selectByPrimaryKey(Long id);
    int updateByPrimaryKeySelective(Users record);
    int updateByPrimaryKey(Users record);
}