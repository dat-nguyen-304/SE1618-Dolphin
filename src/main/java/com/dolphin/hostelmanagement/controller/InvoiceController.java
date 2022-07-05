/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.ContractDAO;
import com.dolphin.hostelmanagement.DAO.InvoiceDAO;
import com.dolphin.hostelmanagement.DAO.ServiceDAO;
import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Invoice;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.NotificationDAO;
import com.dolphin.hostelmanagement.DAO.RoomDAO;
import com.dolphin.hostelmanagement.DTO.Notification;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.Service;
import com.dolphin.hostelmanagement.DTO.ServiceDetail;
import com.dolphin.hostelmanagement.DTO.Tenant;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
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
public class InvoiceController extends HttpServlet {

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
    private SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");

    private void sortByStatus(List<Invoice> invoiceList, int status) {
        switch (status) {
            case 1:
                System.out.println("1");
                for (Iterator<Invoice> iterator = invoiceList.iterator(); iterator.hasNext();) {
                    Invoice next = iterator.next();
                    if (next.getStatus() != 1) {
                        iterator.remove();
                    }
                }
                break;
            case 2:
                System.out.println("2");

                for (Iterator<Invoice> iterator = invoiceList.iterator(); iterator.hasNext();) {
                    Invoice next = iterator.next();
                    if (next.getStatus() != 2) {
                        iterator.remove();
                    }
                }
                break;
            default:
                System.out.println("3");

                for (Iterator<Invoice> iterator = invoiceList.iterator(); iterator.hasNext();) {
                    Invoice next = iterator.next();
                    if (next.getStatus() != 3) {
                        iterator.remove();
                    }
                }
                break;
        }
    }

    private void sortByDate(List<Invoice> invoiceList, Date start, Date end) {
        if (start != null) {
            System.out.println("start");
            System.out.println(start);
            for (Iterator<Invoice> iterator = invoiceList.iterator(); iterator.hasNext();) {
                Invoice next = iterator.next();
                if (next.getStartDate().before(start)) {
                    iterator.remove();
                }
            }
        }
        if (end != null) {
            System.out.println("end");
            System.out.println(end);
            for (Iterator<Invoice> iterator = invoiceList.iterator(); iterator.hasNext();) {
                Invoice next = iterator.next();
                if (next.getEndDate().after(end)) {
                    iterator.remove();
                }
            }
        }
    }

    private void sortFilters(HttpServletRequest request, List<Invoice> invoiceList) throws ParseException {
        if (request.getParameter("sortByStatus") != null) {
            int status = Integer.parseInt(request.getParameter("sortByStatus"));
            System.out.println("status" + status);
            if (status != 0) {
                sortByStatus(invoiceList, status);
            }
        }

        if (request.getParameter("start") != null && !request.getParameter("start").equals("")) {
            String startDate = request.getParameter("start");
            Date start = df.parse(startDate);
            System.out.println("start" + startDate);
            if (request.getParameter("end") != null && !request.getParameter("end").equals("")) {
                String endDate = request.getParameter("end");
                Date end = df.parse(endDate);
                System.out.println("end" + endDate);
                sortByDate(invoiceList, start, end);
            } else {
                sortByDate(invoiceList, start, null);
            }
        } else if (request.getParameter("end") != null && !request.getParameter("end").equals("")) {
            String endDate = request.getParameter("end");
            System.out.println("end" + endDate);
            Date end = df.parse(endDate);
            sortByDate(invoiceList, null, end);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String url = ERROR;
            String path = request.getPathInfo();
            System.out.println("Path: " + path);
            HttpSession session = request.getSession();
            int role = (int) session.getAttribute("role");
            System.out.println("role " + role);
            if (role == 1) {
                Tenant t = (Tenant) session.getAttribute("currentUser");
                List<Contract> contractList = ContractDAO.findByTenant(t);

                if (path.equals("/list")) {
                    if (request.getParameter("resetButton") != null) {
                        System.out.println("Reset!");
                        response.sendRedirect("/sakura/invoice/list");
                    } else {
                        List<Invoice> invoiceList = new ArrayList();
                        for (Contract contract : contractList) {
                            invoiceList.addAll(InvoiceDAO.findByContract(contract.getContractID()));
                        }

                        sortFilters(request, invoiceList);

                        request.setAttribute("invoiceList", invoiceList);
                        request.getRequestDispatcher("/view/tenantPageInvoiceList.jsp").forward(request, response);
                    }
                }

                if (path.equals("/detail")) {
                    if (request.getParameter("invoiceID") != null) {
                        int invoiceID = Integer.parseInt(request.getParameter("invoiceID"));
                        Invoice invoice = InvoiceDAO.findByID(invoiceID);
                        request.setAttribute("invoice", invoice);
                        List<ServiceDetail> detailList = ServiceDAO.findDetailsByInvoice(invoice);
                        request.setAttribute("detailList", detailList);
                        url = "/view/tenantPageInvoiceDetail.jsp";
                    } else {
                        url = "/invoice/list"; //Neu bam vao page ma` khong qua con mat' thi cho no ve list :D
                    }
                    request.getRequestDispatcher(url).forward(request, response);
                }

            } else {

                Landlord l = (Landlord) session.getAttribute("currentUser");
                List<Contract> contractList = ContractDAO.findByLandlord(l);

                if (path.equals("/list")) {
                    List<Invoice> invoiceList = new ArrayList();
                    for (Contract contract : contractList) {
                        invoiceList.addAll(InvoiceDAO.findByContract(contract.getContractID()));
                    }

                    if (request.getParameter("resetButton") != null) {
                        System.out.println("Hellos");
                    } else {
                        sortFilters(request, invoiceList);
                    }

                    request.setAttribute("invoiceList", invoiceList);
                    request.getRequestDispatcher("/view/LInvoiceList.jsp").forward(request, response);
                }

                if (path.equals("/detail")) {
                    if (request.getParameter("invoiceID") != null) {
                        int invoiceID = Integer.parseInt(request.getParameter("invoiceID"));
                        Invoice invoice = InvoiceDAO.findByID(invoiceID);
                        request.setAttribute("invoice", invoice);
                        List<ServiceDetail> detailList = ServiceDAO.findDetailsByInvoice(invoice);
                        request.setAttribute("detailList", detailList);
                        url = "/view/LInvoiceDetail.jsp";
                    } else {
                        url = "/invoice/list"; //Neu bam vao page ma` khong qua con mat' thi cho no ve list :D
                    }
                    request.getRequestDispatcher(url).forward(request, response);
                }

                if (path.equals("/new")) {
                    List<Hostel> hostelList = HostelDAO.findByLandlordObject(l);
                    request.setAttribute("hostelList", hostelList);
                    List<Service> activeServices = new ArrayList();
//                    String chosenHostelID = request.getParameter("hostelID");
                    String chosenRoomID = request.getParameter("roomID");
                    if (chosenRoomID != null) {
                        Room chosenRoom = RoomDAO.findRoomNewInvoice(Integer.parseInt(chosenRoomID));
                        System.out.println("230 " + chosenRoom.getLatestInvoiceMonth());
                        Hostel hostel = chosenRoom.getRoomType().getHostel();
                        request.setAttribute("chosenHostel", hostel);
                        request.setAttribute("chosenRoom", chosenRoom);
                        activeServices = ServiceDAO.findHostelActiveServices(hostel);
                        List<Room> roomNoInvoiceList = RoomDAO.findRoomsNeedInvoice(hostel.getHostelID());
                        if (roomNoInvoiceList != null) {
                            request.setAttribute("noInvoiceList", roomNoInvoiceList);
                        }

                        Contract contract = ContractDAO.findActiveContractByRoomID(Integer.parseInt(chosenRoomID));
                        request.setAttribute("contract", contract);

                        request.setAttribute("activeServices", activeServices);
                    }
                    request.getRequestDispatcher("/view/LAddInvoice_v2.jsp").forward(request, response);
                }

                if (path.equals("/save")) {
                    int roomID = Integer.parseInt(request.getParameter("chosenRoomID"));
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");
                    String month = request.getParameter("invoice-month");
                    int totalPrice = Integer.parseInt(request.getParameter("invoiceSum"));
                    int contractID = Integer.parseInt(request.getParameter("contractID"));
                    Contract c = ContractDAO.findByID(contractID);
                    Tenant t = c.getTenant();

                    int electricitySum = 0;
                    int waterSum = 0;

                    Room room = RoomDAO.findByID(roomID);

                    List<Service> serviceList = ServiceDAO.findHostelActiveServices(room.getRoomType().getHostel());
                    List<ServiceDetail> detailList = new ArrayList();
                    for (Service service : serviceList) {
                        if (service.getType() == 1) {
                            int startValue = Integer.parseInt(request.getParameter("startInput" + service.getServiceID()));
                            int endValue = Integer.parseInt(request.getParameter("endInput" + service.getServiceID()));
                            int quantity = endValue - startValue;

                            if (service.getServiceName().equalsIgnoreCase("điện")) {
                                electricitySum = quantity * service.getServiceFee();
                            }
                            if (service.getServiceName().equalsIgnoreCase("nước")) {
                                waterSum = quantity * service.getServiceFee();
                            }
                            detailList.add(new ServiceDetail(startValue, endValue, quantity, service));
                        } else {
                            int quantity = Integer.parseInt(request.getParameter("quantity" + service.getServiceID()));
                            detailList.add(new ServiceDetail(0, quantity, quantity, service));
                        }
                    }

                    // Save invoice
                    if (InvoiceDAO.save(startDate, endDate, totalPrice, contractID, month, new Date(), electricitySum, waterSum, detailList, roomID)) {
                        System.out.println("!! SAVED INVOICE !!");
                        url = "/sakura/view/success.jsp";

                        // send notification to tenant
                        Notification noti = new Notification();
                        noti.setToAccount(t.getAccount());
                        noti.setContent("Bạn có hóa đơn mới cho phòng trọ " + room.getRoomNumber());
                        noti.setCreatedDate(new Date());
                        noti.setStatus(0);
                        NotificationDAO.saveNotification(noti);
                    } else {
                        url = "/sakura/view/failure.jsp";
                    }
                    response.sendRedirect(url);
                }

                if (path.equals("/success")) {
                    request.getRequestDispatcher("/view/success.jsp").forward(request, response);
                }
                if (path.equals("/failure")) {
                    request.getRequestDispatcher("/view/failure.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InvoiceController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InvoiceController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
