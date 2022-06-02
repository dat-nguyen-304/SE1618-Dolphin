/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.DTO;

public class Landlord {
    private Account account;
    private String fullname;
    private String phone;
    
    public Landlord() {
    }

    public Landlord(Account account, String fullname, String phone) {
        this.account = account;
        this.fullname = fullname;
        this.phone = phone;
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

    @Override
    public String toString() {
        return "Landlord{" + "account=" + account + ", fullname=" + fullname + ", phone=" + phone + '}';
    }
}
