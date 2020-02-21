package com.ggs.web.servlet;

import com.ggs.domain.Order;
import com.ggs.domain.OrderItem;
import com.ggs.domain.User;
import com.ggs.service.BookService;
import com.ggs.service.OrderService;
import com.ggs.utils.CommonUtils;
import com.ggs.vo.Cart;
import com.ggs.vo.CartItem;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Not Today
 * @date 2019/8/17-22:49
 */
public class SubmitOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //封装Order订单,一个订单含有一个或多个订单项

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //点击提交订单后,先判断用户是否登录(判断session中的user是否存在)
        if(user==null){
            //没登陆则跳转到登录界面
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return;
        }

        //已经登录,则将订单保存在数据库中
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart!=null) {

            //封装Order
            Order order = new Order();

//        private String oid;//订单 id
            order.setOid(CommonUtils.getUUID());
//        private Date ordertime;//下单时间
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String current=sdf.format(new Date());
            Timestamp timestamp=Timestamp.valueOf(current);
            order.setOrdertime(timestamp);
//        private double total;//总计
            order.setTotal(cart.getTotal());
//        private int state;//订单状态 0 未支付 1已支付
            order.setState(Order.NON_PAYMENT);
//        private String address;//收件人地址
            order.setAddress(null);
//        private String name;//收件人姓名
            order.setName(null);
//        private String telephone;//收件人手机号码
            order.setTelephone(null);
//        private User user;//登录用户
            order.setUser(user);

//        private List<OrderItem> orderItemList=new ArrayList<OrderItem>();
            //封装订单项,从购物车对象中获取map,遍历封装
            Map<String, CartItem> cartItems = cart.getCartItems();
            List<OrderItem> orderItems = new ArrayList<>();
            BookService bookService=new BookService();
            for (Map.Entry<String, CartItem> entry : cartItems.entrySet()) {
                CartItem cartItem = entry.getValue();
                OrderItem orderItem = new OrderItem();
//            private String itemid;//订单项id
                orderItem.setItemid(CommonUtils.getUUID());
//            private int count;//购买数量
                orderItem.setCount(cartItem.getBuyNum());
//                订单设置购买数后,将该书的库存量减少相应数量--->参数1:书的id,参数2:新的库存量(旧的库存量-购买数)

                try {
                    bookService.updatePnum(cartItem.getBook().getId(),cartItem.getBook().getPnum()-cartItem.getBuyNum());
                } catch (SQLException e) {
                    e.printStackTrace();
                }


//            private double subtotal;//小计
                orderItem.setSubtotal(cartItem.getSubtotal());
//            private String Book;//购买的 商品
                orderItem.setBook(cartItem.getBook());
//            private Order order;//所属哪一个订单
                orderItem.setOrder(order);
//                private int itemstate;//订单项状态
                orderItem.setItemstate(OrderItem.WAITDELIVER);//开始都是待发货状态
                orderItems.add(orderItem);
            }
            order.setOrderItemList(orderItems);


            OrderService service = new OrderService();
            service.submitOrder(order);

            //清空购物车
            session.removeAttribute("cart");
            //提交订单后,重定向到从数据库中获取订单数据的servlet中
            response.sendRedirect(request.getContextPath() + "/checkOrder?oid="+order.getOid());
        }


    }

}