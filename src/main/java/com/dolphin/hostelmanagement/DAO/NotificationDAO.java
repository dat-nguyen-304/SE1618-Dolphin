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

            String sql = "Insert into Notification (toAccountID, createdDate, content, status) values (?, ?, ?, ?)";
            PreparedStatement pst = cn.prepareCall(sql);

            java.sql.Date sqlRegDate = new java.sql.Date(n.getCreatedDate().getTime());

            pst.setInt(1, n.getToAccount().getAccountID());
            pst.setDate(2, sqlRegDate);
            pst.setNString(3, n.getContent());
            pst.setInt(4, n.getStatus());

            boolean check = pst.executeUpdate() != 0;

            return check;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static ArrayList<Notification> getNotificationByToAccount(Account acc) {
        Connection cn = null;

        ArrayList<Notification> notiList = null;
        try {
            cn = DBUtils.makeConnection();

            String sql = "Select * from Notification where toAccountID = ?";
            PreparedStatement pst = cn.prepareCall(sql);

            pst.setInt(1, acc.getAccountID());

            ResultSet rs = pst.executeQuery();

            notiList = new ArrayList<>();

            while (rs != null && rs.next()) {
                int notiID = rs.getInt("notificationID");
                Date createdDate = rs.getDate("createdDate");
                String content = rs.getNString("content");
                int status = rs.getInt("status");
                notiList.add(new Notification(notiID, acc, createdDate, content, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notiList;
    }

    public static void main(String args[]) {
        Account acc = new Account();
        acc.setAccountID(44);
        for(Notification noti: getNotificationByToAccount(acc))
            System.out.println(noti.getContent());
    }
}
