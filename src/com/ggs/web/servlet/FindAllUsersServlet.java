package com.ggs.web.servlet;

import com.ggs.domain.User;
import com.ggs.service.UserService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/20-14:52
 */
public class FindAllUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //查找所有的用户
        UserService userService=new UserService();
        List<User> userList=null;
        try {
            userList=userService.findAllUsers();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/admin/user.jsp").forward(request, response);

    }

}