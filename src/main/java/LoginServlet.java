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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = DBConnection.getCon();
            String username,password;
            int type=0;
            username=request.getParameter("username");
            password =request.getParameter("password");
            PreparedStatement pst=con.prepareStatement("select Username, Password, Name, Type from users where Username=? and Password=?");
            pst.setString(1,username);
            pst.setString(2,password);
            HttpSession httpSession = request.getSession(true);
            ResultSet rs=pst.executeQuery();
            if(username!=null && password!=null) {
                while (rs.next()) {
                    httpSession.setAttribute("username", username);
                    httpSession.setMaxInactiveInterval(-1);
                    type=rs.getInt(4);
                    if (type==1){
                        response.sendRedirect("adminPanel.jsp");
                    }else{
                        response.sendRedirect("mainpage.jsp");
                    }
                }
                response.sendRedirect("index.jsp");
            }

        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
