package com.ggs.web.servlet;

import com.ggs.domain.Book;
import com.ggs.domain.BookForSearch;
import com.ggs.domain.Category;
import com.ggs.service.BookService;
import com.ggs.service.CategoryService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/15-17:21
 */
public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //从数据库获取最热门(根据销量)的四条数据,再首页显示
        BookService bookService=new BookService();
        List<BookForSearch> bookList = null;
        try {
            bookList = bookService.findIndexBookList();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

}