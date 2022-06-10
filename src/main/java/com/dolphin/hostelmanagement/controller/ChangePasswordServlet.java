/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.AccountDAO;
import com.dolphin.hostelmanagement.DTO.Account;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Tenant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ChangePasswordServlet extends HttpServlet {

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
        String url = "/view/changePassword.jsp";
        try {
            HttpSession session = request.getSession(true);
            String currentPassword = (String) request.getParameter("currentPwd");
            String newPassword = (String) request.getParameter("newPwd");
            String newPasswordConfirm = (String) request.getParameter("newPwdConfirm");

            //System.out.println("Current pwd: " + currentPassword);
            //System.out.println("New pwd: " + newPassword);
            //System.out.println("Newc pwd: " + newPasswordConfirm);

            int role = (int) session.getAttribute("role");

            //System.out.println("Role: " + role);

            Account acc = null;

            if (role == 1) {
                Tenant t = (Tenant) session.getAttribute("currentUser");
                acc = t.getAccount();
            } else {
                Landlord l = (Landlord) session.getAttribute("currentUser");
                acc = l.getAccount();
            }

            //System.out.println("username: " + acc.getUsername());

            if(acc.getPassword().compareTo(currentPassword) != 0)
                request.setAttribute("errorMessage", "Wrong current password!");
            else if(newPassword.compareTo(newPasswordConfirm) != 0) 
                request.setAttribute("errorMessage", "New passwords don't match!");
            else {
                request.setAttribute("errorMessage", "Successfully changed password!");
                AccountDAO.changePassword(acc.getAccountID(), newPassword);
                acc.setPassword(newPassword);
            }
        } catch (Exception ex) {
            Logger.getLogger(SendNewPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
