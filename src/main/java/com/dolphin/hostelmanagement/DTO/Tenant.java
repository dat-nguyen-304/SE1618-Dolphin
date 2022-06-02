/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

public class Tenant {
    private Account account;
    private String fullname;
    private String phone;
    private boolean rentStatus; 

    public Tenant() {
    }

    public Tenant(Account account, String fullname, String phone, boolean rentStatus) {
        this.account = account;
        this.fullname = fullname;
        this.phone = phone;
        this.rentStatus = rentStatus;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
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

    public boolean isRentStatus() {
        return rentStatus;
    }

    public void setRentStatus(boolean rentStatus) {
        this.rentStatus = rentStatus;
    } 

    @Override
    public String toString() {
        return "Tenant{" + "account=" + account + ", fullname=" + fullname + ", phone=" + phone + ", rentStatus=" + rentStatus + '}';
    }
}
