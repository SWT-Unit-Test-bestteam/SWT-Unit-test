/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DBHelperTest {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        
        final String serverName = "localhost";
        final String dbName = "EventManagement";
        final String portNumber = "1433";
        final String userID = "sa";
        final String password = "123";
        
        String url = "jdbc:sqlserver://"+ serverName+":"+portNumber+";databaseName="+dbName+";instanceName=DUONGMH";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    
    
}
