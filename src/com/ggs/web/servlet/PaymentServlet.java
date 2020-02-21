package com.ggs.web.servlet;

import com.ggs.service.OrderService;
import com.ggs.vo.Receiver;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Not Today
 * @date 2019/8/19-16:29
 */
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, String[]> parameterMap = request.getParameterMap();
        Receiver receiver=new Receiver();
        try {
            BeanUtils.populate(receiver, parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println(receiver.toString());

        String oid = request.getParameter("oid");
        //封装收件人的信息--->保存到订单表中的信息
        OrderService orderService=new OrderService();
//        orderService.updateReceiverInfo(receiver);
        //增加order的收件人信息
        try {
            orderService.updateOrderInfoWithReceiver(receiver,oid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath()+"/payment.jsp");
    }

}