/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.BookingRequestDAO;
import com.dolphin.hostelmanagement.DAO.ContractDAO;
import com.dolphin.hostelmanagement.DAO.RoomTypeDAO;
import com.dolphin.hostelmanagement.DTO.BookingRequest;
import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Notification;
import com.dolphin.hostelmanagement.DTO.RoomType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
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
public class LandlordController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            String path = request.getPathInfo();
            System.out.println("Path: " + path);
            HttpSession session = request.getSession();
            Landlord l = (Landlord) session.getAttribute("currentUser");
            List<Contract> contractList = ContractDAO.findByLandlord(l);

            if (path.equals("/contractList")) {

                request.setAttribute("contractList", contractList);
                request.getRequestDispatcher("/view/landlordContractList.jsp").forward(request, response);
            }

            if (path.equals("/rentalRequestList")) { //get by hostel ID
                String queryType = request.getParameter("queryType") == null ? "" : request.getParameter("queryType");
                if (queryType.equals("accept")) {
                    int bookingRequestID = Integer.parseInt(request.getParameter("bookingRequestID"));
                } else if (queryType.equals("reject")) {
                    //change status of booking request from 1 to 0, means rejected request
                    int bookingRequestID = Integer.parseInt(request.getParameter("bookingRequestID"));
                    BookingRequest currentBr = BookingRequestDAO.getBookingRequestByID(bookingRequestID);
                    BookingRequestDAO.changeStatus(bookingRequestID, 0);
                    int hostelID = currentBr.getRoom().getRoomType().getHostel().getHostelID();

                    //end change
                    //send notification to tenant about rejecting 
                    Notification rejectNoti = new Notification();
                    rejectNoti.setToAccount(currentBr.getTenant().getAccount());
                    rejectNoti.setCreatedDate(new Date());
                    rejectNoti.setContent("Yêu cầu xem phòng " + currentBr.getRoom().getRoomNumber()
                            + " ở nhà trọ " + currentBr.getRoom().getRoomType().getHostel().getHostelName()
                            + " của bạn đã bị từ chối. Vui lòng liên lạc với chủ nhà nếu có sự nhầm lẫn!");
                    rejectNoti.setStatus(0);
                    //end send notification to tenant
                    //send notification to landlord 
                    //blank -- maybe it's no need to - Khang, 26/06/2022
                    //end send notification to landlord
                }

                int hostelID = Integer.parseInt(request.getParameter("hostelID") == null ? "0" : request.getParameter("hostelID"));
                request.setAttribute("hostelID", hostelID);

                ArrayList<BookingRequest> bookingList = BookingRequestDAO.getBookingRequestByHostelID(hostelID, 1);
                for (BookingRequest br : bookingList) {
                    System.out.println(br.getRoom().getRoomID());
                    System.out.println(br.getBookingRequestID());
                    System.out.println(br.getTenant().getFullname());
                }
                ArrayList<BookingRequest> invitationList = BookingRequestDAO.getBookingRequestByHostelID(hostelID, 2);

                request.setAttribute("bookingList", bookingList);
                request.setAttribute("invitationList", invitationList);

                request.getRequestDispatcher("/view/landlordRentalRequestPage.jsp").forward(request, response);

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
