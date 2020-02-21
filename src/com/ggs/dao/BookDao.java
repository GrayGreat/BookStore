package com.ggs.dao;

import com.ggs.domain.Book;
import com.ggs.domain.BookForSearch;
import com.ggs.utils.DataSourceUtils;
import com.ggs.vo.Condition;
import com.ggs.vo.Query;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Not Today
 * @date 2019/8/15-17:23
 */
public class BookDao {


    public List<BookForSearch> findIndexBookList() throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from book order by sales desc limit 0,4";
        return runner.query(sql,new BeanListHandler<BookForSearch>(BookForSearch.class));
    }

    public int getListCount(int cid) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select count(*) from book where cid=?";
        Long row=runner.query(sql, new ScalarHandler<>(),cid);
        return row.intValue();
    }


    public List<Book> findBookListLimited(int cid, int index, int currentCount) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select  * from book where cid=? limit ?,?";
        return runner.query(sql,new BeanListHandler<Book>(Book.class),cid,index,currentCount);
    }

    public int getListCount() throws SQLException {

        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select count(*) from book";
        Long row=runner.query(sql, new ScalarHandler<>());
        return row.intValue();


    }

    public List<Book> findBookListLimited(int index, int currentCount) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select  * from book limit ?,?";
        return runner.query(sql,new BeanListHandler<Book>(Book.class),index,currentCount);
    }

    public int getListCountByCondition(Condition condition) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select count(*) from book where 1=1 ";
        List list=new ArrayList();
        if(condition.getTop()!=0.0){
            sql+=" and price<? ";
            list.add(condition.getTop());
        }
        if(condition.getBottom()!=0.0){
            sql+=" and price>? ";
            list.add(condition.getBottom());
        }
        if(condition.getCid()!=0){
            sql+=" and cid=? ";
            list.add(condition.getCid());
        }
        if(condition.getAuthor()!=null&&!"".equals(condition.getAuthor())){
            sql+=" and author like ? ";
            list.add("%"+condition.getAuthor()+"%");
        }
        if(condition.getBname()!=null&&!"".equals(condition.getBname())){
            sql+=" and bname like ? ";
            list.add("%"+condition.getBname()+"%");
        }
        Long row=runner.query(sql, new ScalarHandler<>(),list.toArray());
        return row.intValue();
    }

    public List<BookForSearch> getBookListByCondition(int index, int currentCount, Condition condition) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from book where 1=1 ";
        List list=new ArrayList();
        if(condition.getTop()!=0.0){
            sql+=" and price<? ";
            list.add(condition.getTop());
        }
        if(condition.getBottom()!=0.0){
            sql+=" and price>? ";
            list.add(condition.getBottom());
        }
        if(condition.getCid()!=0){
            sql+=" and cid=? ";
            list.add(condition.getCid());
        }
        if(condition.getAuthor()!=null&&!"".equals(condition.getAuthor())){
            sql+=" and author like ? ";
            list.add("%"+condition.getAuthor()+"%");
        }
        if(condition.getBname()!=null&&!"".equals(condition.getBname())){
            sql+=" and bname like ? ";
            list.add("%"+condition.getBname()+"%");
        }
        sql+=" limit ?,?";
        list.add(index);
        list.add(currentCount);
        List<BookForSearch> books=new ArrayList<>();
        books=runner.query(sql, new BeanListHandler<>(BookForSearch.class),list.toArray());
        return books;

    }


    public BookForSearch findBookInfoById(String id) throws SQLException {

        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());

        String sql="select * from book where id=?";

        return runner.query(sql, new BeanHandler<BookForSearch>(BookForSearch.class),id);
    }

    public Book findBookById(String id) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from book where id=?";
        return runner.query(sql, new BeanHandler<Book>(Book.class),id);
    }

    public void delBookById(String id) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="delete  from book where id=?";
        runner.update(sql,id);
    }

    public int addBookInfo(Book book) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="insert into book values(?,?,?,?,?,?,?,?,?)";
        return runner.update(sql,book.getId(),book.getBname(),book.getPrice(),book.getCid(),book.getPnum(),
                book.getImgurl(),book.getDescription(),book.getAuthor(),book.getSales());
    }

    public int updateBookInfo(Book book) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="update book set bname=?,price=?,cid=?,pnum=?,imgurl=?,description=?,author=?,sales=? where id=?";
        return runner.update(sql,book.getBname(),book.getPrice(),book.getCid(),book.getPnum(),book.getImgurl(),book.getDescription(),
                book.getAuthor(),book.getSales(),book.getId());
    }

    public boolean batchDelBook(String id) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="delete  from book where id=?";
        int row=runner.update(sql,id);
        return row>0?true:false;
    }


    public List<Book> getBookListByQuery(int index, int currentCount, Query query) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from book where 1=1 ";
        List<Object> params=new ArrayList<>();
        if(!"".equals(query.getBname())&&query.getBname()!=null){
            sql+=" and bname like ? ";
            params.add("%"+query.getBname()+"%");
        }
        if(query.getPricebottom()!=0.0){
            sql+=" and price>? ";
            params.add(query.getPricebottom());
        }
        if(query.getPricetop()!=0.0){
            sql+=" and price<? ";
            params.add(query.getPricetop());
        }
        if(query.getPnum()!=0){
            sql+=" and pnum>? ";
            params.add(query.getPnum());
        }
        if(!"".equals(query.getDescription())&&query.getDescription()!=null){
            sql+=" and description like ? ";
            params.add("%"+query.getDescription()+"%");
        }
        if(!"".equals(query.getAuthor())&&query.getAuthor()!=null){
            sql+=" and author like ? ";
            params.add("%"+query.getAuthor()+"%");
        }
        if(query.getSales()!=0){
            sql+=" and sales>? ";
            params.add(query.getSales());
        }
        if(query.getCid()!=0){
            sql+=" and cid=?";
            params.add(query.getCid());
        }
        sql+=" limit ?,? ";
        params.add(index);
        params.add(currentCount);
        System.out.println(sql);
        List<Book> books = runner.query(sql, new BeanListHandler<Book>(Book.class), params.toArray());
        return books;
    }

    public int getBookCountByQuery(Query query) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select count(*) from book where 1=1 ";
        List<Object> params=new ArrayList<>();
        if(!"".equals(query.getBname())&&query.getBname()!=null){
            sql+=" and bname like ? ";
            params.add("%"+query.getBname()+"%");
        }
        if(query.getPricebottom()!=0.0){
            sql+=" and price>? ";
            params.add(query.getPricebottom());
        }
        if(query.getPricetop()!=0.0){
            sql+=" and price<? ";
            params.add(query.getPricetop());
        }
        if(query.getPnum()!=0.0){
            sql+=" and pnum>? ";
            params.add(query.getPnum());
        }
        if(!"".equals(query.getDescription())&&query.getDescription()!=null){
            sql+=" and description like ? ";
            params.add("%"+query.getDescription()+"%");
        }
        if(!"".equals(query.getAuthor())&&query.getAuthor()!=null){
            sql+=" and author like ? ";
            params.add("%"+query.getAuthor()+"%");
        }
        if(query.getSales()!=0){
            sql+=" and sales>? ";
            params.add(query.getSales());
        }
        if(query.getCid()!=0){
            sql+=" and cid=? ";
            params.add(query.getCid());
        }
        long totalCount=0;
        System.out.println(sql);
        if(!params.isEmpty()) {
            System.out.println("1");
            totalCount = runner.query(sql, new ScalarHandler<>(), params.toArray());
        }else{
            System.out.println("2");
            totalCount = runner.query(sql, new ScalarHandler<>());
        }
        Long row=totalCount;
        return  row.intValue();
    }

    public List<Book> rankList() throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from book order by sales desc";
        return runner.query(sql, new BeanListHandler<>(Book.class));
    }



    public List<Book> findBookByInfo(String info) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());

        String sql="select * from book where bname like ? or author like ?";

        info="%"+info+"%";

        return runner.query(sql,new BeanListHandler<>(Book.class) ,info,info);
    }





    //点击提交订单,根据购买数量减少相应的库存量
    public void updatePnum(String id, int newPnum) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="update book set pnum=? where id=?";
        runner.update(sql,newPnum,id);
    }

    public void recoverBookPnum(String id, int newPnum) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="update book set pnum=? where id=?";
        runner.update(sql,newPnum,id);
    }
}
