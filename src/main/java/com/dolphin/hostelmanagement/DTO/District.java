/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

import java.util.Objects;

/**
 *
 * @author Vu Thien An - SE160296
 */
public class District {

    private int districtID;
    private String districtName;
    private Province province;

    public District() {
    }

    public District(int districtID, String districtName, Province province) {
        this.districtID = districtID;
        this.districtName = districtName;
        this.province = province;
    }

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final District other = (District) obj;
        if (this.districtID != other.districtID) {
            return false;
        }
        if (!Objects.equals(this.districtName, other.districtName)) {
            return false;
        }
        return Objects.equals(this.province, other.province);
    }
}
