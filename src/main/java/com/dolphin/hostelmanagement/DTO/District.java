/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

/**
 *
 * @author Vu Thien An - SE160296
 */
public class District {
    private int districtId;
    private String districtName;

    public District() {
    }

    public District(int districtId, String districtName) {
        this.districtId = districtId;
        this.districtName = districtName;
    }

    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    @Override
    public String toString() {
        return "District{" + "districtId=" + districtId + ", districtName=" + districtName + '}';
    }
}
