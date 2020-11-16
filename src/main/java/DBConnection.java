import contants.Database;
import java.sql.*;

public class DBConnection {
    private static Connection con;

    private DBConnection(){};
    static {
        try {
            Class.forName(Database.DRIVER_NAME);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection(Database.CONNECTION_STRING, Database.USER_NAME, Database.PASSWORD);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static Connection getCon()
    {
        return con;
    }
}

