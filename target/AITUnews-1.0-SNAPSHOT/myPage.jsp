<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="contants.Database" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My page</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
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
        .user{
            margin-top: 30px;
            border: 3px solid #0950e8;
            width: 80%;
            background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRAkJmkN4js90ynwZsWdT97G8NGFAEHK9kgVQ&usqp=CAU") no-repeat;
            background-size: cover;
        }
        .info{
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-template-rows: 1fr;
        }
        li {
            list-style-type: none;
            font-size: 25px;
            margin-bottom: 1em;
        }
    </style>
</head>
<body>
<%
    PrintWriter pw = response.getWriter();
    response.setContentType("text/html");
    try {
        Class.forName(Database.DRIVER_NAME);
        Connection con = DriverManager.getConnection(Database.CONNECTION_STRING,Database.USER_NAME,Database.PASSWORD);
        String username=(String) session.getAttribute("username");
        PreparedStatement ps = con.prepareStatement("Select * from users where Username='"+username+"'");
        ResultSet rs = ps.executeQuery();
        pw.println("<header>" +
                "    <center><a href=\"mainpage.jsp\" ><img src=\"https://astanait.edu.kz/wp-content/uploads/2020/05/aitu-logo-white-2-300x154.png\"></a></center>\n" +
                "</header>");
        pw.println("<center style='padding-top:50px;'><div style='border: 1px solid silver; box-shadow:  0 10px 20px #39ace7; width: 200px; border-radius: 100px;'>" +
                "    <img width='200' style='border-radius: 100px;' src='https://cdns.iconmonstr.com/wp-content/assets/preview/2018/240/iconmonstr-user-circle-thin.png' id='icon' alt='User Icon'/>" +
                "</div></center>");
        while(rs.next())
        {
            String name = rs.getString(3);
            String surname = rs.getString(4);
            String major = rs.getString(5);
            String group = rs.getString(6);
            String year = rs.getString(7);
            pw.println("<center><div class='user'><div><center><h3 style='font-weight:bold; font-size: 30px;'>"+username+"</h3></center></div><div class='info'><div><ul>"+
                    "<li>Name: </li>" +
                    "<li>Surname: </li>" +
                    "<li>Major: </li>" +
                    "<li>Group: </li>" +
                    "<li>Year: </li>" +
                    "</ul></div>");
            pw.println("<div><ul><li>"+name+"</li>");
            pw.println("<li>"+surname+"</li>");
            pw.println("<li>"+major+"</li>");
            pw.println("<li>"+group+"</li>");
            pw.println("<li>"+year+"</li></ul></div></div></div>");
        }
        pw.println("</div></center>");
    } catch(Exception e) {
        out.println(e);
    }
%>
</body>
</html>
