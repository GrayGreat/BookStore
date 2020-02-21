package com.ggs.web.servlet;

import com.ggs.domain.Order;
import com.ggs.domain.User;
import com.ggs.service.UserService;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Not Today
 * @date 2019/8/18-13:44
 */
public class FindOrderItemByUidServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //点击查看订单

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        //未登录,则跳转到登录页面
        if(user==null){
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return;
        }

        //登录则去数据库查询该用户的订单-->uid
        UserService userService=new UserService();

        //获取已支付的账单
        List<Order> paidOrders=userService.findPaidOrderByUid(user.getUid());


        //获取未支付的账单
        List<Order> noPayOrders=userService.findNoPayOrderByUid(user.getUid());
        double total=0.0;
        for(Order order:noPayOrders){
            total+=order.getTotal();
        }
        request.setAttribute("paidOrders",paidOrders );
        request.setAttribute("total", total);
        request.setAttribute("noPayOrders", noPayOrders);
        request.getRequestDispatcher("/order_info.jsp").forward(request, response);

    }

}