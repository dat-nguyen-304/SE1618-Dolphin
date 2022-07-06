/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.util.Date;

public class RoomResident {
    private int roomResidentID;
    private Room room;
    private String fullname;
    private String phone;
    private Date dob;

    public RoomResident() {
    }

    public RoomResident(int roomResidentID, Room room, String fullname, String phone, Date dob) {
        this.roomResidentID = roomResidentID;
        this.room = room;
        this.fullname = fullname;
        this.phone = phone;
        this.dob = dob;
    }

    public int getRoomResidentID() {
        return roomResidentID;
    }

    public void setRoomResidentID(int roomResidentID) {
        this.roomResidentID = roomResidentID;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }
}
