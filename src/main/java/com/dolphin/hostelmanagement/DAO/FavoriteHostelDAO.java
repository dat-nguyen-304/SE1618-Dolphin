/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Account;
import com.dolphin.hostelmanagement.DTO.FavoriteHostel;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Tenant;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Vu Thien An - SE160296
 */
public class FavoriteHostelDAO {

    public static boolean save(int hostelID, int tenantID) {
        boolean check = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into FavoriteHostel(hostelID, tenantID) values(?, ?)";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, hostelID);
                pst.setInt(2, tenantID);
                check = pst.executeUpdate() != 0;
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

    public static List<Integer> findFavHostelIds(int tenantID) {
        List<Integer> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select hostelID from FavoriteHostel where tenantID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, tenantID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int hostelId = rs.getInt("hostelID");
                        list.add(hostelId);
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

    public static boolean findByHostelTenant(int hostelID, int tenantID) {
        boolean isExist = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from FavoriteHostel where hostelID = ? and tenantID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelID);
                pst.setInt(2, tenantID);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    isExist = true;
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return isExist;
    }

    public static boolean remove(int hostelID, int tenantID) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "delete from FavoriteHostel where hostelID = ? and tenantID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, hostelID);
            pst.setInt(2, tenantID);
            int rows = pst.executeUpdate();
            if (rows > 0) return true;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
    }
}
