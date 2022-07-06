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
    
    public static List<Contract> findByLandlord(Landlord landlord) {
        List<Contract> list = new ArrayList();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select contractID, c.roomID, tenantID, startDate, endDate, c.status, rentalFeePerMonth, deposit, createdDate, duration, c.description from Contract c\n"
                        + "join Room r on c.roomID = r.roomID\n"
                        + "join RoomType rt on r.roomTypeID = rt.roomTypeID\n"
                        + "join Hostel h on h.hostelID = rt.hostelID\n"
                        + "join Landlord l on l.landlordID = h.landlordId\n"
                        + "where l.landlordID = ? order by startDate desc";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, landlord.getAccount().getAccountID());
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
                        int duration = rs.getInt("duration");
                        int rentalFee = rs.getInt("rentalFeePerMonth");
                        String description = rs.getString("description");
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
    
    public static boolean save(Contract c) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Insert into Contract(contractID, roomID, tenantID, startDate, endDate, status, "
                    + "rentalFeePerMonth, deposit, description, duration, createdDate)"
                    + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pst = cn.prepareCall(sql);

            pst.setInt(1, c.getContractID());
            pst.setInt(2, c.getRoom().getRoomID());
            pst.setInt(3, c.getTenant().getAccount().getAccountID());

            java.sql.Date sqlStartDate = new java.sql.Date(c.getStartDate().getTime());
            pst.setDate(4, sqlStartDate);

            java.sql.Date sqlEndDate = new java.sql.Date(c.getEndDate().getTime());
            pst.setDate(5, sqlEndDate);

            pst.setInt(6, c.getStatus()); //status = 0 means expired, 1 means in-use, 2 means pending
            pst.setInt(7, c.getRentalFeePerMonth());
            pst.setInt(8, c.getDeposit());
            pst.setNString(9, c.getDescription());
            pst.setInt(10, c.getDuration());
            
            java.sql.Date sqlCreatedDate = new java.sql.Date(c.getCreatedDate().getTime());
            pst.setDate(11, sqlCreatedDate);
            
            System.out.println("This is debug line: " + c.getDescription() + c.getRentalFeePerMonth());
            
            return pst.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public static boolean changeStatus(int contractID, int status) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            String sql = "Update Contract set status = 1 where contractID = ?";

            PreparedStatement pst = cn.prepareCall(sql);
            pst.setInt(1, contractID);

            return pst.executeUpdate() > 0;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean endContractById(int contractId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Contract SET status = 0 WHERE contractID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, contractId);
                int rows = pst.executeUpdate();
                if (rows > 0) {
                    cn.close();
                    return true;
                }
                cn.close();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        List<Contract> contracts = findByRoom(2);
        System.out.println(contracts.size());
    }
}
