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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class RoomDAO {

    public static ArrayList<Room> findRoomByHostelID(int inputHostelID) {
        ArrayList<Room> arr = new ArrayList<>();

        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from Room where hostelID = ? order by area, advertisedPrice";

            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, inputHostelID);

            ResultSet rs = pst.executeQuery();

            while (rs != null && rs.next()) {
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

                arr.add(new Room(roomID, hostel, roomNumber, area, images, description, status, maxNumberOfResident, currentNumberOfResident, advertisedPrice));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return arr;
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

                room = new Room(roomID, hostel, roomNumber, area, images, description, status, maxNumberOfResident, currentNumberOfResident, advertisedPrice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return room;
    }
}
