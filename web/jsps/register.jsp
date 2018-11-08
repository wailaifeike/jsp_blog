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
    <script>
        window.onload = function () {
            $("input").focus(function(){
                $(this).next().remove()
            });
        }
    </script>
</head>
<body>


<div class="regist_main">
    <form class="form-horizontal" method="post"  action="./check_register.jsp" novalidate>
        <h3 class="regist_title">欢迎注册</h3>
        <div class="regist">
            <div class="form-group">
                <label for="id_username" class="col-sm-3 control-label">名字</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="id_username" placeholder="用户名" name="username">
                    <%--<span><font style="color: red">{% if form.errors.username %}{{ form.errors.username.0 }}{% endif %}</font></span>--%>
                </div>


            </div>

            <div class="form-group">
                <label for="id_password" class="col-sm-3 control-label">密码</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" id="id_password" placeholder="密码" name="password">
                    <%--<span><font style="color: red">{% if form.errors.password %}{{ form.errors.password.0 }}{% endif %}</font></span>--%>
                </div>
            </div>

            <div class="form-group">
                <label for="id_password2" class="col-sm-3 control-label">确认密码</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" id="id_password2" placeholder="确认密码" name="password2">
                    <%--<span><font style="color: red">{% if form.errors.password2 %}{{ form.errors.password2.0 }}{% endif %}</font></span>--%>
                </div>
            </div>

            <div class="form-group">
                <label for="id_eamil" class="col-sm-3 control-label">邮箱</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="id_eamil" placeholder="邮箱" name="email">
                    <%--<span><font style="color: red">{% if form.errors.email %}{{ form.errors.email.0 }}{% endif %}</font></span>--%>
                </div>
            </div>

            <div class="form-group">
                <label for="id_telphone" class="col-sm-3 control-label">手机号</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="id_telphone" placeholder="手机号" name="telphone">
                    <%--<span><font style="color: red">{% if form.errors.telphone %}{{ form.errors.telphone.0 }}{% endif %}</font></span>--%>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="reme"> Remember me
                        </label>
                        <a href="./login.jsp" style="padding-left: 20px">已有账号,去登入</a>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9">
                    <button type="submit" class="btn btn-primary btn-block ">立即登入</button>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
