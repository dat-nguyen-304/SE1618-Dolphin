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
    private Date dueDate;
    private int status;
    private int totalPrice;

    public Invoice() {
    }

    public Invoice(int invoiceID, Contract contract, Date startDate, Date endDate, Date dueDate, int status, int totalPrice) {
        this.invoiceID = invoiceID;
        this.contract = contract;
        this.startDate = startDate;
        this.endDate = endDate;
        this.dueDate = dueDate;
        this.status = status;
        this.totalPrice = totalPrice;
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

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    @Override
    public String toString() {
        return "Invoice{" + "invoiceID=" + invoiceID + ", contract=" + contract + ", startDate=" + startDate + ", endDate=" + endDate + ", dueDate=" + dueDate + ", status=" + status + ", totalPrice=" + totalPrice + '}';
    }
}
