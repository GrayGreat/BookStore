package com.ggs.web.servlet;

import com.ggs.domain.BookForSearch;
import com.ggs.domain.Category;
import com.ggs.service.BookService;
import com.ggs.service.CategoryService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/16-12:30
 */
public class FindAllCategoryAsSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryService categoryService=new CategoryService();
        List<Category> categoryList=null;
        try {
            categoryList=categoryService.findAllCategory();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        request.setAttribute("categoryList", categoryList);

        BookService bookService=new BookService();
        //获取历史浏览记录
        Cookie[] cookies = request.getCookies();
        String ids="";
        List<BookForSearch> historyList=new ArrayList<>();
        BookForSearch book=new BookForSearch();

        for(Cookie cookie:cookies){
            if("ids".equals(cookie.getName())){
                ids=cookie.getValue();
                String[] split = ids.split("_");
                for(String id:split) {
                    try {
                        book=bookService.findBookInfoById(id);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    historyList.add(book);
                }
            }

        }
        request.setAttribute("historyList",historyList );
        request.getSession().setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }

}