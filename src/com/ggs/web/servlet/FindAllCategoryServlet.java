package com.ggs.web.servlet;

import com.ggs.domain.Category;
import com.ggs.service.CategoryService;
import com.google.gson.Gson;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/15-20:31
 */
public class FindAllCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //查找所有商品类型,再导航栏进行显示
        CategoryService categoryService=new CategoryService();
        List<Category> categoryList=null;
        try {
            categoryList=categoryService.findAllCategory();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Gson gson=new Gson();
        String json=gson.toJson(categoryList);
//        System.out.println(json);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }

}