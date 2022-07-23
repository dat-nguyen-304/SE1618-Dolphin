/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.*;
import com.dolphin.hostelmanagement.DTO.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
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
    private SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
    private SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");

    private void sortByStatus(List<Invoice> invoiceList, int status) {
        switch (status) {
            case 0:
                for (Iterator<Invoice> iterator = invoiceList.iterator(); iterator.hasNext();) {
                    Invoice next = iterator.next();
                    if (next.getStatus() != 0) {
                        iterator.remove();
                    }
                }
                break;
            case 1:
                for (Iterator<Invoice> iterator = invoiceList.iterator(); iterator.hasNext();) {
                    Invoice next = iterator.next();
                    if (next.getStatus() != 1) {
                        iterator.remove();
                    }
                }
                break;
        }
    }

    private void sortByDate(List<Invoice> invoiceList, Date start, Date end) {
        if (start != null) {
            for (Iterator<Invoice> iterator = invoiceList.iterator(); iterator.hasNext();) {
                Invoice next = iterator.next();
                if (next.getStartDate().before(start)) {
                    iterator.remove();
                }
            }
        }
        if (end != null) {
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
            if (status != -1) {
                sortByStatus(invoiceList, status);
            }
        }

        if (request.getParameter("start") != null && !request.getParameter("start").equals("")) {
            String startDate = request.getParameter("start");
            Date start = df.parse(startDate);
            if (request.getParameter("end") != null && !request.getParameter("end").equals("")) {
                String endDate = request.getParameter("end");
                Date end = df.parse(endDate);
                sortByDate(invoiceList, start, end);
            } else {
                sortByDate(invoiceList, start, null);
            }
        } else if (request.getParameter("end") != null && !request.getParameter("end").equals("")) {
            String endDate = request.getParameter("end");
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
                    }
                    request.getRequestDispatcher("/view/tenantPageInvoiceList.jsp").forward(request, response);
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

                if (path.equals("/list")) {
                    Room chosenRoom = null;
                    Hostel chosenHostel = null;
                    List<Invoice> invoiceList = null;
                    if (request.getParameter("hostelID") == null) {
                        chosenHostel = (session.getAttribute("currentHostel") != null) ? (Hostel) session.getAttribute("currentHostel") : null;
                    } else {
                        chosenHostel = HostelDAO.findById(Integer.parseInt(request.getParameter("hostelID")));
                    }
                    if (chosenHostel != null) {
                        if (request.getParameter("roomID") != null) {
                            int roomID = Integer.parseInt(request.getParameter("roomID"));
                            if (roomID != 0) {
                                chosenRoom = RoomDAO.findByID(roomID);
                                chosenHostel = chosenRoom.getRoomType().getHostel();
                                invoiceList = InvoiceDAO.findByRoomID(chosenRoom.getRoomID());
                                request.setAttribute("chosenRoom", chosenRoom);
                            } else {
                                int hostelID = Integer.parseInt(request.getParameter("hostelID"));
                                chosenHostel = HostelDAO.findById(hostelID);
                                invoiceList = InvoiceDAO.findByHostelID(chosenHostel.getHostelID());
                                request.setAttribute("chosenRoom", new Room());
                            }
                            request.setAttribute("invoiceList", invoiceList);
                        } 
                        else request.setAttribute("invoiceList", InvoiceDAO.findByHostelID(chosenHostel.getHostelID()));
                        request.setAttribute("roomList", RoomDAO.findByHostelID(chosenHostel.getHostelID()));
                    }
                    request.setAttribute("chosenHostel", chosenHostel);
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
                    List<Service> activeServices = new ArrayList();
                    String chosenRoomID = request.getParameter("roomID");
                    Hostel chosenHostel = null;
                    if (request.getParameter("chosenHostel") == null && request.getParameter("chosenRoom") == null) {
                        chosenHostel = (Hostel) session.getAttribute("currentHostel");
                    }
                    if (chosenHostel != null) {
                        if (chosenRoomID != null) {
                            Room chosenRoom = RoomDAO.findRoomNewInvoice(Integer.parseInt(chosenRoomID));
                            chosenHostel = chosenRoom.getRoomType().getHostel();
                            request.setAttribute("chosenRoom", chosenRoom);
                            Contract contract = ContractDAO.findActiveContractByRoomID(Integer.parseInt(chosenRoomID));
                            if (chosenRoom.getLatestInvoiceMonth() == null) {
                                String firstMonth = df2.format(contract.getStartDate());
                                firstMonth = firstMonth.substring(0, firstMonth.lastIndexOf('-'));
                                YearMonth firstMonthYM = YearMonth.parse(firstMonth);
                                activeServices = ServiceDAO.findServiceByRoom(new Room(chosenRoom.getRoomID(), chosenRoom.getRoomNumber(), chosenRoom.getRoomType(), firstMonthYM));
                            } else {
                                activeServices = ServiceDAO.findServiceByRoom(chosenRoom);
                            }
                            if (chosenRoom.getLatestInvoiceMonth() == null) {
                                String startMonth = contract.getStartDate().toString();
                                startMonth = startMonth.substring(0, startMonth.lastIndexOf('-'));
                                request.setAttribute("startMonth", startMonth);
                            } else {
                                Invoice lastInvoice = InvoiceDAO.findLatestByContract(contract);
                                List<ServiceDetail> prevMonthDetails = ServiceDAO.findDetailsByInvoice(lastInvoice);
                                List<Integer> lastMonthValues = new ArrayList();
                                for (Service activeService : activeServices) {
                                    for (ServiceDetail prevMonthDetail : prevMonthDetails) {
                                        if (activeService.getType() != 0 && prevMonthDetail.getService().getServiceName().equalsIgnoreCase(activeService.getServiceName())) {
                                            lastMonthValues.add(prevMonthDetail.getEndValue());
                                        }
                                    }
                                }
                                for (Integer lastMonthValue : lastMonthValues) {
                                    System.out.println(lastMonthValue);
                                }
                                request.setAttribute("prevMonthDetails", prevMonthDetails);
                            }
                            request.setAttribute("contract", contract);
                            request.setAttribute("activeServices", activeServices);
                        }
                        List<Room> roomNoInvoiceList = RoomDAO.findRoomsNeedInvoice(chosenHostel.getHostelID());
                        if (roomNoInvoiceList != null) {
                            request.setAttribute("noInvoiceList", roomNoInvoiceList);
                        }
                    }
                    request.setAttribute("chosenHostel", chosenHostel);
                    request.getRequestDispatcher("/view/LAddInvoice.jsp").forward(request, response);
                }

                if (path.equals("/save")) {
                    int roomID = Integer.parseInt(request.getParameter("chosenRoomID"));
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");
                    String month = request.getParameter("invoice-month");
                    String invoiceMonth = "01/" + month;
                    int totalPrice = Integer.parseInt(request.getParameter("invoiceSum"));
                    int contractID = Integer.parseInt(request.getParameter("contractID"));
                    Contract c = ContractDAO.findByID(contractID);
                    Tenant t = c.getTenant();

                    int electricitySum = 0;
                    int waterSum = 0;

                    Room room = RoomDAO.findRoomNewInvoice(roomID);
                    
                    List<Service> serviceList = new ArrayList();
                    
                    if (room.getLatestInvoiceMonth() == null) {
                                String firstMonth = df2.format(c.getStartDate());
                                firstMonth = firstMonth.substring(0, firstMonth.lastIndexOf('-'));
                                YearMonth firstMonthYM = YearMonth.parse(firstMonth);
                                serviceList = ServiceDAO.findServiceByRoom(new Room(room.getRoomID(), room.getRoomNumber(), room.getRoomType(), firstMonthYM));
                            } else {
                                serviceList = ServiceDAO.findServiceByRoom(room);
                            }
                    List<ServiceDetail> detailList = new ArrayList();
                    for (Service service : serviceList) {
                        if (service.getType() != 0) {
                            int startValue = Integer.parseInt(request.getParameter("startInput" + service.getServiceID()));
                            int endValue = Integer.parseInt(request.getParameter("endInput" + service.getServiceID()));
                            int quantity = endValue - startValue;

                            if (service.getType() == 1) {
                                electricitySum = quantity * service.getServiceFee();
                            }
                            if (service.getType() == 2) {
                                waterSum = quantity * service.getServiceFee();
                            }
                            detailList.add(new ServiceDetail(startValue, endValue, quantity, service));
                        } else {
                            int quantity = Integer.parseInt(request.getParameter("quantity" + service.getServiceID()));
                            detailList.add(new ServiceDetail(0, quantity, quantity, service));
                        }
                    }

                    // Save invoice
                    if (InvoiceDAO.save(startDate, endDate, totalPrice, contractID, month, invoiceMonth, electricitySum, waterSum, detailList, roomID)) {
                        System.out.println("!! SAVED INVOICE !!");
                        url = "/sakura/invoice/success";

                        // send notification to tenant
                        Notification noti = new Notification();
                        noti.setToAccount(t.getAccount());
                        noti.setContent("Bạn có hóa đơn mới cho phòng trọ " + room.getRoomNumber());
                        noti.setCreatedDate(new Date());
                        noti.setStatus(0);
                        NotificationDAO.saveNotification(noti);
                    } else {
                        url = "/sakura/invoice/failure";
                    }
                    response.sendRedirect(url);
                }

                if (path.equals("/search")) {
                    String hostelID = request.getParameter("hostelID");
                    String roomID = request.getParameter("roomID");
                    Room chosenRoom = null;
                    Hostel chosenHostel = null;
                    List<Invoice> invoiceList;
                    if (!roomID.equals("0")) {
                        invoiceList = InvoiceDAO.findByRoomID(Integer.parseInt(roomID));
                        chosenRoom = RoomDAO.findByID(Integer.parseInt(roomID));
                        chosenHostel = chosenRoom.getRoomType().getHostel();
                        request.setAttribute("chosenRoom", chosenRoom);
                    } else {
                        invoiceList = InvoiceDAO.findByHostelID(Integer.parseInt(hostelID));
                        chosenHostel = HostelDAO.findById(Integer.parseInt(hostelID));
                        request.setAttribute("chosenRoom", new Room());
                    }
                    if (request.getParameter("resetButton") != null) {
                        System.out.println("Reset!");
                        request.setAttribute("reset", true);
                    } else {
                        sortFilters(request, invoiceList);
                    }
                    List<Hostel> hostelList = HostelDAO.findByLandlordObject(l);
                    request.setAttribute("hostelList", hostelList);
                    request.setAttribute("roomList", RoomDAO.findByHostelID(chosenHostel.getHostelID()));
                    request.setAttribute("chosenHostel", chosenHostel);
                    request.setAttribute("invoiceList", invoiceList);
                    request.getRequestDispatcher("/view/LInvoiceList.jsp").forward(request, response);
                }

                if (path.equals("/success")) {
                    request.getRequestDispatcher("/view/success.jsp").forward(request, response);
                }
                if (path.equals("/failure")) {
                    request.getRequestDispatcher("/view/failure.jsp").forward(request, response);
                }

                if (path.equals("/edit")) {
                    int invoiceID = Integer.parseInt(request.getParameter("invoiceID"));
                    Invoice invoice = InvoiceDAO.findByID(invoiceID);
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");
                    int status = Integer.parseInt(request.getParameter("newStatus"));
                    int totalPrice = Integer.parseInt(request.getParameter("invoiceSum"));
                    Contract c = invoice.getContract();
                    Tenant t = c.getTenant();

                    int electricitySum = 0;
                    int waterSum = 0;

                    Room room = invoice.getContract().getRoom();

                    List<ServiceDetail> detailList = ServiceDAO.findDetailsByInvoice(invoice);
                    for (ServiceDetail detail : detailList) {
                        if (detail.getService().getType() != 0) {
                            int startValue = Integer.parseInt(request.getParameter("startInput" + detail.getService().getServiceID()));
                            int endValue = Integer.parseInt(request.getParameter("endInput" + detail.getService().getServiceID()));
                            int quantity = endValue - startValue;
                            detail.setStartValue(startValue);
                            detail.setEndValue(endValue);
                            detail.setQuantity(quantity);

                            if (detail.getService().getType() == 1) {
                                electricitySum = quantity * detail.getService().getServiceFee();
                            }

                            if (detail.getService().getType() == 2) {
                                waterSum = quantity * detail.getService().getServiceFee();
                            }
                        } else {
                            int quantity = Integer.parseInt(request.getParameter("quantity" + detail.getService().getServiceID()));
                            detail.setStartValue(0);
                            detail.setEndValue(quantity);
                            detail.setQuantity(quantity);
                        }
                    }

                    if (InvoiceDAO.edit(startDate, endDate, status, totalPrice, electricitySum, waterSum, detailList, invoiceID)) {
                        System.out.println("!! EDITED INVOICE !!");
                        url = "/sakura/view/success.jsp";

                        // send notification to tenant
                        Notification noti = new Notification();
                        noti.setToAccount(t.getAccount());
                        noti.setContent("Hóa đơn cho phòng " + room.getRoomNumber() + " kỳ " + invoice.getMonth() + " được cập nhật!");
                        noti.setCreatedDate(new Date());
                        noti.setStatus(0);
                        NotificationDAO.saveNotification(noti);
                    } else {
                        url = "/sakura/view/failure.jsp";
                    }
                    response.sendRedirect(url);
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
