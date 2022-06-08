/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Account;
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
public class TenantDAO {

    public static boolean save(Tenant t) {
        boolean tenantCheck = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                boolean accountCheck = AccountDAO.save(t.getAccount());
                if (accountCheck) {
                    String sql = "insert into Tenant(tenantID, fullname, phone, rentStatus) values(?, ?, ?, ?)";
                    PreparedStatement pst = cn.prepareCall(sql);
                    int id = AccountDAO.findIdByUsername(t.getAccount().getUsername());
                    pst.setInt(1, id);
                    pst.setString(2, t.getFullname());
                    pst.setString(3, t.getPhone());
                    pst.setBoolean(4, false);
                    tenantCheck = pst.executeUpdate() != 0;
                    if (tenantCheck) {
                        System.out.println("!!! SAVED tenant");
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
        return tenantCheck;
    }

    public static List<Tenant> findAll() {
        List<Tenant> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Tenant";
                PreparedStatement pst = cn.prepareCall(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("tenantID");
                        String fullname = rs.getString("fullname");
                        String phone = rs.getString("phone");
                        boolean rentStatus = rs.getBoolean("rentStatus");
                        Account acc = AccountDAO.findById(id);
                        list.add(new Tenant(acc, fullname, phone, rentStatus));
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

    public static Tenant findById(int findID) {
        Tenant t = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Tenant where tenantID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, findID);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int id = rs.getInt("tenantID");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    boolean rentStatus = rs.getBoolean("rentStatus");
                    Account acc = AccountDAO.findById(id);
                    t = new Tenant(acc, fullname, phone, rentStatus);
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
        return t;
    }

    public static boolean deleteById(int id) {
        return AccountDAO.deleteById(id);
    }
    
    public static void main(String[] args) {
        System.out.println(findById(3));
    }
}
