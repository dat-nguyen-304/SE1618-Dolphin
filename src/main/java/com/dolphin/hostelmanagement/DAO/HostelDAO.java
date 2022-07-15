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
    
    public static List<Hostel> findAllActive() {
        List<Hostel> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Hostel where activate = 1 and availableRoom > 0";
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

    public static boolean updateMinArea(int hostelId, int area) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Hostel SET minArea = ? WHERE HostelID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, area);
                pst.setInt(2, hostelId);
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
    
     public static boolean updateMaxArea(int hostelId, int area) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Hostel SET maxArea = ? WHERE HostelID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, area);
                pst.setInt(2, hostelId);
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
    
     public static boolean updateMinPrice(int hostelId, int price) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Hostel SET minPrice = ? WHERE HostelID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, price);
                pst.setInt(2, hostelId);
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
    
     public static boolean updateMaxPrice(int hostelId, int price) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Hostel SET maxPrice = ? WHERE HostelID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, price);
                pst.setInt(2, hostelId);
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
     
    public static List<Hostel> findOutstandingHostels() {
        List<Hostel> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select TOP(4) * from Hostel where activate = 1 order by rating desc";
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
                String sql = "update Hostel set activate = 0 where hostelID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, deleteId);
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

    public static void updateStatus(int hostelID, boolean activate) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Update Hostel set activate = ? where hostelID = ?";

            PreparedStatement pst = cn.prepareCall(sql);

            pst.setBoolean(1, activate);
            pst.setInt(2, hostelID);

            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean saveHostelImg(int hostelId, String imgUrl) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO ImageHostel(hostelId, imgLink) VALUES(?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                pst.setString(2, imgUrl);
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

    public static boolean removeHostelImg(int hostelId, String imgURL) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "DELETE FROM ImageHostel WHERE hostelId = ? AND imgLink = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                pst.setString(2, imgURL);
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

    public static int getCurrentIdentImageHostel() {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT IDENT_CURRENT('ImageHostel') AS 'CurImgID'";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int curImgId = rs.getInt("CurImgID");
                    return curImgId;
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public static boolean updateTotalRoom(int hostelId, int quantity) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Hostel SET totalRoom = (SELECT totalRoom FROM Hostel WHERE hostelID = ?) + ? WHERE HostelID = ?";  
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                pst.setInt(2, quantity);
                pst.setInt(3, hostelId);
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
    
    public static boolean updateAvailableRoom(int hostelId, int quantity) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Hostel SET availableRoom = (SELECT availableRoom FROM Hostel WHERE hostelID = ?) + ? WHERE HostelID = ?";  
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                pst.setInt(2, quantity);
                pst.setInt(3, hostelId);
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
        //save(String name, int districtId, String streetAddress, String description, int landlordId)
        
        save("Cô Đệ", 83, "A24 Cống Quỳnh", "Thiết kế đẹp thoáng mát, sang trọng "
                + "với các căn hộ thiết kế 1 phòng khách + 2 phòng ngủ và phòng thông studio phù hợp với hộ gia đình, người đi làm.", 21);
    }
}