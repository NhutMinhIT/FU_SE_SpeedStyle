/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.speedstyle.prj301.controller;

import com.speedstyle.prj301.dao.ProductDAO;
import com.speedstyle.prj301.dto.Product;
import com.speedstyle.prj301.dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "ProductManagerControl", urlPatterns = {"/productmanager"})
public class ProductManagerControl extends HttpServlet {

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

            HttpSession ss = request.getSession();
            User us =  (User) ss.getAttribute("LOGIN_USER");
            if (us.getRoleID().equals("0")){
                 response.sendRedirect("logout");
                 return;
            }
            
            String sortCategory ="";
                if(request.getParameter("sortCategory") != null){
                    sortCategory = request.getParameter("sortCategory");
                    if(sortCategory.equals("Biti's")) sortCategory = "Biti''s";
                }
            String search ="";
                if(request.getParameter("search") != null){
                    search = request.getParameter("search");                 
                }

            ProductDAO dao = new ProductDAO();
            List<Product> categoryL = dao.getCategory();
            request.setAttribute("ListC", categoryL);
            List<Product> list = dao.getAllProduct(sortCategory,search);
            request.setAttribute("listP", list);
            request.setAttribute("search", search);
            RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/ProductManager.jsp");
            rd.forward(request, response);
            

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
