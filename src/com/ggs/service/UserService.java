package com.ggs.service;

import com.ggs.dao.BookDao;
import com.ggs.dao.OrderDao;
import com.ggs.dao.UserDao;
import com.ggs.domain.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Not Today
 * @date 2019/8/15-13:21
 */
public class UserService {

    private UserDao dao=new UserDao();
    public boolean regist(User user) {
        int row=0;
        try {
            row=dao.regist(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row>0?true:false;
    }

    public String checkUsername(String username) throws SQLException {
        User user=dao.checkUsername(username);
        //用户不存在为false,用户名可用;
        //用户存在为true,用户名不可用
        return user==null?"1":"0";
    }

    public User login(String username, String password) throws SQLException {
        return dao.login(username,password);
    }

    public List<Order> findNoPayOrderByUid(Integer uid) {
        List<Order> orders=new ArrayList<>();
        //封装order
        //根据uid查找所有的订单--->有可能有多个订单
        try {
            orders=dao.findNoPayOrderByUid(uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //封装订单项OrderItems
        List<OrderItem> orderItems = null;
        BookDao bookDao=new BookDao();
        OrderDao orderDao=new OrderDao();
        for(Order order:orders) {
            //一个用户可能有多个订单,一个 订单有多个订单项,需要查找所有的订单,根据订单oid遍历查找订单项
            try {
                orderItems = dao.findOrderItemsByOid(order.getOid());
                for(OrderItem orderItem:orderItems){
                    //根据itemid查找book商品,进行封装
                    String id=orderDao.findBookByItemid(orderItem.getItemid());
                    Book book=bookDao.findBookById(id);
                    orderItem.setBook(book);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            order.setOrderItemList(orderItems);

        }


        return orders;

    }

    public List<Order> findPaidOrderByUid(Integer uid) {
        List<Order> orders=new ArrayList<>();
        //封装order
        //根据uid查找所有的订单--->有可能有多个订单
        try {
            orders=dao.findPaidOrderByUid(uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //封装订单项OrderItems
        List<OrderItem> orderItems = null;
        BookDao bookDao=new BookDao();
        OrderDao orderDao=new OrderDao();
        for(Order order:orders) {
            //一个用户可能有多个订单,一个 订单有多个订单项,需要查找所有的订单,根据订单oid遍历查找订单项
            try {
                orderItems = dao.findOrderItemsByOid(order.getOid());
                for(OrderItem orderItem:orderItems){
                    //根据itemid查找book商品,进行封装
                    String id=orderDao.findBookByItemid(orderItem.getItemid());
                    Book book=bookDao.findBookById(id);
                    orderItem.setBook(book);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            order.setOrderItemList(orderItems);

        }


        return orders;
    }

    public void modifyInfo(String uid, String password, String telephone) throws SQLException {
        dao.modifyInfo(uid,password,telephone);
    }

    public List<User> findAllUsers() throws SQLException {
        return dao.findAllUsers();
    }

    public int active(String activeCode) {
        int row=0;
        try {
            row=dao.active(activeCode);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }
}
