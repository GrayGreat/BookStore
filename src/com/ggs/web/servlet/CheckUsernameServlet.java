package com.ggs.web.servlet;

import com.ggs.service.UserService;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/15-11:31
 */
public class CheckUsernameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        if(username!=null&&!"".equals(username)){
            UserService service=new UserService();
            try {
                String isExist=service.checkUsername(username);
                response.getWriter().write(isExist);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

}