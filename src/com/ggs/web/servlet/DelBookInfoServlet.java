package com.ggs.web.servlet;

import com.ggs.service.BookService;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/18-17:21
 */
public class DelBookInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        BookService bookService=new BookService();
        try {
            bookService.delBookById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String destination = request.getParameter("destination");
        if("query".equals(destination)){
            String currentPage = request.getParameter("currentPage");
            response.sendRedirect(request.getContextPath()+"/searchBookInfo?currentPage="+currentPage);
            return;
        }

        response.sendRedirect(request.getContextPath()+"/adminFindAllBooks");

    }

}