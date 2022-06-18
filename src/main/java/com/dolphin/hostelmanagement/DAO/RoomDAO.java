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
                String sql = "select * from Room where roomTypeID = ?";
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
                        boolean isRoomLead = rs.getBoolean("isRoomLead");
                        list.add(new RoomResident(roomResidentID, room, fullname, phone, dob, isRoomLead));
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

    public static void main(String args[]) {
        //for (Room room : findByRoomTypeID(1)) {
        //    System.out.println(room.getCurrentNumberOfResidents());
        //}
        System.out.println(findByID(1).getRoomNumber());
        System.out.println(findByID(2).getRoomNumber());
        System.out.println(findByID(6).getRoomNumber());
    }
}
