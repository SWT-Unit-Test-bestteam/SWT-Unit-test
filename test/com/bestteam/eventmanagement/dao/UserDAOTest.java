/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.dao;

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
        LocationDAO dao = new LocationDAO();
        
        try {
            
            Assert.assertEquals(null, dao.getLocationByName("p"));
        } catch (NamingException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }
    
}
