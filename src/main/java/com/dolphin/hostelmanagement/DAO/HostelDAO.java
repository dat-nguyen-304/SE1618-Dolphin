/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.District;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Landlord;
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
                        int minPrice = rs.getInt("minPrice");
                        int maxPrice = rs.getInt("maxPrice");
                        int minArea = rs.getInt("minArea");
                        int maxArea = rs.getInt("maxArea");
                        int districtID = rs.getInt("districtID");
                        District district = DistrictDAO.findByID(districtID);
                        int availableRoom = rs.getInt("availableRoom");
                        String desc = rs.getString("description");
                        ArrayList<String> imgList = HostelDAO.getAllImagesById(hostelId);
                        list.add(new Hostel(hostelId, streetAddress, district, hostelName, totalRoom, regDate, rating, landlord, activate, minPrice, maxPrice, minArea, maxArea, availableRoom, desc, imgList));
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
        Hostel hostel = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Hostel where hostelID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
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
                        int minPrice = rs.getInt("minPrice");
                        int maxPrice = rs.getInt("maxPrice");
                        int minArea = rs.getInt("minArea");
                        int maxArea = rs.getInt("maxArea");
                        int districtID = rs.getInt("districtID");
                        District district = DistrictDAO.findByID(id);
                        int availableRoom = rs.getInt("availableRoom");
                        String desc = rs.getString("description");
                        ArrayList<String> imgList = HostelDAO.getAllImagesById(hostelId);
                        hostel = new Hostel(hostelId, streetAddress, district, hostelName, totalRoom, regDate, rating, landlord, activate, minPrice, maxPrice, minArea, maxArea, availableRoom, desc, imgList);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hostel;
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
                        + "districtID) "
                        + "values(?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setString(1, t.getStreetAddress());
                pst.setString(2, t.getHostelName());
                pst.setDate(3, sqlRegDate);
                pst.setBoolean(4, true);
                pst.setFloat(5, t.getRating());
                pst.setInt(6, t.getLandlord().getAccount().getAccountID());
                pst.setInt(7, t.getDistrict().getDistrictID());
                check = pst.executeUpdate() != 0;
                if (check) {
                    System.out.println("!!! SAVED hostel");
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public static List<Hostel> findByName(String name) {
        List<Hostel> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Hostel where hostelName like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + name + "%");
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
                        int minPrice = rs.getInt("minPrice");
                        int maxPrice = rs.getInt("maxPrice");
                        int minArea = rs.getInt("minArea");
                        int maxArea = rs.getInt("maxArea");
                        int districtID = rs.getInt("districtID");
                        District district = DistrictDAO.findByID(districtID);
                        int availableRoom = rs.getInt("availableRoom");
                        String desc = rs.getString("description");
                        ArrayList<String> imgList = HostelDAO.getAllImagesById(hostelId);
                        list.add(new Hostel(hostelId, streetAddress, district, hostelName, totalRoom, regDate, rating, landlord, activate, minPrice, maxPrice, minArea, maxArea, availableRoom, desc, imgList));
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<String> getAllImagesById(int id) {
        ArrayList<String> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            list = new ArrayList<String>();
            if (cn != null) {
                String sql = "select imgLink from ImageHostel where hostelID = ?";
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

    public static List<Hostel> findByDistrict(int wardID) {
        List<Hostel> hostelList = new ArrayList();

        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            String sql = "select * from Hostel where districtID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, wardID);
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
                    int minPrice = rs.getInt("minPrice");
                    int maxPrice = rs.getInt("maxPrice");
                    int minArea = rs.getInt("minArea");
                    int maxArea = rs.getInt("maxArea");
                    int districtID = rs.getInt("districtID");
                    District district = DistrictDAO.findByID(districtID);
                    int availableRoom = rs.getInt("availableRoom");
                    String desc = rs.getString("description");
                    ArrayList<String> imgList = HostelDAO.getAllImagesById(hostelId);
                    hostelList.add(new Hostel(hostelId, streetAddress, district, hostelName, totalRoom, 
                            regDate, rating, landlord, activate, minPrice, maxPrice, minArea, maxArea, availableRoom, desc, imgList));
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return hostelList;
    }

    public static List<Hostel> findFavoriteList(int tenantID) {
        List<Hostel> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select hostelID from FavoriteHostel where tenantID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, tenantID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int hostelID = rs.getInt("hostelID");
                        list.add(findById(hostelID));
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateRating(int hostelId, float newHostelRating) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update hostel set rating = ? where hostelID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setFloat(1, newHostelRating);
                pst.setInt(2, hostelId);
                int rows = pst.executeUpdate();
                if (rows > 0) {
                    return true;
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static int findLandlordID(int hostelID) {
        Connection cn = null;
        
        int landlordID = -1;
        
        try {
            cn = DBUtils.makeConnection();
            String sql = "Select landlordId from Hostel where hostelID = ?";
            PreparedStatement pst = cn.prepareCall(sql);
            
            pst.setInt(1, hostelID);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs != null && rs.next()) landlordID = rs.getInt("landlordId");
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return landlordID;
    }

    public static void main(String[] args) {
        System.out.println(findLandlordID(3));
    }
}
