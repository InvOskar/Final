import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.*;
import java.sql.*;
import javax.servlet.*;

public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            Connection con = DBConnection.getCon();
            String username=req.getParameter("username");
            PreparedStatement pst=con.prepareStatement("delete from users where Username=?");
            pst.setString(1,username);
            RequestDispatcher rd = req.getRequestDispatcher("StudentListAdminServlet");
            rd.include(req, res);
            pst.executeUpdate();
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
