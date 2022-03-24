/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.speedstyle.prj301.controller;

import com.speedstyle.prj301.dao.ProductDAO;
import com.speedstyle.prj301.dto.Product;
import com.speedstyle.prj301.dto.ProductSize;
import com.speedstyle.prj301.dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author avillX
 */
@WebServlet(name = "AddProductControl", urlPatterns = {"/addproduct"})
public class AddProductControl extends HttpServlet {

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
        request.getRequestDispatcher("/View/Admin/AddNewProduct.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        boolean hasError = false;
        ProductDAO dao = new ProductDAO();

        String Name = request.getParameter("Name");

        if (Name==null){
            hasError = true;
            
        }
        else{
        int id = dao.CountProduct();
        ProductSize pS = new ProductSize(id,0,0,0,0,0,0);
        pS.setSize39(Integer.valueOf(request.getParameter("size39")));
        pS.setSize40(Integer.valueOf(request.getParameter("size40")));
        pS.setSize41(Integer.valueOf(request.getParameter("size41")));
        pS.setSize42(Integer.valueOf(request.getParameter("size42")));
        pS.setSize43(Integer.valueOf(request.getParameter("size43")));
        pS.setSize44(Integer.valueOf(request.getParameter("size44")));
               
        Product p = new Product(pS.getId(),"","",0,"","");                   
        p.setName(request.getParameter("Name"));
        p.setPrice(Double.parseDouble(request.getParameter("Price")));
        p.setCategory(request.getParameter("Category"));
        p.setImage_link(request.getParameter("image_link"));
        p.setMain_description(request.getParameter("Description"));

        
        boolean s = dao.addProduct(p);
        if(s) dao.addSizeProduct(pS);
        response.sendRedirect(request.getContextPath()+"/productmanager");
        }
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
