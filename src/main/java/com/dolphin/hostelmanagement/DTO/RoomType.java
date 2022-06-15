/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class RoomType {
    private int roomTypeID;
    private String roomTypeName;
    private int area;
    private int advertisedPrice;
    private int maxNumberOfResidents;
    private String description;
    private Hostel hostel;
    private ArrayList<String> imgList;

    public RoomType() {
    }

    public RoomType(int roomTypeID, String roomTypeName, int area, int advertisedPrice, int maxNumberOfResidents, String description, Hostel hostel, ArrayList<String> imgList) {
        this.roomTypeID = roomTypeID;
        this.roomTypeName = roomTypeName;
        this.area = area;
        this.advertisedPrice = advertisedPrice;
        this.maxNumberOfResidents = maxNumberOfResidents;
        this.description = description;
        this.hostel = hostel;
        this.imgList = imgList;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getAdvertisedPrice() {
        return advertisedPrice;
    }

    public void setAdvertisedPrice(int advertisedPrice) {
        this.advertisedPrice = advertisedPrice;
    }

    public int getMaxNumberOfResidents() {
        return maxNumberOfResidents;
    }

    public void setMaxNumberOfResidents(int maxNumberOfResidents) {
        this.maxNumberOfResidents = maxNumberOfResidents;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Hostel getHostel() {
        return hostel;
    }

    public void setHostel(Hostel hostel) {
        this.hostel = hostel;
    }

    public ArrayList<String> getImgList() {
        return imgList;
    }

    public void setImgList(ArrayList<String> imgList) {
        this.imgList = imgList;
    }
    
    
}
