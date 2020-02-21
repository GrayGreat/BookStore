package com.ggs.web.servlet;

import com.ggs.domain.Book;
import com.ggs.domain.BookForSearch;
import com.ggs.domain.Category;
import com.ggs.service.BookService;
import com.ggs.service.CategoryService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/16-14:12
 */
public class FindBookInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String cidStr = request.getParameter("cid");


        String currentPage = request.getParameter("currentPage");
        String index = request.getParameter("index");
        BookService bookService=new BookService();
        BookForSearch book=null;
        try {
            book=bookService.findBookInfoById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(cidStr!=null) {
            CategoryService categoryService = new CategoryService();
            int cid = Integer.parseInt(cidStr);
            Category category = null;
            try {
                category = categoryService.findCategoryByCid(cid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("category", category);
        }
        request.setAttribute("index", index);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("book", book);

        //当用户点击一件商品时,则将该id值记录到cookie中,并返回给客户端,
        //下次再点击商品,先判断是否已经点击过,是,则将id先删除,然后再拼接到cookie的开头,再返回给客户端
        //否,则直接拼接到头部,返回给科幻段

        //1.获取所有cookie
        Cookie[] cookies = request.getCookies();
        String ids=id;
        for(Cookie cookie:cookies){
            //遍历cookie,找到ids
            if("ids".equals(cookie.getName())){
                ids=cookie.getValue();
                //拼接--> id1-id2-id3
                //        先拆分
                String[] split = ids.split("_");
                //将String数组转换成集合
                List<String> listStr = Arrays.asList(split);
                //利用LinkedList的构造方法将List转换成LinkedList,方便操作
                LinkedList<String> list=new LinkedList<>(listStr);
                boolean contains = list.contains(id);
                if(contains){
                    //存在相同的id,先移除,再拼接到头部
                    list.remove(id);
                }
                //不存在,则直接拼接到头部
                list.addFirst(id);
                //{1,4,5,6}
                //再拼接成字符串
                StringBuffer sb=new StringBuffer();
                for(int i=0;i<list.size()&&i<6;i++){
                    sb.append(list.get(i));
                    sb.append("_");
                }
                //最后多出-,切掉 1-4-5-6-
                ids=sb.substring(0, sb.length()-1);
            }
        }

        Cookie cookie=new Cookie("ids", ids);
        response.addCookie(cookie);
        request.getRequestDispatcher("book_info.jsp").forward(request, response);

    }

}