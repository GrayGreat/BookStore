package com.ggs.web.servlet;

import com.ggs.domain.Book;
import com.ggs.service.BookService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @author Not Today
 * @date 2019/8/12-17:58
 */
public class UploadFileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FileItemFactory fileItemFactory=new DiskFileItemFactory();
        ServletFileUpload sfu=new ServletFileUpload(fileItemFactory);
        if(sfu.isMultipartContent(request)){
            //判断表单enctype是否为mutipart-data
            //手动封装Map
            Map<String,String> paramsMap=new HashMap<String,String>();
            List<FileItem> itemList=null;
            try {
                itemList = sfu.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            //1.上传
            for(FileItem fileItem:itemList){
                if(!fileItem.isFormField()) {
                    //这里判断组件是否为上传组件
                    //1.1执行上传
                    //1.1.1获取服务器上传目录路径
//                    String path = getServletContext().getRealPath("/upload");

                    String path="D:\\IDEA_workspace\\FirstProject\\BookStore\\web\\bookImg";
                    //String path = getServletContext().getRealPath("/web/bookImg");
                    //1.1.2上传
                    InputStream is = fileItem.getInputStream();
                    FileOutputStream fos = new FileOutputStream(new File(path, fileItem.getName()));
                    IOUtils.copy(is, fos);
                    //清楚临时文件
                    fileItem.delete();
                    fos.close();
                    is.close();
                    //将pimage属性存入map
                    paramsMap.put(fileItem.getFieldName(),  fileItem.getName());
                    System.out.println(paramsMap.toString());
                }else{
//                    普通组件
                    paramsMap.put(fileItem.getFieldName(),fileItem.getString("UTF-8"));
                }
            }
            System.out.println(paramsMap.toString());
            //封装Book对象,保存到数据库
            Book book=new Book();
//            System.out.println(paramsMap.toString());
            try {
                BeanUtils.populate(book, paramsMap);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
            book.setId(UUID.randomUUID().toString());
//            System.out.println("jjj");
            BookService bookService=new BookService();
            int row=0;
            try {
                row=bookService.addBookInfo(book);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.setContentType("text/html;charset=UTF-8");
            if(row>0){
                System.out.println("成功");
                response.sendRedirect(request.getContextPath()+"/adminFindAllBooks");
            }else{
                System.out.println("失败");
            }


        }else{
            response.sendRedirect(request.getContextPath()+"/addBookUI");
        }


    }

}