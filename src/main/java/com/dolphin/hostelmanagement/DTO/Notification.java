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
public class Notification {
    private int notiID;
    private String content;
    private Date createdDate;
    private int status;
    private Account from;
    private Account to;
    private int notiType;
    
    public Notification() {}

    public Notification(int notiID, String content, Date createdDate, int status, Account from, Account to, int notiType) {
        this.notiID = notiID;
        this.content = content;
        this.createdDate = createdDate;
        this.status = status;
        this.from = from;
        this.to = to;
        this.notiType = notiType;
    }

    public int getNotiID() {
        return notiID;
    }

    public void setNotiID(int notiID) {
        this.notiID = notiID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Account getFrom() {
        return from;
    }

    public void setFrom(Account from) {
        this.from = from;
    }

    public Account getTo() {
        return to;
    }

    public void setTo(Account to) {
        this.to = to;
    }

    public int getNotiType() {
        return notiType;
    }

    public void setNotiType(int notiType) {
        this.notiType = notiType;
    }
    
    
}
