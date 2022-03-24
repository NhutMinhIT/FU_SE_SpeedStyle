/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.speedstyle.prj301.controller;

import com.speedstyle.prj301.dao.UserDAO;
import com.speedstyle.prj301.dto.User;
import java.io.IOException;
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
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {
    private static final String SUCCESS = "/View/home.jsp";
    private static final String ERROR = "/View/signin.jsp";

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
        String url = ERROR;
        String err = "";
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username.isEmpty() || password.isEmpty()) {
                err = "Username and password must not empty";
                request.setAttribute("ERROR_LOGIN", err);
            } else {
                UserDAO dao = new UserDAO();
                User user = dao.checkLogin(username, password);
               if (user != null) {
                    url = SUCCESS;
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", user);
                    
                } else {
                    err = "The account name or password that you have entered is incorrect";
                    request.setAttribute("ERROR_LOGIN", err);
                }
            }
            if(!err.isEmpty()){
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
        } catch (Exception e) {
        } finally{
            if(url==ERROR){
                request.getRequestDispatcher(url).forward(request, response);
            }else{
                response.sendRedirect(request.getContextPath()+"/home");
            }       
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
