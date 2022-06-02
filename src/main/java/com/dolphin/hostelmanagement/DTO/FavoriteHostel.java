/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

public class FavoriteHostel {
    private int favoriteHostelID;
    private Hostel hostel;
    private Tenant tenant;

    public FavoriteHostel() {
    }

    public FavoriteHostel(int favoriteHostelID, Hostel hostel, Tenant tenant) {
        this.favoriteHostelID = favoriteHostelID;
        this.hostel = hostel;
        this.tenant = tenant;
    }

    public int getFavoriteHostelID() {
        return favoriteHostelID;
    }

    public void setFavoriteHostelID(int favoriteHostelID) {
        this.favoriteHostelID = favoriteHostelID;
    }

    public Hostel getHostel() {
        return hostel;
    }

    public void setHostel(Hostel hostel) {
        this.hostel = hostel;
    }

    public Tenant getTenant() {
        return tenant;
    }

    public void setTenant(Tenant tenant) {
        this.tenant = tenant;
    }
}
