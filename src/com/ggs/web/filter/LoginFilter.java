package com.ggs.web.filter;

import com.ggs.domain.User;
import com.ggs.service.UserService;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * @author Not Today
 * @date 2019/8/15-15:57
 */
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request= (HttpServletRequest) req;
        HttpServletResponse response= (HttpServletResponse) resp;
        HttpSession session = request.getSession();

        Cookie[] cookies = request.getCookies();
        String username=null;
        String password=null;
        String autoLogin=null;
        UserService service=new UserService();
        if (cookies != null) {
            for(Cookie cookie:cookies){
                if("username".equals(cookie.getName())){
                    username=cookie.getValue();
                }
                if("password".equals(cookie.getName())){
                    password=cookie.getValue();
                }
                if("autoLogin".equals(cookie.getName())){
                    autoLogin=cookie.getValue();
                }
                //判断autoLogin
                if(autoLogin==null){
                    //记住密码
                    request.setAttribute("username", username);
                    request.setAttribute("password", password);
                }else{
                    //自动登陆
                    User user=null;
                    try {
                        user= service.login(username, password);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    if(user!=null){
                        System.out.println("autologin");
                        session.setAttribute("user", user);
                    }
                }


            }
        }


        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
