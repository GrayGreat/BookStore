package com.ggs.web.servlet;

import com.ggs.domain.Book;
import com.ggs.domain.Category;
import com.ggs.service.BookService;
import com.ggs.service.CategoryService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/18-17:32
 */
public class UpdateBookInfoUIServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        BookService bookService=new BookService();
        CategoryService categoryService=new CategoryService();
        Book book=null;
        Category category=null;
        List<Category> categories=new ArrayList<>();
        try {
            book=bookService.findBookById(id);
            category=categoryService.findCategoryByCid(Integer.parseInt(book.getCid()));
            book.setCategory(category);
            categories=categoryService.findAllCategory();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String destination = request.getParameter("destination");
        String currentPage = request.getParameter("currentPage");
        if(destination!=null&&!"".equals(destination)){
            request.setAttribute("destination", destination);
            request.setAttribute("currentPage", currentPage);
        }
        request.setAttribute("book", book);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin/update.jsp").forward(request, response);

    }

}