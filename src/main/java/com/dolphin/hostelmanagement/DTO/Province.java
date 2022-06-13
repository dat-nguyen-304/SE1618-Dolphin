/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

/**
 *
 * @author Vu Thien An - SE160296
 */
public class Province {
    private int provinceID;
    private String provinceName;

    public Province() {
    }

    public Province(int provinceID, String provinceName) {
        this.provinceID = provinceID;
        this.provinceName = provinceName;
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    
}
