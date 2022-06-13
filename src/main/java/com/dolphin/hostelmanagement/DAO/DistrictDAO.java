/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dolphin.hostelmanagement.DAO;
import com.dolphin.hostelmanagement.DTO.Province;
import com.dolphin.hostelmanagement.DTO.District;
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
public class DistrictDAO {
    public static ArrayList<District> findAll() {
        ArrayList<District> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from District";
                PreparedStatement pst = cn.prepareCall(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("districtID");
                        String districtName = rs.getString("districtName");
                        int provinceID = rs.getInt("provinceID");
                        Province province = ProvinceDAO.findById(provinceID);
                        list.add(new District(id, districtName, province));
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return list;
    }
    
    public static District findById(int id) {
        District ward = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from District where districtID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String districtName = rs.getString("districtName");
                        int provinceID = rs.getInt("provinceID");
                        Province province = ProvinceDAO.findById(provinceID);
                        ward = new District(id, districtName, province);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ward;
    }
    
    public static List<District> findByProvinceID(int provinceID) {
        List<District> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from District where provinceID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, provinceID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int districtID = rs.getInt("districtID");
                        String districtName = rs.getString("districtName");
                        Province province = ProvinceDAO.findById(provinceID);
                        list.add(new District(districtID, districtName, province));
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return list;
    }
    
    public static void main(String[] args) {
        List<District> list = findByProvinceID(1);
        for (District district : list) {
            System.out.println(district.getDistrictName());
        }
    }
}
