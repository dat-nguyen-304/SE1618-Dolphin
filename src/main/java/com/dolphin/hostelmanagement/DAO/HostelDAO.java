/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.District;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Tenant;
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
                        District district = DistrictDAO.findById(districtID);
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

    public static List<Hostel> findOutstandingHostels() {
        List<Hostel> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select TOP(4) * from Hostel where order by rating desc";
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
                        District district = DistrictDAO.findById(districtID);
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
                        District district = DistrictDAO.findById(districtID);
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

    public static boolean save(String name, int districtId, String streetAddress, String description, int landlordId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Hostel(hostelName, streetAddress, districtID, description, landlordId) VALUES(?, ?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, streetAddress);
                pst.setInt(3, districtId);
                pst.setString(4, description);
                pst.setInt(5, landlordId);
                int rowEffect = pst.executeUpdate();
                if (rowEffect > 0) {
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

    public static List<Hostel> findByName(String name) {
        List<Hostel> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Hostel where hostelName like ? AND activate = 1";
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
                        District district = DistrictDAO.findById(districtID);
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
            String sql = "select * from Hostel where districtID = ? AND activate = 1";
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
                    District district = DistrictDAO.findById(districtID);
                    int availableRoom = rs.getInt("availableRoom");
                    String desc = rs.getString("description");
                    ArrayList<String> imgList = HostelDAO.getAllImagesById(hostelId);
                    hostelList.add(new Hostel(hostelId, streetAddress, district, hostelName, totalRoom,
                            regDate, rating, landlord, activate, minPrice, maxPrice, minArea, maxArea, availableRoom, desc, imgList));
                }
                cn.close();
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
                String sql = "select hostelID from FavoriteHostel where tenantID = ? AND activate = 1";
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

    public static List<Hostel> findByLandlord(int landlordId) {
        List<Hostel> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList<>();
                String sql = "SELECT * FROM Hostel WHERE landlordID = ? AND activate = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, landlordId);
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
                        Landlord landlord = LandlordDAO.findById(landlordId);
                        int minPrice = rs.getInt("minPrice");
                        int maxPrice = rs.getInt("maxPrice");
                        int minArea = rs.getInt("minArea");
                        int maxArea = rs.getInt("maxArea");
                        int districtID = rs.getInt("districtID");
                        District district = DistrictDAO.findById(districtID);
                        int availableRoom = rs.getInt("availableRoom");
                        String desc = rs.getString("description");
                        ArrayList<String> imgList = HostelDAO.getAllImagesById(hostelId);
                        list.add(new Hostel(hostelId, streetAddress, district, hostelName, totalRoom,
                                regDate, rating, landlord, activate, minPrice, maxPrice, minArea, maxArea, availableRoom, desc, imgList));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Hostel> findByLandlordObject(Landlord landlord) {
        List<Hostel> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList<>();
                String sql = "SELECT * FROM Hostel WHERE landlordID = ? AND activate = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, landlord.getAccount().getAccountID());
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
//                    Landlord landlord = LandlordDAO.findById(landlordId);
                        int minPrice = rs.getInt("minPrice");
                        int maxPrice = rs.getInt("maxPrice");
                        int minArea = rs.getInt("minArea");
                        int maxArea = rs.getInt("maxArea");
                        int districtID = rs.getInt("districtID");
                        District district = DistrictDAO.findById(districtID);
                        int availableRoom = rs.getInt("availableRoom");
                        String desc = rs.getString("description");
                        ArrayList<String> imgList = HostelDAO.getAllImagesById(hostelId);
                        list.add(new Hostel(hostelId, streetAddress, district, hostelName, totalRoom,
                                regDate, rating, landlord, activate, minPrice, maxPrice, minArea, maxArea, availableRoom, desc, imgList));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Hostel findLastHostelByHostelId(int landlordId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT TOP 1 * FROM Hostel WHERE landlordId = ? AND activate = 1 ORDER BY hostelID DESC";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, landlordId);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int hostelId = rs.getInt("hostelID");
                    String streetAddress = rs.getString("streetAddress");
                    String hostelName = rs.getString("hostelName");
                    int totalRoom = rs.getInt("totalRoom");
                    Date regDate = rs.getDate("registeredDate");
                    boolean activate = rs.getBoolean("activate");
                    float rating = rs.getFloat("rating");
                    Landlord landlord = LandlordDAO.findById(landlordId);
                    int minPrice = rs.getInt("minPrice");
                    int maxPrice = rs.getInt("maxPrice");
                    int minArea = rs.getInt("minArea");
                    int maxArea = rs.getInt("maxArea");
                    int districtID = rs.getInt("districtID");
                    District district = DistrictDAO.findById(districtID);
                    int availableRoom = rs.getInt("availableRoom");
                    String desc = rs.getString("description");
                    ArrayList<String> imgList = HostelDAO.getAllImagesById(hostelId);
                    return new Hostel(hostelId, streetAddress, district, hostelName, totalRoom, regDate, rating, landlord, activate, minPrice, maxPrice, minArea, maxArea, availableRoom, desc, imgList);
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean isExistHostel(String hostelName, int landlordId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT H.hostelID FROM Landlord L INNER JOIN Hostel H ON L.landlordID = H.landlordId \n"
                        + "WHERE L.landlordID = ? AND H.hostelName = ? AND activate = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, landlordId);
                pst.setString(2, hostelName);
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

    public static boolean updateHostelById(int hostelId, String name, int districtId, String streetAddress, String description) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Hostel \n"
                        + "SET hostelName = ?, districtID = ?, streetAddress = ?,  description = ?\n"
                        + "WHERE hostelID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, districtId);
                pst.setString(3, streetAddress);
                pst.setString(4, description);
                pst.setInt(5, hostelId);
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

    public static void main(String[] args) {
        boolean b = updateHostelById(17, "ABC", 3, "123 LVV", "AHJIH");
        if (b) System.out.println("YES");
        else System.out.println("NO");
    }
}
