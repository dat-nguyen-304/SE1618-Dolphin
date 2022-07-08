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

            String sql = "Select * from RoomType where hostelID = ? AND activate = 1 ORDER BY advertisedPrice";

            PreparedStatement pst = cn.prepareCall(sql);

            pst.setInt(1, hostelID);

            ResultSet rs = pst.executeQuery();

            while (rs != null && rs.next()) {
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

        } catch (Exception e) {
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

            if (rs != null && rs.next()) {
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

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rt;
    }

    public static boolean save(String name, int price, int area, int maxNumberOfResidents, String description, int hostelId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO RoomType(roomTypeName, roomTypeArea, description, maxNumberOfResidents, advertisedPrice, hostelID) VALUES(?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, area);
                pst.setString(3, description);
                pst.setInt(4, maxNumberOfResidents);
                pst.setInt(5, price);
                pst.setInt(6, hostelId);
                int addSuccess = pst.executeUpdate();
                if (addSuccess > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static RoomType findLastRoomTypeByHostelId(int hostelId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select top 1 * from RoomType where hostelID = ? AND activate = 1 order by roomTypeID desc";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int roomTypeId = rs.getInt("roomTypeID");
                    String roomTypeName = rs.getString("roomTypeName");
                    int roomTypeArea = rs.getInt("roomTypeArea");
                    String description = rs.getString("description");
                    int maxNumberOfResidents = rs.getInt("maxNumberOfResidents");
                    int advertisedPrice = rs.getInt("advertisedPrice");
                    Hostel hostel = HostelDAO.findById(hostelId);
                    ArrayList<String> imgList = getAllImagesById(roomTypeId);
                    cn.close();
                    return new RoomType(roomTypeId, roomTypeName, roomTypeArea, advertisedPrice, maxNumberOfResidents, description, hostel, imgList);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean isExistRoomType(String roomTypeName, int hostelId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT H.hostelID FROM Hostel H INNER JOIN RoomType RT ON H.hostelID = RT.hostelID\n"
                    + "WHERE H.hostelID = ? AND RT.roomTypeName = ? AND RT.activate = 1";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, hostelId);
            pst.setString(2, roomTypeName);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                cn.close();
                return true;
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updateRoomTypeById(int roomTypeId, String name, int price, int area, int maxNumberOfResidents, String description) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "update RoomType \n"
                    + "SET roomTypeName = ?, roomTypeArea = ?, description = ?, maxNumberOfResidents = ?, advertisedPrice = ?\n"
                    + "WHERE roomTypeID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            pst.setInt(2, area);
            pst.setString(3, description);
            pst.setInt(4, maxNumberOfResidents);
            pst.setInt(5, price);
            pst.setInt(6, roomTypeId);
            int rows = pst.executeUpdate();
            if (rows > 0) {
                cn.close();
                return true;
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean deleteById(int roomTypeId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE RoomType SET activate = 0 WHERE roomTypeID = ?";
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

    public static int getCurrentIdentImageRoomType() {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT IDENT_CURRENT('ImageRoomType') AS 'CurImgID'";
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

    public static void main(String args[]) {

    }

    public static boolean removeRoomTypeImg(int roomTypeId, String filePath) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "DELETE FROM ImageRoomType WHERE roomTypeID = ? AND imgLink = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, roomTypeId);
                pst.setString(2, filePath);
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

    public static boolean saveRoomTypeImg(int roomTypeId, String imgLink) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO ImageRoomType(roomTypeID, imgLink) VALUES(?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, roomTypeId);
                pst.setString(2, imgLink);
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

}
