<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/3 0003
  Time: 下午 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="model.Article" %>
<html>
<head>
    <title>查询文章详情</title>
    <link rel="stylesheet" href="../css/article-detail.css">
    <style>
        .detail-main{
            width: 1410px;
            margin-top: 50px;
            background-color: #ffffff;
            margin-left: 40px;
            border-right: 1px dashed #ccc;
        }
        body{
            background-color: #f3f3f3;
        }
        .detail-title{
            text-align: center;
            font-size: 15px;
            padding-top: 10px;
        }
        .detail-content{
            margin: 15px 250px;
        }
    </style>
</head>
<body>
    <%
        String path =  request.getQueryString();
        String[] str = path.split("=");
       try {
           int aid = Integer.parseInt(str[1]);
           UserDAO userDAO = new UserDAO();
           Article article = userDAO.getArticle(aid);
    %>


    <div class="detail-main">
        <div class="detail-title">
            <h2><%=article.getTitle()%></h2>

            <p>
                <span>作者：<%=userDAO.getName(article.getUser_id())%></span>
                <span>发布于：<%=article.getCtime()%></span>
            </p>
        </div>

        <div class="detail-content">
            <div class="con">
                <p>
                    <%=article.getDetail()%>
                </p>
            </div>
        </div>

        <div class="comment-list">
            <h3>评论:(0)</h3>

            <ul class="answer-list-ul">
                <%--{% for comment in comment_list %}--%>

                <%

                    ResultSet resultSet = userDAO.get_comments(aid);
                    while (resultSet.next()){
                        %>

                    <li>
                        <div class="comment-li">
                            <div class="comment-avtar">
                                <img src="../imgs/default.jpg" alt="">
                            </div>
                            <div class="comment-main">
                                <a href="#"><span class="username"><%=userDAO.getName(resultSet.getInt("uid"))%></span></a>
                                <span class="createtime"> <%=resultSet.getString("ctime")%></span>

                            </div>
                            <p class="comment-text"> <%=resultSet.getString("detail")%></p>
                        </div>
                    </li>

                    <%
                    }

                %>

                <%--{% endfor %}--%>

            </ul>

        </div>


        <div class="comment-detail">

            <div id="commentform_title">发表评论</div>

            <div id="div_digg">
                <div class="diggit action">
                    <span class="diggnum" id="digg_count">2</span>
                </div>
                <div class="buryit action">
                    <span class="burynum" id="bury_count">0</span>
                </div>

                <div class="clear"></div>
                <div class="diggword" id="digg_tips" style="color: red;"></div>

            </div>
            <div class="content">
                <p class="nickname">
                    昵称：<input type="text" id="tbCommentAuthor" class="author" disabled="disabled" size="50" value="小猫妮">
                    <img src="../imgs/copycode.gif" alt="">
                </p>

                <form action="./add_comments.jsp?aid=<%=aid%>" method="post" style="padding: 5px">

                    <div class="commentbox_main">
                        <div class="commentbox_title">
                            <div class="commentbox_title_left">评论内容：</div>
                            <div class="commentbox_title_right">

                            </div>
                        </div>
                        <div class="clear"></div>
                        <textarea id="tbCommentBody" class="comment_textarea" name="text"></textarea>
                    </div>
                    <p>
                        <button class="btn btn-primary" id="btn_submit">立即评论</button>

                        <span style="padding-left: 100px" id="is_login"></span>
                    </p>

                </form>
            </div>
        </div>


    </div>

    <%
       }catch (Exception e){
           out.println(e);
       }
    %>
        <div class="detail-left">

        </div>

    <script src="../js/jquery.min.js"></script>
    <script>

    </script>

</body>
</html>
