<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/23 0023
  Time: 下午 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登入</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/login_register.css">
    <link rel="stylesheet" href="../css/base.css">
    <%--<link rel="stylesheet" href="{{ url_for('static',filename='css/base.css') }}">--%>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.js"></script>
</head>
<body>
<div class="login_main">
    <form class="form-horizontal" method="post" autocomplete="off" novalidate action="check_login.jsp">
        <h3 class="login_title">欢迎登入</h3>
        <div class="login">
            <div class="form-group">
                <label for="id_username" class="col-sm-2 control-label">名字</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="id_username" placeholder="用户名" name="username">
                </div>
            </div>

            <div class="form-group">
                <label for="id_password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="id_password" placeholder="密码" name="password">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="reme"> Remember me
                        </label>
                        <a href="./register.jsp" style="padding-left: 20px">没有账号,去注册</a>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary btn-block ">立即登入</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
