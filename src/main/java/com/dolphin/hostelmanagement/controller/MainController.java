/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DTO.Tenant;
import java.awt.Desktop;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vu Thien An - SE160296
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            System.out.println("action: " + action);
            switch (action) {
                case "LoginForm":
                    url = "/view/login.jsp";
                    break;
                case "RegisterForm":
                    url = "/view/register.jsp";
                    break;
                case "Register":
                    url = "/RegisterServlet";
                    break;
                case "Login":
                    url = "/LoginServlet";
                    break;
                case "Save":
                    url = "/UpdateAccountServlet";
                    break;
                case "SendOTP":
                    url = "/SendOTPServlet";
                    break;
                case "ResetPwd":
                    url = "/SendNewPasswordServlet";
                    break;
                case "Change Display":
                    url = "/ChangeDisplayServlet";
                    break;
                case "ChangePasswordPage":
                    url = "/view/changePassword.jsp";
                    break;
                case "Change password":
                    //HttpSession session = request.getSession(true);
                    //Tenant tmp = (Tenant) session.getAttribute("currentUser");
                    //System.out.println("djasdisa: " + tmp.getFullname() + tmp.getPhone() + "controller");
                    url = "/ChangePasswordServlet";
                    //System.out.println(action.compareTo("Change password"));
                    break;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            System.out.println("URL: " + url);
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
