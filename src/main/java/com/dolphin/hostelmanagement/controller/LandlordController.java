/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.ContractDAO;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.InvoiceDAO;
import com.dolphin.hostelmanagement.DAO.RoomDAO;
import com.dolphin.hostelmanagement.DAO.RoomTypeDAO;
import com.dolphin.hostelmanagement.DAO.ServiceDAO;
import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Invoice;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.RoomType;
import com.dolphin.hostelmanagement.DTO.Service;
import com.dolphin.hostelmanagement.DTO.ServiceDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
        int kq[] = new int[7];
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
            kq[6] += invoice.getTotalPrice();
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
            List<Hostel> hostelList = HostelDAO.findByLandlord(landlord.getAccount().getAccountID());
            if (path.equals("/overview")) {
                Hostel currentHostel = hostelList.get(0);
                if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    currentHostel = HostelDAO.findById(hostelId);
                }
                request.setAttribute("currentHostel", currentHostel);
                request.setAttribute("hostelList", hostelList);
                request.getRequestDispatcher("/view/LOverView.jsp").forward(request, response);
            } else if (path.equals("/contract-list")) {
                int hostelId = hostelList.get(0).getHostelID();
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
            } else if (path.equals("/contract-detail")) {
                int contractId = Integer.parseInt(request.getParameter("contractId"));
                Contract contract = ContractDAO.findByID(contractId);

                List<Invoice> invoiceList = InvoiceDAO.findByContract(contract.getContractID());
                int startElectrict = 0;
                int endElectrict = 0;
                int totalElectric = 0;
                int startWater = 0;
                int endWater = 0;
                int totalWater = 0;
                int totalAll = 0;
                if (invoiceList.size() > 0) {
                    int kq[] = new int[7];
                    kq = statisticElectrictWater(invoiceList);
                    startElectrict = kq[0];
                    endElectrict = kq[1];
                    totalElectric = kq[2];
                    startWater = kq[3];
                    endWater = kq[4];
                    totalWater = kq[5];
                    totalAll = kq[6];
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
            } else if (path.equals("/room-type")) {
                Hostel currentHostel;
                List<RoomType> roomTypeList;
                RoomType currentRoomType;
                if (request.getParameter("roomTypeId") != null) {
                    int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
                    currentRoomType = RoomTypeDAO.findByID(roomTypeId);
                    currentHostel = currentRoomType.getHostel();
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                } else if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    currentHostel = HostelDAO.findById(hostelId);
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                    currentRoomType = roomTypeList.get(0);
                } else {
                    currentHostel = hostelList.get(0);
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                    currentRoomType = roomTypeList.get(0);
                }
                List<Room> roomList = RoomDAO.findByRoomTypeID(currentRoomType.getRoomTypeID());
                request.setAttribute("currentRoomType", currentRoomType);
                request.setAttribute("roomTypeList", roomTypeList);
                request.setAttribute("roomList", roomList);
                request.setAttribute("currentHostel", currentHostel);
                request.setAttribute("hostelList", hostelList);
                request.getRequestDispatcher("/view/LRoomType.jsp").forward(request, response);
            } else if (path.equals("/room-list")) {
                request.getRequestDispatcher("/view/LRoomList.jsp").forward(request, response);
            } else if (path.equals("/room-detail")) {
                Hostel currentHostel = hostelList.get(0);
                Room currentRoom;
                if (request.getParameter("roomId") != null) {
                    int roomId = Integer.parseInt(request.getParameter("roomId"));
                    currentRoom = RoomDAO.findByID(roomId);
                    currentHostel = currentRoom.getRoomType().getHostel();
                } else if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    currentHostel = HostelDAO.findById(hostelId);
                    RoomType roomtype = RoomTypeDAO.findByHostelID(currentHostel.getHostelID()).get(0);
                    currentRoom = RoomDAO.findByRoomTypeID(roomtype.getRoomTypeID()).get(0);
                } else {
                    RoomType roomtype = RoomTypeDAO.findByHostelID(currentHostel.getHostelID()).get(0);
                    currentRoom = RoomDAO.findByRoomTypeID(roomtype.getRoomTypeID()).get(0);
                }
                List<RoomType> roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                List<Room> roomList = RoomDAO.findByRoomHostelID(currentHostel.getHostelID());
                Contract contract = ContractDAO.findActiveContractByRoomID(currentRoom.getRoomID());
                request.setAttribute("contract", contract);
                request.setAttribute("roomTypeList", roomTypeList);
                request.setAttribute("currentRoom", currentRoom);
                request.setAttribute("roomList", roomList);
                request.setAttribute("currentHostel", currentHostel);
                request.setAttribute("hostelList", hostelList);
                request.getRequestDispatcher("/view/LRoomDetail.jsp").forward(request, response);
            } else if (path.equals("/invoice-list")) {
                request.getRequestDispatcher("/view/LInvoiceList.jsp").forward(request, response);
            } else if (path.equals("/invoice-detail")) {
                request.getRequestDispatcher("/view/LInvoiceDetail.jsp").forward(request, response);
            } else if (path.equals("/add-invoice")) {
                request.getRequestDispatcher("/view/LAddInvoice.jsp").forward(request, response);
            } else if (path.equals("/notification")) {
                request.getRequestDispatcher("/view/LNotification.jsp").forward(request, response);
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
