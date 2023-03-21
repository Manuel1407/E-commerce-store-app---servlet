package com.ikechukwu.ecommercestoreapp1.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/EmmyStores?useSSL=false";
                String uname = "root";
                String pass = "12345678";
                connection = DriverManager.getConnection(url, uname, pass);
                System.out.println("CONNECTED");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        return connection;
    }
}
