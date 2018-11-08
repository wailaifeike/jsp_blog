<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/3 0003
  Time: 下午 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销</title>
</head>
<body>

        <%
        response.setHeader("refresh","3;URL=../index.jsp");
         session.invalidate();
        %>
     <h3>你已经成功退出本系统,3秒后会跳转到首页</h3>
     <h3>如果没有跳转请点击<a href="../index.jsp">这里</a></h3>

</body>
</html>
