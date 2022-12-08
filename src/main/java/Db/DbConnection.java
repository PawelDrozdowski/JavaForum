/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author pawel
 */
public class DbConnection {
    protected static Connection initializeDatabase()
        throws SQLException, ClassNotFoundException
    {
        // Initialize all the information regarding
        // Database Connection
        String dbDriver = "com.mysql.cj.jdbc.Driver";
        String dbURL = "jdbc:mysql://localhost:3306/";
        // Database name to access
        String dbName = "forum_java";
        String dbUsername = "root";
        String dbPassword = "";
  
        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(dbURL + dbName,dbUsername,dbPassword);
        
        return con;
    }
}
