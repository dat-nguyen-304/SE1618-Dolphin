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

    public static List<Invoice> findByContract(Contract c) {
        List<Invoice> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Invoice where contractID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, c.getContractID());
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    list = new ArrayList();
                    while (rs.next()) {
                        int invoiceID = rs.getInt("invoiceID");
                        Date startDate = rs.getDate("startDate");
                        Date endDate = rs.getDate("endDate");
                        int status = rs.getInt("status");
                        int totalPrice = rs.getInt("totalPrice");
                        list.add(new Invoice(invoiceID, c, startDate, endDate, status, totalPrice));
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
                    int status = rs.getInt("status");
                    int totalPrice = rs.getInt("totalPrice");
                    int contractID = rs.getInt("contractID");
                    Contract contract = ContractDAO.findByID(contractID);
                    return new Invoice(invoiceID, contract, startDate, endDate, status, totalPrice);
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
        Contract c = ContractDAO.findActiveContract(TenantDAO.findById(3));
        for (Invoice inv : findByContract(c)) {
            System.out.println(inv);
        }
    }
}
