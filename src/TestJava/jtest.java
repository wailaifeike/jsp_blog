package TestJava;

import com.mysql.jdbc.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;

public class jtest {
    public static void main(String[] args) throws Exception {
        DEMO d = new DEMO();
        ResultSet rs = (ResultSet)d.testResultSet(null);
//        System.out.println(rs.getString(1));

        while(rs.next()){
            int id = rs.getInt(1);
            String name = rs.getString("username");
            String password = rs.getString(3);
            String phone = rs.getString(4);
            String email = rs.getString(5);

            System.out.println(id);
            System.out.println(name);
            System.out.println(password);
            System.out.println(phone);
            System.out.println(email);
        }
//        Connection con = (Connection)d.getConnection2();
//        System.out.println(con);


    }
}
