/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.util.ArrayList;

public class Room {
    private int roomID;
    private Hostel hostel;
    private int roomNumber;
    private int area;
    private ArrayList<String> images;
    private String description;
    private int status;
    private int maxNumberOfResident;
    private int currentNumberOfResident;
    private int advertisedPrice;

    public Room() {
    }

    public Room(int roomID, Hostel hostel, int roomNumber, int area, ArrayList<String> images, String description, int status, int maxNumberOfResident, int currentNumberOfResident, int advertisedPrice) {
        this.roomID = roomID;
        this.hostel = hostel;
        this.roomNumber = roomNumber;
        this.area = area;
        this.images = images;
        this.description = description;
        this.status = status;
        this.maxNumberOfResident = maxNumberOfResident;
        this.currentNumberOfResident = currentNumberOfResident;
        this.advertisedPrice = advertisedPrice;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public Hostel getHostel() {
        return hostel;
    }

    public void setHostel(Hostel hostel) {
        this.hostel = hostel;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public ArrayList<String> getImages() {
        return images;
    }

    public void setImages(ArrayList<String> images) {
        this.images = images;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getMaxNumberOfResident() {
        return maxNumberOfResident;
    }

    public void setMaxNumberOfResident(int maxNumberOfResident) {
        this.maxNumberOfResident = maxNumberOfResident;
    }

    public int getCurrentNumberOfResident() {
        return currentNumberOfResident;
    }

    public void setCurrentNumberOfResident(int currentNumberOfResident) {
        this.currentNumberOfResident = currentNumberOfResident;
    }

    public int getAdvertisedPrice() {
        return advertisedPrice;
    }

    public void setAdvertisedPrice(int advertisedPrice) {
        this.advertisedPrice = advertisedPrice;
    }
    
    
}
