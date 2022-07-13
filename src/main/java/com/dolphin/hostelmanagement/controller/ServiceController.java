/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.ServiceDAO;
import com.dolphin.hostelmanagement.DTO.Service;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ServiceController extends HttpServlet {

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
            if (path.equals("/add-service")) {
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                String serviceName = request.getParameter("serviceName");
                int serviceFee = Integer.parseInt(request.getParameter("serviceFee"));
                String serviceUnit = request.getParameter("serviceUnit");

                boolean addSuccess = ServiceDAO.save(hostelId, serviceName, serviceFee, serviceUnit, 0);
                Service service = ServiceDAO.findLastServiceByHostelId(hostelId);
                if (addSuccess) {
                    out.print("<tr class=\"bg-white hover:bg-gray-50 border-b text-[15px] text-gray-800\">\n"
                            + "                                        <td class=\"px-3 py-4\">\n"
                            + "                                            <input name=\"updateName\" type=\"text\" class=\"text-[15px]\" value=\"" + service.getServiceName() + "\"/>\n"
                            + "                                        </td>\n"
                            + "                                        <td class=\"px-3 py-4 text-center\">\n"
                            + "                                            <input name=\"updateFee\" type=\"text\" class=\"text-[15px]\" value=\"" + service.getServiceFee() + "\"/>\n"
                            + "                                        </td>\n"
                            + "                                        <td class=\"px-3 py-4 text-center\">\n"
                            + "                                            <input name=\"updateUnit\" type=\"text\" class=\"text-[15px]\" value=\"" + service.getUnit() + "\"/>\n"
                            + "                                        </td>\n"
                            + "                                        <td class=\"px-3 py-4 text-center\">\n"
                            + "                                            " + service.getMonthApplied() + "\n"
                            + "                                        </td>\n"
                            + "                                        <td class=\"px-3 py-4 text-center\">\n"
                            + "                                            <button onclick=\"updateService(this)\" type=\"submit\" value=\"" + service.getServiceID() + "\" class=\"font-medium text-[#288D87] hover:underline\">Lưu thay đổi</button>\n"
                            + "                                        </td>\n"
                            + "                                        <td class=\"px-3 py-4 text-center\">\n"
                            + "                                            <button onclick=\"deleteService(this)\" type=\"submit\" value=\"" + service.getServiceID() + "\" class=\"font-medium text-[#288D87] hover:underline\">Xóa</button>\n"
                            + "                                        </td>\n"
                            + "                                    </tr>");
                } else {
                    out.print("Thông tin không hợp lệ. Vui lòng kiểm tra lại.");
                }
            }

            if (path.equals("/edit-service")) {
                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                int serviceId = Integer.parseInt(request.getParameter("serviceId"));
                String serviceName = request.getParameter("serviceName");
                int serviceFee = Integer.parseInt(request.getParameter("serviceFee"));
                String serviceUnit = request.getParameter("serviceUnit");
                int serviceType = Integer.parseInt(request.getParameter("serviceType"));

                boolean addSuccess = ServiceDAO.save(hostelId, serviceName, serviceFee, serviceUnit, serviceType);
                boolean deleteSuccess = ServiceDAO.delete(serviceId);
                if (addSuccess && deleteSuccess) {
                    out.print("<h1>Cập nhật dịch vụ " + serviceName + " thành công</h1>");

                } else {
                    out.print("Thông tin không hợp lệ. Vui lòng kiểm tra lại.");
                }
            }

            if (path.equals("/delete-service")) {
                int serviceId = Integer.parseInt(request.getParameter("serviceId"));
                String serviceName = request.getParameter("serviceName");
                boolean deleteSuccess = ServiceDAO.delete(serviceId);
                if (deleteSuccess) {
                    out.print("<h1>Xóa dịch vụ " + serviceName + " thành công</h1>");
                } else {
                    out.print("Thông tin không hợp lệ. Vui lòng kiểm tra lại.");
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
