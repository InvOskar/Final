import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class EditUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            Connection con = DBConnection.getCon();
            String id=req.getParameter("id");
            String type=req.getParameter("type");
            String txt=req.getParameter("toChange");
            PreparedStatement pst=con.prepareStatement("UPDATE users SET "+type+" = '"+txt+"' WHERE Id = "+id+";");
            RequestDispatcher rd = req.getRequestDispatcher("StudentListAdminServlet");
            rd.include(req, res);
            pst.executeUpdate();
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
