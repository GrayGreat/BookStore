package com.ggs.dao;

import com.ggs.domain.Order;
import com.ggs.domain.OrderItem;
import com.ggs.utils.DataSourceUtils;
import com.ggs.vo.Query;
import com.ggs.vo.Receiver;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

/**
 * @author Not Today
 * @date 2019/8/17-23:27
 */
public class OrderDao {
    public void addOrder(Order order) throws SQLException {
        QueryRunner runner=new QueryRunner();//因为使用事务操作,所以不需要从连接池中获取,直接从ThreadLocal中取得线程绑定的Connection
        String sql="insert into orders values(?,?,?,?,?,?,?,?)";
        Connection conn = DataSourceUtils.getConnection();
        runner.update(conn,sql,
                order.getOid(),
                order.getOrdertime(),
                order.getTotal(),
                order.getState(),
                order.getAddress(),
                order.getName(),
                order.getTelephone(),
                order.getUser().getUid());
    }

    public void addOrderItems(Order order) throws SQLException {

        QueryRunner runner=new QueryRunner();//因为使用事务操作,所以不需要从连接池中获取,直接从ThreadLocal中取得线程绑定的Connection
        String sql="insert into orderitem values(?,?,?,?,?,?)";
        Connection conn = DataSourceUtils.getConnection();
        //一个订单有多个订单项,进行循环添加
        List<OrderItem> orderItemList = order.getOrderItemList();
        for(OrderItem orderItem:orderItemList){
            runner.update(conn, sql,
                    orderItem.getItemid(),
                    orderItem.getCount(),
                    orderItem.getSubtotal(),
                    orderItem.getBook().getId(),
                    orderItem.getOrder().getOid(),
                    orderItem.getItemstate());
        }
    }

    public String findBookByItemid(String itemid) throws SQLException {
        //根据订单号查找该商品id
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select id from orderitem where itemid=?";
        return runner.query(sql, new ScalarHandler<>(), itemid);
    }

    public List<Order> findOrderByUid(Integer uid) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from orders where uid=?";
        return runner.query(sql,new BeanListHandler<Order>(Order.class),uid);
    }


    public List<OrderItem> findOrderItemByOid(String oid) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from orderitem where oid=?";
        return runner.query(sql,new BeanListHandler<OrderItem>(OrderItem.class) ,oid );
    }


    //删除当前订单下 的所有订单项
    public void delOrderItemByOid(String oid) throws SQLException {
        QueryRunner runner=new QueryRunner();
        String sql="delete from orderitem where oid=?";
        Connection conn=DataSourceUtils.getConnection();
        runner.update(conn,sql,oid);
    }


    public void delOrderByOid(String oid) throws SQLException {
        QueryRunner runner=new QueryRunner();
        String sql="delete from orders where oid=?";
        Connection conn=DataSourceUtils.getConnection();
        runner.update(conn,sql,oid);
    }

    public Order findOrderByOid(String oid) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from orders where oid=?";
        return runner.query(sql,new BeanHandler<>(Order.class ),oid);
    }

    public void updateOrderInfoWithReceiver(Receiver receiver, String oid) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="update orders set address=?,name=?,telephone=?,state=? where oid=?";
        runner.update(sql,receiver.getAddress(),receiver.getName(),receiver.getTelephone(),Order.PAID,oid );

    }

    public List<Order> findAllOrders() throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from orders";
        return runner.query(sql,new BeanListHandler<>(Order.class));
    }

    public int modifyState(String itemid, String state) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="update orderitem set itemstate=? where itemid=?";
        return runner.update(sql,state,itemid);
    }
}
