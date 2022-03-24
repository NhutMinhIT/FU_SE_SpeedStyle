/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.speedstyle.prj301.dto;

import java.text.DecimalFormat;

/**
 *
 * @author AvillXx
 */
public class Product {
    private int id;
    private double price;
    private String name, category,image_link,main_description;

    public Product(int id, String name, String category, double price, String image_link, String main_description) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image_link = image_link;
        this.main_description = main_description;
    }
    public Product(String category){
        this.category = category;
    }
    public Product(int id, String name, String category, double price, String image_link ){
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image_link = image_link;
}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {       
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImage_link() {
        return image_link;
    }

    public void setImage_link(String image_link) {
        this.image_link = image_link;
    }

    public String getMain_description() {
        return main_description;
    }

    public void setMain_description(String main_description) {
        this.main_description = main_description;
    }
    @Override
    public String toString(){
        return id+", "+name+", "+category+", "+price+", "+image_link;
}

}
