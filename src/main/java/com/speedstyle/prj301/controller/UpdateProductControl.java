/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.speedstyle.prj301.controller;

import com.speedstyle.prj301.dao.ProductDAO;
import com.speedstyle.prj301.dto.Product;
import com.speedstyle.prj301.dto.ProductSize;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author avillX
 */
@WebServlet(name = "UpdateProductControl", urlPatterns = {"/update"})
public class UpdateProductControl extends HttpServlet {

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
        HashMap<String,String> errors = new HashMap<String,String>();
        boolean hasError = false;
        ProductDAO dao = new ProductDAO();
        String id = request.getParameter("id");
        String Name = request.getParameter("Name");

        ProductSize pS = new ProductSize();
        pS.setId(Integer.valueOf(request.getParameter("id")));
        pS.setSize39(Integer.valueOf(request.getParameter("size39")));
        pS.setSize40(Integer.valueOf(request.getParameter("size40")));
        pS.setSize41(Integer.valueOf(request.getParameter("size41")));
        pS.setSize42(Integer.valueOf(request.getParameter("size42")));
        pS.setSize43(Integer.valueOf(request.getParameter("size43")));
        pS.setSize44(Integer.valueOf(request.getParameter("size44")));

        if (Name.trim().equals("")){
            errors.put("Name", "Name is empty");
            hasError = true;
        }
        

        Product p = dao.getProductByID(id);                   
        p.setName(request.getParameter("Name"));
        p.setPrice(Double.parseDouble(request.getParameter("Price")));
        p.setCategory(request.getParameter("Category"));
        p.setImage_link(request.getParameter("image_link"));
        p.setMain_description(request.getParameter("Description"));

        if (hasError){
            request.setAttribute("product", p);
            request.setAttribute("sizeList", pS);
            request.setAttribute("errors", errors);

            RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/EditNewProduct.jsp");
            rd.forward(request, response);
        }else{
            log("Update Product " + p.getId());
            dao.UpdateProduct(p);
            dao.UpdateSizeProduct(pS);
            response.sendRedirect(request.getContextPath()+"/productmanager");
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
