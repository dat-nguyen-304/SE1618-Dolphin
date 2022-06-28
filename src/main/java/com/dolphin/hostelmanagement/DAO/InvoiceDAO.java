/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.Invoice;
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
public class InvoiceDAO {

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

    public static void main(String[] args) {
//        List<Invoice> invoiceList = findByContract(1);
//        for (Invoice invoice : invoiceList) {
//            System.out.println(invoice.getInvoiceID());
//        }
        System.out.println(findByID(1));
    }
}
