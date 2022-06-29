/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.time.YearMonth;

public class Service {
    private int serviceID;
    private String serviceName;
    private int serviceFee;
    private YearMonth monthApplied;
    private Hostel hostel;
    private String unit;
    private int type;

    public Service() {
    }

    public Service(int serviceID, String serviceName, int serviceFee, YearMonth monthApplied, Hostel hostel, String unit, int type) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.serviceFee = serviceFee;
        this.monthApplied = monthApplied;
        this.hostel = hostel;
        this.unit = unit;
        this.type = type;
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

    public YearMonth getMonthApplied() {
        return monthApplied;
    }

    public void setMonthApplied(YearMonth monthApplied) {
        this.monthApplied = monthApplied;
    }

    public Hostel getHostel() {
        return hostel;
    }

    public void setHostel(Hostel hostel) {
        this.hostel = hostel;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
