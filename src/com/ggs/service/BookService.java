package com.ggs.service;

import com.ggs.dao.BookDao;
import com.ggs.dao.CategoryDao;
import com.ggs.domain.Book;
import com.ggs.domain.BookForSearch;
import com.ggs.domain.Category;
import com.ggs.vo.Condition;
import com.ggs.vo.PageBean;
import com.ggs.vo.Query;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Not Today
 * @date 2019/8/15-17:23
 */
public class BookService {

    private BookDao dao=new BookDao();


    public List<BookForSearch> findIndexBookList() throws SQLException {
        return dao.findIndexBookList();
    }


    public PageBean<Book> getPageBean(int cid, int currentCount, int currentPage) {
        PageBean<Book> pageBean=new PageBean<>();

        //1.封装当前页
        pageBean.setCurrentPage(currentPage);

        //2.封装当前每页显示数
        pageBean.setCurrentCount(currentCount);

        //3.通过查询数据库获取数目总条数
        int totalCount=0;
        try {
            totalCount=dao.getListCount(cid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setTotalCount(totalCount);

        //4.计算总页数---->公式: 向上取整totalCount*1.0/currentCount
        int totalPage;
        if(totalCount==0){
            totalPage=1;
        }else{
            totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
        }
        pageBean.setTotalPage(totalPage);

        //5.获取当前页显示的数据
        //获取当前页首个商品的索引 公式: (currentPage-1)*currentCount
        int index=(currentPage-1)*currentCount;
        List<Book> bookList=null;
        try {
            bookList=dao.findBookListLimited(cid,index,currentCount);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setList(bookList);
        return pageBean;
    }

    //查询全部商品
    public PageBean getPageBean(int currentCount, int currentPage) {
        PageBean<Book> pageBean=new PageBean<>();

        //1.封装当前页
        pageBean.setCurrentPage(currentPage);

        //2.封装当前每页显示数
        pageBean.setCurrentCount(currentCount);

        //3.通过查询数据库获取数目总条数
        int totalCount=0;
        try {
            totalCount=dao.getListCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setTotalCount(totalCount);

        //4.计算总页数---->公式: 向上取整totalCount*1.0/currentCount
        int totalPage;
        if(totalCount==0){
            totalPage=1;
        }else{
            totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
        }
        pageBean.setTotalPage(totalPage);

        //5.获取当前页显示的数据
        //获取当前页首个商品的索引 公式: (currentPage-1)*currentCount
        int index=(currentPage-1)*currentCount;
        List<Book> bookList=null;
        try {
            bookList=dao.findBookListLimited(index,currentCount);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        CategoryService categoryService=new CategoryService();
        for(Book book:bookList){
            Category category=new Category();
            try {
                category=categoryService.findCategoryByCid(Integer.parseInt(book.getCid()));
            } catch (SQLException e) {
                e.printStackTrace();
            }
            book.setCategory(category);
        }

        pageBean.setList(bookList);
        return pageBean;


    }

    //条件查询
    public PageBean<BookForSearch> findPageBenByCondition(Condition condition, int currentCount, int currentPage) throws SQLException {
        PageBean<BookForSearch> pageBean=new PageBean<>();

        //封装每页显示数
        pageBean.setCurrentCount(currentCount);

        //封装当前页
        pageBean.setCurrentPage(currentPage);

        //根据条件计算总条数
        int totalCount=0;
        totalCount=dao.getListCountByCondition(condition);
        pageBean.setTotalCount(totalCount);

        //获取总页数
        int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
        if(totalCount==0){
            totalPage=1;
        }
        pageBean.setTotalPage(totalPage);

        //获取当前页 显示的数据
        int index=currentCount*(currentPage-1);
        List<BookForSearch> books=dao.getBookListByCondition(index,currentCount,condition);
        pageBean.setList(books);
        return pageBean;

    }

    public BookForSearch findBookInfoById(String id) throws SQLException {
        return dao.findBookInfoById(id);
    }

    public Book findBookById(String id) throws SQLException {
        return dao.findBookById(id);
    }


    public void delBookById(String id) throws SQLException {
        dao.delBookById(id);
    }

    public int addBookInfo(Book book) throws SQLException {
        return dao.addBookInfo(book);
    }

    public int updateBookInfo(Book book) throws SQLException {
        return dao.updateBookInfo(book);
    }

    public boolean batchDelBook(String id) throws SQLException {
        return dao.batchDelBook(id);
    }

    public PageBean findPageBeanByQuery(int currentCount, int currentPage, Query query) {

        PageBean<Book> pageBean=new PageBean<>();
        //封装每页显示数
        pageBean.setCurrentCount(currentCount);

        //封装 当前页
        pageBean.setCurrentPage(currentPage);

        //获取信息总条数
        int totalCount=0;
        try {
            totalCount=dao.getBookCountByQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setTotalPage(totalCount);

        //获取总页数--->向上取整totalCount*1.0/currentCount
        int totalPage= (int) Math.ceil(totalCount*1.0/currentCount);
        pageBean.setTotalPage(totalPage);

        //获取当前页需要显示的数据
        //计算当前页首条信息的索引index-->currentCount*(currentPage-1)
        int index=currentCount*(currentPage-1);
        List<Book> bookList=new ArrayList<>();
        try {
            bookList=dao.getBookListByQuery(index,currentCount , query);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //封装 book中的category对象
        CategoryService categoryService=new CategoryService();
        Category category=null;
        for(Book book:bookList){
            try {
                category=categoryService.findCategoryByCid(Integer.parseInt(book.getCid()));
            } catch (SQLException e) {
                e.printStackTrace();
            }
            book.setCategory(category);
        }

        pageBean.setList(bookList);

        return pageBean;
    }

    public List<Book> rankList() throws SQLException {
        List<Book> bookList=dao.rankList();
        CategoryDao categoryDao=new CategoryDao();
        for(Book book:bookList){
            Category category=categoryDao.findCategoryByCid(Integer.parseInt(book.getCid()));
            book.setCategory(category);
        }
        return bookList;
    }

    public List<Book> findBookByInfo(String info) throws SQLException {
        List<Book> bookList=dao.findBookByInfo(info);
        CategoryDao categoryDao=new CategoryDao();
        for(Book book:bookList){
            Category category=categoryDao.findCategoryByCid(Integer.parseInt(book.getCid()));
            book.setCategory(category);
        }
        return bookList;
    }

    //点击提交订单,将该书扣除相应的库存量
    public void updatePnum(String id, int newPnum) throws SQLException {
        dao.updatePnum(id,newPnum);
    }

    //点击删除订单,恢复库存量
    public void recoverBookPnum(String id, int newPnum) throws SQLException {
        dao.recoverBookPnum(id,newPnum);
    }
}
