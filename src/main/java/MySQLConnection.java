package main.java;
import java.sql.*;

public class MySQLConnection {
    public static void main(String[] args) throws Exception {

        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/stms",
                    "root", "");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM team");
            while (resultSet.next()) {
                String code = resultSet.getString("TeamId");
                String title = resultSet.getString("tName").trim();
                System.out.println("Team Id : " + code + " \nTeam name : " + title + "\n");
            } 
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception exception) {
            System.out.println(exception);
        }
    }
}
