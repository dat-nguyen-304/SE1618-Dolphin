/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.util.ArrayList;

public class Room {
    private int roomID;
    private String roomNumber;
    private int currentNumberOfResidents;
    private int status;
    private RoomType roomType;

    public Room() {
    }

    public Room(int roomID, String roomNumber, int currentNumberOfResidents, int status, RoomType roomType) {
        this.roomID = roomID;
        this.roomNumber = roomNumber;
        this.currentNumberOfResidents = currentNumberOfResidents;
        this.status = status;
        this.roomType = roomType;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getCurrentNumberOfResidents() {
        return currentNumberOfResidents;
    }

    public void setCurrentNumberOfResidents(int currentNumberOfResidents) {
        this.currentNumberOfResidents = currentNumberOfResidents;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    
}
