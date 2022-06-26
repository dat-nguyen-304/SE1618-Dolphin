/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Invoice;
import com.dolphin.hostelmanagement.DTO.Service;
import com.dolphin.hostelmanagement.DTO.ServiceDetail;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ServiceDAO {

    public static List<Service> findHostelActiveServices(Hostel hostel) {
        List<Service> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                list = new ArrayList();
                String sql = "select serviceID, serviceName, CONCAT(YEAR(s.monthApplied), '-', RIGHT(CONCAT('00', MONTH(s.monthApplied)), 2)) as monthApplied, serviceFee, unit from Service s where hostelID = ? and active = 1";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, hostel.getHostelID());
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int serviceID = rs.getInt("serviceID");
                        String serviceName = rs.getString("serviceName");
                        String monthAppliedString = rs.getString("monthApplied");
                        YearMonth monthApplied = YearMonth.parse(monthAppliedString);
                        int serviceFee = rs.getInt("serviceFee");
                        String unit = rs.getString("unit");
                        list.add(new Service(serviceID, serviceName, serviceFee, monthApplied, hostel, unit));
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

    public static Service findServiceByID(int id) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                //String sql = "select serviceID, serviceName, CONCAT(YEAR(s.monthApplied), '-', RIGHT(CONCAT('00', MONTH(s.monthApplied)), 2)) as monthApplied,  hostelID, serviceFee, unit from Service s where serviceID = ?";
                String sql = "select serviceID, serviceName, CONCAT(YEAR(s.monthApplied), '-', RIGHT(CONCAT('00', MONTH(s.monthApplied)), 2)) as monthApplied,  hostelID, serviceFee from Service s where serviceID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int serviceID = rs.getInt("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String monthAppliedString = rs.getString("monthApplied");
                    YearMonth monthApplied = YearMonth.parse(monthAppliedString);
                    int hostelID = rs.getInt("hostelID");
                    Hostel hostel = HostelDAO.findById(hostelID);
                    int serviceFee = rs.getInt("serviceFee");
                    String unit = null;//rs.getString("unit");
                    return new Service(serviceID, serviceName, serviceFee, monthApplied, hostel, unit);
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

    public static HashMap<Service, ServiceDetail> findDetailsByInvoice(Invoice invoice) {
        HashMap<Service, ServiceDetail> serviceMap = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from ServiceDetail where invoiceID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, invoice.getInvoiceID());
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    serviceMap = new HashMap();
                    while (rs.next()) {
                        int serviceDetailID = rs.getInt("serviceDetailID");
                        int startValue = rs.getInt("startValue");
                        int endValue = rs.getInt("endValue");
                        int serviceID = rs.getInt("serviceID");
                        Service service = findServiceByID(serviceID);
                        int quantity = rs.getInt("quantity");
                        ServiceDetail serviceDetail = new ServiceDetail(serviceDetailID, startValue, endValue, quantity, invoice, service);
                        serviceMap.put(service, serviceDetail);
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
        return serviceMap;
    }

    public static List<ServiceDetail> findDetailsByInvoice(int invoiceId) {
        List<ServiceDetail> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from ServiceDetail where invoiceID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, invoiceId);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    list = new ArrayList<>();
                    while (rs.next()) {
                        int serviceDetailID = rs.getInt("serviceDetailID");
                        int startValue = rs.getInt("startValue");
                        int endValue = rs.getInt("endValue");
                        int serviceID = rs.getInt("serviceID");
                        Service service = findServiceByID(serviceID);
                        int quantity = rs.getInt("quantity");
                        Invoice invoice = InvoiceDAO.findByID(invoiceId);
                        list.add(new ServiceDetail(serviceDetailID, startValue, endValue, quantity, invoice, service));
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
        for (Service service : findHostelActiveServices(HostelDAO.findById(1))) {
            System.out.println(service);
        }
    }
}
