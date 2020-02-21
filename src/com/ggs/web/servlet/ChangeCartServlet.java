package com.ggs.web.servlet;

import com.ggs.vo.Cart;
import com.ggs.vo.CartItem;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Not Today
 * @date 2019/8/19-11:07
 */
public class ChangeCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String buyNumStr = request.getParameter("buyNum");
        DecimalFormat df = new DecimalFormat("#.00");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart!=null) {
            //key为商品的id----value为购物车项
            Map<String, CartItem> cartItems = cart.getCartItems();
            if(cartItems.containsKey(id)) {
                CartItem cartItem = cartItems.get(id);
                //获得修改的商品的购物车项
                int buyNum=Integer.parseInt(buyNumStr);
                cartItem.setBuyNum(buyNum);

                //记录旧的小计
                double oldSubtotal=cartItem.getSubtotal();
                //从新计算小计-->新购买数*单价
                double newSubtotal=buyNum*cartItem.getBook().getPrice();
//                double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
                newSubtotal=Double.valueOf(df.format(newSubtotal));
                cartItem.setSubtotal(newSubtotal);

                //计算总计---->新总计=旧总计+新小计-旧小计
                double newTotal=cart.getTotal()+(newSubtotal-oldSubtotal);
                newTotal=Double.valueOf(df.format(newTotal));
                cart.setTotal(newTotal);

                //将购物车项放回map中--->其实不需要这一步,因为是这只是引用操作
                cartItems.put(id, cartItem);

                //将购物车放回session中
                session.setAttribute("cart",cart );

                String json="{\"isSuccess\":"+true+",\"subtotal\":"+cartItem.getSubtotal()+",\"total\":"+cart.getTotal()+"}";
                System.out.println(json);
                response.getWriter().write(json);
            }
        }else{
            //如果购物车的session过期,或者没了,旧重新跳转购物车页面,当 做刷新
            response.sendRedirect(request.getContextPath()+"/shop_cart.jsp");
        }


    }

}