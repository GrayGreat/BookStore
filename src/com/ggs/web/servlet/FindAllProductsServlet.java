package com.ggs.web.servlet;

import com.ggs.domain.Category;
import com.ggs.service.BookService;
import com.ggs.service.CategoryService;
import com.ggs.vo.PageBean;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/16-10:08
 */
public class FindAllProductsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //定义每页显示数
        int currentCount=4;
        //从页面获取当前页数
        String currentPageStr = request.getParameter("currentPage");
        if(currentPageStr==null||"".equals(currentPageStr)){
            currentPageStr="1";
        }
        int currentPage=Integer.parseInt(currentPageStr);
        BookService bookService=new BookService();
        PageBean pageBean = bookService.getPageBean(currentCount,currentPage);
        request.setAttribute("pageBean", pageBean);


        CategoryService categoryService=new CategoryService();
        List<Category> categoryList=null;
        try {
            categoryList=categoryService.findAllCategory();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("categoryList", categoryList);

        request.getRequestDispatcher("/search.jsp").forward(request,response);
    }

}