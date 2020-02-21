package com.ggs.web.servlet;

import com.ggs.service.UserService;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Not Today
 * @date 2019/8/19-22:57
 */
public class ModifyInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String telephone = request.getParameter("telephone");

        System.out.println(password+":"+repassword+":"+telephone);
        if(password!=null&&!"".equals(password)&&repassword!=null&&!"".equals(repassword)&&telephone!=null&&!"".equals(telephone)){
            if(password.equals(repassword)) {
                String uid = request.getParameter("uid");
                UserService userService = new UserService();
                try {
                    userService.modifyInfo(uid,password,telephone);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                //修改后重新登录
                HttpSession session = request.getSession();
                session.removeAttribute("user");
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }else{
                response.sendRedirect(request.getContextPath()+"/infomanage.jsp");
            }
        }else{
            response.sendRedirect(request.getContextPath()+"/infomanage.jsp");
        }


    }

}