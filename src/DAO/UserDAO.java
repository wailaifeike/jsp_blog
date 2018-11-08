package DAO;

import TestJava.DEMO;
import TestJava.JDBCTools;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.UserInfo;
import model.Article;
import TestJava.CheckIN;

public class UserDAO {

    private UserInfo userInfo;
    private DEMO demo;
    private Article article;
    PreparedStatement ps=null;

    public void setUserDAO(UserInfo userInfo)
    {
        this.userInfo=userInfo;
    }

    public void setArticle(Article article)
    {
        this.article=article;
    }

//    public Connection fetchConnection()throws Exception{
//        Connection connection = this.demo.getConnection2();
//        return connection;
//    }

    public void INSERT() throws SQLException,Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String username = userInfo.getUsername();
        String password = userInfo.getPassword();
        String phone = userInfo.getPhone();
        String email = userInfo.getEamil();
        try {
            connection = (Connection)JDBCTools.getConnection();
            String sql = "INSERT INTO USER(username, password, phone,email) "
                    + "VALUES(?,?,?,?)";
            System.out.println("________________________________");
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, phone);
            preparedStatement.setString(4, email);


            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(null, preparedStatement, connection);
        }
    }

    public ResultSet check_login(String username, String password){
        demo = new DEMO();
        // select id,username,password from user where username="zhangsan" and password="123456";
        String sql = "select id,username,password from user where username="+"'" +username+"'"+" "+"and password="+"'"+password+"'"+"";
        System.out.println(sql);
        ResultSet resultset = (ResultSet)demo.testResultSet(sql);
        return resultset;
    }

    public void AddArticles() throws SQLException,Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String title = article.getTitle();
        String content = article.getContent();
        String detail = article.getDetail();
        int id = article.getUser_id();
        int cid = article.getCid();
        System.out.println("______________________*******************************");
        System.out.println(title);
        System.out.println(detail);
        System.out.println(content);
        System.out.println(id);
        try {
            connection = (Connection)JDBCTools.getConnection();
            String sql = "INSERT INTO article(title, content, detail,user_id,ctime,cid) "
                    + "VALUES(?,?,?,?,?,?)";
            System.out.println("________________________________");
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, content);
            preparedStatement.setString(3, detail);
            preparedStatement.setInt(4, id);

            preparedStatement.setString(5,CheckIN.getTime());
            preparedStatement.setInt(6,cid);


            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(null, preparedStatement, connection);
        }
    }

    public ResultSet show_articles(String sql){
        demo = new DEMO();
//        String sql ="select * from article";
        ResultSet resultSet = (ResultSet)demo.testResultSet(sql);
        return resultSet;

    }

    public String getName(int user_id) throws java.sql.SQLException{

        demo = new DEMO();
        String name = null;
        String sql ="select id,username from user where id="+user_id;
        ResultSet resultSet = (ResultSet)demo.testResultSet(sql);
        while (resultSet.next()){
            name = resultSet.getString("username");
        }
        return name;
    }


    public  Article getArticle(int id) throws  java.sql.SQLException{
        demo = new DEMO();
        String sql ="select * from article where id="+id;
        ResultSet resultSet = (ResultSet)demo.testResultSet(sql);
        String title = null;
        String content = null;
        String detail = null;
        String ctime = null;
        int user_id = 1;
        while (resultSet.next()){
            title = resultSet.getString("title");
            content = resultSet.getString("content");
            detail = resultSet.getString("detail");
            ctime = resultSet.getString("ctime");
            user_id = resultSet.getInt("user_id");
        }

        Article article = new Article(title,content,detail,ctime,user_id);

        return article;
    }


    public void AddComments(String text,int aid,int uid){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = (Connection)JDBCTools.getConnection();
            String sql = "INSERT INTO comment(detail, ctime, aid,uid) "
                    + "VALUES(?,?,?,?)";
            System.out.println("________________________________");
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, text);
            preparedStatement.setString(2, CheckIN.getTime());
            preparedStatement.setInt(3, aid);
            preparedStatement.setInt(4, uid);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(null, preparedStatement, connection);
        }
    }

    public ResultSet get_comments(int aid){
        demo = new DEMO();
        String sql ="select * from comment where aid="+aid;
        ResultSet resultSet = (ResultSet)demo.testResultSet(sql);
        return resultSet;

    }


    public ResultSet get_category(){
        demo = new DEMO();
        String sql ="select * from category";
        ResultSet resultSet = (ResultSet)demo.testResultSet(sql);
        return resultSet;

    }


    public ResultSet get_tags(){
        demo = new DEMO();
        String sql ="select * from tag";
        ResultSet resultSet = (ResultSet)demo.testResultSet(sql);
        return resultSet;

    }

    public void  AddTag2Article(int aid,ArrayList<String> list){

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = (Connection)JDBCTools.getConnection();
            String sql = "INSERT INTO tag2article(tid, aid) \"\n" +
                    "                    + \"VALUES(?,?)";
            preparedStatement = connection.prepareStatement(sql);

            for(int i=0;i<list.size();i++){
                preparedStatement.setInt(1, Integer.parseInt(list.get(i)));
                preparedStatement.setInt(2,aid);
                preparedStatement.executeUpdate();
            }


//            preparedStatement.setInt(3, aid);
//            preparedStatement.setInt(4, uid);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(null, preparedStatement, connection);
        }

    }







}
