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
public class Announcement {
    private int annoucementID;
    private Tenant tenant;
    private Landlord landlord;
    private String content;
    private Date date;

    public Announcement(int annoucementID, Tenant tenant, Landlord landlord, String content, Date date) {
        this.annoucementID = annoucementID;
        this.tenant = tenant;
        this.landlord = landlord;
        this.content = content;
        this.date = date;
    }

    public int getAnnoucementID() {
        return annoucementID;
    }

    public void setAnnoucementID(int annoucementID) {
        this.annoucementID = annoucementID;
    }

    public Tenant getTenant() {
        return tenant;
    }

    public void setTenant(Tenant tenant) {
        this.tenant = tenant;
    }

    public Landlord getLandlord() {
        return landlord;
    }

    public void setLandlord(Landlord landlord) {
        this.landlord = landlord;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
}
