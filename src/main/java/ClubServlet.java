import java.io.*;
import java.sql.*;
import javax.servlet.*;


public class ClubServlet extends GenericServlet{
    public void service(ServletRequest req,ServletResponse res) throws IOException,ServletException
    {
        PrintWriter pw = res.getWriter();
        res.setContentType("text/html");
        try {
            Connection con = DBConnection.getCon();
            String club_name= req.getParameter("club_name");
            PreparedStatement ps = con.prepareStatement("SELECT users.Username, users.Name, users.Surname, users.SGroup FROM `club_members` inner join clubs on club_members.Club_id=clubs.Id inner join users on club_members.User_id=users.Id where clubs.Name=?;");
            ps.setString(1, club_name);
            ResultSet rs = ps.executeQuery();
            RequestDispatcher rd = req.getRequestDispatcher("clubPage.jsp");
            rd.include(req, res);
            pw.println("<div class='club-name'><h1 style='color: white; font-size: 40px; font-family: 'Raleway', sans-serif;'>"+club_name+"</h1></div>");
            pw.println("<div><center><h1 style='color: white; font-size: 30px; font-family: 'Raleway', sans-serif;'>Members list</h1></center>");
            pw.println("<center><table><thead>"+
                    "                    <th>Username</th> "+
                    "                    <th>Name</th> "+
                    "                    <th>Surname</th> "+
                    "                    <th>Group</th> "+
                    "                    </tr></thead>");
            while(rs.next())
            {
                String username = rs.getString(1);
                String name = rs.getString(2);
                String surname = rs.getString(3);
                String group = rs.getString(4);
                pw.println("<tr><td>"+username+"</td>");
                pw.println("<td>"+name+"</td>");
                pw.println("<td>"+surname+"</td>");
                pw.println("<td>"+group+"</td></tr>");
            }
            pw.println("</div></table></center>");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
