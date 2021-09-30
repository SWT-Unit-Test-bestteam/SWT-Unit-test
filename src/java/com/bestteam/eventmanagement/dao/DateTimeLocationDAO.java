/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestteam.eventmanagement.dao;

import com.bestteam.eventmanagement.dto.RangeDateDTO;
import com.bestteam.eventmanagement.utils.DBHelper;
import java.sql.Connection;
import java.sql.Date;
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
public class DateTimeLocationDAO {
    
    public List<RangeDateDTO> getFreeSlotByFirstDateOfWeek(int locationId, Date firstDateOfWeek) throws NamingException, SQLException {
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<RangeDateDTO> listRangeDate;
        
        try {
            con = DBHelper.makeConnection();
            String sql = "select DATEPART(dw,[date]) as day , rangeId "
                        +"from tblDateTimeLocation "
                        +"where locationId = ? AND [date] between ? AND DATEADD(DAY,6, ?) ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, locationId);
            ps.setDate(2, firstDateOfWeek);
            ps.setDate(3, firstDateOfWeek);
            rs = ps.executeQuery();
            RangeDateDTO rangeDate;
            listRangeDate = new ArrayList();
            while (rs.next()) {
                // get from DB each ele
                int dayInWeek = rs.getInt("day");
                int rangeId = rs.getInt("rangeId");
                // inject into DTO
                rangeDate = new RangeDateDTO(rangeId, dayInWeek);
                // add DTO ele to list
                listRangeDate.add(rangeDate);
            }
            
            return listRangeDate;
            
        } finally {
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        
    }
}
