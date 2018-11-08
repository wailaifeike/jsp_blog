package TestJava;


import model.UserInfo;

import java.sql.Connection;

public class xx {
    private UserInfo userInfo;

    public void setUserBean(UserInfo userInfo)
    {
        this.userInfo=userInfo;
    }

    public void SET() throws Exception {
//          DEMO demo = new DEMO();
//          Connection con = (Connection) demo.getConnection2();
//          demo.testStatement();
//          System.out.println(con);
//        UserInfo userInfo = new UserInfo();
        System.out.println(userInfo.getEamil());
        System.out.println(userInfo.getPassword());
        System.out.println(userInfo.getUsername());
    }


}
