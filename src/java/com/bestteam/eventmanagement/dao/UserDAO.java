/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.dao;

import com.bestteam.eventmanagement.dto.UserDTO;
import com.bestteam.eventmanagement.utils.DBHelperUnitTest;
import com.bestteam.eventmanagement.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
                stm.setInt(6, "STUDENT".equals(user.getRoleName()) ? 1 : 2);
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
    public boolean updateUser(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelperUnitTest.getConnection();
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
    
    public void updateUserAction(String name, String email, String address, String phone) throws SQLException, ClassNotFoundException {
        UserDTO userDTO = new UserDTO(1, email, name, "123", address, phone, "123");
        validateUser(userDTO);
        updateUser(userDTO);
    }
    
    public void validateUser(UserDTO user) {
        user.nameValidation();
        user.emailValidation();
        user.addressValidation();
        user.phoneValidation();
    }

    public boolean findUser(int userid) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelperUnitTest.getConnection();
            if (conn != null) {
                String sql = "select email from tblUsers where id = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, userid);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public String getRoleName(int roleID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelperUnitTest.getConnection();
            String sql = "select roleName from tblRoles where id  = ?";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, roleID);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public UserDTO findUserReturnDTO(int userid) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDAO userDAO = new UserDAO();
        try {
            conn = DBHelperUnitTest.getConnection();
            if (conn != null) {
                String sql = "select * from tblUsers where id  = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, userid);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return new UserDTO(rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("name"),
                            rs.getString("avatar"),
                            rs.getString("address"),
                            rs.getString("phoneNum"),
                            userDAO.getRoleName(rs.getInt("roleId")));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public List<UserDTO> getAllUser() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        List<UserDTO> arrayList = new ArrayList<>();
        ResultSet rs = null;
        UserDAO userDAO = new UserDAO();
        try {
            conn = DBHelperUnitTest.getConnection();
            if (conn != null) {
                String sql = "select * from tblUsers";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    arrayList.add(new UserDTO(rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("name"),
                            rs.getString("avatar"),
                            rs.getString("address"),
                            rs.getString("phoneNum"),
                            userDAO.getRoleName(rs.getInt("roleId"))));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return arrayList;
    }
//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        UserDAO userDAO = new UserDAO();
//        for (UserDTO userDTO : userDAO.getAllUser()) {
//            System.out.println(userDTO.toString());
//        }
//    }

    public boolean findUser(int userid) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelperUnitTest.getConnection();
            if (conn != null) {
                String sql = "select email from tblUsers where id = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, userid);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public String getRoleName(int roleID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelperUnitTest.getConnection();
            String sql = "select roleName from tblRoles where id  = ?";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, roleID);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public UserDTO findUserReturnDTO(int userid) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDAO userDAO = new UserDAO();
        try {
            conn = DBHelperUnitTest.getConnection();
            if (conn != null) {
                String sql = "select * from tblUsers where id  = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, userid);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return new UserDTO(rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("name"),
                            rs.getString("avatar"),
                            rs.getString("address"),
                            rs.getString("phoneNum"),
                            userDAO.getRoleName(rs.getInt("roleId")));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public List<UserDTO> getAllUser() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        List<UserDTO> arrayList = new ArrayList<>();
        ResultSet rs = null;
        UserDAO userDAO = new UserDAO();
        try {
            conn = DBHelperUnitTest.getConnection();
            if (conn != null) {
                String sql = "select * from tblUsers";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    arrayList.add(new UserDTO(rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("name"),
                            rs.getString("avatar"),
                            rs.getString("address"),
                            rs.getString("phoneNum"),
                            userDAO.getRoleName(rs.getInt("roleId"))));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return arrayList;
    }
//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        UserDAO userDAO = new UserDAO();
//        for (UserDTO userDTO : userDAO.getAllUser()) {
//            System.out.println(userDTO.toString());
//        }
//    }

}
