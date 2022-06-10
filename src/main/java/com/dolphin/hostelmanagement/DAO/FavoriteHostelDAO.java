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
                String sql = "insert into FavoriteHostel(hostelID, tenantID, activate) values(?, ?, ?)";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, hostelID);
                pst.setInt(2, tenantID);
                pst.setBoolean(3, true);
                check = pst.executeUpdate() != 0;
                if (check) {
                    System.out.println("!!! SAVED FavoriteHostel");
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

    public static List<FavoriteHostel> findByTenant(Tenant t) {
        List<FavoriteHostel> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from FavoriteHostel where tenantID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, t.getAccount().getAccountID());
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("favoriteHostelID");
                        int hostelID = rs.getInt("hostelID");
                        Hostel hostel = HostelDAO.findById(hostelID);
                        Tenant tenant = t;
                        boolean activate = rs.getBoolean("activate");
                        list.add(new FavoriteHostel(id, hostel, tenant, activate));
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

    public static FavoriteHostel findByHostelTenant(int hostelID, Tenant tenant) {
        FavoriteHostel t = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from FavoriteHostel where hostelID = ? and tenantID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, hostelID);
                pst.setInt(2, tenant.getAccount().getAccountID());
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    t = new FavoriteHostel(rs.getInt("favoriteHostelID"), HostelDAO.findById(hostelID), tenant, rs.getBoolean("activate"));
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

    public static boolean toggleFavoriteHostel(int hostelID, Tenant tenant) {
        FavoriteHostel favHostel = findByHostelTenant(hostelID, tenant);
        if (favHostel != null) {
            boolean check = false;
            Connection cn = null;
            try {
                cn = DBUtils.makeConnection();
                if (cn != null) {
                    String sql = "update FavoriteHostel set activate = ? where favoriteHostelID = ?";
                    PreparedStatement pst = cn.prepareCall(sql);
                    if (favHostel.isActivate()) {
                        pst.setBoolean(1, false);
                    } else {
                        pst.setBoolean(1, true);
                    }
                    pst.setInt(2, favHostel.getFavoriteHostelID());
                    check = pst.executeUpdate() != 0;
                    if (check) {
                        System.out.println("!!! TOGGLED FavoriteHostel hostelID=" + hostelID + " tenantID=" + tenant.getAccount().getAccountID());
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
        return false;
    }

    public static void main(String[] args) {
        Account acc = AccountDAO.findById(3);
        Tenant t = TenantDAO.findByAccount(acc);
        System.out.println(findByHostelTenant(1, t));
//        System.out.println(toggleFavoriteHostel(1, 3));
    }
}
