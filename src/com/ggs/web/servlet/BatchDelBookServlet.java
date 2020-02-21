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
 * @date 2019/8/18-22:07
 */
public class BatchDelBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        BookService bookService=new BookService();
        boolean isDel=false;
        try {
            isDel=bookService.batchDelBook(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String json="{\"isDel\":"+isDel+"}";
        response.getWriter().write(json);
    }

}