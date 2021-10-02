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
public class DBHelperUnitTest {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:sqlserver://"+ serverName+":"+portNumber+";databaseName="+dbName+";instanceName=DUONGMH";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    
    private static final String serverName = "localhost";
    private static final String dbName = "EventManagementUnitTest";
    private static final String portNumber = "1433";
    private static final String userID = "sa";
    private static final String password = "root";
}
