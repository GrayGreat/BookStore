package com.ggs.vo;

import com.ggs.domain.Book;

/**
 * @author Not Today
 * @date 2019/8/17-20:35
 */
public class CartItem {

    private Book book;//购买商品
    private int buyNum;//购买数量
    private double subtotal;//小计

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(int buyNum) {
        this.buyNum = buyNum;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
}
