/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.dao;

import com.bestteam.eventmanagement.dto.UserDTO;
import com.bestteam.eventmanagement.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author admin
 */
public class UserDAO {
    

    //khi nguoi dung dang nhap bang mail fpt.edu.vn lan dau thi goi ham nay de insert thong tin vao DB
    public boolean insertNewUser(UserDTO user) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblUsers(email, name, avatar, address, phoneNum, roleID , statusId)"
                        + " VALUES(?,?,?,?,?,?,'AC')";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getEmail());
                stm.setNString(2, user.getName());
                stm.setString(3, user.getAvatar());
                stm.setString(4, user.getAddress());
                stm.setString(5, user.getPhoneNum());
                stm.setInt(6, "STUDENT".equals(user.getRoleName())? 1 : 2);
                check = stm.executeUpdate() > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;

    }
    
    //Ham update thong tin user vao DB
    public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblUsers "
                        + " SET name=?, address=?, phoneNum=?"
                        + " WHERE email=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getName());
                stm.setString(2, user.getAddress());
                stm.setString(3, user.getPhoneNum());
                stm.setString(4, user.getEmail());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
