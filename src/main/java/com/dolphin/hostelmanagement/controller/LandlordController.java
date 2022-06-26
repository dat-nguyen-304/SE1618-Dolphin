/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.BookingRequestDAO;
import com.dolphin.hostelmanagement.DAO.ContractDAO;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.InvoiceDAO;
import com.dolphin.hostelmanagement.DAO.RoomTypeDAO;
import com.dolphin.hostelmanagement.DAO.ServiceDAO;
import com.dolphin.hostelmanagement.DTO.BookingRequest;
import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Invoice;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Notification;
import com.dolphin.hostelmanagement.DTO.RoomType;
import com.dolphin.hostelmanagement.DTO.ServiceDetail;
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
    public int[] statisticElectrictWater(List<Invoice> invoiceList) {
        int kq[] = new int[6];
        Invoice firstInvoice = invoiceList.get(invoiceList.size() - 1);
        List<ServiceDetail> serviceDetailList = ServiceDAO.findDetailsByInvoice(firstInvoice.getInvoiceID());
        for (ServiceDetail serviceDetail : serviceDetailList) {
            if (serviceDetail.getService().getServiceName().equals("Điện")) {
                kq[0] = serviceDetail.getStartValue();
            }
            if (serviceDetail.getService().getServiceName().equals("Nước")) {
                kq[3] = serviceDetail.getStartValue();
            }
        }
        Invoice lastInvoice = invoiceList.get(0);
        serviceDetailList = ServiceDAO.findDetailsByInvoice(lastInvoice.getInvoiceID());
        for (ServiceDetail serviceDetail : serviceDetailList) {
            if (serviceDetail.getService().getServiceName().equals("Điện")) {
                kq[1] = serviceDetail.getEndValue();
            }
            if (serviceDetail.getService().getServiceName().equals("Nước")) {
                kq[4] = serviceDetail.getEndValue();
            }
        }
        for (Invoice invoice : invoiceList) {
            kq[2] += invoice.getElectricPrice();
            kq[5] += invoice.getWaterPrice();
        }
        return kq;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String path = request.getPathInfo();
            System.out.println("Path: " + path);
            HttpSession session = request.getSession();
            Landlord landlord = (Landlord) session.getAttribute("currentUser");
            List<Hostel> listHostel = HostelDAO.findByLandlord(landlord.getAccount().getAccountID());
            if (path.equals("/contract-list")) {
                int hostelId = listHostel.get(0).getHostelID();
                int roomId = 0;
                if (request.getParameter("roomId") != null) {
                    roomId = Integer.parseInt(request.getParameter("roomId"));
                }
                if (request.getParameter("hostelId") != null) {
                    hostelId = Integer.parseInt(request.getParameter("hostelId"));
                }

                List<Contract> contractList = ContractDAO.findByHostel(hostelId);
                if (roomId != 0) {
                    contractList = ContractDAO.findByRoom(roomId);
                }
                System.out.println("----------------------------" + hostelId + "--------------------------------");
                request.setAttribute("contractList", contractList);
                request.getRequestDispatcher("/view/LContractList.jsp").forward(request, response);
            }

            if (path.equals("/contract-detail")) {
                int contractId = Integer.parseInt(request.getParameter("contractId"));
                Contract contract = ContractDAO.findByID(contractId);

                List<Invoice> invoiceList = InvoiceDAO.findByContract(contract.getContractID());
                int startElectrict = 0;
                int endElectrict = 0;
                int totalElectric = 0;
                int startWater = 0;
                int endWater = 0;
                int totalWater = 0;
                if (invoiceList.size() > 0) {
                    int kq[] = new int[6];
                    kq = statisticElectrictWater(invoiceList);
                    startElectrict = kq[0];
                    endElectrict = kq[1];
                    totalElectric = kq[2];
                    startWater = kq[3];
                    endWater = kq[4];
                    totalWater = kq[5];
                }
                int totalAll = 0;
                for (Invoice invoice : invoiceList) {
                    totalAll += invoice.getTotalPrice();
                }
                request.setAttribute("startElectrict", startElectrict);
                request.setAttribute("endElectrict", endElectrict);
                request.setAttribute("totalElectric", totalElectric);
                request.setAttribute("startWater", startWater);
                request.setAttribute("endWater", endWater);
                request.setAttribute("totalWater", totalWater);
                request.setAttribute("totalAll", totalAll);
                request.setAttribute("invoiceList", invoiceList);
                request.setAttribute("contract", contract);
                request.getRequestDispatcher("/view/LContractDetail.jsp").forward(request, response);
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
