/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DAO;

import com.dolphin.hostelmanagement.DTO.Account;
import com.dolphin.hostelmanagement.DTO.Notification;
import com.dolphin.hostelmanagement.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class NotificationDAO {

    public static boolean saveNotification(Notification n) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Insert into Notification (content, createdDate, status, fromID, toID, notiType) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = cn.prepareCall(sql);

            java.sql.Date sqlRegDate = new java.sql.Date(n.getCreatedDate().getTime());

            pst.setString(1, n.getContent());
            pst.setDate(2, sqlRegDate);
            pst.setInt(3, n.getStatus());
            pst.setInt(4, n.getFrom().getAccountID());
            pst.setInt(5, n.getTo().getAccountID());
            pst.setInt(6, n.getNotiType());

            boolean check = pst.executeUpdate() != 0;

            return check;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int countSentNotification(int fromID, int notiType) {
        Connection cn = null;

        int cnt = 0;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select count(*) as cnt from Notification where fromID = ? and notiType = ?";
            PreparedStatement pst = cn.prepareCall(sql);

            pst.setInt(1, fromID);
            pst.setInt(2, notiType);

            ResultSet rs = pst.executeQuery();

            if (rs != null && rs.next()) {
                cnt = rs.getInt("cnt");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cnt;
    }
    
    public static ArrayList<Notification> getNotificationByToID(int toID) {
        Connection cn = null;

        ArrayList<Notification> notiList = null;
        
        int cnt = 0;

        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from Notification where toID = ?";
            PreparedStatement pst = cn.prepareCall(sql);

            pst.setInt(1, toID);

            ResultSet rs = pst.executeQuery();
            
            notiList = new ArrayList<>();
            
            while (rs != null && rs.next()) {
                int notiID = rs.getInt("notiID");
                String content = rs.getString("content");
                Date createdDate = rs.getDate("createdDate");
                int status = rs.getInt("status");
                int fromID = rs.getInt("fromID");
                Account from = AccountDAO.findById(fromID);
                Account to = AccountDAO.findById(toID);
                int notiType = rs.getInt("notiType");
                
                notiList.add(new Notification(notiID, content, createdDate, status, from, to, notiType));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return notiList;
    }

    public static void main(String args[]) {
        for(Notification noti: getNotificationByToID(10)) {
            System.out.println(noti.getContent());
        }
    }
}
