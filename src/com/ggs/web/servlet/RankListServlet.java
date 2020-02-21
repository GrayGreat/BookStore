package com.ggs.web.servlet;

import com.ggs.domain.Book;
import com.ggs.service.BookService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/21-11:02
 */
public class RankListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BookService bookService=new BookService();

        List<Book> bookList=null;
        try {
            bookList=bookService.rankList();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("bookList",bookList );
        request.getRequestDispatcher("/admin/rank.jsp").forward(request, response);

    }

}