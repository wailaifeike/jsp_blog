<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.UserDAO"                  %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>登入</title>
</head>
<body>
<%

 request.setCharacterEncoding("utf-8");
 String username = request.getParameter("username");
 String pasword = request.getParameter("password");

 UserDAO userDAO = new UserDAO();
 ResultSet rs = userDAO.check_login(username,pasword);

 boolean flag = rs.next();

 if(flag){
     do{
				int id = rs.getInt(1);
				String name = rs.getString("username");
				System.out.println("username"+name+"id"+id);
				session.setAttribute("user_id",id);
				session.setAttribute("username",name);
				response.sendRedirect("../index.jsp");
     }while (rs.next());
 }else {
     out.println("用户名或密码错误");
 }
%>

</body>
</html>
