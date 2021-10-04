/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author admin
 */
public class DBHelper implements ConnectionInterface {

    public Connection makeConnection() {
        
        try {
            //1. get current system file
            Context context = new InitialContext();
            //2. get container context
            Context tomcatContext = (Context) context.lookup("java:comp/env");
            //3. get Datasource from container
            DataSource ds = (DataSource) tomcatContext.lookup("DBSlink");
            //4. get Connection
            Connection con = null;
            try {
                con = ds.getConnection();
            } catch (SQLException ex) {
                Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            return con;
        } catch (NamingException ex) {
            Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
