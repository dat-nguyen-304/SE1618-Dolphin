/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.BookingRequestDAO;
import com.dolphin.hostelmanagement.DAO.ContractDAO;
import com.dolphin.hostelmanagement.DAO.DistrictDAO;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.InvoiceDAO;
import com.dolphin.hostelmanagement.DAO.ProvinceDAO;
import com.dolphin.hostelmanagement.DAO.RoomDAO;
import com.dolphin.hostelmanagement.DAO.RoomTypeDAO;
import com.dolphin.hostelmanagement.DAO.ServiceDAO;
import com.dolphin.hostelmanagement.DTO.BookingRequest;
import com.dolphin.hostelmanagement.DTO.Contract;
import com.dolphin.hostelmanagement.DTO.District;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Invoice;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Notification;
import com.dolphin.hostelmanagement.DTO.Province;
import com.dolphin.hostelmanagement.DTO.Room;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
        List<ServiceDetail> serviceDetailList = ServiceDAO.findDetailsByInvoice(firstInvoice);
        for (ServiceDetail serviceDetail : serviceDetailList) {
            if (serviceDetail.getService().getServiceName().equals("Điện")) {
                kq[0] = serviceDetail.getStartValue();
            }
            if (serviceDetail.getService().getServiceName().equals("Nước")) {
                kq[3] = serviceDetail.getStartValue();
            }
        }
        Invoice lastInvoice = invoiceList.get(0);
        serviceDetailList = ServiceDAO.findDetailsByInvoice(lastInvoice);
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

            if (hostelList.size() > 0) {
                session.setAttribute("currentHostel", hostelList.get(0));
                session.setAttribute("hostelList", hostelList);
            } else {
                session.setAttribute("currentHostel", null);
                session.setAttribute("hostelList", null);
            }

            if (path.equals("/overview")) {
                List<Province> provinceList = ProvinceDAO.findAll();
                List<District> districtList = DistrictDAO.findByProvinceID(provinceList.get(0).getProvinceID());
                if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    session.setAttribute("currentHostel", HostelDAO.findById(hostelId));;
                }
                request.setAttribute("provinceList", provinceList);
                request.setAttribute("districtList", districtList);
                request.getRequestDispatcher("/view/LOverView.jsp").forward(request, response);
            } else if (path.equals("/contract-list")) {
                int roomId = 0;
                if (request.getParameter("roomId") != null) {
                    roomId = Integer.parseInt(request.getParameter("roomId"));
                }
                if (request.getParameter("hostelId") != null) {
                    session.setAttribute("currentHostel", Integer.parseInt(request.getParameter("hostelId")));
                }

                Hostel currentHostel = (Hostel) session.getAttribute("currentHostel");
                List<Contract> contractList = ContractDAO.findByHostel(currentHostel.getHostelID());
                if (roomId != 0) {
                    contractList = ContractDAO.findByRoom(roomId);
                }
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
                if (request.getParameter("addRoomNumber") != null) {
                    String roomNumber = request.getParameter("addRoomNumber").trim();
                    int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
                    RoomDAO.save(roomTypeId, roomNumber);
                    currentRoomType = RoomTypeDAO.findByID(roomTypeId);
                    currentHostel = currentRoomType.getHostel();
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                } else if (request.getParameter("roomTypeId") != null) {
                    int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
                    currentRoomType = RoomTypeDAO.findByID(roomTypeId);
                    currentHostel = currentRoomType.getHostel();
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                } else if (request.getParameter("hostelId") != null) {
                    int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                    currentHostel = HostelDAO.findById(hostelId);
                    session.setAttribute("currentHostel", currentHostel);
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                    currentRoomType = roomTypeList.get(0);
                } else {
                    currentHostel = (Hostel) session.getAttribute("currentHostel");
                    roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                    currentRoomType = roomTypeList.get(0);
                }

                List<Room> roomList = RoomDAO.findByRoomTypeID(currentRoomType.getRoomTypeID());
                request.setAttribute("currentRoomType", currentRoomType);
                request.setAttribute("roomTypeList", roomTypeList);
                request.setAttribute("roomList", roomList);
                request.getRequestDispatcher("/view/LRoomType.jsp").forward(request, response);
            } else if (path.equals("/room-list")) {
                Hostel currentHostel = (Hostel) session.getAttribute("currentHostel");
                List<RoomType> roomTypeList = RoomTypeDAO.findByHostelID(currentHostel.getHostelID());
                List<Room> roomList = RoomDAO.findByHostelID(currentHostel.getHostelID());
                request.setAttribute("roomList", roomList);
                request.setAttribute("roomTypeList", roomTypeList);
                request.getRequestDispatcher("/view/LRoomList.jsp").forward(request, response);
            } else if (path.equals("/room-detail")) {
                Hostel currentHostel = (Hostel) session.getAttribute("currentHostel");
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
                Contract contract = ContractDAO.findActiveContractByRoomID(currentRoom.getRoomID());
                request.setAttribute("contract", contract);
                request.setAttribute("roomTypeList", roomTypeList);
                request.setAttribute("currentRoom", currentRoom);
                request.setAttribute("roomList", roomList);
                request.getRequestDispatcher("/view/LRoomDetail.jsp").forward(request, response);
            } else if (path.equals("/invoice-list")) {
                Hostel currentHostel = (Hostel) session.getAttribute("currentHostel");
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
                } else {
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

                request.setAttribute("invoice", invoice);
                request.getRequestDispatcher("/view/LInvoiceDetail.jsp").forward(request, response);
            } else if (path.equals("/add-invoice")) {
                request.getRequestDispatcher("/view/LAddInvoice.jsp").forward(request, response);
            } else if (path.equals("/notification")) {
                request.getRequestDispatcher("/view/LNotification.jsp").forward(request, response);
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
                    BookingRequestDAO.changeStatus(bookingRequestID, 0);
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

                int hostelID = Integer.parseInt(request.getParameter("hostelID") == null ? "0" : request.getParameter("hostelID"));
                request.setAttribute("hostelID", hostelID);

                ArrayList<BookingRequest> bookingList = BookingRequestDAO.getBookingRequestByHostelID(hostelID, 1);
                for (BookingRequest br : bookingList) {
                    System.out.println(br.getRoomType().getRoomTypeName());
                    System.out.println(br.getBookingRequestID());
                    System.out.println(br.getTenant().getFullname());
                }
                ArrayList<BookingRequest> invitationList = BookingRequestDAO.getBookingRequestByHostelID(hostelID, 2);

                request.setAttribute("bookingList", bookingList);
                request.setAttribute("invitationList", invitationList);

                request.getRequestDispatcher("/view/landlordRentalRequestPage.jsp").forward(request, response);
            }
            if (path.equals("/add-hostel")) {
                String name = request.getParameter("name");
                int districtId = Integer.parseInt(request.getParameter("districtId"));
                String streetAddress = request.getParameter("streetAddress");
                String description = request.getParameter("description");
                int landlordId = Integer.parseInt(request.getParameter("landlordId"));
                boolean addSuccess = HostelDAO.save(name, districtId, streetAddress, description, landlordId);
                Hostel newHostel = HostelDAO.findLastHostelByHostelId(landlordId);
                if (addSuccess) {
                    out.println("<span class=\"inline-block text-green-600\">Thêm nhà trọ " + newHostel.getHostelName()+ " thành công! Xem");
                    out.println("<form class=\"inline-block w-[1px] text-left\" action=\"/sakura/landlord/overview\">");
                    out.println("<input type='hidden' name=\"hostelId\" value='" + newHostel.getHostelID()+ "'>");
                    out.println("<input type=\"submit\" value=\"tại đây\">");
                    out.println("</form></span>");
                }
            }
            
            if (path.equals("/check-hostel-valid")) {
                String hostelName = request.getParameter("hostelName").trim();
                int landlordId = Integer.parseInt(request.getParameter("landlordId"));
                boolean isExistHostel = HostelDAO.isExistHostel(hostelName, landlordId);
                if (isExistHostel) {
                    out.print("Tên nhà trọ đã tồn tại. Vui lòng kiểm tra lại!");
                } else {
                    out.print("");
                }
            }
            
            if (path.equals("/add-roomtype")) {
                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                int area = Integer.parseInt(request.getParameter("area"));
                int maxNumberOfResidents = Integer.parseInt(request.getParameter("maxNumberOfResidents"));
                String description = request.getParameter("description");
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                boolean addSuccess = RoomTypeDAO.save(name, price, area, maxNumberOfResidents, description, hostelId);
                RoomType newRoomType = RoomTypeDAO.findLastRoomTypeByHostelId(hostelId);
                if (addSuccess) {
                    out.println("<span class=\"inline-block text-green-600\">Thêm loại phòng " + newRoomType.getRoomTypeName() + " thành công! Xem");
                    out.println("<form class=\"inline-block w-[1px] text-left\" action=\"/sakura/landlord/room-type\">");
                    out.println("<input type='hidden' name=\"roomTypeId\" value='" + newRoomType.getRoomTypeID() + "'>");
                    out.println("<input type=\"submit\" value=\"tại đây\">");
                    out.println("</form></span>");
                }
            }
            
            if (path.equals("/check-roomtype-valid")) {
                String roomTypeName = request.getParameter("roomTypeName").trim();
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                boolean isExistRoomType = RoomTypeDAO.isExistRoomType(roomTypeName, hostelId);
                if (isExistRoomType) {
                    out.print("Tên loại phòng đã tồn tại. Vui lòng kiểm tra lại!");
                } else {
                    out.print("");
                }
            }

            if (path.equals("/check-room-valid")) {
                String roomNumber = request.getParameter("roomNumber").trim();
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                boolean isExistRoomNumber = RoomDAO.isExistRoomNumber(roomNumber, hostelId);
                if (isExistRoomNumber) {
                    out.print("Tên phòng đã tồn tại. Vui lòng kiểm tra lại!");
                } else {
                    out.print("");
                }
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
        File folderUpload = new File(par.getParent() + "/src/main/webapp/assets/images/user-avatars");

//        File folderUpload = new File(request.getServletContext().getRealPath("/") + "assets/images/user-avatars/");
        // System.out.println(folderUpload);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    public File getRuntimeFolder(HttpServletRequest request) throws URISyntaxException {
        File folderUpload = new File(request.getServletContext().getRealPath("/") + "/assets/images/user-avatars");
        System.out.println("Runtime folder: " + folderUpload);
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
