/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.speedstyle.prj301.dao;

import com.speedstyle.prj301.dao.ProductDAO;
import com.speedstyle.prj301.dto.Cart;
import com.speedstyle.prj301.dto.Product;
import com.speedstyle.prj301.dto.ProductCart;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author avillX
 */
public class CartDAO {

//    public List<ProductCart> Cart (String txt){
//        ProductCart product = new ProductCart(); 
//        ProductDAO dao = new ProductDAO();
//        List<ProductCart> list = new ArrayList<>();     
//        try{
//            if(txt!=null && txt.length()!=0){
//                String[] s = txt.split("_");
//                for(String i:s){
//                    String[] n = i.split(":");
//                        String id = n[0];
//                        int size = Integer.parseInt(n[1]);
//                        int quantity = Integer.parseInt(n[2]);
//                    Product p = dao.getProductByID(id);
//                    ProductCart t = new ProductCart (p,size,quantity,p.getPrice());
//                    cart.addProductCart(t,quantity);
//                }
//            }
//        }catch(Exception e){
//        }
//    return list;   
//    }    
}
