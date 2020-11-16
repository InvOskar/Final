<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="variables.Events" %>
<%@ page import="contants.Database" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Events</title>
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
            color: red;
        }
        .e-block{
            margin-top: 20px;
            border-radius: 50px;
            display: block;
            border: 3px solid #0950e8;
            background: url("https://png.pngtree.com/thumb_back/fw800/background/20190223/ourmid/pngtree-blue-smart-light-tech-background-backgroundlight-effect-backgroundelectronic-image_81225.jpg") no-repeat;
            background-size: cover;
        }
    </style>
    <link rel="stylesheet" href="css/news.css">
</head>
<body>
<!-- Header -->
<header>
    <center><a href="mainpage.jsp"><img src="https://astanait.edu.kz/wp-content/uploads/2020/05/aitu-logo-white-2-300x154.png"></a></center>
</header>
<!-- Main part -->
<h1 style="color: white; font-size: 40px; font-family: 'Raleway', sans-serif;margin-left: 225px;">Events</h1>
<div class="content">
    <%
        Class.forName(Database.DRIVER_NAME);
        Connection con = DriverManager.getConnection(Database.CONNECTION_STRING,Database.USER_NAME,Database.PASSWORD);
        LinkedList<Events> eventsLinkedList = new LinkedList<>();
        int n=0;
        try {
            PreparedStatement pst = con.prepareStatement("select * from events");
            ResultSet rs=pst.executeQuery();
            while(rs.next()) {
                Events events = new Events(rs.getString("Header"),rs.getString("Main_part"),rs.getString("Date/time"),rs.getString("Location"));
                eventsLinkedList.add(events);
                n++;
            }
        } catch(Exception e) {
            out.println(e);
        }
        Events[] eventsArray = new Events[n];
        for (int i=0; i<n; i++) {
            eventsArray[i]= (Events) eventsLinkedList.pop();
        }
        ArrayList<Events> eventsArrayList = new ArrayList<>();
        for (int i=0; i<n; i++) {
            eventsArrayList.add(eventsArray[i]);
            out.println("<div class='e-block'>\n" +
                    "        <center><h2 class='a-header'>"+eventsArrayList.get(eventsArrayList.size() - 1).getA_name()+"</h2></center>" +
                    "        <hr>");
            out.println("<p class='article'>"+ eventsArrayList.get(eventsArrayList.size() - 1).getMain_part()+"</p>" +
                    "<p class='a-author'> Date/time: "+ eventsArrayList.get(eventsArrayList.size() - 1).getDate_time()+"<br>Location: "+
                    eventsArrayList.get(eventsArrayList.size() - 1).getLocation()+"</p>" +
                    "</div>");
        }
    %>
</div>
</body>
</html>
