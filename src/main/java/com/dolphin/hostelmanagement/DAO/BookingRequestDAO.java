package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Account;
import com.dolphin.hostelmanagement.DTO.BookingRequest;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.Tenant;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public static ArrayList<BookingRequest> getBookingRequestByTenant(Tenant t, int status) { //status = 1 means bookingReq, = 2 means landlords accepted,
        // 0 is refused, won't show
        Connection cn = null;

        ArrayList<BookingRequest> arr = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from BookingRequest where tenantID = ? and status = ?";

            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, t.getAccount().getAccountID());
            pst.setInt(2, status);

            ResultSet rs = pst.executeQuery();

            while (rs != null && rs.next()) {
                int bookingRequestID = rs.getInt("bookingRequestID");
                Room room = RoomDAO.findByID(rs.getInt("roomID"));
                Date createdDate = rs.getDate("createdDate");

                arr.add(new BookingRequest(bookingRequestID, t, room, createdDate, status));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return arr;
    }

    public static ArrayList<BookingRequest> getBookingRequestByHostelID(int hostelID, int status) { //status = 1 means bookingReq, = 2 means landlords accepted,
        // 0 is refused, won't show
        Connection cn = null;

        ArrayList<BookingRequest> arr = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select BookingRequest.bookingRequestID, BookingRequest.createdDate, BookingRequest.roomID, BookingRequest.status, BookingRequest.tenantID\n"
                    + "from BookingRequest \n"
                    + "inner join Room on Room.roomID = BookingRequest.roomID\n"
                    + "inner join RoomType on RoomType.roomTypeID = Room.roomTypeID\n"
                    + "inner join Hostel on Hostel.hostelID = RoomType.hostelID\n"
                    + "where Hostel.hostelID = ? and BookingRequest.status = ?";

            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, hostelID);
            pst.setInt(2, status);

            ResultSet rs = pst.executeQuery();

            while (rs != null && rs.next()) {
                int bookingRequestID = rs.getInt("bookingRequestID");
                Room room = RoomDAO.findByID(rs.getInt("roomID"));
                Date createdDate = rs.getDate("createdDate");
                Tenant t = TenantDAO.findById(rs.getInt("tenantID"));

                arr.add(new BookingRequest(bookingRequestID, t, room, createdDate, status));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return arr;
    }
    
    public static boolean changeStatus(int bookingRequestID, int status) {
        Connection cn = null;
        
        try {
            cn = DBUtils.makeConnection();
            
            String sql = "Update BookingRequest set status = ? where bookingRequestID = ?";
            
            PreparedStatement pst = cn.prepareCall(sql);
            
            pst.setInt(1, status);
            pst.setInt(2, bookingRequestID);
            
            pst.executeUpdate();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    public static BookingRequest getBookingRequestByID(int bookingRequestID) {
        Connection cn = null;

        BookingRequest br = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from BookingRequest where bookingRequestID = ?";

            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, bookingRequestID);

            ResultSet rs = pst.executeQuery();

            while (rs != null && rs.next()) {
                Room room = RoomDAO.findByID(rs.getInt("roomID"));
                Date createdDate = rs.getDate("createdDate");
                Tenant t = TenantDAO.findById(rs.getInt("tenantID"));
                int status = rs.getInt("status");
                
                br = (new BookingRequest(bookingRequestID, t, room, createdDate, status));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return br;
    }

    public static void main(String args[]) {
        /*Tenant t = new Tenant();
        t.setAccount(new Account());
        t.getAccount().setAccountID(10);
        for (BookingRequest br : getBookingRequestByHostelID(1, 1)) {
            System.out.println(br.getRoom().getRoomID());
            System.out.println(br.getBookingRequestID());
            System.out.println(br.getTenant().getFullname());
        }*/
        
        System.out.println(getBookingRequestByID(1).getTenant().getAccount().getAccountID());
    }

    
}
