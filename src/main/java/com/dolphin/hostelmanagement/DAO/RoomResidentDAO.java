/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.RoomResident;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RoomResidentDAO {

    public static ArrayList<RoomResident> findByRoom(Room r) {
        Connection cn = null;

        ArrayList<RoomResident> arr = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from RoomResident where roomID = ? AND activate = 1";
            PreparedStatement pst = cn.prepareCall(sql);

            pst.setInt(1, r.getRoomID());

            ResultSet rs = pst.executeQuery();

            while (rs != null && rs.next()) {
                int roomResidentID = rs.getInt("roomResidentID");
                String fullname = rs.getNString("fullname");
                String phone = rs.getString("phone");
                Date dob = rs.getDate("dob");

                arr.add(new RoomResident(roomResidentID, r, fullname, phone, dob));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return arr;
    }

    public static ArrayList<RoomResident> findByRoomAndName(Room r, String keyword) {
        Connection cn = null;

        ArrayList<RoomResident> arr = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from RoomResident where roomID = ? AND activate = 1 AND fullname like ?";
            PreparedStatement pst = cn.prepareCall(sql);

            pst.setInt(1, r.getRoomID());
            pst.setString(2, "%" + keyword + "%");
            ResultSet rs = pst.executeQuery();

            while (rs != null && rs.next()) {
                int roomResidentID = rs.getInt("roomResidentID");
                String fullname = rs.getNString("fullname");
                String phone = rs.getString("phone");
                Date dob = rs.getDate("dob");

                arr.add(new RoomResident(roomResidentID, r, fullname, phone, dob));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return arr;
    }

    public static boolean save(int roomId, String memberName, String memberPhone, String memberDob) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO RoomResident(roomID, fullname, phone, dob)\n"
                        + "VALUES (?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, roomId);
                pst.setString(2, memberName);
                pst.setString(3, memberPhone);
                pst.setString(4, memberDob);
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

    public static RoomResident findLastRoomResidentByRoomId(int roomId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT TOP 1 * FROM RoomResident WHERE roomID = ? AND activate = 1 ORDER BY roomResidentID DESC";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, roomId);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int roomResidentId = rs.getInt("roomResidentID");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    Date dob = rs.getDate("dob");
                    Room room = RoomDAO.findByID(roomId);
                    cn.close();
                    return new RoomResident(roomResidentId, room, fullname, phone, dob);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean update(int residentId, String updateFullName, String updatePhone, String updateDob) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE RoomResident SET fullname = ?, phone = ?, dob = ?\n"
                        + "WHERE roomResidentID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, updateFullName);
                pst.setString(2, updatePhone);
                pst.setString(3, updateDob);
                pst.setInt(4, residentId);
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

    public static boolean delete(int residentId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE RoomResident SET activate = 0 WHERE roomResidentID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, residentId);
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

    public static boolean deleteByRoomId(int roomId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE RoomResident SET activate = 0 WHERE roomID = ?";
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

    public static boolean deleteByRoomTypeId(int roomTypeId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE RoomResident\n"
                        + "SET activate = 0 FROM RoomResident RR\n"
                        + "INNER JOIN Room R ON RR.roomID = R.roomID\n"
                        + "INNER JOIN RoomType RT ON RT.roomTypeID = R.roomTypeID\n"
                        + " WHERE RT.roomTypeID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, roomTypeId);
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

    public static boolean deleteByHostelId(int hostelId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE RoomResident\n"
                        + "SET activate = 0 FROM RoomResident RR\n"
                        + "INNER JOIN Room R ON RR.roomID = R.roomID\n"
                        + "INNER JOIN RoomType RT ON RT.roomTypeID = R.roomTypeID\n"
                        + "INNER JOIN Hostel H ON H.hostelID = RT.hostelID\n"
                        + "WHERE H.hostelID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
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

    public static List<RoomResident> findByHostelID(int hostelId) {
        Connection cn = null;

        List<RoomResident> list = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList<>();
                String sql = "SELECT RR.roomResidentID, RR.roomID, RR.fullname, RR.phone, RR.dob \n"
                        + "FROM RoomResident RR INNER JOIN Room R ON RR.roomID = R.roomID \n"
                        + "INNER JOIN RoomType RT ON RT.roomTypeID = R.roomTypeID\n"
                        + "INNER JOIN Hostel H ON H.hostelID = RT.hostelID\n"
                        + "WHERE H.hostelID = ? AND RR.activate = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int roomResidentID = rs.getInt("roomResidentID");
                    String fullname = rs.getNString("fullname");
                    String phone = rs.getString("phone");
                    int roomID = rs.getInt("roomID");
                    Room r = RoomDAO.findByID(roomID);
                    Date dob = rs.getDate("dob");
                    list.add(new RoomResident(roomResidentID, r, fullname, phone, dob));
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<RoomResident> findByHostelAndName(int hostelId, String keyword) {
        Connection cn = null;

        List<RoomResident> list = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList<>();
                String sql = "SELECT RR.roomResidentID, RR.roomID, RR.fullname, RR.phone, RR.dob \n"
                        + "FROM RoomResident RR INNER JOIN Room R ON RR.roomID = R.roomID \n"
                        + "INNER JOIN RoomType RT ON RT.roomTypeID = R.roomTypeID\n"
                        + "INNER JOIN Hostel H ON H.hostelID = RT.hostelID\n"
                        + "WHERE H.hostelID = ? AND RR.activate = 1 AND RR.fullname like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                pst.setString(2, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int roomResidentID = rs.getInt("roomResidentID");
                    String fullname = rs.getNString("fullname");
                    String phone = rs.getString("phone");
                    int roomID = rs.getInt("roomID");
                    Room r = RoomDAO.findByID(roomID);
                    Date dob = rs.getDate("dob");
                    list.add(new RoomResident(roomResidentID, r, fullname, phone, dob));
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String args[]) {
        System.out.println(findByRoomAndName(RoomDAO.findByID(2), "a").size());
    }
}
