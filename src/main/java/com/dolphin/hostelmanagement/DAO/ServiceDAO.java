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
                String sql = "select s.type, serviceID, serviceName, CONCAT(YEAR(s.monthApplied), '-', RIGHT(CONCAT('00', MONTH(s.monthApplied)), 2)) as monthApplied, serviceFee, unit from Service s where hostelID = ? and active = 1";
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
                        int type = rs.getInt("type");
                        list.add(new Service(serviceID, serviceName, serviceFee, monthApplied, hostel, unit, type));
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
                String sql = "select serviceID, serviceName, CONCAT(YEAR(s.monthApplied), '-', RIGHT(CONCAT('00', MONTH(s.monthApplied)), 2)) as monthApplied,  hostelID, serviceFee, unit, s.type from Service s where serviceID = ?";
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
                    String unit = rs.getString("unit");
                    int type = rs.getInt("type");
                    return new Service(serviceID, serviceName, serviceFee, monthApplied, hostel, unit, type);
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

    public static List<ServiceDetail> findDetailsByInvoice(Invoice invoice) {
        List<ServiceDetail> list = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from ServiceDetail where invoiceID = ?";
                PreparedStatement pst = cn.prepareCall(sql);
                pst.setInt(1, invoice.getInvoiceID());
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

//    public static List<Service> findByHostelId(int hostelId) {
//        Connection cn = null;
//        List<Service> list = null;
//        try {
//            cn = DBUtils.makeConnection();
//            if (cn != null) {
//                list = new ArrayList<>();
//                String sql = "SELECT * FROM Service WHERE hostelID = ? AND active = 1";
//                PreparedStatement pst = cn.prepareStatement(sql);
//                pst.setInt(1, hostelId);
//                ResultSet rs = pst.executeQuery();
//                if (rs != null) {
//                    while (rs.next()) {
//                        int serviceID = rs.getInt("serviceID");
//                        String serviceName = rs.getString("serviceName");
//                        String monthAppliedString = rs.getString("monthApplied");
//                        YearMonth monthApplied = YearMonth.parse(monthAppliedString);
//                        Hostel hostel = HostelDAO.findById(hostelId);
//                        int serviceFee = rs.getInt("serviceFee");
//                        String unit = rs.getString("unit");
//                        int type = rs.getInt("type");
//                        list.add(new Service(serviceID, serviceName, serviceFee, monthApplied, hostel, unit, type));
//                    }
//                }
//                cn.close();
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
     public static boolean save(int hostelId, String name, int fee, String unit, int serviceType) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Service(hostelID, serviceName, serviceFee, unit, type) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                pst.setString(2, name);
                pst.setInt(3, fee);
                pst.setString(4, unit);
                pst.setInt(5, serviceType);
                int rows = pst.executeUpdate();
                if (rows > 0) {
                    cn.close();
                    return true;
                }
                cn.close();
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static Service findLastServiceByHostelId(int hostelId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select TOP 1 type, serviceID, serviceName, CONCAT(YEAR(monthApplied), '-', RIGHT(CONCAT('00', MONTH(monthApplied)), 2)) as monthApplied, serviceFee, unit FROM Service WHERE hostelID = ? AND active = 1 ORDER BY serviceID DESC";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int serviceID = rs.getInt("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String monthAppliedString = rs.getString("monthApplied");
                    YearMonth monthApplied = YearMonth.parse(monthAppliedString);
                    int serviceFee = rs.getInt("serviceFee");
                    String unit = rs.getString("unit");
                    int type = rs.getInt("type");
                    Hostel hostel = HostelDAO.findById(hostelId);
                    return new Service(serviceID, serviceName, serviceFee, monthApplied, hostel, unit, type);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean delete(int serviceId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Service SET active = 0 WHERE serviceID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, serviceId);
                int rows = pst.executeUpdate();
                if (rows > 0) {
                    cn.close();
                    return true;
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean saveDefaultService(int hostelId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Service([serviceName], [hostelID], [unit], [active], [type]) VALUES \n"
                        + "(N'Điện', ?, N'kWh', 1, 1),\n"
                        + "(N'Nước', ?, N'm3', 1, 2)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                pst.setInt(2, hostelId);
                int rows = pst.executeUpdate();
                if (rows == 2) {
                    cn.close();
                    return true;
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        List<Service> list = findHostelActiveServices(HostelDAO.findById(1));
        for (Service service : list) {
            System.out.println(service.getType());
        }
                
    }
}
