/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.Invoice;
import com.dolphin.hostelmanagement.DTO.ServiceDetail;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class InvoiceDAO {

    private static SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
    private static SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");

    public static List<Invoice> findByContract(int contractId) {
        List<Invoice> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Invoice where contractID = ? ORDER BY createdDate DESC";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, contractId);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    list = new ArrayList();
                    while (rs.next()) {
                        int invoiceID = rs.getInt("invoiceID");
                        Contract contract = ContractDAO.findByID(contractId);
                        Date startDate = rs.getDate("startDate");
                        Date endDate = rs.getDate("endDate");
                        Date createdDate = rs.getDate("createdDate");
                        int status = rs.getInt("status");
                        int totalPrice = rs.getInt("totalPrice");
                        String month = rs.getString("month");
                        int electricPrice = rs.getInt("electricPrice");
                        int waterPrice = rs.getInt("waterPrice");
                        list.add(new Invoice(invoiceID, contract, startDate, endDate, createdDate, status, totalPrice, month, electricPrice, waterPrice));
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

    public static List<Invoice> findByHostelID(int hostelId) {
        List<Invoice> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Invoice ORDER BY createdDate DESC";
                PreparedStatement pst = cn.prepareCall(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    list = new ArrayList();
                    while (rs.next()) {
                        int invoiceID = rs.getInt("invoiceID");
                        int contractId = rs.getInt("contractID");
                        Contract contract = ContractDAO.findByID(contractId);
                        if (contract.getHostel().getHostelID() == hostelId) {
                            Date startDate = rs.getDate("startDate");
                            Date endDate = rs.getDate("endDate");
                            Date createdDate = rs.getDate("createdDate");
                            int status = rs.getInt("status");
                            int totalPrice = rs.getInt("totalPrice");
                            String month = rs.getString("month");
                            int electricPrice = rs.getInt("electricPrice");
                            int waterPrice = rs.getInt("waterPrice");
                            list.add(new Invoice(invoiceID, contract, startDate, endDate, createdDate, status, totalPrice, month, electricPrice, waterPrice));
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

    public static List<Invoice> findByRoomID(int roomId) {
        List<Invoice> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Invoice ORDER BY createdDate DESC";
                PreparedStatement pst = cn.prepareCall(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    list = new ArrayList();
                    while (rs.next()) {
                        int invoiceID = rs.getInt("invoiceID");
                        int contractId = rs.getInt("contractID");
                        Contract contract = ContractDAO.findByID(contractId);
                        if (contract.getRoom().getRoomID() == roomId) {
                            Date startDate = rs.getDate("startDate");
                            Date endDate = rs.getDate("endDate");
                            Date createdDate = rs.getDate("createdDate");
                            int status = rs.getInt("status");
                            int totalPrice = rs.getInt("totalPrice");
                            String month = rs.getString("month");
                            int electricPrice = rs.getInt("electricPrice");
                            int waterPrice = rs.getInt("waterPrice");
                            list.add(new Invoice(invoiceID, contract, startDate, endDate, createdDate, status, totalPrice, month, electricPrice, waterPrice));
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

    public static Invoice findLatestByContract(Contract c) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select top 1 * from Invoice where contractID = ? order by startDate desc";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, c.getContractID());
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int invoiceID = rs.getInt("invoiceID");
                        Date startDate = rs.getDate("startDate");
                        Date endDate = rs.getDate("endDate");
                        Date createdDate = rs.getDate("createdDate");
                        int status = rs.getInt("status");
                        int totalPrice = rs.getInt("totalPrice");
                        int waterPrice = rs.getInt("waterPrice");
                        int electricPrice = rs.getInt("electricPrice");
                        return new Invoice(invoiceID, c, startDate, endDate, createdDate, status, totalPrice, sql, electricPrice, waterPrice);
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
        return null;
    }

    public static Invoice findByID(int id) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Invoice where invoiceID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int invoiceID = rs.getInt("invoiceID");
                    Date startDate = rs.getDate("startDate");
                    Date endDate = rs.getDate("endDate");
                    Date createdDate = rs.getDate("createdDate");
                    int status = rs.getInt("status");
                    int totalPrice = rs.getInt("totalPrice");
                    int contractID = rs.getInt("contractID");
                    String month = rs.getString("month");
                    Contract contract = ContractDAO.findByID(contractID);
                    int electricPrice = rs.getInt("electricPrice");
                    int waterPrice = rs.getInt("waterPrice");
                    return new Invoice(invoiceID, contract, startDate, endDate, createdDate, status, totalPrice, month, electricPrice, waterPrice);
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
        return null;
    }

    public static boolean save(String startDate, String endDate, int totalPrice,
            int contractID, String month, java.util.Date createdDate, int electricPrice, int waterPrice, List<ServiceDetail> detailList, int roomID) {
        boolean check = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int invoiceID = 0;
                cn.setAutoCommit(false);
                String sql = "insert into Invoice(startDate, endDate, status, "
                        + "totalPrice, contractID, month, createdDate, electricPrice, waterPrice) "
                        + "values(?, ?, 1, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setDate(1, new java.sql.Date(df.parse(startDate).getTime()));
                pst.setDate(2, new java.sql.Date(df.parse(endDate).getTime()));
                pst.setInt(3, totalPrice);
                pst.setInt(4, contractID);
                pst.setString(5, month);
                pst.setDate(6, new java.sql.Date((new Date()).getTime()));
                pst.setInt(7, electricPrice);
                pst.setInt(8, waterPrice);
                pst.executeUpdate();

                // update room latestInvoiceMonth OR UPDATE WHEN INVOICE CHANGE STATUS TO 'PAID'??
                sql = "update Room set latestInvoiceMonth = GETDATE() where roomID = ?";
                pst = cn.prepareCall(sql);
                pst.setInt(1, roomID);
                pst.executeUpdate();

                // get Invoice ID that is latest
                sql = "select top 1 invoiceID from invoice order by invoiceID desc";
                pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    invoiceID = rs.getInt("invoiceID");
                }
                
                System.out.println("270 " + invoiceID);

                // insert service detail
                for (ServiceDetail serviceDetail : detailList) {
                    sql = "insert into ServiceDetail(startValue, endValue, invoiceID, serviceID, quantity) values (?, ?, ?, ?, ?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, serviceDetail.getStartValue());
                    pst.setInt(2, serviceDetail.getEndValue());
                    pst.setInt(3, invoiceID);
                    pst.setInt(4, serviceDetail.getService().getServiceID());
                    pst.setInt(5, serviceDetail.getQuantity());
                    pst.executeUpdate();
                }
                cn.commit();
                return true;
            } else {
                System.out.println("CANNOT INSERT INVOICE!");
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            check = false;
        } finally {
            try {
                if (cn != null) {
                    cn.setAutoCommit(true);
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return check;
    }
}
