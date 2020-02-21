package com.ggs.web.servlet;

import com.ggs.domain.User;
import com.ggs.service.UserService;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/**
 * @author Not Today
 * @date 2019/8/15-14:19
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String checkCode = request.getParameter("checkCode");//前台验证码
        HttpSession session = request.getSession();
        String check_code = (String) session.getAttribute("check_code");//后台设置的验证码
        if(checkCode!=null&&!"".equals(checkCode)&&check_code.equals(checkCode)){
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            UserService service=new UserService();
            User user=null;
            try {
                user=service.login(username,password);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if(user!=null) {//登录成功
                if(user.getState()==1) {
                    session.setAttribute("user", user);
                    //跳转前判断用户是否勾选记住密码选项或者自动登陆选项
                    String remember = request.getParameter("remember");
                    String autoLogin = request.getParameter("autoLogin");
                    System.out.println(remember + ":" + autoLogin);
                    Cookie cookie_username = new Cookie("username", username);
                    Cookie cookie_password = new Cookie("password", password);
                    Cookie cookie_autologin = new Cookie("autoLogin", autoLogin);
                    //将session持久化,防止session丢失
                    String id = session.getId();
                    Cookie cookie_id = new Cookie("JSESSIONID", id);
                    cookie_username.setPath(request.getContextPath());
                    cookie_password.setPath(request.getContextPath());
                    cookie_autologin.setPath(request.getContextPath());
                    cookie_id.setPath(request.getContextPath());
                    if (remember != null && autoLogin != null || remember == null && autoLogin != null) {
                        //如果 用户勾选了两个选项,则优先选择自动登录
                        cookie_username.setMaxAge(60 * 60 * 24);
                        cookie_password.setMaxAge(60 * 60 * 24);
                        cookie_autologin.setMaxAge(60 * 60 * 24);
                        cookie_id.setMaxAge(60 * 60 * 24);
                        System.out.println("1");
                    } else {
                        //否则,分别判断用户的选项
                        //1.勾选了记住密码
                        if (remember != null && autoLogin == null) {
                            cookie_username.setMaxAge(60 * 60 * 24);
                            cookie_password.setMaxAge(60 * 60 * 24);
                            cookie_autologin.setMaxAge(0);
                            cookie_id.setMaxAge(0);
                            System.out.println("2");
                        }
                        //2.什么都没勾选
                        if (remember == null && autoLogin == null) {
                            cookie_username.setMaxAge(0);
                            cookie_password.setMaxAge(0);
                            cookie_autologin.setMaxAge(0);
                            cookie_id.setMaxAge(0);
                            System.out.println("3");
                        }
                    }
                    response.addCookie(cookie_autologin);
                    response.addCookie(cookie_password);
                    response.addCookie(cookie_username);
                    if (user.getRole().equals("administrator")) {
                        //管理员,跳转到后台
                        response.sendRedirect(request.getContextPath() + "/admin/home.jsp");
                    } else if (user.getRole().equals("general")) {
                        //普通用户,跳转到首页
                        response.sendRedirect(request.getContextPath() + "/index");
                    }
                }else{
                    request.setAttribute("loginInfo", "账号未激活,请先进行激活再登录");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            }else{//登录失败
                request.setAttribute("loginInfo", "用户名或密码错误");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("loginInfo", "验证码错误");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }

}