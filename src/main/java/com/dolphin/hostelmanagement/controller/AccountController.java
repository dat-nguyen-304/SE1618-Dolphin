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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AccountController extends HttpServlet {

    private static final String ERROR = "error.jsp";

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
        String path = request.getPathInfo();
        if (path == null) {
            url = ERROR;
        } else if (path.equals("/changePasswordPage")) {
            url = "/view/changePassword.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else if (path.equals("/userProfilePage")) {
            url = "/view/userProfile.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else if (path.equals("/changePassword")) {
            try {
                HttpSession session = request.getSession(true);
                String currentPassword = (String) request.getParameter("currentPwd");
                String newPassword = (String) request.getParameter("newPwd");
                String newPasswordConfirm = (String) request.getParameter("newPwdConfirm");

                System.out.println("Current pwd: " + currentPassword);
                System.out.println("New pwd: " + newPassword);
                System.out.println("Newc pwd: " + newPasswordConfirm);
                int role = (int) session.getAttribute("role");
                url = "/view/changePassword.jsp";
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
                if (acc.getPassword().compareTo(currentPassword) != 0) {
                    request.setAttribute("errorMessage", "Wrong current password!");
                } else if (newPassword.compareTo(newPasswordConfirm) != 0) {
                    request.setAttribute("errorMessage", "New passwords don't match!");
                } else {
                    request.setAttribute("errorMessage", "Successfully changed password!");
                    AccountDAO.changePassword(acc.getAccountID(), newPassword);
                    acc.setPassword(newPassword);
                }

                //url = "/view/changePassword.jsp";
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
        } else if (path.equals(
                "/changeProfilePage")) {
            url = "/view/changeProfile.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } else if (path.equals(
                "/hostelListPage")) {
            url = "/view/hostelList.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } else if (path.equals(
                "/checkUsername")) {
            String username = request.getParameter("username");
            try {
                String servletResponse = "";
                if (AccountDAO.checkUsername(username)) {
                    servletResponse = "Username đã được dùng!";
                }
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(servletResponse);
                out.flush();
            } catch (Exception e) {
                e.getMessage();
            }
        } else if (path.equals(
                "/checkEmail")) {
            String email = request.getParameter("email").trim();
            try {
                String servletResponse = "";
                if (AccountDAO.checkEmail(email)) {
                    servletResponse = "Email đã được dùng!";
                }
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(servletResponse);
                out.flush();
            } catch (Exception e) {
                e.getMessage();
            }
        } else if (path.equals(
                "/logout")) {
            System.out.println("This is log out");
            HttpSession session = request.getSession();
            session.invalidate();
            //request.getRequestDispatcher("/view/homepage.jsp").forward(request, response);
            response.sendRedirect("../");
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
