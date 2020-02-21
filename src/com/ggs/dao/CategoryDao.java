package com.ggs.dao;

import com.ggs.domain.Category;
import com.ggs.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @author Not Today
 * @date 2019/8/15-19:36
 */
public class CategoryDao {

    public List<Category> findAllCategory() throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from category";
        return runner.query(sql, new BeanListHandler<Category>(Category.class));
    }


    public Category findCategoryByCid(int cid) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from category where cid=?";
        return runner.query(sql, new BeanHandler<Category>(Category.class ),cid);
    }
}
