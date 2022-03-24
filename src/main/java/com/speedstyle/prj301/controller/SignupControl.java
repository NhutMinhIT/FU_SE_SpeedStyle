/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.speedstyle.prj301.controller;

import com.speedstyle.prj301.dao.UserDAO;
import com.speedstyle.prj301.dto.User;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "SignupControl", urlPatterns = {"/signup"})
public class SignupControl extends HttpServlet {

    private static final String ERROR = "/View/signup.jsp";
    private static final String SUCCESS = "login";

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
        String URL = ERROR;
        String err = "";
        boolean checkValidation = true;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username.isEmpty() || password.isEmpty()) {
                err = "Username and password must not empty";
                request.setAttribute("MSG_SIGNUP", err);
                checkValidation = false;
            } else {
                UserDAO dao = new UserDAO();
                User user = dao.checkLoginByUserName(username);
                if (user == null) {                  
                    dao.signUp(username, password);
                    err = "The account had created.";
                    request.setAttribute("MSG_SIGNUP", err);

                } else {
                    err = "Username already exists.";
                    request.setAttribute("MSG_SIGNUP", err);
                    checkValidation = false;
                }
            }
        } catch (Exception e) {
        } finally {
            if (URL == ERROR) {
                request.getRequestDispatcher(URL).forward(request, response);
            } else {
                response.sendRedirect(SUCCESS);
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
