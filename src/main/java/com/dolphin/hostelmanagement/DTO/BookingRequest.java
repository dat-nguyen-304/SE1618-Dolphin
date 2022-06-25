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
    private Room room;
    private Date createdDate;
    private int status;

    public BookingRequest() {
    }

    public BookingRequest(int bookingRequestID, Tenant tenant, Room room, Date createdDate, int status) {
        this.bookingRequestID = bookingRequestID;
        this.tenant = tenant;
        this.room = room;
        this.createdDate = createdDate;
        this.status = status;
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

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
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
