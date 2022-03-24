/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.speedstyle.prj301.controller;

import com.speedstyle.prj301.dao.OrderDAO;
import com.speedstyle.prj301.dao.UserDAO;
import com.speedstyle.prj301.dto.Order;
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
@WebServlet(name = "UserInformationControl", urlPatterns = {"/user_infor"})
public class UserInformationControl extends HttpServlet {

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

        UserDAO dao = new UserDAO();
        HttpSession ss = request.getSession();
        User us =  (User) ss.getAttribute("LOGIN_USER");

        
        String search ="";
            if(request.getParameter("search") != null){
                search = request.getParameter("search");                 
        }
        String User_id ="";
            if(request.getParameter("Uid") != null){
                User_id = request.getParameter("Uid");                 
        }
        
        OrderDAO Odao = new OrderDAO();
        User listU = dao.getUserInformation(User_id);
        request.setAttribute("InforU", listU);
        List<Order> listO = Odao.getAllOrderOfUser(listU.getUserID(),search);
        request.setAttribute("listO", listO);

        request.getRequestDispatcher("/View/Admin/UserInformation.jsp").forward(request, response);
       
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
