<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="variables.Clubs" %>
<%@ page import="contants.Database" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Clubs</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/alphardex/aqua.css@master/dist/aqua.min.css">
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
        .content{
            width: 80%;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            grid-column-gap: 50px;
            grid-row-gap: 20px;
            padding-top: 30px;
        }
        .clubs{
            border: 3px solid #0950e8;
            background-image: url("https://i.pinimg.com/736x/e3/2e/2a/e32e2a0893cbf4322dd31df3242c1231.jpg");
            color: white;
            border-radius: 20px;
            padding-right: 20px;
        }
    </style>
    <!-- Button css -->
    <style type="text/scss">
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background: #eceffc;
      }

      .btn {
        padding: 8px 20px;
        border-radius: 0;
        overflow: hidden;

        &::before {
          position: absolute;
          content: "";
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background: linear-gradient(
                          120deg,
                          transparent,
                          var(--primary-color),
                          transparent
          );
          transform: translateX(-100%);
          transition: 0.6s;
        }

        &:hover {
          background: transparent;
          box-shadow: 0 0 20px 10px hsla(204, 70%, 53%, 0.5);

          &::before {
            transform: translateX(100%);
          }
        }
      }

      .form-input-material {
        --input-default-border-color: white;
        --input-border-bottom-color: white;

        input {
          color: white;
        }
      }

      .login-form {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 50px 40px;
        color: white;
        background: rgba(0, 0, 0, 0.8);
        border-radius: 10px;
        box-shadow: 0 0.4px 0.4px rgba(128, 128, 128, 0.109),
        0 1px 1px rgba(128, 128, 128, 0.155),
        0 2.1px 2.1px rgba(128, 128, 128, 0.195),
        0 4.4px 4.4px rgba(128, 128, 128, 0.241),
        0 12px 12px rgba(128, 128, 128, 0.35);

        h1 {
          margin: 0 0 24px 0;
        }

        .form-input-material {
          margin: 12px 0;
        }

        .btn {
          width: 100%;
          margin: 18px 0 9px 0;
        }
      }

    </style>
</head>
<body>
<!-- Header -->
<header>
    <center><a href="mainpage.jsp" ><img src="https://astanait.edu.kz/wp-content/uploads/2020/05/aitu-logo-white-2-300x154.png"></a></center>
</header>
<!-- Main part -->
<h1 style="color: white; font-size: 40px; font-family: 'Raleway', sans-serif;margin-left: 225px;">University clubs</h1>
<center><div class='content'>
<%
    Class.forName(Database.DRIVER_NAME);
    Connection con = DriverManager.getConnection(Database.CONNECTION_STRING,Database.USER_NAME,Database.PASSWORD);
    LinkedList<Clubs> clubsLinkedList = new LinkedList<>();
    int n=0;
    try {
        PreparedStatement pst = con.prepareStatement("select * from clubs");
        ResultSet rs=pst.executeQuery();
        while(rs.next()) {
            Clubs clubs = new Clubs(rs.getString("Name"));
            clubsLinkedList.add(clubs);
            n++;
        }
    } catch(Exception e) {
        out.println(e);
    }
    Clubs[] clubsArray = new Clubs[n];
    for (int i=0; i<n; i++) {
        clubsArray[i]= (Clubs) clubsLinkedList.pop();
    }
    ArrayList<Clubs> clubsArrayList = new ArrayList<>();
    for (int i=0; i<n; i++) {
        clubsArrayList.add(clubsArray[i]);
        out.println("<div class='clubs'><div style='padding-top=40%'><center><h3 style='font-weight:bold; font-size: 25px;'>"+
                clubsArrayList.get(i).getClub_name()+"</h3></center></div>" +
                "<div><form method='post' action='ClubServlet'><input type='hidden' name='club_name' value='" +
                clubsArrayList.get(i).getClub_name() +"'><button type='submit' class='btn btn-primary btn-ghost'><span>Details</span></button></form></div></div>");
    }
%>
</div></center>
</body>
</html>
