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
 * @date 2019/8/19-20:01
 */
public class CheckOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //封装当前的订单信息--->根据oid
        String oid = request.getParameter("oid");

        OrderService orderService=new OrderService();
        Order order=orderService.findOrderByOid(oid);

        request.setAttribute("order",order );
        request.getRequestDispatcher("/order_info.jsp").forward(request, response);

    }

}