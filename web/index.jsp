<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>瞎鱼</title>
  <link rel="stylesheet" href="./css/bootstrap.css">
  <link rel="stylesheet" href="./css/index-article.css">
  <link rel="stylesheet" href="./css/base.css">
  <script src="./js/jquery.min.js"></script>
  <script src="./js/bootstrap.js"></script>

  <%--{% block head %}{% endblock %}--%>
  <style>
    .navbar-brand img{
      width: 100px;
      height: 45px;
      line-height:50px ;
      position: absolute;
      top: 2px;
      left: 280px;
    }
    .tool-bar{
      width:250px ;
      float: right;
      margin-top: 35px;
      margin-right: 145px;
    }
    .bar{
      width: 220px;

      /*float: left;*/
      display: inline-block;
    }

  </style>

</head>
<body>

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
          <img src="./imgs/blog.jpg" alt="">
        </a>
      </div>

      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li class="active"><a href="index.jsp">首页<span class="sr-only">(current)</span></a></li>
          <li><a href="./jsps/publish_articles.jsp">发布文章</a></li>
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

          <%--<li><a href="./jsps/login.jsp">登入</a></li>--%>
          <%--<li><a href="./jsps/register.jsp">注册</a></li>--%>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
</div>


<%
    UserDAO userDAO = new UserDAO();

%>
<div class="tool-bar">
  <div class="panel  bar">
    <div class="panel-heading">文章分类</div>
    <%--<div class="panel-body">--%>
      <%--<a href="">python</a>--%>
    <%--</div>--%>
    <ul class="list-group">
        <li class="list-group-item"><a href="index.jsp">全部</a></li>
        <%
            ResultSet cate = userDAO.get_category();
            while (cate.next()){
                %>
                    <li class="list-group-item"><a href="index.jsp?q=<%=cate.getString("query_title")%>&id=<%=cate.getInt("id")
                    %>"><%=cate.getString("name")%></a></li>
                <%
            }

        %>

      <%--<li class="list-group-item"><a href="index.jsp?q=life">生活</a></li>--%>
      <%--<li class="list-group-item"><a href="index.jsp?q=code">编程语言</a></li>--%>
      <%--<li class="list-group-item"><a href="index.jsp?q=soft">软件设计</a></li>--%>
      <%--<li class="list-group-item"><a href="index.jsp?q=others">其他</a></li>--%>
    </ul>
  </div>

  <div class="panel  bar">
    <div class="panel-heading">标签</div>
    <ul class="list-group">
        <%

            ResultSet tags = userDAO.get_tags();
            while (tags.next()){
                %>
                    <li class="list-group-item"><a href=""><%=tags.getString("name")%>(10)</a></li>
                <%
            }
        %>

      <%--<li class="list-group-item"><a href="">java(2)</a></li>--%>
      <%--<li class="list-group-item"><a href="">php(2)</a></li>--%>
      <%--<li class="list-group-item"><a href="">go(3)</a></li>--%>
      <%--<li class="list-group-item"><a href="">C/C++(5)</a></li>--%>
    </ul>
  </div>


</div>


<div class="main-content">

    <%


        String path =  request.getQueryString();
        String sql = null;
        if(path!=null){
            try {
                String[] str = path.split("="); //q=others&id=5
               if(str[0].equals("page")){
//                   out.print(str[0]+"-->"+str[1]);
                   sql = "select * from article";
               }else {
                   String[] query_choices = str[1].split("&");
                   int cid = Integer.parseInt(str[2]);
                   sql = "select * from article where cid = "+cid ;
               }
            }catch (Exception e){
//                sql = "select * from article ORDER BY ctime desc";
                out.print(sql);
            }
        }else {
           sql = "select * from article ORDER BY ctime desc";
        }
//        sql = "select * from article";
        ResultSet resultSet = userDAO.show_articles(sql);
        try{
        while (resultSet.next()){
            %>

    <div class="article">
        <div class="media">
            <div class="media-left">
                <a href="#">
                    <img class="media-object" src="./imgs/1.png" alt="...">
                </a>
            </div>
            <div class="media-body">
                <h3 class="media-heading"><a href="./jsps/article_detail.jsp?aid=<%=resultSet.getInt("id")%>"><%=resultSet.getString("title")%></a></h3>
                <p>
                   <%=resultSet.getString("content")%> &nbsp;<<a href="./jsps/article_detail.jsp?aid=<%=resultSet.getInt("id")%>">阅读全文</a>>
                </p>
                <div class="icon">
                    <span><a href="#">
                       <%=userDAO.getName(resultSet.getInt("user_id"))%>
                    </a>
                    </span>
                    <span>发布于:<%=resultSet.getString("ctime")%></span>
                    <span class="glyphicon glyphicon-comment">阅读量<%=resultSet.getString("downcount")%></span>
                    <span class="glyphicon glyphicon-thumbs-up">点赞(<%=resultSet.getString("upcount")%>)</span>
                </div>
            </div>
        </div>
    </div>
    <hr>
         <%
//            out.println(resultSet.getString("title"));
//            out.println(resultSet.getString("content"));
//            out.println(resultSet.getString("ctime"));
//            out.println(resultSet.getString("upcount"));

        }}catch (Exception e){
            out.println(e);
        }
    %>



  <hr>





</div>

<%
    int pageCount=10;//总页数
    int curPage = 1;//当前页
    int count = 10;
    int pagecount = 5;//一页显示5条数据
    int default_pagenum = 5; //默认每页显示5条数据

%>
<div class="page-bottom">
  <nav aria-label="Page navigation">
    <ul class="pagination">
      <li>
        <a href="index.jsp?page=1" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>


        </a>
      </li>
        <%
            int prepage = 1;
            int nextpage = curPage+1;
            if(nextpage>pageCount){
                nextpage = pageCount;
            }
            if(curPage>1){
                prepage = curPage-1;
            }else {
                curPage=1;
            }
        %>
      <li><a href="index.jsp?page=1" id="prepage">1</a></li>
      <li><a href="index.jsp?page=2" id="nextpage">2</a></li>
      <li><a href="index.jsp?page=3">3</a></li>
      <li><a href="index.jsp?page=4">4</a></li>
      <li><a href="index.jsp?page=5">5</a></li>
      <li>
        <a href="index.jsp?page=5" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <%--<span aria-hidden="true">尾页</span>--%>
        </a>
      </li>
    </ul>
  </nav>
</div>



</body>
</html>
