package com.ggs.web.servlet;

import com.ggs.domain.Category;
import com.ggs.service.CategoryService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Not Today
 * @date 2019/8/18-17:57
 */
public class AddBookUIServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //点击书籍添加按钮,先准备数据,跳转到添加页面

        CategoryService categoryService=new CategoryService();
        List<Category> categorys = null;
        try {
            categorys=categoryService.findAllCategory();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession();
        session.setAttribute("categorys",categorys );
        String destination = request.getParameter("destination");
        if("query".equals(destination)){
            request.getRequestDispatcher("/admin/query.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("/admin/add.jsp").forward(request, response);


    }

}