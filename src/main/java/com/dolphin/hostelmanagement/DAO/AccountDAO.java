/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Account;
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
public class AccountDAO {

    public static List<Account> findAll() {
        List<Account> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select * from Account";
                PreparedStatement pst = cn.prepareCall(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("accountId");
                        String username = rs.getString("username");
                        String password = rs.getString("password");
                        String email = rs.getString("email");
                        Date regDate = rs.getDate("registeredDate");
                        int role = rs.getInt("role");
                        boolean activate = rs.getBoolean("activate");
                        list.add(new Account(id, username, password, email, regDate, role, activate));
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

    public static Account findById(int id) {
        for (Account account : findAll())
            if (account.getAccountID() == id) 
                return account;
        return null;
    }
    
    public static Account findByEmail(String email) {
        for (Account account : findAll())
            if (account.getEmail().compareToIgnoreCase(email) == 0)
                return account;
        return null;
    }

    public static boolean checkUsername(String username) {
        boolean check = false;
        for (Account account : findAll()) {
            if (username.equals(account.getUsername())) {
                check = true;
                break;
            }
        }
        return check;
    }

    public static boolean checkEmail(String email) {
        boolean check = false;
        for (Account account : findAll()) {
            if (email.equals(account.getEmail())) {
                check = true;
                break;
            }
        }
        return check;
    }

    public static boolean save(Account t) throws Exception {
        boolean check = false;
        Connection cn = null;
        cn = DBUtils.makeConnection();
        if (cn != null) {
            java.sql.Date sqlRegDate = new java.sql.Date(t.getRegistrationDate().getTime());
            String sql = "insert into Account(username, password, email, registeredDate, role, activate) values(?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setString(1, t.getUsername());
            pst.setString(2, t.getPassword());
            pst.setString(3, t.getEmail());
            pst.setDate(4, sqlRegDate);
            pst.setInt(5, t.getRole());
            pst.setBoolean(6, true);
            check = pst.executeUpdate() != 0;
            if (check) {
                System.out.println("!!! SAVED account");
            }
        }
        return check;
    }

    public static int findIdByUsername(String username) {
        int id = -1;
        for (Account account : findAll()) {
            if (username.equals(account.getUsername())) {
                id = account.getAccountID();
            }
        }
        return id;
    }

    public static boolean deleteById(int deleteId) {
        boolean check = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Account set activate = ? where accountId = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setBoolean(1, false);
                pst.setInt(2, deleteId);
                check = pst.executeUpdate() != 0;
                if (check) {
                    System.out.println("!!! DEACTIVATED accountId " + deleteId);
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

    public static boolean updateAccount(Account t) {
        boolean check = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Account set password = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setString(1, t.getPassword());
                check = pst.executeUpdate() != 0;
                if (check) {
                    System.out.println("!!! Updated password account id " + t.getAccountID());
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

    public static boolean changePassword(int changeId, String newPassword) {
        boolean check = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Account set password = ? where accountID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setString(1, newPassword);
                pst.setInt(2, changeId);
                check = pst.executeUpdate() != 0;
                if (check) {
                    System.out.println("!!! Changed password of accountID " + changeId);
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

    public static Account login(String username, String password) {
        Account t = null;
        for (Account account : findAll()) {
            if (username.equals(account.getUsername()) && password.equals(account.getPassword())) {
                t = account;
                break;
            }
        }
        return t;
    }
}
