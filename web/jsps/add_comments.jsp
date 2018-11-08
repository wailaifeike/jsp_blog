<%@ page import="DAO.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .error {
            width: 700px;
            margin: 50px auto;
        }
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    if (session.getAttribute("username") != null) {
        try {
            String path = request.getQueryString();
            String[] str = path.split("=");
            String text = request.getParameter("text");
            out.println(text);
            out.println(str[1]);
            int aid = Integer.parseInt(str[1]);
            int uid = (int) session.getAttribute("user_id");
            UserDAO userDAO = new UserDAO();
            userDAO.AddComments(text, aid, uid); //article_detail.jsp?aid=1
            response.setHeader("refresh", "0;URL=./article_detail.jsp?aid=" + aid);
            ;
        } catch (Exception e) {
            out.print(e);
        }
    } else {
        out.print("<div class=\"error\">\n" +
                "                            <div class=\"title\">\n" +
                "                                <h2 style='color:red'>你还未登入！,请登入后进行评论！</h2>\n" +
                "                            </div>\n" +
                "                        <a href=\"./login.jsp\">点我去登入</a>\n" +
                "                    </div>");


    }


%>


<%--<script language="JavaScript">--%>
<%--function myrefresh(){--%>
<%--window.location.reload(true);--%>
<%--}--%>
<%--//指定1秒刷新一次--%>
<%--</script>--%>
</body>
</html>