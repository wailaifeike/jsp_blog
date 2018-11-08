<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Article"%>
<%@ page import="DAO.UserDAO"%>
<%@ page import="java.util.*"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String detail = request.getParameter("detail");
    String category_id = request.getParameter("category");
    int cid = Integer.parseInt(category_id);
    String[] selected = request.getParameterValues("tags");
    ArrayList<String> list = new ArrayList<String>();
    if(selected != null){
        for(int i=0; i<selected.length; i++){
//            out.write("<p>" + selected[i] + "</p><br>");
            list.add(selected[i]);

        }
        out.print(list);
    }else{
        out.write("error");
    }
    int user_id = (Integer) session.getAttribute("user_id");


        try {

         Article article = new Article(title,content,detail,user_id,cid);
          UserDAO userDAO = new UserDAO();
            userDAO.setArticle(article);
           userDAO.AddArticles();
//          response.sendRedirect("../index.jsp");
     }catch (Exception e){
        out.print(e);
     }



%>
</body>
</html>
