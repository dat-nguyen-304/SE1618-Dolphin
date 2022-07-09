package com.dolphin.hostelmanagement.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.dolphin.hostelmanagement.DAO.BookingRequestDAO;
import com.dolphin.hostelmanagement.DAO.ContractDAO;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.InvoiceDAO;
import com.dolphin.hostelmanagement.DAO.NotificationDAO;
import com.dolphin.hostelmanagement.DAO.RoomDAO;
import com.dolphin.hostelmanagement.DAO.RoomResidentDAO;
import com.dolphin.hostelmanagement.DAO.TenantDAO;
import com.dolphin.hostelmanagement.DTO.BookingRequest;
import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Invoice;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Notification;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.RoomResident;
import com.dolphin.hostelmanagement.DTO.Tenant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
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
            HttpSession session = request.getSession(true);
            Tenant t = (Tenant) session.getAttribute("currentUser");
            List<Contract> contractList = ContractDAO.findByTenant(t);

            if (path.equals("/dashboard")) {
                /*HashMap<Contract, ArrayList<Invoice>> invoiceMap = new HashMap();
                for (Contract contract : contractList) {
                    invoiceMap.put(contract, (ArrayList<Invoice>) InvoiceDAO.findByContract(contract.getContractID()));
                }
                TreeMap<Contract, ArrayList<Invoice>> sorted = new TreeMap<>();
                sorted.putAll(invoiceMap);

                request.setAttribute("contractList", contractList);
                request.setAttribute("invoiceMap", sorted);*/
                Contract currentContract = ContractDAO.findActiveContractByTenant(t);
                if (currentContract == null) {
                    request.getRequestDispatcher("/view/tenantPage.jsp").forward(request, response);
                }
                ArrayList<RoomResident> roomResidentList = RoomResidentDAO.findByRoom(currentContract.getRoom());
                Invoice latestInvoice = InvoiceDAO.findLatestByContract(currentContract);

                //currentContract
                session.setAttribute("currentContract", currentContract);
                session.setAttribute("roomResidentList", roomResidentList);
                session.setAttribute("latestInvoice", latestInvoice);

                //currentContract.getHostel().getDistrict()
                request.getRequestDispatcher("/view/tenantPage.jsp").forward(request, response);
            }

            if (path.equals("/invoiceList")) {

                List<Invoice> invoiceList = new ArrayList();
                for (Contract contract : contractList) {
                    invoiceList.addAll(InvoiceDAO.findByContract(contract.getContractID()));
                }
                request.setAttribute("invoiceList", invoiceList);

                request.getRequestDispatcher("/view/tenantPageInvoiceList.jsp").forward(request, response);
            }

            if (path.equals("/rentalRequestList")) {
                if (request.getParameter("queryType") == null) {
                    ArrayList<BookingRequest> bookingList = BookingRequestDAO.getBookingRequestByTenant(t, 1);
                    ArrayList<BookingRequest> invitationList = BookingRequestDAO.getBookingRequestByTenant(t, 2);

                    request.setAttribute("bookingList", bookingList);
                    request.setAttribute("invitationList", invitationList);

                    request.getRequestDispatcher("/view/tenantRentalRequestPage.jsp").forward(request, response);
                } else if (request.getParameter("queryType").equals("accept")) {
                    int contractID = Integer.parseInt(request.getParameter("contractID"));
                    Contract contract = ContractDAO.findByID(contractID);
                    ContractDAO.changeStatus(contractID, 1);
                    BookingRequestDAO.removeAllByTenantID(t.getAccount().getAccountID());
                    RoomDAO.changeStatus(contract.getRoom().getRoomID(), 2);
                    TenantDAO.changeStatus(t.getAccount().getAccountID(), true);
                    
                    //send accept notification to landlord
                    Notification landlordNoti = new Notification();

                    landlordNoti.setToAccount(contract.getLandlord().getAccount());
                    landlordNoti.setCreatedDate(new Date());
                    landlordNoti.setContent(t.getFullname() + " đã đồng ý hợp đồng thuê nhà ở phòng " + contract.getRoom().getRoomNumber()
                            + ", nhà trọ " + contract.getHostel().getHostelName());

                    landlordNoti.setStatus(0); //0 means unread
                    boolean check = NotificationDAO.saveNotification(landlordNoti);
                    //end send accept notification to landlord

                    //send accept notification to landlord
                    Notification tenantNoti = new Notification();

                    tenantNoti.setToAccount(t.getAccount());
                    tenantNoti.setCreatedDate(new Date());
                    tenantNoti.setContent("Bạn đã đồng ý hợp đồng thuê nhà ở phòng " + contract.getRoom().getRoomNumber()
                            + ", nhà trọ " + contract.getHostel().getHostelName());

                    tenantNoti.setStatus(0); //0 means unread
                    check = NotificationDAO.saveNotification(tenantNoti);
                    //end send accept notification to landlord   
                    response.sendRedirect("/sakura/tenant/dashboard");
                } else if (request.getParameter("queryType").equals("refuse")) {
                    int contractID = Integer.parseInt(request.getParameter("contractID"));
//                    ContractDAO.changeStatus(contractID, 0);
                    response.sendRedirect("/sakura/tenant/dashboard");
                }
            }

            if (path.equals("/notifications")) {
                List<Notification> notiList = NotificationDAO.getNotificationByToAccount(t.getAccount());
                for (Notification notification : notiList) {
                    System.out.println(notification);
                }
                request.setAttribute("notificationList", notiList);
                request.getRequestDispatcher("/view/tenantPageNotiList.jsp").forward(request, response);
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
