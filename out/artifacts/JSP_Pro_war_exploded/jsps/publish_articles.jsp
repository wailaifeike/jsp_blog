<%@ page import="DAO.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加文章</title>

    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/article.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.js"></script>
</head>
<body>

<%

    String name = (String) session.getAttribute("username");
    if(name==null){
        response.sendRedirect("./login.jsp");
    }


%>

<div class="header">
    <nav class="navbar navbar-default">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <img src="../imgs/blog.jpg" alt="">
                </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="../index.jsp">首页<span class="sr-only">(current)</span></a></li>
                    <li><a href="../jsps/publish_articles.jsp">发布文章</a></li>
                </ul>
                <form class="navbar-form navbar-left" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="请输入要查找的内容">
                    </div>
                    <button type="submit" class="btn btn-default">查找</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <%
                        request.setCharacterEncoding("utf-8");
                        String username = (String) session.getAttribute("username");
                        System.out.println("username"+username);
                        if(username!=null){
                    %>
                    <li><a href="#"><%=username%></a></li>
                    <li><a href="./jsps/logout.jsp">注销</a></li>
                    <%
                    }else{
                    %>
                    <li><a href="./jsps/login.jsp">登入</a></li>
                    <li><a href="./jsps/register.jsp">注册</a></li>
                    <%
                        }

                    %>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>


<div class="main-article">

    <div class="article">
        <form action="./check_articles.jsp" class="form-artilce" method="post">
            <h3 style="text-align: center">发布问答</h3>

            <div class="form-group item-group">
               <div class="col-sm-12 item-group">
                <input type="text" class="form-control" id="id_password" placeholder="标题" name="title">
               </div>
            </div>

            <div class="form-group item-group">
              <div class="col-sm-10 item-group">
                           <%--<input name="content" id=""  class="form-control" placeholder="简介">#}--%>
                <textarea name="content" id="xx" cols="98" rows="5" placeholder="简介"></textarea>

              </div>
            </div>

            <div class="form-group ">

                <textarea name="detail" id="editor_id" placeholder="详情"></textarea>

            </div>
            <%
                UserDAO userDAO = new UserDAO();
                ResultSet rs = userDAO.get_category();
                ResultSet rs2 = userDAO.get_tags();

            %>

            <div class="form-group">
                <span>选择文章分类</span>
                <select class="form-control" name="category">
                    <%
                        while (rs.next()){
                            %>
                                <option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
                            <%
                        }

                    %>

                    <%--<option value="1">技术</option>--%>
                    <%--<option value="3">编程语言</option>--%>
                    <%--<option value="4">软件开发</option>--%>
                    <%--<option value="5">其他</option>--%>
                </select>
            </div>

            <div class="form-group">
                <span>选择文章标签</span>
                <select  multiple class="form-control" name="tags">

                    <%
                        while (rs2.next()){
                            %>
                               <option value="<%=rs2.getInt("id")%>">
                                   <%=rs2.getString("name")%>
                               </option>
                            <%
                        }
                    %>

                    <%--<option value="python">python</option>--%>
                    <%--<option value="Java">Java</option>--%>
                    <%--<option value="go">go</option>--%>
                    <%--<option value="C++/C">C++/C</option>--%>
                    <%--<option value="php">php</option>--%>
                </select>
            </div>

            <div class="form-group bottom-btn ">

                <input type="submit" class="btn btn-primary" />

            </div>
        </form>

    </div>

</div>

<script src="../js/kindeditor-all-min.js"></script>
<script src="../js/zh-CN.js"></script>
<script type="text/javascript">
    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('#editor_id', {
            width : '710px',

            allowImageUpload : false,
            items : [
                'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
                'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
                'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                'anchor', 'link', 'unlink', '|', 'about']
        });
    });
</script>

</body>
</html>
