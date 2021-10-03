/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.dao;

import com.bestteam.eventmanagement.dto.UserDTO;
import java.sql.SQLException;
import java.util.List;
import junit.framework.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.jupiter.api.Assertions;

/**
 *
 * @author admin
 */
public class UserDAOTest {
    @Test
      //biến 1 hàm đi kèm ái Annotation này thành hàm main()
    public void checkUpdateUserGivenRightArgumentReturnsWell() throws SQLException, ClassNotFoundException{
        
        
        UserDAO userDAO = new UserDAO();
        
        UserDTO userDTO1 = userDAO.findUserReturnDTO(2);
        UserDTO userDTO = new UserDTO(1, "antruong300&gmail.com", "thien an", "img/dasdhh", "quan 2 ", "093223", "admin");
        
        Assert.assertNotNull(userDTO1);
        
        
    }
}
