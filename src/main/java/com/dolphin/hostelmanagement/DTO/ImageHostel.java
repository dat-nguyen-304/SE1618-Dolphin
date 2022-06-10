/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

/**
 *
 * @author Admin
 */
public class ImageHostel {
    private int imgHostelID;
    private int hostelID;
    private String imgLink;

    public ImageHostel(int imgHostelID, int hostelID, String imgLink) {
        this.imgHostelID = imgHostelID;
        this.hostelID = hostelID;
        this.imgLink = imgLink;
    }

    public int getImgHostelID() {
        return imgHostelID;
    }

    public void setImgHostelID(int imgHostelID) {
        this.imgHostelID = imgHostelID;
    }

    public int getHostelID() {
        return hostelID;
    }

    public void setHostelID(int hostelID) {
        this.hostelID = hostelID;
    }

    public String getImgLink() {
        return imgLink;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }
    
    
}
