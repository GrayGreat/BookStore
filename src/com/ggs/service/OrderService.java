package com.ggs.service;

import com.ggs.dao.BookDao;
import com.ggs.dao.OrderDao;
import com.ggs.domain.Book;
import com.ggs.domain.Order;
import com.ggs.domain.OrderItem;
import com.ggs.utils.DataSourceUtils;
import com.ggs.vo.Receiver;

import javax.xml.crypto.Data;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 * @author Not Today
 * @date 2019/8/17-23:20
 */
public class OrderService {
    OrderDao dao=new OrderDao();

    public void submitOrder(Order order) {

        //存储订单与存储订单项要同步成功,所以需要使用事务 进行操作,如果中途出现异常问题,则进行回滚操作,保持数据完整性

        try {
            //开启事务
            DataSourceUtils.startTransaction();

            OrderDao orderDao=new OrderDao();
            //保存订单
            orderDao.addOrder(order);
            //保存订单项--->订单项 保存在order中,直接传递order进行操作
            orderDao.addOrderItems(order);


        } catch (SQLException e) {
            try {
                //如果出现异常,则进行回滚操作
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }finally{
            try {
                //最终进行提交,并且将绑定的Connection进行释放
                DataSourceUtils.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


    }

    public List<Order> findOrderByUid(Integer uid) throws SQLException {
        //封装order
        List<Order> orderList=dao.findOrderByUid(uid);
        //封装order中的orderitem集合
        List<OrderItem> orderItems;
        for(Order order:orderList){
            orderItems=dao.findOrderItemByOid(order.getOid());

            order.setOrderItemList(orderItems);
        }

        return orderList;

    }

    public void delOrder(String oid) {
        try {

            DataSourceUtils.startTransaction();

            //恢复库存量--->因为在点击提交订单的时候已经将库存量减少,删除订单需要将其回复


            //根据oid查找所有的订单项,获取相应商品的购买数,回复库存量
            List<OrderItem> orderItems = dao.findOrderItemByOid(oid);
            BookDao bookDao=new BookDao();
            for(OrderItem orderItem:orderItems){
                //获取该订单的商品
                Book book = bookDao.findBookById(orderItem.getId());
                //将旧的库存量+订单的购买数量-->删除订单后的新的库存量
                int newPnum=book.getPnum()+orderItem.getCount();
                //遍历该订单的所有订单项,获取该订单项商品id和购买数量--->进行恢复库存量
                bookDao.recoverBookPnum(orderItem.getId(),newPnum);
            }

            dao.delOrderItemByOid(oid);

            dao.delOrderByOid(oid);


//            bookService.recoverPnum()

        } catch (SQLException e) {
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }finally {
            try {
                DataSourceUtils.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    public Order findOrderByOid(String oid) {
        Order order=null;
        //封装order的基本信息
        try {
            order=dao.findOrderByOid(oid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //封装order的OrderItem集合

        List<OrderItem> orderItems = null;
        try {
            orderItems=dao.findOrderItemByOid(oid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //封装订单项中的商品book
        BookService bookService=new BookService();
        Book book=null;
        for(OrderItem orderItem:orderItems){
            try {
                book=bookService.findBookById(orderItem.getId());
            } catch (SQLException e) {
                e.printStackTrace();
            }
            orderItem.setBook(book);
        }


        order.setOrderItemList(orderItems);
        return order;

    }

    public void updateOrderInfoWithReceiver(Receiver receiver, String oid) throws SQLException {

        dao.updateOrderInfoWithReceiver(receiver,oid);



    }

    public List<Order> findAllOrders() throws SQLException {
        List<Order> orderList=dao.findAllOrders();

        List<OrderItem> orderItemList=null;
        for(Order order:orderList){
            orderItemList=dao.findOrderItemByOid(order.getOid());
            order.setOrderItemList(orderItemList);
        }

        return orderList;
    }

    public boolean modifyState(String itemid, String state) throws SQLException {
        int row=dao.modifyState(itemid,state);
        return row>0?true:false;
    }
}
