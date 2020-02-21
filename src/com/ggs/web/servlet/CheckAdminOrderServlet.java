package com.ggs.web.servlet;

import com.ggs.domain.Order;
import com.ggs.service.OrderService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/20-16:36
 */
public class CheckAdminOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oid = request.getParameter("oid");

        OrderService orderService=new OrderService();
        Order order = orderService.findOrderByOid(oid);

        request.setAttribute("order", order);
        request.getRequestDispatcher("/admin/orderInfo.jsp").forward(request, response);

    }

}