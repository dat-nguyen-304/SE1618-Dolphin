/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.util.Date;

public class Hostel {

    private int hostelID;
    private String streetAddress;
    private Ward ward;
    private String hostelName;
    private int totalRoom;
    private Date registeredDate;
    private float rating;
    private Landlord landlord;
    private boolean activate;
    private String images;
    private int minPrice;
    private int maxPrice;
    private float minArea;
    private float maxArea;
    private int availableRoom;

    public Hostel() {
    }

    public Hostel(int hostelID, String streetAddress, Ward ward, String hostelName, int totalRoom, Date registeredDate, float rating, Landlord landlord, boolean activate, String images, int minPrice, int maxPrice, float minArea, float maxArea, int availableRoom) {
        this.hostelID = hostelID;
        this.streetAddress = streetAddress;
        this.ward = ward;
        this.hostelName = hostelName;
        this.totalRoom = totalRoom;
        this.registeredDate = registeredDate;
        this.rating = rating;
        this.landlord = landlord;
        this.activate = activate;
        this.images = images;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.minArea = minArea;
        this.maxArea = maxArea;
        this.availableRoom = availableRoom;
    }

    public int getHostelID() {
        return hostelID;
    }

    public void setHostelID(int hostelID) {
        this.hostelID = hostelID;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public Ward getWard() {
        return ward;
    }

    public void setWard(Ward ward) {
        this.ward = ward;
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

    public Date getRegisteredDate() {
        return registeredDate;
    }

    public void setRegisteredDate(Date registeredDate) {
        this.registeredDate = registeredDate;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public Landlord getLandlord() {
        return landlord;
    }

    public void setLandlord(Landlord landlord) {
        this.landlord = landlord;
    }

    public boolean isActivate() {
        return activate;
    }

    public void setActivate(boolean activate) {
        this.activate = activate;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public int getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(int minPrice) {
        this.minPrice = minPrice;
    }

    public int getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(int maxPrice) {
        this.maxPrice = maxPrice;
    }

    public float getMinArea() {
        return minArea;
    }

    public void setMinArea(float minArea) {
        this.minArea = minArea;
    }

    public float getMaxArea() {
        return maxArea;
    }

    public void setMaxArea(float maxArea) {
        this.maxArea = maxArea;
    }

    public int getAvailableRoom() {
        return availableRoom;
    }

    public void setAvailableRoom(int availableRoom) {
        this.availableRoom = availableRoom;
    }

    @Override
    public String toString() {
        return "Hostel{" + "hostelID=" + hostelID + ", streetAddress=" + streetAddress + ", ward=" + ward + ", hostelName=" + hostelName + ", totalRoom=" + totalRoom + ", registeredDate=" + registeredDate + ", rating=" + rating + ", landlord=" + landlord + ", activate=" + activate + ", images=" + images + ", minPrice=" + minPrice + ", maxPrice=" + maxPrice + ", minArea=" + minArea + ", maxArea=" + maxArea + ", availableRoom=" + availableRoom + '}';
    }
}
