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
                return new Contract(contractID, room, tenant, landlord, hostel, startDate, endDate, deposit, status, rentalFee);
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

    public static Contract findActiveContract(Tenant t) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "Select * from Contract where tenantID = ? and status = 1";
            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, t.getAccount().getAccountID());
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
                return new Contract(contractID, room, t, landlord, hostel, startDate, endDate, deposit, status, rentalFee);
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

    public static List<Contract> findByTenant(Tenant t) {
        List<Contract> list = new ArrayList();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Select * from Contract where tenantID = ? order by startDate desc";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, t.getAccount().getAccountID());
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
                        Landlord landlord = room.getRoomType().getHostel().getLandlord();
                        list.add(new Contract(contractID, room, t, landlord, hostel, startDate, endDate, deposit, status, rentalFee));
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

    public static List<Contract> findByLandlord(Landlord l) {
        List<Contract> list = new ArrayList();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select contractID, c.roomID, tenantID, startDate, endDate, c.status, rentalFeePerMonth, deposit from Contract c\n"
                        + "join Room r on c.roomID = r.roomID\n"
                        + "join RoomType rt on r.roomTypeID = rt.roomTypeID\n"
                        + "join Hostel h on h.hostelID = rt.hostelID\n"
                        + "join Landlord l on l.landlordID = h.landlordId\n"
                        + "where l.landlordID = ? order by startDate desc";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, l.getAccount().getAccountID());
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int contractID = rs.getInt("contractID");
                        Room room = RoomDAO.findByID(rs.getInt("roomID"));
                        Tenant tenant = TenantDAO.findById(rs.getInt("tenantID"));
                        Hostel hostel = room.getRoomType().getHostel();
                        Date startDate = rs.getDate("startDate");
                        Date endDate = rs.getDate("endDate");
                        int deposit = rs.getInt("deposit");
                        int status = rs.getInt("status");
                        int rentalFee = rs.getInt("rentalFeePerMonth");
                        list.add(new Contract(contractID, room, tenant, l, hostel, startDate, endDate, deposit, status, rentalFee));
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
//        System.out.println(findActiveContract(TenantDAO.findById(3)));
        for (Contract contract : findByLandlord(LandlordDAO.findById(4))) {
            System.out.println(contract);
        }
    }
}
