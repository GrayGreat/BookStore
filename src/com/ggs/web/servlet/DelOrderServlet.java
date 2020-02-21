package com.ggs.web.servlet;

import com.ggs.domain.OrderItem;
import com.ggs.service.OrderService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/19-19:50
 */
public class DelOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //根据oid订单与其他相关的订单项
        String oid = request.getParameter("oid");
//        String orderItemListJson = request.getParameter("list");
//        System.out.println("为转化的前台json");

//        Gson gson=new Gson();
//        List<OrderItem> orderItemList=gson.fromJson(orderItemListJson, new TypeToken<List<OrderItem>>(){}.getType());
//        for(OrderItem orderItem:orderItemList){
//            System.out.println(orderItem.toString());
//            System.out.println(orderItem.getCount());
//            System.out.println(orderItem.getId());
//        }

        OrderService orderService=new OrderService();
        orderService.delOrder(oid);

        //跳转会订单列表页面
        response.sendRedirect(request.getContextPath()+"/orderList");
    }

}