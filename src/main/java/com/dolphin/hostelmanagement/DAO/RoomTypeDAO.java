/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.RoomType;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class RoomTypeDAO {
    public static ArrayList<RoomType> findByHostelID(int hostelID) {
        Connection cn = null;
        
        ArrayList<RoomType> roomTypeList = new ArrayList<>();
        
        try {
            cn = DBUtils.makeConnection();
            
            String sql = "Select * from RoomType where hostelID = ? ORDER BY advertisedPrice";
            
            PreparedStatement pst = cn.prepareCall(sql);
            
            pst.setInt(1, hostelID);
            
            ResultSet rs = pst.executeQuery();
            
            while(rs != null && rs.next()) {
                int roomTypeID = rs.getInt("roomTypeID");
                String roomTypeName = rs.getNString("roomTypeName");
                int roomTypeArea = rs.getInt("roomTypeArea");
                String description = rs.getNString("description");
                int maxNumberOfResidents = rs.getInt("maxNumberOfResidents");
                int advertisedPrice = rs.getInt("advertisedPrice");
                Hostel hostel = HostelDAO.findById(hostelID);
                ArrayList<String> imgList = getAllImagesById(roomTypeID);
                
                roomTypeList.add(new RoomType(roomTypeID, roomTypeName, roomTypeArea, advertisedPrice, maxNumberOfResidents, description, hostel, imgList));
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return roomTypeList;
    }
    
    public static ArrayList<String> getAllImagesById(int id) {
        ArrayList<String> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            list = new ArrayList<String>();
            if (cn != null) {
                String sql = "select imgLink from ImageRoomType where roomTypeID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String imgLink = rs.getString("imgLink");
                        list.add(imgLink);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static RoomType findByID(int roomTypeID) { //find a roomType by ID
        Connection cn = null;
        
        RoomType rt = null;
        
        try {
            cn = DBUtils.makeConnection();
            String sql = "Select * from RoomType where roomTypeID = ?";
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, roomTypeID);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs != null && rs.next()) {
                String roomTypeName = rs.getNString("roomTypeName");
                int roomTypeArea = rs.getInt("roomTypeArea");
                String description = rs.getNString("description");
                int maxNumberOfResidents = rs.getInt("maxNumberOfResidents");
                int advertisedPrice = rs.getInt("advertisedPrice");
                int hostelID = rs.getInt("hostelID");
                Hostel hostel = HostelDAO.findById(hostelID);
                ArrayList<String> imgList = getAllImagesById(roomTypeID);
                
                rt = new RoomType(roomTypeID, roomTypeName, roomTypeArea, advertisedPrice, maxNumberOfResidents, description, hostel, imgList);
            
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return rt;
    }   
    
    public static void main(String args[]) {
        for(RoomType rt: findByHostelID(1)) {
            System.out.println(rt.getDescription());
        }
        
        //System.out.println(findByID(1).getDescription());
    }

}
