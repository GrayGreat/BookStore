package com.ggs.domain;

/**
 * @author Not Today
 * @date 2019/8/17-22:56
 */
public class OrderItem {

    private String itemid;//订单项id
    private int count;//购买数量
    private double subtotal;//小计
    private String id;//商品id
    private String oid;//订单oid
    private Book book;//购买的 商品
    private int itemstate;//订单项状态
    private Order order;//所属哪一个订单
    public static final int WAITDELIVER=2;  //待发货--->默认为2
    public static final int TRANSPORTINT=3; //运输中
    public static final int SIGN_IN=4;      //已签收

    public int getItemstate() {
        return itemstate;
    }

    public void setItemstate(int itemstate) {
        this.itemstate = itemstate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
