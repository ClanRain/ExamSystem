package cn.edu.hziee.Dao;

import cn.edu.hziee.Entity.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

public class UserDao extends BaseDao{
    public User login(String username,String password)
    {
        String sql = "select * from  User where username = '" + username + "' and password = '" + password + "'";
        ResultSet resultSet = query(sql);
        try {
            if(resultSet.next()){
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                return user;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}
