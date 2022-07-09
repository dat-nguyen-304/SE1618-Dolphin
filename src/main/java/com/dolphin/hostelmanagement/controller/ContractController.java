/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.BookingRequestDAO;
import com.dolphin.hostelmanagement.DAO.ContractDAO;
import com.dolphin.hostelmanagement.DAO.RoomDAO;
import com.dolphin.hostelmanagement.DAO.TenantDAO;
import com.dolphin.hostelmanagement.DTO.BookingRequest;
import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.Tenant;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ContractController extends HttpServlet {

    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String url = ERROR;
            String path = request.getPathInfo();
            System.out.println("Path: " + path);

            if (path.equals("/add-contract")) {
                if (request.getParameter("queryType") == null) {
                    int bookingRequestID = Integer.parseInt(request.getParameter("bookingRequestID"));
                    BookingRequest br = BookingRequestDAO.getBookingRequestByID(bookingRequestID);
                    request.setAttribute("bookingRequest", br);
                    ArrayList<Room> roomList = RoomDAO.findByRoomTypeID(br.getRoomType().getRoomTypeID());
                    request.setAttribute("roomList", roomList);
                    request.getRequestDispatcher("/view/addContract.jsp").forward(request, response);
                } else if (request.getParameter("queryType").equals("add")) {
                    int bookingRequestID = Integer.parseInt(request.getParameter("bookingRequestID"));
                    int rentalFeePerMonth = Integer.parseInt(request.getParameter("rentalFeePerMonth"));
                    int deposit = Integer.parseInt(request.getParameter("deposit"));
                    Tenant t = TenantDAO.findById(Integer.parseInt(request.getParameter("tenantID")));
                    Room r = RoomDAO.findByID(Integer.parseInt(request.getParameter("roomID")));

                    String description = request.getParameter("description");

                    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

                    System.out.println(request.getParameter("startDate"));
                    Date startDate = null;
                    Date endDate = null;
                    try {
                        startDate = format.parse(request.getParameter("startDate"));
                        endDate = format.parse(request.getParameter("endDate"));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    int duration = Integer.parseInt(request.getParameter("duration"));
                    Date createdDate = new Date();
                    Contract c = new Contract(bookingRequestID, r, t, null, null, startDate, endDate,
                            deposit, 2, rentalFeePerMonth, description, duration, createdDate);
                    if(ContractDAO.findByID(bookingRequestID) == null)
                        ContractDAO.save(c);
                    else ContractDAO.updateContract(c);
//                    
                    //change booking request status
                    //BookingRequestDAO.disableByRoomID(c.getRoom().getRoomID()); //reject all booking request
                    System.out.println("Booking: " + bookingRequestID);
                    BookingRequestDAO.changeStatus(bookingRequestID, 2); //then accept this request only
                    BookingRequestDAO.changeCreatedDate(bookingRequestID, new Date());

                    //disable all booking request of this room
                    //end disable
                    //redirect
                    int hostelID = r.getRoomType().getHostel().getHostelID();
                    response.sendRedirect("/sakura/landlord/rentalRequestList?hostelID=" + hostelID);

                } else if (request.getParameter("queryType").equals("edit")) {
                    System.out.println("????");
                    int contractID = Integer.parseInt(request.getParameter("contractID"));

                    BookingRequest br = BookingRequestDAO.getBookingRequestByID(contractID);
                    request.setAttribute("bookingRequest", br);
                    ArrayList<Room> roomList = RoomDAO.findByRoomTypeID(br.getRoomType().getRoomTypeID());
                    request.setAttribute("roomList", roomList);
                    
                    
                    Contract c = ContractDAO.findByID(contractID);
                    
                    SimpleDateFormat ymdFormat = new SimpleDateFormat("dd/MM/yyyy");
                    String startDate = ymdFormat.format(c.getStartDate());
                    String endDate = ymdFormat.format(c.getEndDate());
                    
                    request.setAttribute("editContract", c);
                    request.setAttribute("startDate", startDate);
                    request.setAttribute("endDate", endDate);

                    request.getRequestDispatcher("/view/addContract.jsp").forward(request, response);
                }
            }

            if (path.equals("/end-contract")) {
                int endContractId = Integer.parseInt(request.getParameter("endContractId"));
                boolean endContractSuccess = ContractDAO.endContractById(endContractId);
                if (endContractSuccess) {
                    out.print("Cập nhật thành công");
                } else {
                    out.print("Cập nhật thất bại");
                }
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
