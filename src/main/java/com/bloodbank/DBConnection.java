package com.bloodbank;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {
        	   Class.forName("com.mysql.cj.jdbc.Driver");
        	   String url = System.getenv("DB_URL");
        	   String user = System.getenv("DB_USER");
        	   String password = System.getenv("DB_PASSWORD");  
            
            

            
              

                con = DriverManager.getConnection(url, user, password);

                System.out.println("Aiven Connected Successfully!");

            return con;

        } catch (Exception e) {
            e.printStackTrace();
            throw new 
            RuntimeException("Database connection failed: "+e.getMessage(),e);
        }

        
    }
}