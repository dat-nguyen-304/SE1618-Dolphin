/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DTO.Hostel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vu Thien An - SE160296
 */
public class ChangeDisplayServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String displayOption = request.getParameter("displayOption");
            System.out.println("servlet 38 " + displayOption);
            ArrayList<Hostel> allList = (ArrayList<Hostel>) HostelDAO.findAll();
            if (displayOption.equals("all")) {
                request.setAttribute("hostelList", allList);
            } else {
                int numberOnPage = Integer.parseInt(displayOption);
                int n = allList.size();
                ArrayList<Integer> pages = new ArrayList();
                for (int i = 0; i < n / numberOnPage + (n % numberOnPage); i++) {
                    pages.add(i);
                }
                int pageNumber = 1;
                String page_number = request.getParameter("pageNumber");
                System.out.println("line 61 " + page_number);
                if (page_number != null) {
                    pageNumber = Integer.parseInt(page_number);
                }
                ArrayList<Hostel> smallList = new ArrayList();
                for (int i = (pageNumber - 1) * numberOnPage; i < pageNumber * numberOnPage; i++) {
                    if (i >= allList.size()) {
                        break;
                    }
                    smallList.add(allList.get(i));
                }
                System.out.println("Line 63 " + smallList.size());

                request.setAttribute("pageNumber", page_number);
                request.setAttribute("hostelList", smallList);
                request.setAttribute("pages", pages);
            }
            request.getRequestDispatcher("/view/hostelList.jsp").forward(request, response);
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
