/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.speedstyle.prj301.dto;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author avillX
 */
public class ProductCart {
    Product product;
    private int quantity,size;
    private double price;
    
    public ProductCart(){}
     
    public ProductCart(Product product, int size, int quantity, double price) {
        this.product = product;
        this.quantity = quantity;
        this.size = size;
        this.price = price;
    }
    @Override
    public String toString(){
        return product.getId()+", "+size+", "+quantity+", "+price;
    }
    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
   

}
