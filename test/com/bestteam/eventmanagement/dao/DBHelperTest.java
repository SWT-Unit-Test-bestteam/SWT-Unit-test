/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.dao;

import com.bestteam.eventmanagement.utils.ConnectionInterface;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DBHelperTest implements ConnectionInterface {

    @Override
    public Connection makeConnection() {
        try {
            final String serverName = "localhost";
            final String dbName = "EventManagementUnitTest";
            final String portNumber = "1433";
            final String userID = "sa";
            final String password = "root";
            
            String url = "jdbc:sqlserver://"+ serverName+":"+portNumber+";databaseName="+dbName+";instanceName=DUONGMH";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(url, userID, password);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
        return null;
    }
    
}
