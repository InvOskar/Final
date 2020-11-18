import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/MyBooksServlet")
public class MyBooksServlet extends HttpServlet {
    private static int SERIAL_ID=0;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String item = "book"+id+"n"+SERIAL_ID;
        SERIAL_ID++;
        Cookie itemCookie = new Cookie(item,id);
        itemCookie.setMaxAge(120);
        response.addCookie(itemCookie);
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().contains("book")) {
                cookie.setMaxAge(-1);
                response.addCookie(cookie);
            }
        }
        for (Cookie cookie : cookies) {
            if (cookie.getName().contains("book")) {
                cookie.setMaxAge(120);
                response.addCookie(cookie);
            }
        }
        response.sendRedirect("books.jsp");
    }
}
