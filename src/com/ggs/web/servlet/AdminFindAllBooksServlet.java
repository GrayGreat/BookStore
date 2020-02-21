package com.ggs.web.servlet;

import com.ggs.domain.Book;
import com.ggs.service.BookService;
import com.ggs.vo.PageBean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/18-16:47
 */
public class AdminFindAllBooksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        final int currentCount=4;//当前每页显示数
        String currentPageStr = request.getParameter("currentPage");
        if(currentPageStr==null){
            currentPageStr="1";
        }
        int currentPage=Integer.parseInt(currentPageStr);

        BookService bookService=new BookService();
        PageBean<Book> pageBean=bookService.getPageBean(currentCount,currentPage);
        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("/admin/list.jsp").forward(request, response);

    }

}