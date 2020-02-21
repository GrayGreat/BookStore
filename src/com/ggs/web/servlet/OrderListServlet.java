package com.ggs.web.servlet;

import com.ggs.domain.Order;
import com.ggs.domain.User;
import com.ggs.service.OrderService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Not Today
 * @date 2019/8/19-17:55
 */
public class OrderListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if(user==null){
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return;
        }

        OrderService orderService=new OrderService();
        List<Order> orderList=null;
        try {
            orderList=orderService.findOrderByUid(user.getUid());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("orderList", orderList);

        request.getRequestDispatcher("/order_list.jsp").forward(request, response);
    }

}