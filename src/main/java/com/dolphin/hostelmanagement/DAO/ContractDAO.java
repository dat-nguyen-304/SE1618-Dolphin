/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.Tenant;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ContractDAO {

    public static Contract findByID(int id) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "Select * from Contract where contractID = ?";
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int contractID = rs.getInt("contractID");
                Room room = RoomDAO.findByID(rs.getInt("roomID"));
                Tenant tenant = TenantDAO.findById(rs.getInt("tenantID"));
                Landlord landlord = room.getRoomType().getHostel().getLandlord();
                Hostel hostel = room.getRoomType().getHostel();
                Date startDate = rs.getDate("startDate");
                Date endDate = rs.getDate("endDate");
                int deposit = rs.getInt("deposit");
                int status = rs.getInt("status");
                int rentalFee = rs.getInt("rentalFeePerMonth");
                String description = rs.getString("description");
                int duration = rs.getInt("duration");
                Date createdDate = rs.getDate("createdDate");
                return new Contract(contractID, room, tenant, landlord, hostel, startDate, endDate, deposit, status, rentalFee, description, duration, createdDate);
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
        return null;
    }

    public static Contract findActiveContractByTenant(Tenant tenant) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "Select * from Contract where tenantID = ? and status = 1";
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, tenant.getAccount().getAccountID());
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int contractID = rs.getInt("contractID");
                Room room = RoomDAO.findByID(rs.getInt("roomID"));
                Hostel hostel = room.getRoomType().getHostel();
                Date startDate = rs.getDate("startDate");
                Date endDate = rs.getDate("endDate");
                int deposit = rs.getInt("deposit");
                int status = rs.getInt("status");
                int rentalFee = rs.getInt("rentalFeePerMonth");
                Landlord landlord = room.getRoomType().getHostel().getLandlord();
                String description = rs.getString("description");
                int duration = rs.getInt("duration");
                Date createdDate = rs.getDate("createdDate");
                return new Contract(contractID, room, tenant, landlord, hostel, startDate, endDate, deposit, status, rentalFee, description, duration, createdDate);
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
        return null;
    }

    public static Contract findActiveContractByRoomID(int roomId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "Select * from Contract where roomID = ? and status = 1";
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, roomId);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int contractID = rs.getInt("contractID");
                Room room = RoomDAO.findByID(roomId);
                int tenantID = rs.getInt("tenantID");
                Tenant tenant = TenantDAO.findById(tenantID);
                Hostel hostel = room.getRoomType().getHostel();
                Date startDate = rs.getDate("startDate");
                Date endDate = rs.getDate("endDate");
                int deposit = rs.getInt("deposit");
                int status = rs.getInt("status");
                int rentalFee = rs.getInt("rentalFeePerMonth");
                Landlord landlord = room.getRoomType().getHostel().getLandlord();
                String description = rs.getString("description");
                int duration = rs.getInt("duration");
                Date createdDate = rs.getDate("createdDate");
                return new Contract(contractID, room, tenant, landlord, hostel, startDate, endDate, deposit, status, rentalFee, description, duration, createdDate);
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
        return null;
    }

    public static List<Contract> findByTenant(Tenant tenant) {
        List<Contract> list = new ArrayList();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Select * from Contract where tenantID = ? order by startDate desc";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, tenant.getAccount().getAccountID());
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int contractID = rs.getInt("contractID");
                        Room room = RoomDAO.findByID(rs.getInt("roomID"));
                        Hostel hostel = room.getRoomType().getHostel();
                        Date startDate = rs.getDate("startDate");
                        Date endDate = rs.getDate("endDate");
                        int deposit = rs.getInt("deposit");
                        int status = rs.getInt("status");
                        int rentalFee = rs.getInt("rentalFeePerMonth");
                        Landlord landlord = hostel.getLandlord();
                        String description = rs.getString("description");
                        int duration = rs.getInt("duration");
                        Date createdDate = rs.getDate("createdDate");
                        list.add(new Contract(contractID, room, tenant, landlord, hostel, startDate, endDate, deposit, status, rentalFee, description, duration, createdDate));
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

    public static List<Contract> findByHostel(int hostelId) {
        List<Contract> list = new ArrayList();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM Contract";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int contractID = rs.getInt("contractID");
                        Room room = RoomDAO.findByID(rs.getInt("roomID"));
                        Tenant tenant = TenantDAO.findById(rs.getInt("tenantID"));
                        Hostel hostel = room.getRoomType().getHostel();
                        if (hostel.getHostelID() == hostelId) {
                            Landlord landlord = hostel.getLandlord();
                            Date startDate = rs.getDate("startDate");
                            Date endDate = rs.getDate("endDate");
                            int deposit = rs.getInt("deposit");
                            int status = rs.getInt("status");
                            int rentalFee = rs.getInt("rentalFeePerMonth");
                            String description = rs.getString("description");
                            int duration = rs.getInt("duration");
                            Date createdDate = rs.getDate("createdDate");
                            list.add(new Contract(contractID, room, tenant, landlord, hostel, startDate, endDate, deposit, status, rentalFee, description, duration, createdDate));
                        }
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

    public static List<Contract> findByRoom(int roomId) {
        List<Contract> list = new ArrayList();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM Contract";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int contractID = rs.getInt("contractID");
                        Room room = RoomDAO.findByID(rs.getInt("roomID"));
                        if (room.getRoomID() == roomId) {
                            Tenant tenant = TenantDAO.findById(rs.getInt("tenantID"));
                            Hostel hostel = room.getRoomType().getHostel();
                            Landlord landlord = hostel.getLandlord();
                            Date startDate = rs.getDate("startDate");
                            Date endDate = rs.getDate("endDate");
                            int deposit = rs.getInt("deposit");
                            int status = rs.getInt("status");
                            int rentalFee = rs.getInt("rentalFeePerMonth");
                            String description = rs.getString("description");
                            int duration = rs.getInt("duration");
                            Date createdDate = rs.getDate("createdDate");
                            list.add(new Contract(contractID, room, tenant, landlord, hostel, startDate, endDate, deposit, status, rentalFee, description, duration, createdDate));
                        }
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
        Contract contract = findActiveContractByRoomID(4);
        System.out.println(contract);
    }
}
