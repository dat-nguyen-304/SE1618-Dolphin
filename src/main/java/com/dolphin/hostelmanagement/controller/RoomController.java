/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.RoomDAO;
import com.dolphin.hostelmanagement.DAO.RoomResidentDAO;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.RoomResident;
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
                    out.print("<tr class=\"member-${iterator} bg-white border-b hover:bg-gray-50\">\n"
                            + "                                                <td class=\"px-3 py-4 text-center\">\n"
                            + "                                                    " + roomResident.getRoomResidentID() + "\n"
                            + "                                                </td>\n"
                            + "                                                <td class=\"px-3 py-4 text-center\">\n"
                            + "                                                    <input name=\"updateFullName\" type=\"text\" class=\"text-xs\" value=\"" + roomResident.getFullname() + "\"/>\n"
                            + "\n"
                            + "                                                </td>\n"
                            + "                                                <td class=\"px-3 py-4 text-center\">\n"
                            + "                                                    <input name=\"updatePhone\" type=\"text\" class=\"text-xs\" value=\"" + roomResident.getPhone() + "\"/>\n"
                            + "                                                </td>\n"
                            + "                                                <td class=\"px-3 py-4 text-center\">\n"
                            + "                                                    <input name=\"updateDob\" type=\"date\" value=\"" + roomResident.getDob() + "\"/>\n"
                            + "                                                </td>\n"
                            + "                                                <td class=\"px-3 py-4 text-right text-center\">\n"
                            + "                                                    <button onclick=\"updateMember(this)\" type=\"submit\" value=\"" + roomResident.getRoomResidentID() + "\" class=\"font-medium text-[#17535B]\" data-modal-toggle=\"updateMemberModal\">Lưu thay đổi</button>\n"
                            + "                                                </td>\n"
                            + "                                                <td class=\"px-3 py-4 text-right text-center\">\n"
                            + "                                                    <button onclick=\"deleteMember(this)\" type=\"submit\" value=\"" + roomResident.getRoomResidentID() + "\" class=\"font-medium text-[#17535B]\">Xóa</button>\n"
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
                if (updateFullName.isEmpty() || updatePhone.isEmpty() || updateDob.isEmpty()) {
                    if (updateFullName.isEmpty()) {
                        out.print("Tên người ở - ");
                    }
                    if (updatePhone.isEmpty()) {
                        out.print("SÐT - ");
                    }
                    if (updateDob.isEmpty()) {
                        out.print("Ngày sinh ");
                    }
                    out.print("không được trống");
                } else {
                    boolean updateSuccess = RoomResidentDAO.update(residentId, updateFullName, updatePhone, updateDob);
                    if (updateSuccess) {
                        out.print("Cập nhật thành công");
                    } else {
                        out.print("Cập nhật thất bại. Vui lòng kiểm tra lại thông tin");
                    }
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
