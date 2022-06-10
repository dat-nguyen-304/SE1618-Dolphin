/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dolphin.hostelmanagement.DAO;
import com.dolphin.hostelmanagement.DTO.District;
import com.dolphin.hostelmanagement.DTO.Ward;
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
public class WardDAO {
    public static ArrayList<Ward> findAll() {
        ArrayList<Ward> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Ward";
                PreparedStatement pst = cn.prepareCall(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("wardID");
                        String name = rs.getString("wardName");
                        int districtId = rs.getInt("districtID");
                        District district = DistrictDAO.findById(districtId);
                        list.add(new Ward(id, name, district));
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
    
    public static Ward findById(int id) {
        Ward ward = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Ward where wardID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String name = rs.getString("wardName");
                        int districtId = rs.getInt("districtID");
                        District district = DistrictDAO.findById(districtId);
                        ward = new Ward(id, name, district);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ward;
    }
    
    public static List<Ward> findByDistrictID(int districtID) {
        List<Ward> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Ward where districtID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, districtID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("wardID");
                        String name = rs.getString("wardName");
                        int districtId = rs.getInt("districtID");
                        District district = DistrictDAO.findById(districtId);
                        list.add(new Ward(id, name, district));
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
    
    public static void main(String[] args) {
        ArrayList<Ward> list = findAll();
        for (Ward ward : list) {
            System.out.println(ward);
        }
    }
}
