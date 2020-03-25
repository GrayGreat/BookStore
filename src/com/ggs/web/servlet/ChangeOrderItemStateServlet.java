package com.ggs.web.servlet;

import com.ggs.service.OrderService;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/20-17:40
 */
public class ChangeOrderItemStateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String itemid = request.getParameter("itemid");
        String state = request.getParameter("state");

        //鍔ㄦ�佷慨鏀圭姸鎬�
        OrderService orderService=new OrderService();
        boolean isSuccess=false;
        try {
            isSuccess=orderService.modifyState(itemid,state);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String  json="{\"isSuccess\":"+isSuccess+"}";
        response.getWriter().write(json);

    }

}