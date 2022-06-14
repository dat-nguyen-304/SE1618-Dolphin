/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

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
    public static List<District> findAll() {
        List<District> list = null;
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
                        String districtName = rs.getNString("districtName");
                        int provinceID = rs.getInt("provinceID");
                        list.add(new District(id, districtName, provinceID));
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
    
    public static District findByID(int id) {
        District d = null;
        Connection cn = null;
        
        try {
            cn = DBUtils.makeConnection();
            String sql = "Select * from District where districtID = ?";
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs != null && rs.next()) {
                String districtName = rs.getNString("districtName");
                int provinceID = rs.getInt("provinceID");
                
                d = new District(id, districtName, provinceID);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return d;
    }
    
    public static void main(String[] args) {
        /*for (District district : findAll()) {
            System.out.println(district.getDistrictName());
        }*/
        for(int i = 1;i <= 10;++i) {
            System.out.println(findByID(i).getDistrictName());
        }
        
    }
}
