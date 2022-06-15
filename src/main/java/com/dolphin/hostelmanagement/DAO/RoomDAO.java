/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
                        int roomNumber = rs.getInt("roomNumber");
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
    
    public static List<Room> findByHostelID(int hostelID) {
        List<Room> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Room where hostelID = ? order by area, advertisedPrice";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, hostelID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int roomID = rs.getInt("roomID");
                        Hostel hostel = HostelDAO.findById(hostelID);
                        int roomNumber = rs.getInt("roomNumber");
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
    
    public static Room findByID(int inputRoomID) {
        Room room = null;

        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from Room where roomID = ?";

            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, inputRoomID);

            ResultSet rs = pst.executeQuery();

            if(rs != null && rs.next()) {
                    int roomID = rs.getInt("roomId");
                int hostelID = rs.getInt("hostelID");
                Hostel hostel = HostelDAO.findById(hostelID);
                int roomNumber = rs.getInt("roomNumber");
                int area = rs.getInt("area");
                String description = rs.getNString("description");
                int maxNumberOfResident = rs.getInt("maxNoResidents");
                int currentNumberOfResident = rs.getInt("currentNoResidents");
                int advertisedPrice = rs.getInt("advertisedPrice");
                int status = rs.getInt("status");
                ArrayList<String> images = null; //cho nay em chua biet lam sao :D

//                room = new Room(roomID, hostel, roomNumber, area, images, description, status, maxNumberOfResident, currentNumberOfResident, advertisedPrice);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return room;
    }
    
    public static void main(String args[]) {
        for(Room room: findByHostelID(1)) {
//            System.out.println(room.getArea());
        }
    }
}
