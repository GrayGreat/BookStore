package com.ggs.web.servlet;

import com.ggs.vo.Cart;
import com.ggs.vo.CartItem;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Not Today
 * @date 2019/8/17-22:22
 */
public class DelCartItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");
        if(cart!=null) {
            Map<String, CartItem> cartItems = cart.getCartItems();
            CartItem cartItem = cartItems.get(id);
            cart.setTotal(cart.getTotal()-cartItem.getSubtotal());
            cartItems.remove(id);
        }

        response.sendRedirect(request.getContextPath()+"/shop_cart.jsp");


    }

}