import java.sql.*;

public class MySQLConnection {
    public static void main(String[] args) throws Exception {

        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/stms",
                    "root", "");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from team");
            int code;
            String title;
            while (resultSet.next()) {
                code = resultSet.getInt("TeamId");
                title = resultSet.getString("tName").trim();
                System.out.println("Team Id : " + code + " Team name : " + title);
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception exception) {
            System.out.println(exception);
        }
    }
}
