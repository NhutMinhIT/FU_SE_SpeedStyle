/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.speedstyle.prj301.dto;


public class ProductSize {
    private int id;
    private int size39,size40,size41,size42,size43,size44;    
    public ProductSize(){}
    public ProductSize(int id, int size39, int size40, int size41, int size42, int size43, int size44) {
        this.id = id;
        this.size39 = size39;
        this.size40 = size40;
        this.size41 = size41;
        this.size42 = size42;
        this.size43 = size43;
        this.size44 = size44;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSize39() {
        return size39;
    }

    public void setSize39(int size39) {
        this.size39 = size39;
    }

    public int getSize40() {
        return size40;
    }

    public void setSize40(int size40) {
        this.size40 = size40;
    }

    public int getSize41() {
        return size41;
    }

    public void setSize41(int size41) {
        this.size41 = size41;
    }

    public int getSize42() {
        return size42;
    }

    public void setSize42(int size42) {
        this.size42 = size42;
    }

    public int getSize43() {
        return size43;
    }

    public void setSize43(int size43) {
        this.size43 = size43;
    }

    public int getSize44() {
        return size44;
    }

    public void setSize44(int size44) {
        this.size44 = size44;
    }
    @Override
    public String toString(){
        return id+", "+size39+", "+size40+", "+size41+", "+size42+", "+size43+", "+size44;
}
}
