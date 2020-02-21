package com.ggs.web.servlet;

import com.ggs.domain.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/**
 * @author Not Today
 * @date 2019/8/15-14:50
 */
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean quit = Boolean.parseBoolean(request.getParameter("quit"));
        User user = (User) session.getAttribute("user");
        if(quit){
            //选择强制退出-->清空密码,用户名和自动登陆的cookie,防止选择了自动登陆而无法退出
            Cookie cookie_username=new Cookie("username","xxx");
            Cookie cookie_password =new Cookie("password","xxx");
            Cookie cookie_autologin=new Cookie("autoLogin","xxx");
            Cookie cookie_id=new Cookie("JSESSIONID","xxxx" );
            cookie_username.setPath(request.getContextPath());
            cookie_password.setPath(request.getContextPath());
            cookie_autologin.setPath(request.getContextPath());
            cookie_id.setPath(request.getContextPath());
            cookie_username.setMaxAge(0);
            cookie_password.setMaxAge(0);
            cookie_autologin.setMaxAge(0);
            cookie_id.setMaxAge(0);
            response.addCookie(cookie_autologin);
            response.addCookie(cookie_password);
            response.addCookie(cookie_username);
            response.addCookie(cookie_id);
        }
        if(user!=null){
            session.removeAttribute("user");
        }
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }

}