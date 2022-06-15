/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.util.ArrayList;

public class Room {
    private int roomID;
    private int roomNumber;
    private int currentNumberOfResident;
    private int status;
    private RoomType roomtype;

    public Room() {
    }

    public Room(int roomID, int roomNumber, int currentNumberOfResident, int status, RoomType roomtype) {
        this.roomID = roomID;
        this.roomNumber = roomNumber;
        this.currentNumberOfResident = currentNumberOfResident;
        this.status = status;
        this.roomtype = roomtype;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getCurrentNumberOfResident() {
        return currentNumberOfResident;
    }

    public void setCurrentNumberOfResident(int currentNumberOfResident) {
        this.currentNumberOfResident = currentNumberOfResident;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public RoomType getRoomtype() {
        return roomtype;
    }

    public void setRoomtype(RoomType roomtype) {
        this.roomtype = roomtype;
    }
}
