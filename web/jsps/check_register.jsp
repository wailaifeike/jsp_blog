<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="TestJava.DEMO"%>
<%@ page import="TestJava.xx"%>
<%@ page import="model.UserInfo"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DAO.UserDAO" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>


<%

        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String email = request.getParameter("email");
        String phone = request.getParameter("telphone");
//        System.out.println("name"+name);
        if(name.length()!=0&&password.length()!=0&&password2.length()!=0&&email.length()
                !=0&&phone.length()!=0){
            if(!password.equals(password2)){
                out.println("<h1>两次密码不一致！</h1>");
//                System.out.println("password"+password);
//                System.out.println("password2"+password2);
            }else {
                UserInfo userInfo = new UserInfo();
                userInfo.setUsername(name);
                userInfo.setPassword(password);
                userInfo.setEamil(email);
                userInfo.setPhone(phone);
                UserDAO userdao = new UserDAO();
                userdao.setUserDAO(userInfo);
                userdao.INSERT();
                out.print("注册成功！,3秒后跳转到登入页面");
                response.setHeader("refresh", "3;URL=./login.jsp" );
            }
        }else {
            out.println("<h1>请将信息补充完整！</h1>");
        }

%>


<%

%>


</body>
</html>
