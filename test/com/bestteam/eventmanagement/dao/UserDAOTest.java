/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.dao;

import com.bestteam.eventmanagement.dto.UserDTO;
import com.bestteam.eventmanagement.utils.ConnectionInterface;
import java.sql.SQLException;
import org.junit.Test;
//import org.junit.Test;

/**
 *
 * @author admin
 */
public class UserDAOTest {
    
//    private ConnectionInterface DBTest = (ConnectionInterface) new DBHelperTest();
    
    @Test   //biến 1 hàm đi kèm ái Annotation này thành hàm main()
    public void checkUpdateUserGivenRightArgumentReturnsWell() throws SQLException, ClassNotFoundException {
        ConnectionInterface DBTest = (ConnectionInterface) new DBHelperTest();
        UserDAO userDAO = new UserDAO(DBTest);
        
        UserDTO userDTO1 = userDAO.findUserReturnDTO(2);
        UserDTO userDTO = new UserDTO(1, "antruong300&gmail.com", "thien an", "img/dasdhh", "quan 2 ", "093223", "admin");
        
    }
    
    @Test(expected = RuntimeException.class)
    public void test() throws SQLException, ClassNotFoundException {
        ConnectionInterface DBTest = (ConnectionInterface) new DBHelperTest();
        UserDAO userDAO = new UserDAO(DBTest);
        userDAO.updateUserAction(null, "antruong3007@gmail.com", "abc", "abc");
    }
    
    
}
