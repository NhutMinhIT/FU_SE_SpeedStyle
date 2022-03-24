/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.speedstyle.prj301.dto;
import java.io.Serializable;

/**
 *
 * @author avillX
 */
public class User implements Serializable {
    private String userID="";
    private String username="";
    private String password="";
    private String fullname="";
    private String email="";
    private String phone="";
    private String address="";   
    private String roleID="";

    public User() {
    }
    public User(String userID,String username,String password,String fullname,String email,String phone,String address,String roleID) {
        this.userID = userID;
        this.username = username;       
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;        
        this.email = email;
        this.roleID = roleID;
    }
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }
}
