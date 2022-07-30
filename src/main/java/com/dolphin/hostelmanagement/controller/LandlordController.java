/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.BookingRequestDAO;
import com.dolphin.hostelmanagement.DAO.ContractDAO;
import com.dolphin.hostelmanagement.DAO.DistrictDAO;
import com.dolphin.hostelmanagement.DAO.FeedbackDAO;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.InvoiceDAO;
import com.dolphin.hostelmanagement.DAO.NotificationDAO;
import com.dolphin.hostelmanagement.DAO.ProvinceDAO;
import com.dolphin.hostelmanagement.DAO.RoomDAO;
import com.dolphin.hostelmanagement.DAO.RoomResidentDAO;
import com.dolphin.hostelmanagement.DAO.RoomTypeDAO;
import com.dolphin.hostelmanagement.DAO.ServiceDAO;
import com.dolphin.hostelmanagement.DTO.BookingRequest;
import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.District;
import com.dolphin.hostelmanagement.DTO.Feedback;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Invoice;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Notification;
import com.dolphin.hostelmanagement.DTO.Province;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.RoomResident;
import com.dolphin.hostelmanagement.DTO.RoomType;
import com.dolphin.hostelmanagement.DTO.Service;
import com.dolphin.hostelmanagement.DTO.ServiceDetail;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
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
        Invoice firstInvoice = invoiceList.get(0);
        List<ServiceDetail> serviceDetailList = ServiceDAO.findDetailsByInvoice(firstInvoice);
        for (ServiceDetail serviceDetail : serviceDetailList) {
            if (serviceDetail.getService().getType() == 1) {
                kq[0] = serviceDetail.getStartValue();
            }
            if (serviceDetail.getService().getType() == 2) {
                kq[3] = serviceDetail.getStartValue();
            }
        }
        Invoice lastInvoice = invoiceList.get(invoiceList.size() - 1);
        serviceDetailList = ServiceDAO.findDetailsByInvoice(lastInvoice);
        for (ServiceDetail serviceDetail : serviceDetailList) {
            if (serviceDetail.getService().getType() == 1) {
                kq[1] = serviceDetail.getEndValue();
            }
            if (serviceDetail.getService().getType() == 2) {
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
            if (landlord == null) {
                response.sendRedirect("/sakura/view/login.jsp");
            }

            Hostel currentHostel = null;
            List<Hostel> hostelList = HostelDAO.findByLandlord(landlord.getAccount().getAccountID());
            if (session.getAttribute("currentHostel") == null) {
                if (hostelList.size() > 0) {
                    currentHostel = hostelList.get(0);
                    session.setAttribute("currentHostel", currentHostel);
                    session.setAttribute("hostelList", hostelList);
                } else {
                    session.setAttribute("currentHostel", null);
                    session.setAttribute("hostelList", null);
                }
            } else {

                currentHostel = (Hostel) session.getAttribute("currentHostel");
                currentHostel = HostelDAO.findById(currentHostel.getHostelID());
                session.setAttribute("currentHostel", currentHostel);
            }

            if (path.equals("/overview")) {
                if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    currentHostel = HostelDAO.findById(hostelId);
                    session.setAttribute("currentHostel", currentHostel);
                }
                currentHostel = (Hostel) session.getAttribute("currentHostel");

                List<Province> provinceList = ProvinceDAO.findAll();
                List<District> districtList = DistrictDAO.findByProvinceID(provinceList.get(0).getProvinceID());
                request.setAttribute("provinceList", provinceList);
                request.setAttribute("districtList", districtList);

                if (currentHostel != null) {
                    int currentProvinceId = currentHostel.getDistrict().getProvince().getProvinceID();
                    List<District> currentDistrictList = DistrictDAO.findByProvinceID(currentProvinceId);
                    request.setAttribute("currentDistrictList", currentDistrictList);
                    //doanh thu
                    ArrayList<Invoice> invoiceList = (ArrayList<Invoice>) InvoiceDAO.findByHostelIDLOverview(currentHostel.getHostelID());
                    Collections.sort(invoiceList, new Comparator<Invoice>() {
                        public int compare(Invoice i1, Invoice i2) {
                            SimpleDateFormat mmyy = new SimpleDateFormat("MM/yyyy");
                            Date date1 = null, date2 = null;

                            try {
                                date1 = mmyy.parse(i1.getMonth());
                                date2 = mmyy.parse(i2.getMonth());
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            return date2.compareTo(date1);
                        }
                    });

                    ArrayList<String> revenueDate = new ArrayList<>();
                    ArrayList<Integer> revenueValue = new ArrayList<>();

                    String currentDate = "";
                    int currentYear = Calendar.getInstance().get(Calendar.YEAR);

                    long totalRevenue = 0;
                    long currentYearRevenue = 0;

                    for (Invoice i : invoiceList) {
                        if (!currentDate.equals(i.getMonth()) && revenueDate.size() < 5) {

                            revenueDate.add(i.getMonth());
                            currentDate = i.getMonth();
                            revenueValue.add(0);
                        }
                        if (revenueDate.size() <= 5 && currentDate.equals(i.getMonth())) {
                            revenueValue.set(revenueValue.size() - 1, revenueValue.get(revenueValue.size() - 1) + i.getTotalPrice());
                        }

                        totalRevenue += i.getTotalPrice();
                        String dateValue[] = i.getMonth().split("/");

                        if (currentYear == Integer.parseInt(dateValue[1])) {
                            currentYearRevenue += i.getTotalPrice();
                        }
                    }

                    request.setAttribute("totalRevenue", totalRevenue);
                    request.setAttribute("currentYearRevenue", currentYearRevenue);
                    request.setAttribute("revenueDate", revenueDate);
                    request.setAttribute("revenueValue", revenueValue);

                    if (revenueValue.size() <= 1 || revenueValue.get(0) == revenueValue.get(1)) {
                        request.setAttribute("revenueChange", 0);
                    } else {
                        double ratio = ((double) revenueValue.get(0) - revenueValue.get(1)) / revenueValue.get(0) * 100;
                        ratio = Math.round(ratio * 100.0) / 100.0; //round up to 2 decimal places

                        request.setAttribute("revenueChange", -ratio);
                    }
                    //end doanh thu

                    //rating
                    request.setAttribute("ratingCount", FeedbackDAO.findByHostelId(currentHostel.getHostelID()).size());
                    //end rating

                    //booking request
                    ArrayList<BookingRequest> brList = BookingRequestDAO.getBookingRequestByHostelID(currentHostel.getHostelID(), 1);
                    //end booking request
                    request.setAttribute("noResidents", RoomResidentDAO.findByHostelID(currentHostel.getHostelID()).size());
                }
                request.getRequestDispatcher("/view/LOverView.jsp").forward(request, response);
            } else if (path.equals("/contract-list")) {
                List<Contract> contractList = null;
                List<Room> roomList = null;
                if (session.getAttribute("currentHostel") != null) {
                    currentHostel = (Hostel) session.getAttribute("currentHostel");
                }
                int roomId = 0;
                if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    session.setAttribute("currentHostel", HostelDAO.findById(hostelId));
                }
                if (session.getAttribute("currentHostel") != null) {
                    currentHostel = (Hostel) session.getAttribute("currentHostel");
                    contractList = ContractDAO.findByHostel(currentHostel.getHostelID());
                    if (roomId != 0) {
                        contractList = ContractDAO.findByRoom(roomId);
                    }
                }
                request.setAttribute("contractList", contractList);
                request.getRequestDispatcher("/view/LContractList.jsp").forward(request, response);
            } else if (path.equals("/contract-detail")) {
                int contractID = Integer.parseInt(request.getParameter("contractID"));
                System.out.println("contractID: " + contractID);
                Contract contract = ContractDAO.findByID(contractID);

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
                List<RoomType> roomTypeList = null;
                RoomType currentRoomType = null;
                List<Room> roomList = null;
                currentHostel = null;
                if (session.getAttribute("currentHostel") != null) {
                    currentHostel = (Hostel) session.getAttribute("currentHostel");
                }
                if (request.getParameter("roomTypeId") != null) {
                    int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
                    currentRoomType = RoomTypeDAO.findByID(roomTypeId);
                    currentHostel = currentRoomType.getHostel();
                    session.setAttribute("currentHostel", currentHostel);
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                } else if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    currentHostel = HostelDAO.findById(hostelId);
                    session.setAttribute("currentHostel", currentHostel);
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                    if (roomTypeList.size() > 0) {
                        currentRoomType = roomTypeList.get(0);
                    } else {
                        currentRoomType = null;
                    }
                } else if (session.getAttribute("currentHostel") != null) {
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                    if (roomTypeList.size() > 0) {
                        currentRoomType = roomTypeList.get(0);
                    }
                }
                if (currentRoomType != null) {
                    roomList = RoomDAO.findByRoomTypeID(currentRoomType.getRoomTypeID());
                }
                request.setAttribute("currentRoomType", currentRoomType);
                request.setAttribute("roomTypeList", roomTypeList);
                request.setAttribute("roomList", roomList);
                request.getRequestDispatcher("/view/LRoomType.jsp").forward(request, response);
            } else if (path.equals("/room-list")) {
                currentHostel = (Hostel) session.getAttribute("currentHostel");
                List<RoomType> roomTypeList = null;
                List<Room> roomList = null;
                if (currentHostel != null) {
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                    roomList = RoomDAO.findByHostelID(currentHostel.getHostelID());
                }
                request.setAttribute("roomList", roomList);
                request.setAttribute("roomTypeList", roomTypeList);
                request.getRequestDispatcher("/view/LRoomList.jsp").forward(request, response);
            } else if (path.equals("/room-detail")) {
                currentHostel = (Hostel) session.getAttribute("currentHostel");
                Room currentRoom;
                if (request.getParameter("roomId") != null) {
                    int roomId = Integer.parseInt(request.getParameter("roomId"));
                    currentRoom = RoomDAO.findByID(roomId);
                } else if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    currentHostel = HostelDAO.findById(hostelId);
                    session.setAttribute("currentHostel", currentHostel);
                    RoomType roomtype = RoomTypeDAO.findByHostelID(currentHostel.getHostelID()).get(0);
                    currentRoom = RoomDAO.findByRoomTypeID(roomtype.getRoomTypeID()).get(0);
                } else {
                    RoomType roomtype = RoomTypeDAO.findByHostelID(currentHostel.getHostelID()).get(0);
                    currentRoom = RoomDAO.findByRoomTypeID(roomtype.getRoomTypeID()).get(0);
                }
                List<RoomType> roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                List<Room> roomList = RoomDAO.findByHostelID(currentHostel.getHostelID());
                List<RoomResident> residentList = RoomResidentDAO.findByRoom(currentRoom);
                Contract contract = ContractDAO.findLastContractByRoomID(currentRoom.getRoomID());
                request.setAttribute("contract", contract);
                request.setAttribute("roomTypeList", roomTypeList);
                request.setAttribute("residentList", residentList);
                request.setAttribute("currentRoom", currentRoom);
                request.setAttribute("roomList", roomList);
                request.getRequestDispatcher("/view/LRoomDetail.jsp").forward(request, response);
            } else if (path.equals("/invoice-list")) {
                currentHostel = (Hostel) session.getAttribute("currentHostel");
                Room currentRoom = null;
                List<Invoice> invoiceList;
                if (request.getParameter("roomId") != null) {
                    int roomId = Integer.parseInt(request.getParameter("roomId"));
                    currentRoom = RoomDAO.findByID(roomId);
                } else if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    currentHostel = HostelDAO.findById(hostelId);
                    session.setAttribute("currentHostel", currentHostel);
                    RoomType roomtype = RoomTypeDAO.findByHostelID(currentHostel.getHostelID()).get(0);
                    currentRoom = RoomDAO.findByRoomTypeID(roomtype.getRoomTypeID()).get(0);
                }
                List<Room> roomList = RoomDAO.findByHostelID(currentHostel.getHostelID());

                if (currentRoom == null) {
                    invoiceList = InvoiceDAO.findByHostelID(currentHostel.getHostelID());
                } else {
                    invoiceList = InvoiceDAO.findByRoomID(currentRoom.getRoomID());
                }
                request.setAttribute("currentRoom", currentRoom);
                request.setAttribute("roomList", roomList);
                request.setAttribute("invoiceList", invoiceList);
                request.getRequestDispatcher("/view/LInvoiceList.jsp").forward(request, response);
            } else if (path.equals("/invoice-detail")) {
                int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));
                Invoice invoice = InvoiceDAO.findByID(invoiceId);
                List<ServiceDetail> detailList = ServiceDAO.findDetailsByInvoice(invoice);
                request.setAttribute("detailList", detailList);
                request.setAttribute("invoice", invoice);
                request.getRequestDispatcher("/view/LInvoiceDetail.jsp").forward(request, response);
            } else if (path.equals("/add-invoice")) {
                request.getRequestDispatcher("/view/LAddInvoice.jsp").forward(request, response);
            } else if (path.equals("/notification")) {
                ArrayList<Notification> notificationList = NotificationDAO.getNotificationByToAccount(landlord.getAccount());

                request.setAttribute("notificationList", notificationList);

                request.getRequestDispatcher("/view/LNotification.jsp").forward(request, response);
            } else if (path.equals("/service")) {
                List<Service> list = ServiceDAO.findHostelActiveServices(currentHostel);
                List<Service> serviceList = new ArrayList<>();
                Service eletricService = null;
                Service waterService = null;
                for (Service service : list) {
                    if (service.getType() == 1) {
                        eletricService = service;
                    } else if (service.getType() == 2) {
                        waterService = service;
                    } else {
                        serviceList.add(service);
                    }
                }
                request.setAttribute("serviceList", serviceList);
                request.setAttribute("eletricService", eletricService);
                request.setAttribute("waterService", waterService);
                request.getRequestDispatcher("/view/LAddService.jsp").forward(request, response);

            } else if (path.equals("/resident")) {
                List<RoomResident> residentList = null;
                if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    currentHostel = HostelDAO.findById(hostelId);
                    session.setAttribute("currentHostel", currentHostel);
                }
                residentList = RoomResidentDAO.findByHostelID(currentHostel.getHostelID());

                request.setAttribute("residentList", residentList);
                request.getRequestDispatcher("/view/LResidentList.jsp").forward(request, response);
            }

            if (path.equals("/rentalRequestList")) { //get by hostel ID
                String queryType = request.getParameter("queryType") == null ? "" : request.getParameter("queryType");
                if (queryType.equals("accept")) {
                    int bookingRequestID = Integer.parseInt(request.getParameter("bookingRequestID"));
                    response.sendRedirect("/sakura/contract/add-contract?bookingRequestID=" + bookingRequestID);
                    return;
                } else if (queryType.equals("reject")) {
                    //change status of booking request from 1 to 0, means rejected request
                    int bookingRequestID = Integer.parseInt(request.getParameter("bookingRequestID"));
                    BookingRequest currentBr = BookingRequestDAO.getBookingRequestByID(bookingRequestID);

                    BookingRequestDAO.changeStatus(bookingRequestID, 4);
                    //ContractDAO.changeStatus(bookingRequestID, 3);
                    int hostelID = currentBr.getRoomType().getHostel().getHostelID();

                    //end change
                    //send notification to tenant about rejecting 
                    Notification rejectNoti = new Notification();
                    rejectNoti.setToAccount(currentBr.getTenant().getAccount());
                    rejectNoti.setCreatedDate(new Date());
                    rejectNoti.setContent("Yêu cầu xem phòng"
                            + " ở nhà trọ " + currentBr.getRoomType().getHostel().getHostelName()
                            + " của bạn đã bị từ chối. Vui lòng liên lạc với chủ nhà nếu có sự nhầm lẫn!");
                    rejectNoti.setStatus(0);
                    //end send notification to tenant
                    //send notification to landlord 
                    //blank -- maybe it's no need to - Khang, 26/06/2022
                    //end send notification to landlord
                }

//                int hostelID = ((Hostel) session.getAttribute("currentHostel")).getHostelID();
//                request.setAttribute("hostelID", hostelID);
                ArrayList<BookingRequest> bookingList = BookingRequestDAO.findByLandlordID(landlord.getAccount().getAccountID(), 1);
                bookingList.addAll(BookingRequestDAO.findByLandlordID(landlord.getAccount().getAccountID(), 3));
                bookingList.addAll(BookingRequestDAO.findByLandlordID(landlord.getAccount().getAccountID(), 4));
                /*for (BookingRequest br : bookingList) {
                    System.out.println(br.getRoomType().getRoomTypeName());
                    System.out.println(br.getBookingRequestID());
                    System.out.println(br.getTenant().getFullname());
                }*/
                ArrayList<BookingRequest> invitationList = BookingRequestDAO.findByLandlordID(landlord.getAccount().getAccountID(), 2);
                invitationList.addAll(BookingRequestDAO.findByLandlordID(landlord.getAccount().getAccountID(), 5));
                invitationList.addAll(BookingRequestDAO.findByLandlordID(landlord.getAccount().getAccountID(), 6));
                invitationList.addAll(BookingRequestDAO.findByLandlordID(landlord.getAccount().getAccountID(), 7));

                request.setAttribute("bookingList", bookingList);
                request.setAttribute("invitationList", invitationList);

                request.getRequestDispatcher("/view/landlordRentalRequestPage.jsp").forward(request, response);
            }

            if (path.equals("/hostel-info")) {
//                currentHostel = null;
//                if (session.getAttribute("currentHostel") != null) {
//                    currentHostel = (Hostel) session.getAttribute("currentHostel");
//                }
                if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    currentHostel = HostelDAO.findById(hostelId);
                    session.setAttribute("currentHostel", currentHostel);
                }
                if (currentHostel != null) {
                    ArrayList<Feedback> feedbackList = (ArrayList<Feedback>) FeedbackDAO.findByHostelId(currentHostel.getHostelID());
                    double avgRating = 0;
                    for (Feedback feedback : feedbackList) {
                        avgRating += feedback.getRating();
                        //System.out.println(feedback.toString());
                    }
                    avgRating /= feedbackList.size();
                    avgRating = Math.round(avgRating * 100.0) / 100.0;
                    request.setAttribute("avgRating", avgRating);
                    request.setAttribute("feedbacks", feedbackList);
                    int currentProvinceId = currentHostel.getDistrict().getProvince().getProvinceID();
                    List<District> currentDistrictList = DistrictDAO.findByProvinceID(currentProvinceId);

                    List<Province> provinceList = ProvinceDAO.findAll();
                    List<District> districtList = DistrictDAO.findByProvinceID(provinceList.get(0).getProvinceID());
                    request.setAttribute("currentDistrictList", currentDistrictList);
                    request.setAttribute("provinceList", provinceList);
                    request.setAttribute("districtList", districtList);
                }
                request.getRequestDispatcher("/view/LHostelInfo.jsp").forward(request, response);
            }

            if (path.equals("/add-hostel-image")) {
                //request.getRequestDispatcher("/view/LHostelInfo.jsp").forward(request, response);
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                int maxImgID = HostelDAO.getCurrentIdentImageHostel();
                System.out.println("IDENT: " + maxImgID);
                try {
                    for (Part part : request.getParts()) {
                        if (extractFileName(part).length() > 0) {
                            maxImgID++;
                            String fileName = "img" + maxImgID + ".jpg";
                            String savePath = "/sakura/assets/images/hostel-list-images/";
                            System.out.println("FILENAME: " + fileName);
                            boolean res = HostelDAO.saveHostelImg(hostelId, savePath + fileName);
                            String src = this.getRuntimeFolder(request).getAbsolutePath() + File.separator + fileName;
                            String dest = this.getFolderUpload(request).getAbsolutePath() + File.separator + fileName;
                            part.write(src);
                            copy(src, dest);
                        }
                    }
                    session.setAttribute("currentHostel", HostelDAO.findById(hostelId));;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (path.equals("/remove-image")) {
                String filePath = request.getParameter("path");
                String name = filePath.substring(filePath.lastIndexOf('/') + 1);
                System.out.println("\nName: " + name);
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                try {
                    boolean res = HostelDAO.removeHostelImg(hostelId, filePath);
                    String srcPath = this.getFolderUpload(request).getAbsolutePath() + File.separator + name;
                    File fSrc = new File(srcPath);
                    System.out.println("Remove: " + srcPath);
                    fSrc.delete();
                    String targetPath = this.getRuntimeFolder(request).getAbsolutePath() + File.separator + name;
                    File fTarget = new File(targetPath);
                    System.out.println("Remove: " + targetPath);
                    fTarget.delete();
                    session.setAttribute("currentHostel", HostelDAO.findById(hostelId));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                response.sendRedirect("/view/LHostelInfo.jsp");
            }

            if (path.equals("/remove-multiple-images")) {
                try {
                    String[] toDelete = request.getParameterValues("toDelete[]");
                    // for (String s : toDelete) System.out.println(s);
                    int[] toBeDeleted = new int[toDelete.length];
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    System.out.println("HOSTEL ID: " + hostelId);
                    //System.out.println("Before: " + HostelDAO.getAllImagesById(hostelId));
                    for (String imagePath : toDelete) {
                        //System.out.println("IMG PATH: " + imagePath);
                        boolean res = HostelDAO.removeHostelImg(hostelId, imagePath);
                        String name = imagePath.substring(imagePath.lastIndexOf('/') + 1);
                        //System.out.println("Name: " + name);
                        String srcPath = this.getFolderUpload(request).getAbsolutePath() + File.separator + name;
                        File fSrc = new File(srcPath);
                        //System.out.println("Remove: " + srcPath);
                        fSrc.delete();
                        String targetPath = this.getRuntimeFolder(request).getAbsolutePath() + File.separator + name;
                        File fTarget = new File(targetPath);
                        //System.out.println("Remove: " + targetPath);
                        fTarget.delete();
                    }
                    session.setAttribute("currentHostel", HostelDAO.findById(hostelId));
                    //System.out.println("After : " + HostelDAO.getAllImagesById(hostelId));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (path.equals("/update-image")) {
                String hostelId = request.getParameter("hostelId");
                int id = 0;
                if (hostelId != null) {
                    id = Integer.parseInt(hostelId);
                    ArrayList<String> images = HostelDAO.getAllImagesById(id);
                    session.setAttribute("currentHostel", HostelDAO.findById(id));
                    JSONArray list = new JSONArray();
                    for (String imgLink : images) {
                        System.out.println("Link: " + imgLink);
                        JSONObject obj = new JSONObject();
                        obj.put("imgLink", imgLink);
                        list.add(obj);
                    }
                    System.out.println("LIST: " + list);
                    out.write(list.toJSONString());
                    out.close();
                }
            }

            if (path.equals("/add-rt-image")) {
                int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
                int maxImgID = RoomTypeDAO.getCurrentIdentImageRoomType();
                System.out.println("IDENT: " + maxImgID);
                try {
                    for (Part part : request.getParts()) {
                        if (extractFileName(part).length() > 0) {
                            maxImgID++;
                            String fileName = "img" + maxImgID + ".jpg";
                            String savePath = "/sakura/assets/images/room-type-images/";
                            System.out.println("FILENAME: " + fileName);
                            boolean res = RoomTypeDAO.saveRoomTypeImg(roomTypeId, savePath + fileName);
                            String src = this.getRuntimeFolderRT(request).getAbsolutePath() + File.separator + fileName;
                            String dest = this.getFolderUploadRT(request).getAbsolutePath() + File.separator + fileName;
                            part.write(src);
                            copy(src, dest);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (path.equals("/remove-rt-image")) {
                String filePath = request.getParameter("path");
                String name = filePath.substring(filePath.lastIndexOf('/') + 1);
                System.out.println("\nName: " + name);
                int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
                try {
                    boolean res = RoomTypeDAO.removeRoomTypeImg(roomTypeId, filePath);
                    session.setAttribute("currentRoomType", RoomTypeDAO.findByID(roomTypeId));;
                    String srcPath = this.getFolderUploadRT(request).getAbsolutePath() + File.separator + name;
                    File fSrc = new File(srcPath);
                    System.out.println("Remove: " + srcPath);
                    fSrc.delete();
                    String targetPath = this.getRuntimeFolderRT(request).getAbsolutePath() + File.separator + name;
                    File fTarget = new File(targetPath);
                    System.out.println("Remove: " + targetPath);
                    fTarget.delete();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                response.sendRedirect("/view/LRoomType.jsp");
            }

            if (path.equals("/remove-multiple-rt-images")) {
                try {
                    String[] toDelete = request.getParameterValues("toDelete[]");
                    // for (String s : toDelete) System.out.println(s);
                    int[] toBeDeleted = new int[toDelete.length];
                    int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
                    System.out.println("HOSTEL ID: " + roomTypeId);
                    //System.out.println("Before: " + HostelDAO.getAllImagesById(hostelId));
                    for (String imagePath : toDelete) {
                        //System.out.println("IMG PATH: " + imagePath);
                        boolean res = RoomTypeDAO.removeRoomTypeImg(roomTypeId, imagePath);
                        String name = imagePath.substring(imagePath.lastIndexOf('/') + 1);
                        //System.out.println("Name: " + name);
                        String srcPath = this.getFolderUploadRT(request).getAbsolutePath() + File.separator + name;
                        File fSrc = new File(srcPath);
                        //System.out.println("Remove: " + srcPath);
                        fSrc.delete();
                        String targetPath = this.getRuntimeFolderRT(request).getAbsolutePath() + File.separator + name;
                        File fTarget = new File(targetPath);
                        //System.out.println("Remove: " + targetPath);
                        fTarget.delete();
                    }
                    session.setAttribute("currentRoomType", RoomTypeDAO.findByID(roomTypeId));;
                    //System.out.println("After : " + HostelDAO.getAllImagesById(hostelId));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (path.equals("/revenue-list")) {
                ArrayList<Invoice> invoiceList = (ArrayList<Invoice>) InvoiceDAO.findByHostelID(currentHostel.getHostelID());

                Collections.sort(invoiceList, new Comparator<Invoice>() {
                    public int compare(Invoice i1, Invoice i2) {
                        SimpleDateFormat mmyy = new SimpleDateFormat("MM/yyyy");
                        Date date1 = null, date2 = null;

                        try {
                            date1 = mmyy.parse(i1.getMonth());
                            date2 = mmyy.parse(i2.getMonth());
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        return date2.compareTo(date1);
                    }
                });

                for (Invoice i : invoiceList) {
                    System.out.println(i.getMonth());
                }
                ArrayList<String> revenueDate = new ArrayList<>();
                ArrayList<Integer> revenueValue = new ArrayList<>();

                String currentDate = "";

                for (Invoice i : invoiceList) {
                    if (!currentDate.equals(i.getMonth()) && revenueDate.size() < 5) {
                        revenueDate.add(i.getMonth());
                        currentDate = i.getMonth();
                        revenueValue.add(0);
                    }
                    if (revenueDate.size() <= 5 && currentDate.equals(i.getMonth())) {
                        revenueValue.set(revenueValue.size() - 1, revenueValue.get(revenueValue.size() - 1) + i.getTotalPrice());
                    }
                }

                request.setAttribute("revenueDate", revenueDate);
                request.setAttribute("revenueValue", revenueValue);

                request.getRequestDispatcher("/view/LRevenueList.jsp").forward(request, response);
            }

            if (path.equals("/revenue-detail")) {
                String revenueDate = request.getParameter("revenueDate");

                ArrayList<Invoice> invoiceList = (ArrayList<Invoice>) InvoiceDAO.findByHostelID(currentHostel.getHostelID());

                request.setAttribute("invoiceList", invoiceList);
                request.setAttribute("revenueDate", revenueDate);

                request.getRequestDispatcher("/view/LRevenueDetail.jsp").forward(request, response);
            }
        }
    }

    private void copy(String src, String dest) throws IOException {
        InputStream is = null;
        OutputStream os = null;
        try {
            is = new FileInputStream(src);
            os = new FileOutputStream(dest);
            // buffer size 1K
            byte[] buf = new byte[1024];

            int bytesRead;
            while ((bytesRead = is.read(buf)) > 0) {
                os.write(buf, 0, bytesRead);
            }
        } finally {
            is.close();
            os.close();
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload(HttpServletRequest request) throws URISyntaxException {
        String path = request.getServletContext().getRealPath("/").replace("\\", "/");
        File target = new File(path);
        File par = new File(target.getParent());
        File folderUpload = new File(par.getParent() + "/src/main/webapp/assets/images/hostel-list-images");
//        File folderUpload = new File(request.getServletContext().getRealPath("/") + "assets/images/user-avatars/");
        // System.out.println(folderUpload);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    public File getRuntimeFolder(HttpServletRequest request) throws URISyntaxException {
        File folderUpload = new File(request.getServletContext().getRealPath("/") + "/assets/images/hostel-list-images");
        //System.out.println("Runtime folder: " + folderUpload);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    public File getFolderUploadRT(HttpServletRequest request) throws URISyntaxException {
        String path = request.getServletContext().getRealPath("/").replace("\\", "/");
        File target = new File(path);
        File par = new File(target.getParent());
        File folderUpload = new File(par.getParent() + "/src/main/webapp/assets/images/room-type-images");
//        File folderUpload = new File(request.getServletContext().getRealPath("/") + "assets/images/user-avatars/");
        // System.out.println(folderUpload);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    public File getRuntimeFolderRT(HttpServletRequest request) throws URISyntaxException {
        File folderUpload = new File(request.getServletContext().getRealPath("/") + "/assets/images/room-type-images");
        //System.out.println("Runtime folder: " + folderUpload);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
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
