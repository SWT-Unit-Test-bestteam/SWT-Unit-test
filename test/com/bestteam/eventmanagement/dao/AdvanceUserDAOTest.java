package com.bestteam.eventmanagement.dao;

import com.bestteam.eventmanagement.dto.UserDTO;
import com.bestteam.eventmanagement.utils.ConnectionInterface;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameter;
import org.junit.runners.Parameterized.Parameters;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author admin
 */
@RunWith(value = Parameterized.class)
public class AdvanceUserDAOTest {
    
    @Parameters //int a[] = {2,4,6,8,10}
    public static Object[][] initData() {
        List<UserDTO> expectedList = new ArrayList<>();
//        expectedList.add(new UserDTO(5, "haha@gmail.com", "HAHA", "link", "add2", "321", "Lecturer"));
        expectedList.add(new UserDTO(2, "hoho@gmail.com", "HOHO", "link", "add1", "123", "Student"));
        expectedList.add(new UserDTO(6, "hoho@gmail.com", "HOHO", "link", "add1", "123", "Student"));
        expectedList.add(new UserDTO(7, "hoho@gmail.com", "HOHO", "link", "add1", "123", "Student"));
        expectedList.add(new UserDTO(8, "hoho@gmail.com", "HOHO", "link", "add1", "123", "Student"));
        expectedList.add(new UserDTO(9, "hoho@gmail.com", "HOHO", "link", "add1", "123", "Student"));
        expectedList.add(new UserDTO(10, "hoho@gmail.com", "HOHO", "link", "add1", "123", "Student"));
        expectedList.add(new UserDTO(11, "hoho@gmail.com", "HOHO", "link", "add1", "123", "Student"));
        
        return new Object[][] {
                {2, expectedList},
                {1, new ArrayList<UserDTO>()}
                
        };
    }
    
    @Parameter(value = 0)
    public int n;   // bạn muốn tính mấy giai thừa
    
    @Parameter(value = 1)
    public List<UserDTO> expected;   //bạn kì vọng giai thừa trả về mấy
    
    @Test   //biến 1 hàm đi kèm ái Annotation này thành hàm main()
    public void checkFactorialGivenRightArgumentReturnsWell() throws SQLException, ClassNotFoundException {
        ConnectionInterface DBTest = new DBHelperTest();
        UserDAO userDAO = new UserDAO(DBTest);
        Assert.assertEquals(expected, userDAO.getAllUserByRoldId(n));
//        Assert.assertThat(userDAO.getUser(), expected);
    }
}
