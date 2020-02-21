package com.ggs.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Not Today
 * @date 2019/8/17-22:52
 */
public class Order {

    private String oid;//订单 id
    private Timestamp ordertime;//下单时间
    private double total;//总计
    private int state;//订单状态 0 未支付 1已支付 2待发货 3运送中 4已签收
    private String address;//收件人地址
    private String name;//收件人姓名
    private String telephone;//收件人手机号码
    private User user;//登录用户

    public static final int NON_PAYMENT=0;  //未支付
    public static final int PAID=1;         //已支付


    private List<OrderItem> orderItemList=new ArrayList<OrderItem>();

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

//    public Date getOrdertime() {
//        return ordertime;
//    }
//
//    public void setOrdertime(Date ordertime) {
//        this.ordertime = ordertime;
//    }


    public Timestamp getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Timestamp ordertime) {
        this.ordertime = ordertime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid='" + oid + '\'' +
                ", ordertime=" + ordertime +
                ", total=" + total +
                ", state=" + state +
                ", address='" + address + '\'' +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", user=" + user +
                ", orderItemList=" + orderItemList +
                '}';
    }
}
