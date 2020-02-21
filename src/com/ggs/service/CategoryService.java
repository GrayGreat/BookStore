package com.ggs.service;

import com.ggs.dao.CategoryDao;
import com.ggs.domain.Category;

import java.sql.SQLException;
import java.util.List;

/**
 * @author Not Today
 * @date 2019/8/15-19:34
 */
public class CategoryService {
    private CategoryDao dao=new CategoryDao();
    public List<Category> findAllCategory() throws SQLException {
        return dao.findAllCategory();
    }

    public Category findCategoryByCid(int cid) throws SQLException {
        return dao.findCategoryByCid(cid);
    }
}
