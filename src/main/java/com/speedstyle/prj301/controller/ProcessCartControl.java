/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.speedstyle.prj301.controller;

import com.speedstyle.prj301.dao.ProductDAO;
import com.speedstyle.prj301.dto.Cart;
import com.speedstyle.prj301.dto.Product;
import com.speedstyle.prj301.dto.ProductCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author avillX
 */
@WebServlet(name = "ProcessCartControl", urlPatterns = {"/process"})
public class ProcessCartControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProduct("","");
        Cookie arr[] = request.getCookies();
        String txt = "";
        if(arr!=null){
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Cart cart = new Cart(txt,list);
        String size_raw = request.getParameter("size");
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        int id,num,size=0;
        try{
            id = Integer.parseInt(id_raw);
            size = Integer.parseInt(size_raw);
            Product p = dao.getProductByID(String.valueOf(id));
            int numStore = dao.InStock(id, size);
            num = Integer.parseInt(num_raw);
            if(num==-1&&(cart.getQuantityById(id,size)<=1)){
                cart.removeProductCart(id, size);
            }else{
                if((num==1) && cart.getQuantityById(id, size)>=numStore){
                    num=0;
                }
            ProductCart pC = new ProductCart(p,size,num,p.getPrice());
            cart.addProductCart(pC, num);
            }
        }catch(Exception e){
        }

        List<ProductCart> pCart = cart.getProductCart();
        txt="";
        if(pCart.size()>0){
            txt= pCart.get(0).getProduct().getId()+":"+
                pCart.get(0).getSize()+":"+pCart.get(0).getQuantity();
            for(int i = 1; i < pCart.size();i++){
                txt+="_"+ pCart.get(i).getProduct().getId()+":"+
                    pCart.get(i).getSize()+":"+pCart.get(i).getQuantity();
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60 * 60 * 24);
        response.addCookie(c);
        request.setAttribute("pCart", pCart);
        request.getRequestDispatcher("View/cart.jsp").forward(request, response); 

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
