package com.dolphin.hostelmanagement.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.dolphin.hostelmanagement.DAO.ContractDAO;
import com.dolphin.hostelmanagement.DAO.InvoiceDAO;
import com.dolphin.hostelmanagement.DAO.RoomDAO;
import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Invoice;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.RoomResident;
import com.dolphin.hostelmanagement.DTO.Tenant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class TenantController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String url = ERROR;
            String path = request.getPathInfo();
            System.out.println("Path: " + path);
            HttpSession session = request.getSession();
            if (path.equals("/dashboard")) {
                Tenant t = (Tenant) session.getAttribute("currentUser");
                Contract contract = ContractDAO.findActiveContract(t);
                Landlord landlord = contract.getLandlord();
                Room room = contract.getRoom();
                Hostel hostel = contract.getHostel();
                List<Invoice> invoiceList = InvoiceDAO.findByContract(contract);
                List<RoomResident> residentList = RoomDAO.findResidentByRoom(room);
                request.setAttribute("hostel", hostel);
                request.setAttribute("landlord", landlord);
                request.setAttribute("room", room);
                request.setAttribute("invoiceList", invoiceList);
                request.setAttribute("residentList", residentList);
                url = "/view/rentedTenantPage.jsp";
                request.getRequestDispatcher(url).forward(request, response);
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
