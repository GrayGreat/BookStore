package com.ggs.web.servlet;

import com.ggs.domain.User;
import com.ggs.service.UserService;
import com.ggs.utils.CommonUtils;
import com.ggs.utils.MailUtils;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 */
public class RegistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String checkCode = request.getParameter("checkCode");
        HttpSession session = request.getSession();
        String check_code = (String) session.getAttribute("check_code");
        if(checkCode!=null&&!"".equals(checkCode)&&check_code.equals(checkCode)) {
            User user = new User();
            Map<String, String[]> parameterMap = request.getParameterMap();
            try {
                BeanUtils.populate(user, parameterMap);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
            //封装用户信息
            //id为自增,设空
            user.setUid(null);
            //设置激活状态 1 已激活  0 待激活
            user.setState(0);
            //设置激活码
            user.setActive_code(CommonUtils.getUUID());
            //设置注册时间
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String current=sdf.format(new Date());
            Timestamp timestamp=Timestamp.valueOf(current);
            user.setRegist_time(timestamp);
            UserService service=new UserService();
            boolean isRegist=service.regist(user);
//            System.out.println(user.toString());
            response.setContentType("text/html;charset=UTF-8");
            if (isRegist) {
//                //跳转之前,先发送激活邮件

                String emailMsg="恭喜您注册成功!请点击下面的链接激活账户<a href='http://localhost:8080/BookStore/active?activeCode="+user.getActive_code()+"'>" +
                        "http://localhost:8080/BookStore/active?activeCode="+user.getActive_code()+"</a>";
                //用户点击后跳转activeServlet进行激活---->修改激活码这个字段
                try {
                    MailUtils.sendMail(user.getEmail(), emailMsg);
                } catch (MessagingException e) {
                    e.printStackTrace();
                }


                response.getWriter().write("注册成功!!!正在跳转<a href='"+request.getContextPath()+"/registerSuccess.jsp'>邮箱登陆界面</a>");
                response.setHeader("refresh", "3;url="+request.getContextPath()+"/registerSuccess.jsp");

//                response.getWriter().write("注册成功!!!,3秒后跳转");
//                response.setHeader("refresh", "3;url="+request.getContextPath()+"/login.jsp");

            }else{
                response.getWriter().write("注册失败!!!");
                response.setHeader("refresh", "3;url="+request.getContextPath()+"/regist.jsp");
            }
        }else{
            request.setAttribute("checkCodeInfo", "验证码错误");
            request.getRequestDispatcher("/regist.jsp").forward(request, response);
        }

    }

}