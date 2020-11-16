import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            Connection con = DBConnection.getCon();
            String id=req.getParameter("id");
            String type=req.getParameter("type");
            PreparedStatement pst=con.prepareStatement("delete from "+type+" where Header='"+id+"'");
            RequestDispatcher rd = req.getRequestDispatcher("adminPanel.jsp");
            rd.include(req, res);
            pst.executeUpdate();
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
