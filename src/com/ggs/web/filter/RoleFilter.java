package com.ggs.web.filter;

import com.ggs.domain.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author Not Today
 * @date 2019/8/15-16:54
 */
public class RoleFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request= (HttpServletRequest) req;
        HttpServletResponse response= (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        response.setContentType("text/html;charset=UTF-8");
        if(user!=null){
            if(user.getRole().equals("administrator")){
                chain.doFilter(request, response);
            }else{
                response.getWriter().write("<hr/><h1 style='color:red;text-align:center'>权限不足!!!!!!!</h1><hr/>");
                response.setHeader("refresh","3;url="+request.getContextPath()+"/index" );
            }
        }else{
            response.getWriter().write("<hr/><h1 style='color:red;text-align:center'>请先登录</h1><hr/>");
            response.setHeader("refresh","3;url="+request.getContextPath()+"/login.jsp" );
        }


    }

    public void init(FilterConfig config) throws ServletException {

    }

}
