/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Ward;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Vu Thien An - SE160296
 */
public class HostelDAO {

    public static List<Hostel> findAll() {
        List<Hostel> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Hostel";
                PreparedStatement pst = cn.prepareCall(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int hostelId = rs.getInt("hostelID");
                        String streetAddress = rs.getString("streetAddress");
                        String hostelName = rs.getString("hostelName");
                        int totalRoom = rs.getInt("totalRoom");
                        Date regDate = rs.getDate("registeredDate");
                        boolean activate = rs.getBoolean("activate");
                        float rating = rs.getFloat("rating");
                        int landlordId = rs.getInt("landlordID");
                        Landlord landlord = LandlordDAO.findById(landlordId);
                        String images = rs.getString("images");
                        int minPrice = rs.getInt("minPrice");
                        int maxPrice = rs.getInt("maxPrice");
                        int minArea = rs.getInt("minArea");
                        int maxArea = rs.getInt("maxArea");
                        int wardId = rs.getInt("wardID");
                        Ward ward = WardDAO.findById(wardId);
                        int availableRoom = rs.getInt("availableRoom");
                        String desc = rs.getString("description");
                        list.add(new Hostel(hostelId, streetAddress, ward, hostelName, totalRoom, regDate, rating, landlord, activate, images, minPrice, maxPrice, minArea, maxArea, availableRoom, desc));
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

    public static Hostel findById(int id) {
        for (Hostel hostel : findAll()) {
            if (hostel.getHostelID() == id) {
                return hostel;
            }
        }
        return null;
    }

    public static boolean save(Hostel t) throws Exception {
        boolean check = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                java.sql.Date sqlRegDate = new java.sql.Date(t.getRegisteredDate().getTime());
                String sql = "insert into Hostel(streetAddress, hostelName, "
                        + "registeredDate, activate, rating, landlordID, "
                        + "wardId) "
                        + "values(?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setString(1, t.getStreetAddress());
                pst.setString(2, t.getHostelName());
                pst.setDate(3, sqlRegDate);
                pst.setBoolean(4, true);
                pst.setFloat(5, t.getRating());
                pst.setInt(6, t.getLandlord().getAccount().getAccountID());
                pst.setInt(7, t.getWard().getWardID());
                check = pst.executeUpdate() != 0;
                if (check) {
                    System.out.println("!!! SAVED hostel");
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
        return check;
    }

    public static List<Hostel> findByName(String name) {
        ArrayList<Hostel> list = new ArrayList();
        for (Hostel hostel : findAll()) {
            if (hostel.getHostelName().contains(name)) {
                list.add(hostel);
            }
        }
        return list;
    }

    public static boolean deleteById(int deleteId) {
        boolean check = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Hostel set activate = ? where hostelID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setBoolean(1, false);
                pst.setInt(2, deleteId);
                check = pst.executeUpdate() != 0;
                if (check) {
                    System.out.println("!!! DEACTIVATED hostelId " + deleteId);
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
        return check;
    }

    public static List<Hostel> findByWard(int wardID) {
        List<Hostel> list = new ArrayList();
        for (Hostel hostel : findAll()) {
            if (hostel.getWard().getWardID() == wardID) {
                list.add(hostel);
            }
        }
        return list;
    }

    public static void main(String[] args) {
    }
}
