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
                        int id = rs.getInt("accountID");
                        String username = rs.getString("username");
                        String password = rs.getString("password");
                        String email = rs.getString("email");
                        Date regDate = rs.getDate("registeredDate");
                        int role = rs.getInt("role");
                        boolean activate = rs.getBoolean("activate");
                        String avatar = rs.getString("avatar");
                        list.add(new Account(id, username, password, email, regDate, role, activate, avatar));
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

    public static Account findById(int findID) {
        Account t = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Account where accountID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, findID);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("accountID");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    Date regDate = rs.getDate("registeredDate");
                    int role = rs.getInt("role");
                    boolean activate = rs.getBoolean("activate");
                    String avatar = rs.getString("avatar");
                    t = new Account(id, username, password, email, regDate, role, activate, avatar);
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

    public static Account findByEmail(String email) {
        Connection cn = null;
        Account acc = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from Account where email = ?";
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setString(1, email);

            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int id = rs.getInt("accountID");
                String username = rs.getString("username");
                String password = rs.getString("password");
                Date regDate = rs.getDate("registeredDate");
                int role = rs.getInt("role");
                boolean activate = rs.getBoolean("activate");
                String avatar = rs.getString("avatar");
                acc = new Account(id, username, password, email, regDate, role, activate, avatar);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

    public static boolean checkUsername(String username) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from Account where username = ?";
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setString(1, username);

            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean checkEmail(String email) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from Account where email = ?";
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setString(1, email);

            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
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
            pst.setBoolean(6, t.isActivate());
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
                String sql = "update Account set activate = ? where accountID = ?";
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

    public static boolean updateAccount(Account a) {
        boolean check = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Account set email = ? where accountID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setString(1, a.getEmail());
                pst.setInt(2, a.getAccountID());
                check = pst.executeUpdate() != 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public static Account loginByEmail(String inputEmail, String inputPassword) {
        Account acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Account where email = ? and password = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setString(1, inputEmail);
                pst.setString(2, inputPassword);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("accountID");
                        String username = rs.getString("username");
                        String password = rs.getString("password");
                        String email = rs.getString("email");
                        Date regDate = rs.getDate("registeredDate");
                        int role = rs.getInt("role");
                        boolean activate = rs.getBoolean("activate");
                        String avatar = rs.getString("avatar");
                        acc = new Account(id, username, password, email, regDate, role, activate, avatar);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

    public static Account login(String inputUsername, String inputPassword) {
        Account acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Account where username = ? and password = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setString(1, inputUsername);
                pst.setString(2, inputPassword);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("accountID");
                        String username = rs.getString("username");
                        String password = rs.getString("password");
                        String email = rs.getString("email");
                        Date regDate = rs.getDate("registeredDate");
                        int role = rs.getInt("role");
                        boolean activate = rs.getBoolean("activate");
                        String avatar = rs.getString("avatar");
                        acc = new Account(id, username, password, email, regDate, role, activate, avatar);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }
    public static boolean saveUserImgURL(String URL, int accountID) {
        boolean check = false;
        Connection cn = null;
        try {
            Account acc = findById(accountID);
            acc.setAvatar(URL);
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Account SET avatar = ? WHERE accountID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, URL);
                pst.setInt(2, accountID);
                check = pst.executeUpdate() != 0;
                if (check) {
                    System.out.println("!!! Update avatar of accountID " + accountID);
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
    
    public static boolean saveGoogleAccount(int googleID, String googleToken) {
        Connection cn = null;
        
        try {
            cn = DBUtils.makeConnection();
            
            String sql = "Insert into GoogleAccount (googleID, googleToken) values (?, ?)";
            
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, googleID);
            pst.setString(2, googleToken);
            
            boolean check = pst.executeUpdate() > 0;
            
            return check;
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        
        return true;
    }
    
    public static String findGoogleToken(int googleID) {
        Connection cn = null;
        
        try {
            cn = DBUtils.makeConnection();
            
            String sql = "Select * from GoogleAccount where googleID = ?";
            
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, googleID);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs != null && rs.next()) return rs.getString("googleToken");
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    public static boolean changeStatus(int accountID, boolean status) {
        Connection cn = null;
        
        try {
            cn = DBUtils.makeConnection();
            
            String sql = "Update Account set activate = ? where accountID = ?";
            
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setBoolean(1, status);
            pst.setInt(2, accountID);
            
            return pst.executeUpdate() != 0;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void updateVerificationCode(String email, String verificationCode) {
        Connection cn = null;
        
        try {
            cn = DBUtils.makeConnection();
            
            String sql = "Update Account set verificationCode = ? where email = ?";
            
            PreparedStatement pst = cn.prepareCall(sql);
            
            pst.setString(1, verificationCode);
            pst.setString(2, email);
            
            pst.executeUpdate();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public static String getVerificationCode(String email) {
        Connection cn = null;
        
        try {
            cn = DBUtils.makeConnection();
            
            String sql = "Select verificationCode from Account where email = ?";
            
            PreparedStatement pst = cn.prepareCall(sql);
            
            pst.setString(1, email);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs != null && rs.next())
                return rs.getString("verificationCode");
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    

    public static void main(String[] args) {
        //saveGoogleAccount(3, "hiohiahha");
        updateVerificationCode("dasdassda@gmail.com", null);
    }

}
