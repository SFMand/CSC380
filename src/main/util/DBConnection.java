package main.util;

import java.sql.*;

public class DBConnection {
    Connection connection;

    public DBConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/stms",
                    "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
        public void printTeam(){
            try{
            Statement st = getConnection().createStatement();
            ResultSet rs = st.executeQuery("select * from team");
            System.out.println("Teams:");
            while (rs.next()){
                    System.out.println(rs.getString("tName"));
                
            }

            st.close();
        }
    catch(Exception e){

    }
    
    }
    public static Connection getConnection() {
        return new DBConnection().connection;
    }

    
    

    
}
