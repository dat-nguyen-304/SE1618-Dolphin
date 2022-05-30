/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Service {
    private int serviceID;
    private String serviceName;
    private int serviceFee;
    private Date monthApplied;
    private Hostel hostel;

    public Service(int serviceID, String serviceName, int serviceFee, Date monthApplied, Hostel hostel) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.serviceFee = serviceFee;
        this.monthApplied = monthApplied;
        this.hostel = hostel;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(int serviceFee) {
        this.serviceFee = serviceFee;
    }

    public Date getMonthApplied() {
        return monthApplied;
    }

    public void setMonthApplied(Date monthApplied) {
        this.monthApplied = monthApplied;
    }

    public Hostel getHostel() {
        return hostel;
    }

    public void setHostel(Hostel hostel) {
        this.hostel = hostel;
    }
    
    
}
