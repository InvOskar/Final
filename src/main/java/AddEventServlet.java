import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            Connection con = DBConnection.getCon();
            String header=req.getParameter("header");
            String main_part=req.getParameter("main_part");
            String date=req.getParameter("date");
            String location=req.getParameter("location");
            PreparedStatement pst=con.prepareStatement("insert into events values('"+header+"','"+main_part+"','"+date+"','"+location+"')");
            RequestDispatcher rd = req.getRequestDispatcher("adminPanel.jsp");
            rd.include(req, res);
            pst.executeUpdate();
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
