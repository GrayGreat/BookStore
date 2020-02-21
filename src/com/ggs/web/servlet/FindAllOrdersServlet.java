package com.ggs.web.servlet;

import com.ggs.domain.Order;
import com.ggs.service.OrderService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/20-15:43
 */
public class FindAllOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        OrderService orderService=new OrderService();

        List<Order> orderList=null;
        try {
            orderList=orderService.findAllOrders();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("/admin/orders.jsp").forward(request, response);
    }

}