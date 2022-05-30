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
public class Hostel {
    private int hostelID;
    private String address;
    private String hostelName;
    private int totalRoom;
    private Date registrationDate;
    private String detailAddress;
    private float rating;
    private Landlord landlord;
    private boolean activate;

    public Hostel(int hostelID, String address, String hostelName, int totalRoom, Date registrationDate, String detailAddress, float rating, Landlord landlord, boolean activate) {
        this.hostelID = hostelID;
        this.address = address;
        this.hostelName = hostelName;
        this.totalRoom = totalRoom;
        this.registrationDate = registrationDate;
        this.detailAddress = detailAddress;
        this.rating = rating;
        this.landlord = landlord;
        this.activate = activate;
    }
    
    public int getHostelID() {
        return hostelID;
    }

    public void setHostelID(int hostelID) {
        this.hostelID = hostelID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHostelName() {
        return hostelName;
    }

    public void setHostelName(String hostelName) {
        this.hostelName = hostelName;
    }

    public int getTotalRoom() {
        return totalRoom;
    }

    public void setTotalRoom(int totalRoom) {
        this.totalRoom = totalRoom;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public Landlord getLandlord() {
        return landlord;
    }

    public void setLandlord(Landlord landlord) {
        this.landlord = landlord;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public boolean isActivate() {
        return activate;
    }

    public void setActivate(boolean activate) {
        this.activate = activate;
    }
    
    
}
