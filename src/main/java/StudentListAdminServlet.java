import java.io.*;
import java.sql.*;
import javax.servlet.*;


public class StudentListAdminServlet extends GenericServlet{
    public void service(ServletRequest req,ServletResponse res) throws IOException,ServletException
    {
        PrintWriter pw = res.getWriter();
        res.setContentType("text/html");
        try {
            Connection con = DBConnection.getCon();
            PreparedStatement ps = con.prepareStatement("Select * from users");
            ResultSet rs = ps.executeQuery();
            RequestDispatcher rd = req.getRequestDispatcher("editStudents.jsp");
            rd.include(req, res);
            pw.println("<div><center><h1 style='color: white; font-size: 40px; font-family: 'Raleway', sans-serif;'>Students list</h1></center>");
            pw.println("<center><div class='content'>");
            //students list
            while(rs.next())
            {
                String id=rs.getString(1);
                String username = rs.getString(2);
                String name = rs.getString(3);
                String surname = rs.getString(4);
                String major = rs.getString(5);
                String group = rs.getString(6);
                String year = rs.getString(7);
                pw.println("<div class='user'><div><center><h3 style='font-weight:bold; font-size: 25px;'>"+username+"</h3></center></div><div class='info'><div><ul>"+
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
                pw.println("<li>"+year+"</li></ul></div></div>");
                pw.println("<div class='editors'><ul><form method='post' action='DeleteUserServlet'><li>" +
                        "<input type='hidden' name='username' value="+username+"><button type='submit'>Delete</button></li></form>");
                pw.println("<form method='post' action='EditUserServlet'><li>" +
                        "<input type='hidden' name='id' value="+id+">" +
                        "<input type='hidden' name='type' value='Username'>" +
                        "<input type='text' name='toChange' placeholder='Username'>" +
                        "<button type='submit'>Change</button></li></form>");
                pw.println("<form method='post' action='EditUserServlet'><li>" +
                        "<input type='hidden' name='id' value="+id+">" +
                        "<input type='hidden' name='type' value='Name'>" +
                        "<input type='text' name='toChange' placeholder='Name'>" +
                        "<button type='submit'>Change</button></li></form>");
                pw.println("<form method='post' action='EditUserServlet'><li>" +
                        "<input type='hidden' name='id' value="+id+">" +
                        "<input type='hidden' name='type' value='Surname'>" +
                        "<input type='text' name='toChange' placeholder='Surname'>" +
                        "<button type='submit'>Change</button></li></form>");
                pw.println("<form method='post' action='EditUserServlet'><li>" +
                        "<input type='hidden' name='id' value="+id+">" +
                        "<input type='hidden' name='type' value='Major'>" +
                        "<input type='text' name='toChange' placeholder='Major'>" +
                        "<button type='submit'>Change</button></li></form>");
                pw.println("<form method='post' action='EditUserServlet'><li>" +
                        "<input type='hidden' name='id' value="+id+">" +
                        "<input type='hidden' name='type' value='SGroup'>" +
                        "<input type='text' name='toChange' placeholder='Group'>" +
                        "<button type='submit'>Change</button></li></form>");
                pw.println("<form method='post' action='EditUserServlet'><li>" +
                        "<input type='hidden' name='id' value="+id+">" +
                        "<input type='hidden' name='type' value='Year'>" +
                        "<input type='text' name='toChange' placeholder='Year'>" +
                        "<button type='submit'>Change</button></li></form>");
                pw.println("</ul></div></div>");
            }
            pw.println("</div></center>");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
