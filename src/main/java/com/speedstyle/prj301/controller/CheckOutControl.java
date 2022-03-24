/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.speedstyle.prj301.controller;

import com.speedstyle.prj301.dao.ProductDAO;
import com.speedstyle.prj301.dao.OrderDAO;
import com.speedstyle.prj301.dto.Cart;
import com.speedstyle.prj301.dto.Product;
import com.speedstyle.prj301.dto.ProductCart;
import com.speedstyle.prj301.dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author avillX
 */
@WebServlet(name = "CheckOutControl", urlPatterns = {"/checkout"})
public class CheckOutControl extends HttpServlet {

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
            ss.removeAttribute("CART");
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
        ProductDAO dao = new ProductDAO();
        OrderDAO Odao = new OrderDAO();
        List<Product> list = dao.getAllProduct("","");
        Cookie arr[] = request.getCookies();
        String txt = "",total="";
        if(arr!=null){
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        User NewUs = new User("404","g"," "," "," "," "," ","0");
        Cart cart = new Cart(txt,list);
        List<ProductCart> pList = cart.getProductCart();
        HttpSession ss = request.getSession();
        User us =  (User) ss.getAttribute("LOGIN_USER");
        if(us != null){
            NewUs = us;
        }
        if(request.getParameter("total")!=null && !request.getParameter("total").equals("")){
            total = request.getParameter("total");
        }
        if(request.getParameter("fullname")!=null && !request.getParameter("fullname").equals("")){
            NewUs.setFullname(request.getParameter("fullname"));
        }
        if(request.getParameter("phone")!=null && !request.getParameter("phone").equals("")){
            NewUs.setPhone(request.getParameter("phone"));
        }
        if(request.getParameter("address")!=null && !request.getParameter("address").equals("")){
            NewUs.setAddress(request.getParameter("address"));
        }
        Odao.addOrder(NewUs, pList, NewUs.getFullname(), Double.parseDouble(total));
        Cookie c = new Cookie("cart","");
        c.setMaxAge(0);
        response.addCookie(c);
            
        request.getRequestDispatcher("shop").forward(request, response);

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
