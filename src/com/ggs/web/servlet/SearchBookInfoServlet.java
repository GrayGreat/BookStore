package com.ggs.web.servlet;

import com.ggs.service.BookService;
import com.ggs.vo.PageBean;
import com.ggs.vo.Query;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Not Today
 * @date 2019/8/18-22:41
 */
public class SearchBookInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        final int currentCount=4;//当前每页显示数
        String currentPageStr = request.getParameter("currentPage");
        if("".equals(currentPageStr)||currentPageStr==null){
            currentPageStr="1";
        }
        int currentPage=Integer.parseInt(currentPageStr);
        String flag = request.getParameter("flag");
        Query Query=new Query();
        HttpSession session = request.getSession();

        //判别用户点击的是搜索还是分页按钮
        if(flag!=null) {
            //用户点击的是搜索按钮
            session.removeAttribute("Query");//移除之前的查询条件
            //获取新的查询条件
            Map<String, String[]> parameterMap = request.getParameterMap();
            try {
                BeanUtils.populate(Query, parameterMap);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
            session.setAttribute("Query", Query);
        }else{
            //用户点击的是分页按钮
            Query = (Query) session.getAttribute("Query");
        }
        BookService bookService=new BookService();
        PageBean pageBean=bookService.findPageBeanByQuery(currentCount,currentPage,Query);
        System.out.println(pageBean.getTotalPage());
        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("/admin/query.jsp").forward(request, response);
    }

}