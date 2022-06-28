/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.util.Date;

public class Invoice {

    private int invoiceID;
    private Contract contract;
    private Date startDate;
    private Date endDate;
    private Date createdDate;
    private int status;
    private int totalPrice;
    private String month;
    private int ElectricPrice;
    private int WaterPrice;

    public Invoice() {
    }

    public Invoice(int invoiceID, Contract contract, Date startDate, Date endDate, Date createdDate, int status, int totalPrice, String month, int ElectricPrice, int WaterPrice) {
        this.invoiceID = invoiceID;
        this.contract = contract;
        this.startDate = startDate;
        this.endDate = endDate;
        this.createdDate = createdDate;
        this.status = status;
        this.totalPrice = totalPrice;
        this.month = month;
        this.ElectricPrice = ElectricPrice;
        this.WaterPrice = WaterPrice;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getElectricPrice() {
        return ElectricPrice;
    }

    public void setElectricPrice(int ElectricPrice) {
        this.ElectricPrice = ElectricPrice;
    }

    public int getWaterPrice() {
        return WaterPrice;
    }

    public void setWaterPrice(int WaterPrice) {
        this.WaterPrice = WaterPrice;
    }

    @Override
    public String toString() {
        return "Invoice{" + "invoiceID=" + invoiceID + ", contract=" + contract + ", startDate=" + startDate + ", endDate=" + endDate + ", createdDate=" + createdDate + ", status=" + status + ", totalPrice=" + totalPrice + ", month=" + month + ", ElectricPrice=" + ElectricPrice + ", WaterPrice=" + WaterPrice + '}';
    }
}
