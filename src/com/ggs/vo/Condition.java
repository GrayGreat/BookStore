package com.ggs.vo;

/**
 * @author Not Today
 * @date 2019/8/16-10:48
 */
public class Condition {
    private String author;
    private String bname;
    private int cid;
    private double bottom;
    private double top;

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public double getBottom() {
        return bottom;
    }

    public void setBottom(double bottom) {
        this.bottom = bottom;
    }

    public double getTop() {
        return top;
    }

    public void setTop(double top) {
        this.top = top;
    }

    @Override
    public String toString() {
        return "Condition{" +
                "author='" + author + '\'' +
                ", bname='" + bname + '\'' +
                ", cid=" + cid +
                ", bottom=" + bottom +
                ", top=" + top +
                '}';
    }
}
