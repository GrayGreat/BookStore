package com.ggs.utils;


import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author Not Today
 * @date 2019/8/7-15:10
 */
public class DataSourceUtils {

    private static DataSource dataSource=new ComboPooledDataSource();

    private static ThreadLocal<Connection> tl=new ThreadLocal();

    public static DataSource getDataSource(){
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        Connection con = tl.get();
        if (con == null) {
            con=dataSource.getConnection();
            tl.set(con);
        }
        return con;
    }

    //开启事务
    public static void startTransaction() throws SQLException {
        Connection con=getConnection();
        con.setAutoCommit(false);
    }

    //事务回滚
    public static void rollback() throws SQLException {
        Connection con=getConnection();
        con.rollback();
    }

    //事务提交
    public  static void commit() throws SQLException {
        Connection con=getConnection();
        con.commit();
        //将Connection从tl中解绑
        tl.remove();
        con.close();
    }

}
