/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.RoomResident;
import com.dolphin.hostelmanagement.DTO.RoomType;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RoomDAO {

    public static List<Room> findAll() {
        List<Room> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Room";
                PreparedStatement pst = cn.prepareCall(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int roomID = rs.getInt("roomId");
                        int hostelID = rs.getInt("hostelId");
                        Hostel hostel = HostelDAO.findById(hostelID);
                        String roomNumber = rs.getString("roomNumber");
                        int area = rs.getInt("area");
                        ArrayList<String> images = null; //cho nay em chua biet lam sao :D
                        String description = rs.getNString("description");
                        int status = rs.getInt("status");
                        int maxNumberOfResident = rs.getInt("maxNoResidents");
                        int currentNumberOfResident = rs.getInt("currentNoResidents");
                        int advertisedPrice = rs.getInt("advertisedPrice");

//                        list.add(new Room(roomID, hostel, roomNumber, 
//                                area, images, description, status, maxNumberOfResident, currentNumberOfResident, advertisedPrice));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static ArrayList<Room> findByRoomTypeID(int roomTypeID) {
        ArrayList<Room> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Room where roomTypeID = ? AND activate = 1";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, roomTypeID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int roomID = rs.getInt("roomID");
                        String roomNumber = rs.getString("roomNumber");
                        int currentNoResidents = rs.getInt("currentNoResidents");
                        int status = rs.getInt("status");

                        RoomType roomType = RoomTypeDAO.findByID(roomTypeID);

                        list.add(new Room(roomID, roomNumber, currentNoResidents, status, roomType));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static ArrayList<Room> findByHostelID(int hostelID) {
        ArrayList<Room> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Room WHERE activate = 1";
                PreparedStatement pst = cn.prepareCall(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int roomID = rs.getInt("roomID");
                        String roomNumber = rs.getString("roomNumber");
                        int currentNoResidents = rs.getInt("currentNoResidents");
                        int status = rs.getInt("status");
                        RoomType roomType = findByID(roomID).getRoomType();
                        if (roomType.getHostel().getHostelID() == hostelID) {
                            list.add(new Room(roomID, roomNumber, currentNoResidents, status, roomType));
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static Room findByID(int inputRoomID) {
        Room room = null;

        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from Room where roomID = ?";

            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, inputRoomID);

            ResultSet rs = pst.executeQuery();

            if (rs != null && rs.next()) {
                int roomID = rs.getInt("roomId");
                String roomNumber = rs.getString("roomNumber");
                int currentNumberOfResident = rs.getInt("currentNoResidents");
                int status = rs.getInt("status");
                int roomTypeID = rs.getInt("roomTypeID");
                RoomType roomType = RoomTypeDAO.findByID(roomTypeID);

                room = new Room(roomID, roomNumber, currentNumberOfResident, status, roomType);

//                room = new Room(roomID, hostel, roomNumber, area, images, description, status, maxNumberOfResident, currentNumberOfResident, advertisedPrice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return room;
    }

    public static ArrayList<RoomResident> findResidentByRoom(Room room) {
        ArrayList<RoomResident> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from RoomResident where roomID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, room.getRoomID());
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int roomResidentID = rs.getInt("roomResidentID");
                        String fullname = rs.getString("fullname");
                        String phone = rs.getString("phone");
                        Date dob = rs.getDate("dob");
                        list.add(new RoomResident(roomResidentID, room, fullname, phone, dob));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static void changeStatus(int roomID, int status) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Update Room set status = ? where roomID = ?";

            PreparedStatement pst = cn.prepareCall(sql);

            pst.setInt(1, status);
            pst.setInt(2, roomID);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean isExistRoomNumber(String roomNumber, int hostelId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT R.roomID FROM Room R INNER JOIN RoomType RP ON R.roomTypeID = RP.roomTypeID \n"
                        + "INNER JOIN Hostel H  ON RP.hostelID = H.hostelID\n"
                        + " where H.hostelID = ? AND R.roomNumber = ? AND R.activate = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                pst.setString(2, roomNumber);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    cn.close();
                    return true;
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean save(int roomTypeId, String roomNumber) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Room(roomNumber, roomTypeId) VALUES(?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, roomNumber);
                pst.setInt(2, roomTypeId);
                int rows = pst.executeUpdate();
                if (rows > 0) {
                    cn.close();
                    return true;
                }
                cn.close();
            }
        } catch (Exception e) {

        }
        return false;
    }

    public static List<Room> findRoomsNeedInvoice(int hostelID) {
        List<Room> list = null;
        Connection cn = null;
        YearMonth thisMonth = YearMonth.now();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select roomID, roomNumber, status, CONCAT(YEAR(latestInvoiceMonth), '-', RIGHT(CONCAT('00', MONTH(latestInvoiceMonth)), 2)) as latestInvoiceMonth\n"
                        + "from Room";
                PreparedStatement pst = cn.prepareCall(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int roomID = rs.getInt("roomID");
                        String roomNumber = rs.getString("roomNumber");
                        int status = rs.getInt("status");
                        RoomType roomType = findByID(roomID).getRoomType();
                        String latestMonthString = rs.getString("latestInvoiceMonth");
                        YearMonth latestInvoiceMonth = (!latestMonthString.equals("-00")) ? YearMonth.parse(latestMonthString) : null;
                        if (roomType.getHostel().getHostelID() == hostelID && status == 1 && (latestInvoiceMonth == null || latestInvoiceMonth.isBefore(thisMonth))) {
                            list.add(new Room(roomID, roomNumber, roomType, latestInvoiceMonth));
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static Room findRoomNewInvoice(int roomIDInput) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select roomID, roomNumber, CONCAT(YEAR(latestInvoiceMonth), '-', RIGHT(CONCAT('00', MONTH(latestInvoiceMonth)), 2)) as latestInvoiceMonth\n"
                        + "from Room where roomID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, roomIDInput);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int roomID = rs.getInt("roomID");
                        String roomNumber = rs.getString("roomNumber");
                        RoomType roomType = findByID(roomID).getRoomType();
                        String latestMonthString = rs.getString("latestInvoiceMonth");
                        YearMonth latestInvoiceMonth = (!latestMonthString.equals("-00")) ? YearMonth.parse(latestMonthString) : null;
                        return new Room(roomID, roomNumber, roomType, latestInvoiceMonth);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    public static boolean updateRoom(int roomId, int updateRoomTypeId, String updateroomNumber) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Room\n"
                        + "SET roomTypeID = ?, roomNumber = ? \n"
                        + "WHERE roomID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, updateRoomTypeId);
                pst.setString(2, updateroomNumber);
                pst.setInt(3, roomId);
                int rows = pst.executeUpdate();
                if (rows > 0) {
                    cn.close();
                    return true;
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean deleteById(int roomId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Room SET activate = 0 WHERE roomID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, roomId);
                int rows = pst.executeUpdate();
                if (rows > 0) {
                    cn.close();
                    return true;
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean setCurrentNumberOfResidents(int roomId, int quantity) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Room SET currentNoResidents = ? WHERE roomID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, quantity);
                pst.setInt(2, roomId);
                int rows = pst.executeUpdate();
                if (rows > 0) {
                    cn.close();
                    return true;
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String args[]) {
        for (Room r:
             findRoomsNeedInvoice(1)) {
            System.out.println(r);
        }
//        System.out.println(setCurrentNumberOfResidents(5, 3));
    }
}
