/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.RoomDAO;
import com.dolphin.hostelmanagement.DAO.RoomResidentDAO;
import com.dolphin.hostelmanagement.DAO.RoomTypeDAO;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.RoomResident;
import com.dolphin.hostelmanagement.DTO.RoomType;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
public class RoomController extends HttpServlet {

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
        HttpSession session = request.getSession();
        try ( PrintWriter out = response.getWriter()) {
            String path = request.getPathInfo();
            if (path.equals("/roomsNeedInvoice")) {
                String hostelID = request.getParameter("hostelID");
                int id = 0;
                if (hostelID != null) {
                    id = Integer.parseInt(hostelID);
                    List<Room> roomList = RoomDAO.findRoomsNeedInvoice(id);

                    JSONArray list = new JSONArray();
                    for (Room room : roomList) {
                        JSONObject obj = new JSONObject();
                        String roomID = Integer.toString(room.getRoomID());
                        String roomNumber = room.getRoomNumber();
                        obj.put("roomID", roomID);
                        obj.put("roomNumber", roomNumber);
                        list.add(obj);
                    }
                    out.write(list.toJSONString());
                    out.close();
                }
            }

            if (path.equals("/add-member")) {
                int roomId = Integer.parseInt(request.getParameter("roomId"));
                String memberName = request.getParameter("memberName");
                String memberPhone = request.getParameter("memberPhone");
                String memberDob = request.getParameter("memberDob");
                boolean updateSuccess = RoomResidentDAO.save(roomId, memberName, memberPhone, memberDob);
                RoomResident roomResident = RoomResidentDAO.findLastRoomResidentByRoomId(roomId);
                if (updateSuccess) {
                    out.print("<tr class=\"py-[10px] text-[16px] bg-white border-b hover:bg-gray-50 grid grid-cols-12 gap-[10px]\">\n"
                            + "                                                <td class=\"col-span-2 text-center\">\n"
                            + "                                                    <p class=\"p-2\">" + roomResident.getRoomResidentID() + "</p>\n"
                            + "                                                </td>\n"
                            + "                                                <td class=\"col-span-3\">\n"
                            + "                                                    <input name=\"updateFullName\" type=\"text\" class=\"w-full p-2\" value=\"" + roomResident.getFullname() + "\"/>\n"
                            + "                                                </td>\n"
                            + "                                                <td class=\"col-span-2\">\n"
                            + "                                                    <input name=\"updatePhone\" type=\"text\" class=\"w-full p-2\" value=\"" + roomResident.getPhone() + "\"/>\n"
                            + "                                                </td>\n"
                            + "                                                <td class=\"col-span-2\">\n"
                            + "                                                    <input name=\"updateDob\" type=\"date\" class=\"w-full p-2\"  value=\"" + roomResident.getDob() + "\"/>\n"
                            + "                                                </td>\n"
                            + "                                                <td class=\"col-span-3 flex justify-around items-center\">\n"
                            + "                                                    <button onclick=\"updateMember(this)\" type=\"submit\" value=\"" + roomResident.getRoomResidentID() + "\" class=\"mx-auto font-[15px] text-[#288D87] hover:underline\">Lưu thay đổi</button>\n"
                            + "                                                    <button onclick=\"deleteMember(this)\" type=\"submit\" value=\"" + roomResident.getRoomResidentID() + "\" class=\"mx-auto font-[15px] text-[#288D87] hover:underline\">Xóa</button>\n"
                            + "                                                </td>\n"
                            + "                                            </tr>");
                } else {
                    out.print("Thông tin không hợp lệ. Vui lòng kiểm tra lại.");
                }

            } else if (path.equals("/update-member")) {
                int residentId = Integer.parseInt(request.getParameter("residentId"));
                String updateFullName = request.getParameter("updateFullName");
                String updatePhone = request.getParameter("updatePhone");
                String updateDob = request.getParameter("updateDob");

                boolean updateSuccess = RoomResidentDAO.update(residentId, updateFullName, updatePhone, updateDob);
                if (updateSuccess) {
                    out.print("Cập nhật thành công");
                } else {
                    out.print("Cập nhật thất bại. Vui lòng kiểm tra lại thông tin");
                }

            } else if (path.equals("/delete-member")) {
                int residentId = Integer.parseInt(request.getParameter("residentId"));
                boolean deleteSuccess = RoomResidentDAO.delete(residentId);
                if (deleteSuccess) {
                    out.print("Xóa thành công");
                } else {
                    out.print("Xóa thất bại");
                }
            } else if (path.equals("/update-current-resident-number")) {
                int roomId = Integer.parseInt(request.getParameter("roomId"));
                int currentResidentQuantity = Integer.parseInt(request.getParameter("currentResidentQuantity"));
                boolean updateSuccess = RoomDAO.setCurrentNumberOfResidents(roomId, currentResidentQuantity);
                if (updateSuccess) {
                    out.print("Success");
                } else {
                    out.print("Fail");
                }
            } else if (path.equals("/add-roomtype")) {
                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                int area = Integer.parseInt(request.getParameter("area"));
                int maxNumberOfResidents = Integer.parseInt(request.getParameter("maxNumberOfResidents"));
                String description = request.getParameter("description");
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                Hostel hostel = HostelDAO.findById(hostelId);

                boolean addSuccess = RoomTypeDAO.save(name, price, area, maxNumberOfResidents, description, hostelId);
                RoomType newRoomType = RoomTypeDAO.findLastRoomTypeByHostelId(hostelId);
                if (addSuccess) {
                    if (hostel.getMinArea() == 0) {
                        HostelDAO.updateMinArea(hostelId, area);
                        HostelDAO.updateMaxArea(hostelId, area);
                    } else {
                        if (hostel.getMaxArea() < area) {
                            HostelDAO.updateMaxArea(hostelId, area);
                        } else if (hostel.getMinArea() > area) {
                            HostelDAO.updateMinArea(hostelId, area);
                        }
                    }
                    if (hostel.getMinPrice() == 0) {
                        HostelDAO.updateMinPrice(hostelId, price);
                        HostelDAO.updateMaxPrice(hostelId, price);
                    } else {
                        if (hostel.getMaxArea() < price) {
                            HostelDAO.updateMaxPrice(hostelId, price);
                        } else if (hostel.getMinPrice() > price) {
                            HostelDAO.updateMinPrice(hostelId, price);
                        }
                    }
                    session.setAttribute("currentHostel", hostel);
                    out.println("<span class=\"inline-block text-green-600\">Thêm loại phòng " + newRoomType.getRoomTypeName() + " thành công! Xem");
                    out.println("<form class=\"inline-block w-[1px] text-left\" action=\"/sakura/landlord/room-type\">");
                    out.println("<input type='hidden' name=\"roomTypeId\" value='" + newRoomType.getRoomTypeID() + "'>");
                    out.println("<input type=\"submit\" value=\"tại đây\">");
                    out.println("</form></span>");
                } else {
                    out.print("Thông tin không hợp lệ. Vui lòng kiểm tra lại.");
                }

            } else if (path.equals("/update-roomtype")) {
                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                int area = Integer.parseInt(request.getParameter("area"));
                int maxNumberOfResidents = Integer.parseInt(request.getParameter("maxNumberOfResidents"));
                String description = request.getParameter("description");
                int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
                Hostel currentHostel = (Hostel) session.getAttribute("currentHostel");
                int hostelId = currentHostel.getHostelID();
                boolean updateSuccess = RoomTypeDAO.updateRoomTypeById(roomTypeId, name, price, area, maxNumberOfResidents, description);
                if (updateSuccess) {
                    List<RoomType> roomTypeList = RoomTypeDAO.findByHostelID(hostelId);

                    int minPrice = Integer.MAX_VALUE;
                    int maxPrice = -1;
                    int minArea = Integer.MAX_VALUE;
                    int maxArea = -1;
                    for (RoomType roomtype : roomTypeList) {
                        minPrice = Math.min(minPrice, roomtype.getAdvertisedPrice());
                        maxPrice = Math.max(maxPrice, roomtype.getAdvertisedPrice());
                        minArea = Math.min(minArea, roomtype.getArea());
                        maxArea = Math.max(maxArea, roomtype.getArea());
                    }
                    HostelDAO.updateMinArea(hostelId, minArea);
                    HostelDAO.updateMaxArea(hostelId, maxArea);
                    HostelDAO.updateMinPrice(hostelId, minPrice);
                    HostelDAO.updateMaxPrice(hostelId, maxPrice);

                    session.setAttribute("currentHostel", HostelDAO.findById(hostelId));
                    out.print("Cập nhật thành công");
                } else {
                    out.print("Thông tin không hợp lệ. Vui lòng kiểm tra lại.");
                }

            } else if (path.equals("/update-room")) {
                int roomId = Integer.parseInt(request.getParameter("roomId"));
                String updateRoomNumber = request.getParameter("updateRoomNumber");
                int updateRoomType = Integer.parseInt(request.getParameter("updateRoomType"));
                int oldRoomTypeId = RoomDAO.findByID(roomId).getRoomType().getRoomTypeID();
                boolean updateSuccess = RoomDAO.updateRoom(roomId, updateRoomType, updateRoomNumber);
                if (updateSuccess) {
                    int newRoomTypeId = RoomDAO.findByID(roomId).getRoomType().getRoomTypeID();
                    if (oldRoomTypeId != newRoomTypeId) {
                        RoomTypeDAO.updateTotalRoom(oldRoomTypeId, -1);
                        RoomTypeDAO.updateTotalRoom(newRoomTypeId, 1);
                        if (RoomDAO.findByID(roomId).getStatus() == 0) {
                            RoomTypeDAO.updateAvailableRoom(oldRoomTypeId, -1);
                            RoomTypeDAO.updateAvailableRoom(newRoomTypeId, 1);
                        }
                    }
                    out.print("Cập nhật thành công");
                } else {
                    out.print("Thông tin không hợp lệ. Vui lòng kiểm tra lại.");
                }
            } else if (path.equals("/check-roomtype-valid")) {
                String roomTypeName = request.getParameter("roomTypeName").trim();
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                boolean isExistRoomType = RoomTypeDAO.isExistRoomType(roomTypeName, hostelId);
                if (isExistRoomType) {
                    out.print("Tên loại phòng đã tồn tại. Vui lòng kiểm tra lại!");
                } else {
                    out.print("");
                }
            } else if (path.equals("/check-update-roomtype-valid")) {
                String roomTypeName = request.getParameter("roomTypeName").trim();
                String currentName = request.getParameter("currentName").trim();
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                if (!roomTypeName.equals(currentName)) {
                    boolean isExistRoomType = RoomTypeDAO.isExistRoomType(roomTypeName, hostelId);
                    if (isExistRoomType) {
                        out.print("Tên loại phòng đã tồn tại. Vui lòng kiểm tra lại!");
                    } else {
                        out.print("");
                    }
                } else {
                    out.print("");
                }
            } else if (path.equals("/check-room-valid")) {
                String roomNumber = request.getParameter("roomNumber").trim();
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                boolean isExistRoomNumber = RoomDAO.isExistRoomNumber(roomNumber, hostelId);
                if (isExistRoomNumber) {
                    out.print("Tên phòng đã tồn tại. Vui lòng kiểm tra lại!");
                } else {
                    out.print("");
                }
            } else if (path.equals("/delete-roomtype")) {
                int roomTypeId = Integer.parseInt(request.getParameter("deleteRoomTypeId"));
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                RoomType roomType = RoomTypeDAO.findByID(roomTypeId);

                boolean deleteSuccess = RoomTypeDAO.deleteById(roomTypeId);
                RoomDAO.deleteByRoomTypeId(roomTypeId);
                RoomResidentDAO.deleteByRoomTypeId(roomTypeId);
                if (deleteSuccess) {
                    HostelDAO.updateAvailableRoom(hostelId, -roomType.getAvailableRoom());
                    HostelDAO.updateTotalRoom(hostelId, -roomType.getTotalRoom());
                    RoomTypeDAO.updateAvailableRoom(roomTypeId, -roomType.getAvailableRoom());
                    RoomTypeDAO.updateTotalRoom(hostelId, -roomType.getTotalRoom());

                    List<RoomType> roomTypeList = RoomTypeDAO.findByHostelID(hostelId);
                    if (roomTypeList.size() == 0) {
                        HostelDAO.updateMinArea(hostelId, 0);
                        HostelDAO.updateMaxArea(hostelId, 0);
                        HostelDAO.updateMinPrice(hostelId, 0);
                        HostelDAO.updateMaxPrice(hostelId, 0);
                    } else {
                        int minPrice = Integer.MAX_VALUE;
                        int maxPrice = -1;
                        int minArea = Integer.MAX_VALUE;
                        int maxArea = -1;
                        for (RoomType roomtype : roomTypeList) {
                            minPrice = Math.min(minPrice, roomtype.getAdvertisedPrice());
                            maxPrice = Math.max(maxPrice, roomtype.getAdvertisedPrice());
                            minArea = Math.min(minArea, roomtype.getArea());
                            maxArea = Math.max(maxArea, roomtype.getArea());
                        }
                        HostelDAO.updateMinArea(hostelId, minArea);
                        HostelDAO.updateMaxArea(hostelId, maxArea);
                        HostelDAO.updateMinPrice(hostelId, minPrice);
                        HostelDAO.updateMaxPrice(hostelId, maxPrice);
                    }
                    session.setAttribute("currentHostel", HostelDAO.findById(hostelId));
                    out.print("Xóa thành công");
                } else {
                    out.print("Xóa không thành công");
                }
            } else if (path.equals("/delete-room")) {
                int roomId = Integer.parseInt(request.getParameter("deleteRoomId"));
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                Room room = RoomDAO.findByID(roomId);
                boolean deleteSuccess = RoomDAO.deleteById(roomId);
                RoomResidentDAO.deleteByRoomId(roomId);
                if (deleteSuccess) {
                    HostelDAO.updateTotalRoom(hostelId, -1);
                    RoomTypeDAO.updateTotalRoom(room.getRoomType().getRoomTypeID(), -1);
                    if (room.getStatus() == 0) {
                        HostelDAO.updateAvailableRoom(hostelId, -1);
                        RoomTypeDAO.updateAvailableRoom(room.getRoomType().getRoomTypeID(), -1);
                    }
                    out.print("Xóa thành công");
                } else {
                    out.print("Xóa không thành công");
                }
            }
            if (path.equals("/roomsByHostel")) {
                System.out.println("called");
                String hostelID = request.getParameter("hostelID");
                int id = 0;
                if (hostelID != null) {
                    id = Integer.parseInt(hostelID);
                    List<Room> roomList = RoomDAO.findByHostelID(id);

                    JSONArray list = new JSONArray();
                    for (Room room : roomList) {
                        System.out.println(room);
                        JSONObject obj = new JSONObject();
                        String roomID = Integer.toString(room.getRoomID());
                        String roomNumber = room.getRoomNumber();
                        obj.put("roomID", roomID);
                        obj.put("roomNumber", roomNumber);
                        list.add(obj);
                    }
                    out.write(list.toJSONString());
                    out.close();
                }
            } else if (path.equals("/search-room-on-modal")) {
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                String keyword = request.getParameter("keyword");
                List<Room> roomList = RoomDAO.findByHostelAndKeyword(hostelId, keyword);
                for (Room room : roomList) {
                    out.print("<form action=\"/sakura/landlord/resident\" class=\"inline-block\">\n"
                            + "                                            <button type=\"submit\" name=\"roomID\" value=\"" + room.getRoomID() + "\" class=\"px-4 py-2 m-2 rounded border-2\">" + room.getRoomNumber() + "</button>\n"
                            + "                                        </form>");
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
