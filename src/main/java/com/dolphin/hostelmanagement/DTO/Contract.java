/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.util.Date;

public class Contract implements Comparable<Contract> {
    private int contractID;
    private Room room;
    private Tenant tenant;
    private Landlord landlord;
    private Hostel hostel;
    private Date startDate;
    private Date endDate;
    private int deposit;
    private int status;
    private int rentalFeePerMonth;

    public Contract() {
    }

    public Contract(int contractID, Room room, Tenant tenant, Landlord landlord, Hostel hostel, Date startDate, Date endDate, int deposit, int status, int rentalFeePerMonth) {
        this.contractID = contractID;
        this.room = room;
        this.tenant = tenant;
        this.landlord = landlord;
        this.hostel = hostel;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.status = status;
        this.rentalFeePerMonth = rentalFeePerMonth;
    }

    public int getContractID() {
        return contractID;
    }

    public void setContractID(int contractID) {
        this.contractID = contractID;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Tenant getTenant() {
        return tenant;
    }

    public void setTenant(Tenant tenant) {
        this.tenant = tenant;
    }

    public Landlord getLandlord() {
        return landlord;
    }

    public void setLandlord(Landlord landlord) {
        this.landlord = landlord;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getDeposit() {
        return deposit;
    }

    public void setDeposit(int deposit) {
        this.deposit = deposit;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRentalFeePerMonth() {
        return rentalFeePerMonth;
    }

    public void setRentalFeePerMonth(int rentalFeePerMonth) {
        this.rentalFeePerMonth = rentalFeePerMonth;
    }

    public Hostel getHostel() {
        return hostel;
    }

    public void setHostel(Hostel hostel) {
        this.hostel = hostel;
    }

    @Override
    public String toString() {
        return "Contract{" + "contractID=" + contractID + ", room=" + room + ", tenant=" + tenant + ", landlord=" + landlord + ", hostel=" + hostel + ", startDate=" + startDate + ", endDate=" + endDate + ", deposit=" + deposit + ", status=" + status + ", rentalFeePerMonth=" + rentalFeePerMonth + '}';
    }

    @Override
    public int compareTo(Contract o) {
        return o.startDate.compareTo(this.startDate);
    }
}
