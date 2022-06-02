/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Account;
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
public class LandlordDAO {

    public static boolean save(Landlord l) {
        boolean check = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                boolean accountCheck = AccountDAO.save(l.getAccount());
                if (accountCheck) {
                    String sql = "insert into Landlord(landlordId, fullname, phone) values(?, ?, ?)";
                    PreparedStatement pst = cn.prepareCall(sql);
                    int id = AccountDAO.findIdByUsername(l.getAccount().getUsername());
                    pst.setInt(1, id);
                    pst.setString(2, l.getFullname());
                    pst.setString(3, l.getPhone());
                    check = pst.executeUpdate() != 0;
                    if (check == true) {
                        System.out.println("!!! SAVED landlord id");
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
        return check;
    }

    public static List<Landlord> findAll() {
        List<Landlord> list = null;
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
                        int id = rs.getInt("landlordId");
                        String fullname = rs.getString("fullname");
                        String email = rs.getString("email");
                        String phone = rs.getString("phone");
                        Account acc = AccountDAO.findById(id);
                        list.add(new Landlord(acc, fullname, phone));
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

    public static Landlord findById(int id) {
        Landlord t = null;
        for (Landlord landlord : findAll()) {
            if (landlord.getAccount().getAccountID()== id) {
                t = landlord;
            }
        }
        return t;
    }
    
    public static boolean deleteById(int id) {
        return AccountDAO.deleteById(id);
    }
}
