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
import java.util.ArrayList;
import java.util.Date;

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
            
            String sql = "Select * from RoomResident where roomID = ?";
            PreparedStatement pst = cn.prepareCall(sql);
            
            pst.setInt(1, r.getRoomID());
            
            ResultSet rs = pst.executeQuery();
            
            while(rs != null && rs.next()) {
                int roomResidentID = rs.getInt("roomResidentID");
                String fullname = rs.getNString("fullname");
                String phone = rs.getString("phone");
                Date dob = rs.getDate("dob");
                boolean isRoomLead = rs.getBoolean("isRoomLead");
                
                arr.add(new RoomResident(roomResidentID, r, fullname, phone, dob, isRoomLead));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        return arr;
    }
    
    public static void main(String args[]) {
        Room r = new Room();
        r.setRoomID(2);
        
        for(RoomResident rr: findByRoom(r)) {
            System.out.println(rr.getFullname());
        }
    }
}
