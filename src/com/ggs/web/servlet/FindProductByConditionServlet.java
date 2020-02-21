package com.ggs.web.servlet;

import com.ggs.domain.Book;
import com.ggs.domain.BookForSearch;
import com.ggs.service.BookService;
import com.ggs.service.CategoryService;
import com.ggs.vo.Condition;
import com.ggs.vo.PageBean;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/**
 * @author Not Today
 * @date 2019/8/16-11:03
 */
public class FindProductByConditionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        Condition condition=new Condition();
        String flag = request.getParameter("flag");
        HttpSession session = request.getSession();
        if(flag!=null) {
            //搜索
            try {
                BeanUtils.populate(condition, parameterMap);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
            session.setAttribute("condition", condition);
        }else{
            //分页
            condition= (Condition) session.getAttribute("condition");
        }
        //定义每页显示数
        int currentCount=4;
        //获取当前页
        String currentPageStr = request.getParameter("currentPage");
        if(currentPageStr==null||"".equals(currentPageStr)){
            currentPageStr="1";
        }
        int currentPage=Integer.parseInt(currentPageStr);

        BookService service=new BookService();
        PageBean<BookForSearch> pageBean=new PageBean<>();
        try {
            pageBean=service.findPageBenByCondition(condition,currentCount,currentPage);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("condition", condition);
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
                        book=service.findBookInfoById(id);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    historyList.add(book);
                }
            }

        }
        request.setAttribute("historyList",historyList );




        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }

}