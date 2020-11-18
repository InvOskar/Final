<%@ page import="contants.Database" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="variables.Events" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="variables.Books" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library</title>
    <style>
        html, body {
            padding: 0px;
            margin: 0px;
            background: black;
            font-family: 'Raleway', sans-serif;
            color: #FFF;
            min-height: 100vh;
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
            width: 80%;
            background-image: url("https://wallpaperaccess.com/full/124383.jpg");
        }
        table, th,td, tr{
            border: 3px solid #0950e8;
            border-collapse: collapse;
            font-size: 20px;
        }
        td,th{
            padding: 20px;
        }
        .searcher, .button{
            font-size: 18px;
            border-radius: 10px;
            border: 3px solid #0950e8;
            color: #0950e8;
            background-color: darkgray;
        }
        .searcher{
            padding-left: 5px;
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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/alphardex/aqua.css@master/dist/aqua.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $("#BookSearch").on("keyup",function(){
            var value=$(this).val();

            $("table tr").each(function(result){
                if (result!==0){
                    var id=$(this).find("td:first").text();
                    if(id.indexOf(value)!==0 && id.toLowerCase().indexOf(value.toLowerCase())<0){
                        $(this).hide();
                    }else{
                        $(this).show();
                    }
                }
            })
        })
    </script>
</head>
<body>
<header>
    <center><a href="http://localhost:8080/AITUnews_war/mainpage.jsp" ><img src="https://astanait.edu.kz/wp-content/uploads/2020/05/aitu-logo-white-2-300x154.png"></a></center>
</header><br><br><br>
<center><a href="mybooks.jsp"><button class='btn btn-primary btn-ghost'><span>My books</span></button></a></center>
</body>
</html>
<%
    Class.forName(Database.DRIVER_NAME);
    Connection con = DriverManager.getConnection(Database.CONNECTION_STRING,Database.USER_NAME,Database.PASSWORD);
    LinkedList<Books> booksLinkedList = new LinkedList<>();
    int n=0;
    try {
        PreparedStatement pst = con.prepareStatement("select * from books");
        ResultSet rs=pst.executeQuery();
        while(rs.next()) {
            Books books = new Books(rs.getInt("Id"),rs.getString("Name"),rs.getString("Author"),rs.getString("Genre"));
            booksLinkedList.add(books);
            n++;
        }
    } catch(Exception e) {
        out.println(e);
    }
    Books[] booksArray = new Books[n];
    for (int i=0; i<n; i++) {
        booksArray[i]= (Books) booksLinkedList.pop();
    }
    ArrayList<Books> booksArrayList = new ArrayList<>();
    out.println("<center><div class=\"content\">\n" +
            "    <br><br>\n" +
            "    <input type=\"text\" class=\"searcher\" id=\"BookSearch\" placeholder=\"Search book by name...\" />\n" +
            "    <br>\n" +
            "    <br>\n" +
            "    <table>\n" +
            "        <tr>\n" +
            "            <th>Name</th>\n" +
            "            <th>Author</th>\n" +
            "            <th>Genre</th>\n" +
            "        </tr>\n");
    for (int i=0; i<n; i++) {
        booksArrayList.add(booksArray[i]);
        out.println("<tr>" +
                "        <td>"+booksArrayList.get(booksArrayList.size() - 1).getName()+"</td>");
        out.println("<td>"+ booksArrayList.get(booksArrayList.size() - 1).getAuthor()+"</td>" +
                "<td>"+ booksArrayList.get(booksArrayList.size() - 1).getGenre() +
                "</td>");
        out.println("<td><form method='post' action='MyBooksServlet'><input type='hidden' name='id' value='"+booksArrayList.get(booksArrayList.size() - 1).getId()+"'><button type='submit' class='btn btn-primary btn-ghost'><span>Take book</span></button></form></td></tr>");
    }
    out.println("</table></div></center>");
%>
