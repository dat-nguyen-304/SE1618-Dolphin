/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

public class ServiceDetail {
    private int serviceDetailID;
    private int startValue;
    private int endValue;
    private int quantity;
    private Invoice invoice;
    private Service service;

    public ServiceDetail() {
    }

    public ServiceDetail(int serviceDetailID, int startValue, int endValue, int quantity, Invoice invoice, Service service) {
        this.serviceDetailID = serviceDetailID;
        this.startValue = startValue;
        this.endValue = endValue;
        this.quantity = quantity;
        this.invoice = invoice;
        this.service = service;
    }

    public int getServiceDetailID() {
        return serviceDetailID;
    }

    public void setServiceDetailID(int serviceDetailID) {
        this.serviceDetailID = serviceDetailID;
    }

    public int getStartValue() {
        return startValue;
    }

    public void setStartValue(int startValue) {
        this.startValue = startValue;
    }

    public int getEndValue() {
        return endValue;
    }

    public void setEndValue(int endValue) {
        this.endValue = endValue;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
    
    
}
