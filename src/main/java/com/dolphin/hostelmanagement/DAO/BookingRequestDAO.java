package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Account;
import com.dolphin.hostelmanagement.DTO.BookingRequest;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.RoomType;
import com.dolphin.hostelmanagement.DTO.Tenant;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class BookingRequestDAO {

    public static int saveBookingRequest(int tenantID, int roomTypeID, Date date, int status, String description) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();

            java.sql.Date createdDate = new java.sql.Date(date.getTime());
            String sql = "Insert into BookingRequest (tenantID, roomTypeID, createdDate, status, description) values (?, ?, ?, ?, ?)";

            PreparedStatement pst = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, tenantID);
            pst.setInt(2, roomTypeID);
            pst.setDate(3, (java.sql.Date) createdDate);
            pst.setInt(4, status);
            pst.setNString(5, description);

            pst.executeUpdate();

            ResultSet rs = pst.getGeneratedKeys();

            if (rs.next()) {
                return rs.getInt(1);
            }

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

            String sql = "Select * from BookingRequest where tenantID = ? and status = ? order by createdDate desc";

            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, t.getAccount().getAccountID());
            pst.setInt(2, status);

            ResultSet rs = pst.executeQuery();

            while (rs != null && rs.next()) {
                int bookingRequestID = rs.getInt("bookingRequestID");
                RoomType roomType = RoomTypeDAO.findByID(rs.getInt("roomTypeID"));
                Date createdDate = rs.getDate("createdDate");
                String description = rs.getNString("description");

                arr.add(new BookingRequest(bookingRequestID, t, roomType, createdDate, status, description));
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

            String sql = "Select BookingRequest.bookingRequestID, BookingRequest.createdDate, BookingRequest.roomTypeID, BookingRequest.status, BookingRequest.tenantID, BookingRequest.description\n"
                    + "from BookingRequest \n"
                    + "inner join RoomType on RoomType.roomTypeID = BookingRequest.roomTypeID\n"
                    + "inner join Hostel on Hostel.hostelID = RoomType.hostelID\n"
                    + "where Hostel.hostelID = ? and BookingRequest.status = ? order by createdDate desc";

            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, hostelID);
            pst.setInt(2, status);

            ResultSet rs = pst.executeQuery();

            while (rs != null && rs.next()) {
                int bookingRequestID = rs.getInt("bookingRequestID");
                RoomType roomType = RoomTypeDAO.findByID(rs.getInt("roomTypeID"));
                Date createdDate = rs.getDate("createdDate");
                Tenant t = TenantDAO.findById(rs.getInt("tenantID"));
                String description = rs.getNString("description");

                arr.add(new BookingRequest(bookingRequestID, t, roomType, createdDate, status, description));
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
        } catch (Exception e) {
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
                RoomType roomType = RoomTypeDAO.findByID(rs.getInt("roomTypeID"));
                Date createdDate = rs.getDate("createdDate");
                Tenant t = TenantDAO.findById(rs.getInt("tenantID"));
                int status = rs.getInt("status");
                String description = rs.getNString("description");

                br = (new BookingRequest(bookingRequestID, t, roomType, createdDate, status, description));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return br;
    }

    /*public static boolean disableByRoomID(int roomID) {
        Connection cn = null;
        
        try {
            cn = DBUtils.makeConnection();
            
            String sql = "Update BookingRequest set status = 0 where roomID = ?";
            
            PreparedStatement pst = cn.prepareCall(sql);
            
            pst.setInt(1, roomID);
            
            return pst.executeUpdate() > 0;
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }*/
    public static void removeAllByTenantID(int tenantID, int status) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            String sql = "Update BookingRequest set status = ? where tenantID = ? and status = ?";

            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(2, tenantID);
            pst.setInt(3, status);
            if (status == 1) {
                pst.setInt(1, 3);
            }
            if (status == 2) {
                pst.setInt(1, 5);
            }
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void changeCreatedDate(int bookingRequestID, Date date) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            String sql = "Update BookingRequest set createdDate = ? where bookingRequestID = ?";

            java.sql.Date sqlRegDate = new java.sql.Date(date.getTime());
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setDate(1, sqlRegDate);
            pst.setInt(2, bookingRequestID);

            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<BookingRequest> findByLandlordID(int landlordID, int status) {
        Connection cn = null;

        ArrayList<BookingRequest> brList = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select br.bookingRequestID, br.tenantID, br.createdDate, br.status, br.roomTypeID, br.description from BookingRequest br inner join RoomType rt \n"
                    + "	on rt.roomTypeID = br.roomTypeID inner join Hostel h on rt.hostelID = h.hostelID inner join Landlord l on l.landlordID = h.landlordId where L.landlordID = ?\n"
                    + "	and status = ? order by createdDate desc";

            PreparedStatement pst = cn.prepareCall(sql);

            pst.setInt(1, landlordID);
            pst.setInt(2, status);

            ResultSet rs = pst.executeQuery();

            while (rs != null && rs.next()) {
                int bookingRequestID = rs.getInt("bookingRequestID");
                Tenant t = TenantDAO.findById(rs.getInt("tenantID"));
                Date createdDate = rs.getDate("createdDate");
                RoomType rt = RoomTypeDAO.findByID(rs.getInt("roomTypeID"));
                String description = rs.getNString("description");

                brList.add(new BookingRequest(bookingRequestID, t, rt, createdDate, status, description));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return brList;
    }

    public static boolean findPendingBookingRequest(int tenantID, int roomTypeID) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from BookingRequest where tenantID = ? and roomTypeID = ? and (status = 1 or status = 2)";

            PreparedStatement pst = cn.prepareCall(sql);

            pst.setInt(1, tenantID);
            pst.setInt(2, roomTypeID);

            ResultSet rs = pst.executeQuery();

            if (rs != null && rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static void addDescription(int bookingRequestID, String description) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Update BookingRequest set description = ? where bookingRequestID = ?";

            PreparedStatement pst = cn.prepareCall(sql);

            pst.setNString(1, description);
            pst.setInt(2, bookingRequestID);

            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
        //changeCreatedDate(1002, new Date());
        addDescription(1, "gâu gâu");
    }

}
