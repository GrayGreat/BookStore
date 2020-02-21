package com.ggs.web.servlet;

import com.ggs.domain.BookForSearch;
import com.ggs.domain.Category;
import com.ggs.service.BookService;
import com.ggs.service.CategoryService;
import com.ggs.vo.PageBean;

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
 * @date 2019/8/15-19:49
 */
public class ProductListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cidStr = request.getParameter("cid");
        int cid=Integer.parseInt(cidStr);
        CategoryService categoryService=new CategoryService();
        Category category=null;
        try {
            category=categoryService.findCategoryByCid(cid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("category",category );

        //定义每页显示数
        int currentCount=4;
        //从页面获取当前页数
        String currentPageStr = request.getParameter("currentPage");
        if(currentPageStr==null||"".equals(currentPageStr)){
            currentPageStr="1";
        }
        int currentPage=Integer.parseInt(currentPageStr);



        BookService bookService=new BookService();
        PageBean pageBean = bookService.getPageBean(cid,currentCount,currentPage);
        request.setAttribute("cid", cid);
        request.setAttribute("pageBean", pageBean);


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

        request.getRequestDispatcher("/book_list.jsp").forward(request,response);

    }

}