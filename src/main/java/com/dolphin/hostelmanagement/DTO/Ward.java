/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

/**
 *
 * @author Vu Thien An - SE160296
 */
public class Ward {

    private int wardID;
    private String wardName;
    private District district;

    public Ward(int wardID, String wardName, District district) {
        this.wardID = wardID;
        this.wardName = wardName;
        this.district = district;
    }

    public int getWardID() {
        return wardID;
    }

    public void setWardID(int wardID) {
        this.wardID = wardID;
    }

    public String getWardName() {
        return wardName;
    }

    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    @Override
    public String toString() {
        return "Ward{" + "wardID=" + wardID + ", wardName=" + wardName + ", district=" + district + '}';
    }

}
