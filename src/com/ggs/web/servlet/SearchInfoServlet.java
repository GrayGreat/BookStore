package com.ggs.web.servlet;

import com.ggs.domain.Book;
import com.ggs.service.BookService;
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
 * @date 2019/8/22-12:00
 */
public class SearchInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String info = request.getParameter("info");

        BookService bookService=new BookService();

        List<Book> bookList=null;
        try {
            bookList=bookService.findBookByInfo(info);
        } catch (SQLException e) {
            e.printStackTrace();
        }

//        for(Book book:bookList){
//            System.out.println(book.toString());
//        }

        response.setContentType("text/html;charset=UTF-8");
        Gson gson=new Gson();
        String json=gson.toJson(bookList);
//        System.out.println(json);
        response.getWriter().write(json);





    }

}