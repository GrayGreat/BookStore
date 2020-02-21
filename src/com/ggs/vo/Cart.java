package com.ggs.vo;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Not Today
 * @date 2019/8/17-20:34
 */
public class Cart {

    //所有购物项
    Map<String,CartItem> cartItems=new HashMap<String,CartItem>();

    //总计
    private double total;


    public Map<String, CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(Map<String, CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
