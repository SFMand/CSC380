package main.java;

import java.sql.*;

public class MySQLConnection {
    Connection connection;

    public MySQLConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/stms",
                    "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void printTeams() {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement
                    .executeQuery("SELECT pName, tName FROM team, player WHERE Team_TeamId = TeamId");
            while (resultSet.next()) {
                String name = resultSet.getString("pName");
                String id = resultSet.getString("tName");
                System.out.printf("Player Name: %20s\tTeam: %s\n", name, id);
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
