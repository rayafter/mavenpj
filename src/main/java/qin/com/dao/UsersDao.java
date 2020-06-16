package qin.com.dao;
import qin.com.entity.Users;
import java.util.List;
/**
 * 接口中的访法是与我们定义的UsersMapper.xml的操作是对应的
 */
public interface UsersDao {

    /*
    查询users数据表中所有数据
     */
    List<Users> queryAll();
}
