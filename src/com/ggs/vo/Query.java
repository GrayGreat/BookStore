package com.ggs.vo;

/**
 * @author Not Today
 * @date 2019/8/18-22:35
 */
public class Query {
    private String bname;
    private double pricebottom;//最低价
    private double pricetop;//最高价
    private int pnum;//库存量
    private String description;//描述
    private String author;//作者
    private int sales;//销量
    private int cid;//类型

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public double getPricebottom() {
        return pricebottom;
    }

    public void setPricebottom(double pricebottom) {
        this.pricebottom = pricebottom;
    }

    public double getPricetop() {
        return pricetop;
    }

    public void setPricetop(double pricetop) {
        this.pricetop = pricetop;
    }

    public int getPnum() {
        return pnum;
    }

    public void setPnum(int pnum) {
        this.pnum = pnum;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
}
