/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Admin
 */
public class DBUtils {

    public static Connection makeConnection() throws Exception {
        Connection cn = null;
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://localhost\\PEASHOOTER:1433;databaseName=HostelManagement;user=sa;password=123456;";
        Class.forName(driver);
        cn = DriverManager.getConnection(url);
        return cn;
    }
}
