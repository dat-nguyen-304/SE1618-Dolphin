package com.dolphin.hostelmanagement.DTO;

import java.util.Date;

public class Account {

    private int accountID;
    private String username;
    private String password;
    private String email;
    private Date registrationDate;
    private int role;
    private boolean activate;
    private String avatar;

    public Account() {
        
    }

    public Account(int accountID, String username, String password, String email, Date registrationDate, int role, boolean activate) {
        this.accountID = accountID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.registrationDate = registrationDate;
        this.role = role;
        this.activate = activate;
    }
    
    

    public Account(int accountID, String username, String password, String email, Date registrationDate, int role, boolean activate, String avatar) {
        this.accountID = accountID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.registrationDate = registrationDate;
        this.role = role;
        this.activate = activate;
        this.avatar = avatar;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public boolean isActivate() {
        return activate;
    }

    public void setActivate(boolean activate) {
        this.activate = activate;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

}
