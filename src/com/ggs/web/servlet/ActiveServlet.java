package com.ggs.web.servlet;

import com.ggs.service.UserService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/20-18:54
 */
public class ActiveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String activeCode = request.getParameter("activeCode");

        UserService userService=new UserService();

        int row=userService.active(activeCode);

        if(row>0){
            response.getWriter().write("<h1 style='color:orange;text-align:center'>激活成功</h1>");
//            response.setHeader("refresh", "3;url="+request.getContextPath()+"/login.jsp");
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }else{
            response.getWriter().write("激活失败!!!");
        }


    }

}