/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.AccountDAO;
import com.dolphin.hostelmanagement.DAO.BookingRequestDAO;
import com.dolphin.hostelmanagement.DAO.FavoriteHostelDAO;
import com.dolphin.hostelmanagement.DAO.FeedbackDAO;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.NotificationDAO;
import com.dolphin.hostelmanagement.DAO.ProvinceDAO;
import com.dolphin.hostelmanagement.DAO.DistrictDAO;
import com.dolphin.hostelmanagement.DTO.Province;
import com.dolphin.hostelmanagement.DAO.RoomTypeDAO;
import com.dolphin.hostelmanagement.DAO.ServiceDAO;
import com.dolphin.hostelmanagement.DTO.Feedback;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Notification;
import com.dolphin.hostelmanagement.DTO.Tenant;
import com.dolphin.hostelmanagement.DTO.District;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.RoomType;
import com.dolphin.hostelmanagement.DTO.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Admin
 */
public class HostelController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            String path = request.getPathInfo();
            if (path.equals("/list")) {
                List<Hostel> hostelList = null;

                if (request.getParameter("favorite") != null && request.getParameter("favorite").equals("true")) {
                    Tenant t = (Tenant) session.getAttribute("currentUser");
                    hostelList = HostelDAO.findFavoriteList(t.getAccount().getAccountID());
                    request.setAttribute("favorite", true);
                    if (request.getParameter("keyword") != null) {
                        String keyword = request.getParameter("keyword");
                        List<Hostel> hostelListTmp = new ArrayList<>();
                        for (Hostel hostel : hostelList) {
                            if (hostel.getHostelName().toLowerCase().contains(keyword.toLowerCase())) {
                                hostelListTmp.add(hostel);
                            }
                        }
                        hostelList = hostelListTmp;
                    }
                } else {

                    hostelList = (ArrayList<Hostel>) HostelDAO.findAllActive();

                    if (request.getParameter("province") != null) {
                        if (!request.getParameter("province").equals("0")) {
                            int provinceID = Integer.parseInt(request.getParameter("province"));
                            int districtID = 0;
                            if (request.getParameter("district") != null) {
                                districtID = Integer.parseInt(request.getParameter("district"));
                            }
                            List<Hostel> hostelListTmp = new ArrayList<>();
                            Province province = ProvinceDAO.findById(provinceID);
                            session.setAttribute("province", province);
                            if (districtID == 0) {
                                for (Hostel hostel : hostelList) {
                                    if (hostel.getDistrict().getProvince().getProvinceID() == provinceID) {
                                        hostelListTmp.add(hostel);
                                    }
                                }
                                session.setAttribute("district", null);
                            } else {
                                for (Hostel hostel : hostelList) {
                                    if (hostel.getDistrict().getDistrictID() == districtID) {
                                        hostelListTmp.add(hostel);
                                    }
                                }
                                District district = DistrictDAO.findById(districtID);
                                session.setAttribute("district", district);
                            }
                            hostelList = hostelListTmp;
                        } else {
                            session.setAttribute("province", null);
                            session.setAttribute("district", null);
                        }

                    } else if (session.getAttribute("province") != null) {
                        Province province = (Province) session.getAttribute("province");
                        District district = null;
                        if (session.getAttribute("district") != null) {
                            district = (District) session.getAttribute("district");
                        }
                        List<Hostel> hostelListTmp = new ArrayList<>();
                        if (district == null) {
                            for (Hostel hostel : hostelList) {
                                if (hostel.getDistrict().getProvince().equals(province)) {
                                    hostelListTmp.add(hostel);
                                }
                            }
                        } else {
                            for (Hostel hostel : hostelList) {
                                if (hostel.getDistrict().equals(district)) {
                                    hostelListTmp.add(hostel);
                                }
                            }
                        }
                        hostelList = hostelListTmp;
                    }
                    if (request.getParameter("keyword") != null) {
                        String keyword = request.getParameter("keyword");
                        List<Hostel> hostelListTmp = new ArrayList<>();
                        for (Hostel hostel : hostelList) {
                            if (hostel.getHostelName().toLowerCase().contains(keyword.toLowerCase())) {
                                hostelListTmp.add(hostel);
                            }
                        }
                        hostelList = hostelListTmp;
                        request.setAttribute("keyword", keyword);
                    }
                }
                List<Province> provinceList = ProvinceDAO.findAll();
                session.setAttribute("provinceList", provinceList);

                if (request.getParameter("sortByMinPrice") != null) {
                    if (request.getParameter("sortByMinPrice").equals("asc")) {
                        sortByMinPrice(hostelList, true);
                        request.setAttribute("sortByMinPrice", "asc");
                    } else {
                        sortByMinPrice(hostelList, false);
                        request.setAttribute("sortByMinPrice", "desc");
                    }
                }
                if (request.getParameter("sortByMaxPrice") != null) {
                    if (request.getParameter("sortByMaxPrice").equals("asc")) {
                        sortByMaxPrice(hostelList, true);
                        request.setAttribute("sortByMaxPrice", "asc");
                    } else {
                        sortByMaxPrice(hostelList, false);
                        request.setAttribute("sortByMaxPrice", "desc");
                    }
                }
                if (request.getParameter("sortByRate") != null) {
                    if (request.getParameter("sortByRate").equals("asc")) {
                        sortByRate(hostelList, true);
                        request.setAttribute("sortByRate", "asc");
                    } else {
                        sortByRate(hostelList, false);
                        request.setAttribute("sortByRate", "desc");
                    }
                }

                if (session.getAttribute("favoriteHostelIds") != null) {
                    List<Boolean> toggleList = new ArrayList<>();
                    List<Integer> favHostelIds = (List<Integer>) session.getAttribute("favoriteHostelIds");
                    for (Hostel hostel : hostelList) {
                        boolean isFavorite = false;
                        for (int i = 0; i < favHostelIds.size(); i++) {
                            if (hostel.getHostelID() == favHostelIds.get(i)) {
                                isFavorite = true;
                                break;
                            }
                        }
                        toggleList.add(isFavorite);
                    }
                    request.setAttribute("toggleList", toggleList);
                }

                request.setAttribute("hostelList", hostelList);

                request.getRequestDispatcher("/view/hostelList.jsp").forward(request, response);
            } else if (path.equals("/detail")) {
                if (request.getParameter("message") != null) {
                    String message = request.getParameter("message");
                    request.setAttribute("message", message);
                }
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                Hostel hostel = HostelDAO.findById(hostelId);

                List<Hostel> outstandingHostels = HostelDAO.findOutstandingHostels();
                request.setAttribute("outstandingHostels", outstandingHostels);

                List<Feedback> feedbackList = FeedbackDAO.findByHostelId(hostelId);
                request.setAttribute("feedbackQuantity", feedbackList.size());
                List<Province> provinceList = ProvinceDAO.findAll();
                request.setAttribute("provinceList", provinceList);
                List<RoomType> roomTypeList = RoomTypeDAO.findByHostelID(hostelId);
                request.setAttribute("roomTypeList", roomTypeList);
                if (session.getAttribute("currentUser") != null && session.getAttribute("currentUser") instanceof Tenant) {
                    Tenant t = (Tenant) session.getAttribute("currentUser");
                    boolean isFavorite = FavoriteHostelDAO.findByHostelTenant(hostelId, t.getAccount().getAccountID());
                    request.setAttribute("isFavorite", isFavorite);

                    if (request.getParameter("feedbackContent") != null) {
                        String feedbackContent = request.getParameter("feedbackContent");
                        int rating = Integer.parseInt(request.getParameter("rating"));
                        int feedbackQuantity = feedbackList.size();
                        float currentHostelRating = hostel.getRating();
                        float newHostelRating = (float) (currentHostelRating * feedbackQuantity + rating) / (feedbackQuantity + 1);
                        hostel.setRating(newHostelRating);
                        HostelDAO.updateRating(hostelId, newHostelRating);
                        FeedbackDAO.add(t.getAccount().getAccountID(), hostelId, feedbackContent, rating);
                        feedbackList = FeedbackDAO.findByHostelId(hostelId);
                    }

                    if (request.getParameter("updateContent") != null) {
                        String updateContent = request.getParameter("updateContent");
                        int rating = Integer.parseInt(request.getParameter("rating"));
                        int oldRating = Integer.parseInt(request.getParameter("oldRating"));
                        int feedbackQuantity = feedbackList.size();
                        float currentHostelRating = hostel.getRating();
                        float newHostelRating = (float) (currentHostelRating * feedbackQuantity - oldRating + rating) / feedbackQuantity;
                        hostel.setRating(newHostelRating);
                        HostelDAO.updateRating(hostelId, newHostelRating);
                        LocalDateTime current = LocalDateTime.now();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        String formatted = current.format(formatter);
                        FeedbackDAO.update(t.getAccount().getAccountID(), hostelId, updateContent, rating, formatted);
                        feedbackList = FeedbackDAO.findByHostelId(hostelId);
                    }

                    Feedback feedback = FeedbackDAO.findByHostelTenant(hostelId, t.getAccount().getAccountID());
                    request.setAttribute("feedback", feedback);
                }

                if (request.getParameter("filterStar") != null) {
                    int filterStar = Integer.parseInt(request.getParameter("filterStar"));
                    if (filterStar > 0) {
                        List<Feedback> feedbackListTmp = new ArrayList<>();
                        for (Feedback feedback : feedbackList) {
                            if (feedback.getRating() == filterStar) {
                                feedbackListTmp.add(feedback);
                            }
                        }
                        feedbackList = feedbackListTmp;
                    }
                    request.setAttribute("filterStar", filterStar);
                }
                List<Service> list = ServiceDAO.findHostelActiveServices(hostel);
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
                
                request.setAttribute("feedbackList", feedbackList);
                request.setAttribute("hostel", hostel);
                request.setAttribute("roomTypeList", roomTypeList);
                request.getRequestDispatcher("/view/hostelDetail.jsp").forward(request, response);
            } else if (path.equals("/toggleFavHostel")) {
                //Hàm bắt xử lí khi nhấn toggle favorite
                int hostelID = Integer.parseInt(request.getParameter("hostelID"));
                Tenant t = (Tenant) session.getAttribute("currentUser");
                int tenantID = t.getAccount().getAccountID();
                if (FavoriteHostelDAO.findByHostelTenant(hostelID, tenantID) == false) {
                    FavoriteHostelDAO.save(hostelID, tenantID);
                } else {
                    FavoriteHostelDAO.remove(hostelID, tenantID);
                }
                session.setAttribute("favoriteHostelIds", FavoriteHostelDAO.findFavHostelIds(t.getAccount().getAccountID()));
            } else if (path.equals("/findDistrictProvince")) {
                try {
                    String param = request.getParameter("param");
                    if (param.equals("province")) {
                        System.out.println(param);
                        JSONArray list = new JSONArray();
                        for (Province province : ProvinceDAO.findAll()) {
                            JSONObject obj = new JSONObject();
                            String provinceID = Integer.toString(province.getProvinceID());
                            String provinceName = province.getProvinceName();
                            obj.put("provinceID", provinceID);
                            obj.put("provinceName", provinceName);
                            list.add(obj);
                        }
                        out.write(list.toJSONString());
                        out.close();
                    }
                    if (param.equals("district")) {
                        System.out.println(param);
                        System.out.println(request.getParameter("provinceID"));
                        JSONArray list = new JSONArray();
                        int provinceID = Integer.parseInt(request.getParameter("provinceID"));
                        System.out.println("Line 85 " + provinceID);
                        for (District district : DistrictDAO.findByProvinceID(provinceID)) {
                            JSONObject obj = new JSONObject();
                            String districtID = Integer.toString(district.getDistrictID());
                            String districtName = district.getDistrictName();
                            obj.put("districtID", districtID);
                            obj.put("districtName", districtName);
                            list.add(obj);
                        }
                        out.write(list.toJSONString());
                        out.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (path.equals("/roomTypeDetail")) {
                int roomTypeID = Integer.parseInt(request.getParameter("roomTypeID"));
                //System.out.println("RoomID: " + roomID);
                RoomType roomType = RoomTypeDAO.findByID(roomTypeID);
                request.setAttribute("roomType", roomType);
                request.getRequestDispatcher("/view/roomTypeDetail.jsp").forward(request, response);

            } else if (path.equals("/sendRentalRequest")) {
                Tenant t = (Tenant) session.getAttribute("currentUser");

                
                String intentStartDate = request.getParameter("intentStartDate").trim();
                String rentalNote = request.getParameter("rentalNote").trim();
                
                if(intentStartDate == null || intentStartDate.length() == 0) intentStartDate = "Không có";
                if(rentalNote == null || rentalNote.length() == 0) rentalNote = "Không có";
                
                Notification rentalNoti = new Notification();

                int roomTypeID = Integer.parseInt(request.getParameter("roomTypeID"));

                RoomType roomType = RoomTypeDAO.findByID(roomTypeID);

                //this is notification for landlord about booking request from tenant
                int landlordID = roomType.getHostel().getLandlord().getAccount().getAccountID();
                rentalNoti.setToAccount(AccountDAO.findById(landlordID));
                rentalNoti.setCreatedDate(new Date());
                
                String content = "Người thuê nhà " + t.getFullname() + " muốn xem loại phòng " + roomType.getRoomTypeName()
                        + " ở nhà trọ " + roomType.getHostel().getHostelName() + "!<br>";
                
                content += "Ngày đến xem phòng(dự kiến): " + intentStartDate + "<br>";
                content += "Ghi chú thêm: " + rentalNote + ".";
                
                rentalNoti.setContent(content);
                rentalNoti.setStatus(0); //0 means unread

                boolean check = NotificationDAO.saveNotification(rentalNoti);  //check if request is sent
//                if (!check) {
//                    System.out.println("Something wrong in save rental notification function!");
//                } else {
//                    System.out.println("Successfully save rental notification!");
//                }

                //end notification for landlord
                //this is notification for tenant about successfully booking request from system
                Notification successNoti = new Notification();

                successNoti.setToAccount(t.getAccount());
                successNoti.setCreatedDate(new Date());
                
                content = "Bạn đã đăng kí xem loại phòng " + roomType.getRoomTypeName()
                        + ", ở nhà trọ " + roomType.getHostel().getHostelName() + " thành công!<br>";
                
                content += "Ngày đến xem phòng(dự kiến): " + intentStartDate + "<br>";
                content += "Ghi chú thêm: " + rentalNote + ".";
                
                successNoti.setContent(content);

                successNoti.setStatus(0); //0 means unread
                check = NotificationDAO.saveNotification(successNoti);
//                if (!check) {
//                    System.out.println("Something wrong in save success notification function!");
//                } else {
//                    System.out.println("Successflly save success notification function");
//                }
                //end notification for landlord

                //this is booking request adding function
                int testID = BookingRequestDAO.saveBookingRequest(t.getAccount().getAccountID(), roomType.getRoomTypeID(), rentalNoti.getCreatedDate(), 1, ""); // 1 means pending from landlord

                System.out.println("MY TEST ID: " + testID);

                //end booking request adding function
                //this will show notification after returning back to hostel detail page!
                response.sendRedirect("/sakura/tenant/rental-request");
                return;

                //end function
            } else if (path.equals("/address")) {
                int provinceID = Integer.parseInt(request.getParameter("provinceID"));
                List<District> districtList = DistrictDAO.findByProvinceID(provinceID);
                int districtSelected = 0;
                if (request.getParameter("districtSelected") != null && !request.getParameter("districtSelected").equals("")) {
                    districtSelected = Integer.parseInt(request.getParameter("districtSelected"));
                    for (District district : districtList) {
                        if (district.getDistrictID() == districtSelected) {
                            out.println("<option selected value='" + district.getDistrictID() + "'>" + district.getDistrictName() + "</option>");
                        } else {
                            out.println("<option value='" + district.getDistrictID() + "'>" + district.getDistrictName() + "</option>");
                        }
                    }
                } else {
                    for (District district : districtList) {
                        out.println("<option value='" + district.getDistrictID() + "'>" + district.getDistrictName() + "</option>");
                    }
                }
            } else if (path.equals("/add-hostel")) {
                String name = request.getParameter("name");
                int districtId = Integer.parseInt(request.getParameter("districtId"));
                String streetAddress = request.getParameter("streetAddress");
                String description = request.getParameter("description");
                int landlordId = Integer.parseInt(request.getParameter("landlordId"));
                boolean addSuccess = HostelDAO.save(name, districtId, streetAddress, description, landlordId);
                Hostel newHostel = HostelDAO.findLastHostelByHostelId(landlordId);
                List<Hostel> hostelList = HostelDAO.findByLandlord(landlordId);
                session.setAttribute("hostelList", hostelList);
                ServiceDAO.saveDefaultService(newHostel.getHostelID());
                if (addSuccess) {
                    out.println("<p class=\"inline-block text-green-600\">Thêm nhà trọ " + newHostel.getHostelName() + " thành công! Xem <span>");
                    out.println("<form class=\"inline-block w-[1px] text-left\" action=\"/sakura/landlord/hostel-info\" method='post'>");
                    out.println("<input type='hidden' name=\"hostelId\" value='" + newHostel.getHostelID() + "'>");
                    out.println("<input type='hidden' name=\"newHostelId\" value='" + newHostel.getHostelID() + "'>");
                    out.println("<input type='hidden' name=\"newHostelName\" value='" + newHostel.getHostelName()+ "'>");
                    out.println("<input type=\"submit\" class=\"ml-[4px] hover:underline text-green-800 cursor-pointer font-bold\" value=\"tại đây\">");
                    out.println("</form></span></p>");
                } else {
                    out.print("Thông tin không hợp lệ. Vui lòng kiểm tra lại.");
                }
            } else if (path.equals("/check-hostel-valid")) {
                String hostelName = request.getParameter("hostelName").trim();
                int landlordId = Integer.parseInt(request.getParameter("landlordId"));
                boolean isExistHostel = HostelDAO.isExistHostel(hostelName, landlordId);
                if (isExistHostel) {
                    out.print("Tên nhà trọ đã tồn tại. Vui lòng kiểm tra lại!");
                } else {
                    out.print("");
                }
            } else if (path.equals("/update-hostel")) {
                String name = request.getParameter("name");
                int updateDistrictId = Integer.parseInt(request.getParameter("updateDistrictId"));
                String updateStreetAddress = request.getParameter("updateStreetAddress");
                String description = request.getParameter("description");
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));

                boolean updateSuccess = HostelDAO.updateHostelById(hostelId, name, updateDistrictId, updateStreetAddress, description);
                if (updateSuccess) {
                    out.print("Cập nhật thành công");
                    System.out.println("success");
                    session.setAttribute("currentHostel", HostelDAO.findById(hostelId));
                } else {
                    out.print("Thông tin không hợp lệ. Vui lòng kiểm tra lại.");
                    System.out.println("failed");
                }
            } else if (path.equals("/check-update-hostel-valid")) {
                String updateName = request.getParameter("updateName");
                int landlordId = Integer.parseInt(request.getParameter("landlordId"));
                String currentName = request.getParameter("currentName");
                if (!updateName.equals(currentName)) {
                    boolean isExistHostel = HostelDAO.isExistHostel(updateName, landlordId);
                    if (isExistHostel) {
                        out.print("Tên nhà trọ đã tồn tại. Vui lòng kiểm tra lại!");
                    } else {
                        out.print("");
                    }
                }
            } else if (path.equals("/delete-hostel")) {
                int hostelId = Integer.parseInt(request.getParameter("deleteHostelId"));
                boolean deleteSuccess = HostelDAO.deleteById(hostelId);
//                if (deleteSuccess) {
//                    deleteSuccess = RoomTypeDAO.deleteByHostelId(hostelId);
//                }
//                if (deleteSuccess) {
//                    deleteSuccess = RoomDAO.deleteByHostelId(hostelId);
//                }
//                if (deleteSuccess) {
//                    deleteSuccess = RoomResidentDAO.deleteByHostelId(hostelId);
//                }
                if (deleteSuccess) {
                    out.print("Xóa thành công");
                    Landlord landlord = (Landlord) session.getAttribute("currentUser");
                    List<Hostel> hostelList = HostelDAO.findByLandlord(landlord.getAccount().getAccountID());
                    session.setAttribute("hostelList", hostelList);
                    session.setAttribute("currentHostel", null);
                } else {
                    out.print("Xóa không thành công");
                }
            }
        }
    }

    private void sortByMinPrice(List<Hostel> hostelList, boolean asc) {
        if (asc) {
            Collections.sort(hostelList, new Comparator<Hostel>() {
                @Override
                public int compare(Hostel o1, Hostel o2) {
                    return (o1.getMinPrice() - o2.getMinPrice());
                }
            });
        } else {
            Collections.sort(hostelList, new Comparator<Hostel>() {
                @Override
                public int compare(Hostel o1, Hostel o2) {
                    return (o2.getMinPrice() - o1.getMinPrice());
                }
            });
        }
    }

    private void sortByMaxPrice(List<Hostel> hostelList, boolean asc) {
        if (asc) {
            Collections.sort(hostelList, new Comparator<Hostel>() {
                @Override
                public int compare(Hostel o1, Hostel o2) {
                    return (o1.getMaxPrice() - o2.getMaxPrice());
                }
            });
        } else {
            Collections.sort(hostelList, new Comparator<Hostel>() {
                @Override
                public int compare(Hostel o1, Hostel o2) {
                    return (o2.getMaxPrice() - o1.getMaxPrice());
                }
            });
        }
    }

    private void sortByRate(List<Hostel> hostelList, boolean asc) {
        if (asc) {
            Collections.sort(hostelList, new Comparator<Hostel>() {
                @Override
                public int compare(Hostel o1, Hostel o2) {
                    if (o1.getRating() - o2.getRating() >= 0) {
                        return 1;
                    } else {
                        return -1;
                    }
                }
            });
        } else {
            Collections.sort(hostelList, new Comparator<Hostel>() {
                @Override
                public int compare(Hostel o1, Hostel o2) {
                    if (o2.getRating() - o1.getRating() >= 0) {
                        return 1;
                    } else {
                        return -1;
                    }
                }
            });
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
