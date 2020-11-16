<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="variables.News" %>
<%@ page import="contants.Database" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
    <style>
        html, body {
            padding: 0px;
            margin: 0px;
            background: black;
            font-family: 'Raleway', sans-serif;
            color: #FFF;
        }
        body {
            background-image: linear-gradient(270deg, #2b67ac 3px, transparent 0),
            linear-gradient(#2b67ac 3px, transparent 0),
            linear-gradient(270deg, rgba(43, 103, 172, 0.4) 1px, transparent 0),
            linear-gradient(#2b67ac 1px, transparent 0),
            linear-gradient(270deg, rgba(43, 103, 172, 0.4) 1px, transparent 0),
            linear-gradient(#2b67ac 1px, transparent 0);
            background-size: 112px 112px, 112px 112px, 56px 56px, 56px 56px, 28px 28px,
            28px 28px;
        }
        .a-author{
            color:#e0ed68;
        }
        .adder{
            display: grid;
            grid-template-columns: 1fr 4fr 1fr 0.5fr;
            width: 80%;
            grid-column-gap: 20px;
        }
        input, textarea{
            border: 3px solid #0950e8;
            border-radius: 10px;
            font-size: 18px;
        }
        .add-btn{
            font-weight: bold;
            color: #0950e8;
        }
        .panel{
            padding-top: 30px;
            display: grid;
            grid-template-columns: 0.3fr 1fr 1fr 1fr;
            width: 80%;
            grid-column-gap: 20px;
        }
        button{
            font-weight: bold;
            color: #0950e8;
        }
        input,button{
            font-size: 18px;
        }
    </style>
    <link rel="stylesheet" href="css/news.css">
</head>
<body>
<!-- Header -->
<header>
    <center><a href="adminPanel.jsp"><img src="https://astanait.edu.kz/wp-content/uploads/2020/05/aitu-logo-white-2-300x154.png"></a></center>
</header>
<!-- Main part -->
<h1 style="color: white; font-size: 40px; font-family: 'Raleway', sans-serif;margin-left: 225px;">News</h1>
<center><form method="post" action="AddNewsServlet" class="adder">
    <input type="text" name="header" placeholder="Header">
    <textarea name="main_part"></textarea>
    <input type="text" name="author" placeholder="Author">
    <input type="submit" value="Add" class="add-btn">
</form></center>
<div class="content">
    <%
        Class.forName(Database.DRIVER_NAME);
        Connection con = DriverManager.getConnection(Database.CONNECTION_STRING,Database.USER_NAME,Database.PASSWORD);
        Stack<News> newsStack = new Stack<>();
        int n=0;
        try {
            PreparedStatement pst = con.prepareStatement("select * from news");
            ResultSet rs=pst.executeQuery();
            while(rs.next()) {
                News news = new News(rs.getString("Header"),rs.getString("Main_part"),rs.getString("Author"));
                newsStack.push(news);
                n++;
            }
        } catch(Exception e) {
            out.println(e);
        }
        News[] newsArray = new News[n];
        for (int i=0; i<n; i++) {
            newsArray[i]= (News) newsStack.pop();
        }
        ArrayList<News> newsList = new ArrayList<>();
        for (int i=0; i<n; i++) {
            newsList.add(newsArray[i]);
            out.println("<div class='block'>\n" +
                    "        <center><h2 class='a-header'>"+newsList.get(newsList.size() - 1).getA_name()+"</h2></center>" +
                    "        <hr>");
            out.println("<p class='article'>"+ newsList.get(newsList.size() - 1).getMain_part()+"</p>" +
                    "<p class='a-author'> Author: "+ newsList.get(newsList.size() - 1).getAuthor()+"</p>" +
                    "</div>");
            out.println("<center><div class='panel'><form method='post' action='DeleteNewsServlet'><input type='hidden' name='id' value='"+
                    newsList.get(newsList.size() - 1).getA_name()+"'><input type='hidden' name='type' value='news'><button type='submit'>Delete</button></form>" +
                    "<form method='post' action='EditNewsServlet'><input type='hidden' name='id' value='"+
                    newsList.get(newsList.size() - 1).getA_name()+"'><input type='hidden' name='type' value='Header'>" +
                    "<input type='text' name='txt' placeholder='Header...'><button type='submit'>Change</button></form>"+
                    "<form method='post' action='EditNewsServlet'><input type='hidden' name='id' value='"+
                    newsList.get(newsList.size() - 1).getA_name()+"'><input type='hidden' name='type' value='Main_part'>" +
                    "<input type='text' name='txt' placeholder='Main part...'><button type='submit'>Change</button></form>"+
                    "<form method='post' action='EditNewsServlet'><input type='hidden' name='id' value='"+
                    newsList.get(newsList.size() - 1).getA_name()+"'><input type='hidden' name='type' value='Author'>" +
                    "<input type='text' name='txt' placeholder='Author...'><button type='submit'>Change</button></form>"+
                    "</div></center>");
        }
    %>
</div>
</body>
</html>
