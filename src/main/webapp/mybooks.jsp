<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="variables.Books" %>
<%@ page import="java.util.List" %>
<%@ page import="contants.Database" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>My books</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/alphardex/aqua.css@master/dist/aqua.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
        table{
            background: #c5c1e3;
        }
        th,td{
            color: #1a1a1a;
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
<header>
    <center><a href="mainpage.jsp"><img src="https://astanait.edu.kz/wp-content/uploads/2020/05/aitu-logo-white-2-300x154.png"></a></center>
</header>
<%
    ArrayList<String> bookList = new ArrayList<>();
    List<Books> items = new ArrayList<>();
    Integer numberOfItems = 0;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if(cookie.getName().contains("book")) {
                bookList.add(cookie.getValue());
            }
        }
        try {
            Class.forName(Database.DRIVER_NAME);
            Connection con = DriverManager.getConnection(Database.CONNECTION_STRING,Database.USER_NAME,Database.PASSWORD);
            Statement stmt = con.createStatement();
            for (String id : bookList) {
                ResultSet rs = stmt.executeQuery("select * from books where Id= '"+id+"'");
                while (rs.next()) {
                    boolean check = false;
                    Books book = new Books(rs.getInt("Id"),rs.getString("Name"),rs.getString("Author"),rs.getString("Genre"));
                    for(int i=0;i<items.size();i++){
                        if (items.get(i).getId()==book.getId()){
                            check=true;
                        }
                    }
                    if (!check){
                        numberOfItems++;
                        items.add(book);
                    }
                }
            }
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
    request.setAttribute("items", items);
    HttpSession httpSession = request.getSession(true);
    httpSession.setAttribute("numberOfItems",numberOfItems);
%>
<h2 style="margin-left: 225px">My books</h2>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="table-responsive" data-pattern="priority-columns">
                <table class="table table-bordered table-hover">
                    <thead>
                    <c:if test="${!empty items}">
                        <tr>
                            <th data-priority="1">Name</th>
                            <th data-priority="2">Author</th>
                            <th data-priority="3">Genre</th>
                        </tr>
                    </c:if>
                    <c:if test="${empty items}">
                        <caption class="text-center">No Items</caption>
                    </c:if>
                    </thead>
                    <tbody>
                    <c:forEach items="${items}" var="item">
                        <tr>
                            <td><c:out value="${item.getName()}"/></td>
                            <td><c:out value="${item.getAuthor()}"/></td>
                            <td><c:out value="${item.getGenre()}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <center><a href="books.jsp"><button class='btn btn-primary btn-ghost'><span>Go Back</span></button></a></center>
            </div>
        </div>
    </div>
</div>
</body>
</html>
