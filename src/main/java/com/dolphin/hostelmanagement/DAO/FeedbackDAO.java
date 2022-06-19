/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Feedback;
import com.dolphin.hostelmanagement.DTO.Tenant;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class FeedbackDAO {

    public static List<Feedback> findByHostelId(int hostelId) {
        List<Feedback> feedbackList = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                feedbackList = new ArrayList<>();
                String sql = "select feedbackID, TenantID, content, rating, date from feedback where hostelID = ? Order by date DESC";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int feedbackId = Integer.parseInt(rs.getString("feedbackID"));
                        int tenantId = Integer.parseInt(rs.getString("TenantID"));
                        Tenant tenant = TenantDAO.findById(tenantId);
                        String content = rs.getString("content");
                        int rating = Integer.parseInt(rs.getString("rating"));
                        Date date = rs.getDate("date");
                        feedbackList.add(new Feedback(feedbackId, tenant, null, content, rating, date));
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbackList;
    }
    
    public static Feedback findByHostelTenant(int hostelId, int tenantId) {
        Feedback feedback = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select feedbackID, content, rating, date from feedback where hostelID = ? and tenantID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, hostelId);
                pst.setInt(2, tenantId);

                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    if (rs.next()) {
                        int feedbackId = Integer.parseInt(rs.getString("feedbackID"));
                        Tenant tenant = TenantDAO.findById(tenantId);
                        String content = rs.getString("content");
                        int rating = Integer.parseInt(rs.getString("rating"));
                        Date date = rs.getDate("date");
                        feedback = new Feedback(feedbackId, tenant, null, content, rating, date);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedback;
    }
    
    public static boolean add(int tenantId, int hostelId, String content, int rating) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into Feedback(tenantID, hostelId, content, rating) values (?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, tenantId);
                pst.setInt(2, hostelId);
                pst.setString(3, content);
                pst.setInt(4, rating);
                int rows = pst.executeUpdate();
                if (rows > 0) return true;
                cn.close();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean update(int tenantId, int hostelId, String content, int rating, String date) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Feedback set content = ?, rating = ?, date = ? where tenantID = ? AND hostelId = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, content);
                pst.setInt(2, rating);
                pst.setDate(3, Date.valueOf(date));
                pst.setInt(4, tenantId);
                pst.setInt(5, hostelId);
                int rows = pst.executeUpdate();
                if (rows > 0) return true;
                cn.close();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String[] args) {
        float currentHostelRating = (float)3.5;
        int feedbackQuantity = 5;
        int rating = 4;
        float a = (float)Math.round((currentHostelRating * feedbackQuantity + rating) / (feedbackQuantity + 1) * 10)/10;
        System.out.println(a);
    }
}
