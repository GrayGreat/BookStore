package com.ggs.web.servlet;

import com.ggs.domain.Book;
import com.ggs.domain.BookForSearch;
import com.ggs.domain.Category;
import com.ggs.service.BookService;
import com.ggs.service.CategoryService;
import com.ggs.vo.Cart;
import com.ggs.vo.CartItem;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Not Today
 * @date 2019/8/17-20:34
 */
public class AddBookToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String id = request.getParameter("id");
//        System.out.println(id);
        String buyNumStr = request.getParameter("buyNum");
//        int ccc = Integer.valueOf(buyNumStr);
//        System.out.println(ccc);
//        System.out.println(buyNum);
        CartItem cartItem=new CartItem();

//        double保留后两位小鼠
        DecimalFormat df = new DecimalFormat("#.00");

        String cid = request.getParameter("cid");
        CategoryService categoryService=new CategoryService();
        Category category = null;
        try {
            category = categoryService.findCategoryByCid(Integer.parseInt(cid));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //封装购物车项
        Book book=null;
        BookService service=new BookService();
        try {
            book = service.findBookById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        book.setCategory(category);
        //计算小计
//        数量*单价
        int buyNum = Integer.parseInt(buyNumStr);
//        System.out.println(buyNum);
        double subtotal=buyNum*book.getPrice();
        cartItem.setBook(book);
        cartItem.setBuyNum(buyNum);
        subtotal=Double.valueOf(df.format(subtotal));
        cartItem.setSubtotal(subtotal);
        //cartItem购物车项封装完毕

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart==null){
            cart=new Cart();
        }

        Map<String, CartItem> cartItems = cart.getCartItems();
        if(cartItems.containsKey(id)){
            //查看购物车中有没有相同的购物项
            CartItem oldCartItem = cartItems.get(id);
            //将旧的商品购买数+新的商品购买数
            int oldBuyNum = oldCartItem.getBuyNum();
            int newBuyNum=oldBuyNum+cartItem.getBuyNum();
            cartItem.setBuyNum(newBuyNum);

            //重新计算小计  新的购买数量*单价
            double newSubtotal=newBuyNum*book.getPrice();
            newSubtotal=Double.valueOf(df.format(newSubtotal));
            cartItem.setSubtotal(newSubtotal);
        }
        //键值对:键-->商品id 值-->购物想
        cartItems.put(id, cartItem);

        //重新计算总计
        double total=cart.getTotal()+subtotal;
        total=Double.valueOf(df.format(total));
        cart.setTotal(total);

        //将购物车放回 session中
        session.setAttribute("cart", cart);

        //重定向到购物车页面
        response.sendRedirect(request.getContextPath()+"/shop_cart.jsp");

    }

}