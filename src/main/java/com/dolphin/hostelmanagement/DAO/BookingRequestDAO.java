
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class BookingRequestDAO {
    public static int saveBookingRequest(int tenantID, int roomID, Date date, int status) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            
            java.sql.Date createdDate = new java.sql.Date(date.getTime());
            String sql = "Insert into BookingRequest (tenantID, roomID, createdDate, status) values (?, ?, ?, ?)";
            
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, tenantID);
            pst.setInt(2, roomID);
            pst.setDate(3, (java.sql.Date) createdDate);
            pst.setInt(4, status);
            
            int check = pst.executeUpdate();
            return check;
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }
    
    public static void main(String args[]) {
        Date date = new Date();
        saveBookingRequest(10, 1, date, 1);
    }
}
