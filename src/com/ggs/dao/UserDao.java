package com.ggs.dao;

import com.ggs.domain.Order;
import com.ggs.domain.OrderItem;
import com.ggs.domain.User;
import com.ggs.utils.DataSourceUtils;
import com.ggs.vo.Query;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;


/**
 * @author Not Today
 * @date 2019/8/15-13:23
 */
public class UserDao {
    public int regist(User user) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="insert into user values(?,?,?,?,?,?,?,?,?,?,?)";
        int row=runner.update(sql,user.getUid(),user.getUsername(),user.getPassword(),user.getEmail(),user.getTelephone(),
                user.getIntroduce(),user.getActive_code(),user.getState(),user.getRole(),user.getRegist_time(),user.getGender());
        return row;
    }

    public User checkUsername(String username) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from user where username=?";
        User user = runner.query(sql, new BeanHandler<User>(User.class), username);
        return user;
    }

    public User login(String username, String password) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from user where username=? and password=?";
        return  runner.query(sql, new BeanHandler<User>(User.class),username,password);
    }

    public List<Order> findNoPayOrderByUid(Integer uid) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from orders where uid=? and state=? ";
        List<Order> orders = runner.query(sql,new BeanListHandler<Order>(Order.class), uid, 0);
        return orders;
    }

    public List<OrderItem> findOrderItemsByOid(String oid) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from orderitem where oid=?";
        return runner.query(sql, new BeanListHandler<>(OrderItem.class),oid);
    }

    //查找已支付的订单
    public List<Order> findPaidOrderByUid(Integer uid) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from orders where uid=? and state<>? ";
        List<Order> orders = runner.query(sql,new BeanListHandler<Order>(Order.class), uid, 0);
        return orders;
    }

    public void modifyInfo(String uid, String password, String telephone) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="update user set password=?,telephone=? where uid=?";
        runner.update(sql,password,telephone,uid );
    }

    public List<User> findAllUsers() throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from user";
        return runner.query(sql,new BeanListHandler<>(User.class));
    }


    public int active(String activeCode) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="update user set state=? where active_code=?";
        return runner.update(sql, 1, activeCode);
    }
}
