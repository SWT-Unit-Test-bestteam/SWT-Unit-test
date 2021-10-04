/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.dao;

import com.bestteam.eventmanagement.utils.ConnectionInterface;
import com.bestteam.eventmanagement.utils.DBHelper;
import com.bestteam.eventmanagement.utils.DBHelperUnitTest;
import java.sql.SQLException;
import javax.naming.NamingException;
import junit.framework.Assert;
import org.junit.Test;

/**
 *
 * @author admin
 */
public class UserDAOTest {
    
    @Test   //biến 1 hàm đi kèm ái Annotation này thành hàm main()
    public void checkUpdateUserGivenRightArgumentReturnsWell() {
        ConnectionInterface DBTest = (ConnectionInterface) new DBHelperUnitTest();
        LocationDAO dao = new LocationDAO(DBTest);
        
        try {
            // return False
            Assert.assertFalse(dao.getLocationByName("E"));
            
            // return True
            Assert.assertTrue(dao.getLocationByName("A"));
            Assert.assertTrue(dao.getLocationByName("B"));
            Assert.assertTrue(dao.getLocationByName("AB"));
            Assert.assertTrue(dao.getLocationByName("BC"));
            
        } catch (NamingException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }
    
}
