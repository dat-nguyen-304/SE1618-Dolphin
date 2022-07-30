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
public class BookingRequest {
    private int bookingRequestID;
    private Tenant tenant;
    private RoomType roomType;
    private Date createdDate;
    private int status;
    private String description;

    public BookingRequest() {
    }

    public BookingRequest(int bookingRequestID, Tenant tenant, RoomType roomType, Date createdDate, int status) {
        this.bookingRequestID = bookingRequestID;
        this.tenant = tenant;
        this.roomType = roomType;
        this.createdDate = createdDate;
        this.status = status;
    }

    public BookingRequest(int bookingRequestID, Tenant tenant, RoomType roomType, Date createdDate, int status, String description) {
        this.bookingRequestID = bookingRequestID;
        this.tenant = tenant;
        this.roomType = roomType;
        this.createdDate = createdDate;
        this.status = status;
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    

    public int getBookingRequestID() {
        return bookingRequestID;
    }

    public void setBookingRequestID(int bookingRequestID) {
        this.bookingRequestID = bookingRequestID;
    }

    public Tenant getTenant() {
        return tenant;
    }

    public void setTenant(Tenant tenant) {
        this.tenant = tenant;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
}
