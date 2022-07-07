/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.AccountDAO;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.LandlordDAO;
import com.dolphin.hostelmanagement.DAO.NotificationDAO;
import com.dolphin.hostelmanagement.DAO.TenantDAO;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Notification;
import com.dolphin.hostelmanagement.DTO.Tenant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AdminController extends HttpServlet {

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

        try ( PrintWriter out = response.getWriter()) {
            String url = ERROR;
            String path = request.getPathInfo();
            System.out.println("Path: " + path);
            HttpSession session = request.getSession(true);
            
            if(path.equals("/dashboard")) {
                
                request.getRequestDispatcher("/view/adminOverview.jsp").forward(request, response);
            }

            if (path.equals("/tenant-management")) {
                ArrayList<Tenant> tenantList = (ArrayList<Tenant>) TenantDAO.findAll();
                /*ArrayList<Tenant> tenantList = new ArrayList<>();
                String keyword = request.getParameter("keyword");
                String searchBy = request.getParameter("search-option");

                if (keyword != null && searchBy != null) {
                    session.setAttribute("keyword", keyword);
                    if (searchBy.equalsIgnoreCase("username-keyword")) {
                        session.setAttribute("searchBy", "username");
                        for (Tenant t : fullList) {
                            if (t.getAccount().getUsername().contains(keyword)) {
                                tenantList.add(t);
                            }
                        }
                    }

                    if (searchBy.equalsIgnoreCase("email-keyword")) {
                        session.setAttribute("searchBy", "email");
                        for (Tenant t : fullList) {
                            if (t.getAccount().getEmail().contains(keyword)) {
                                tenantList.add(t);
                            }
                        }
                    }

                    if (searchBy.equalsIgnoreCase("phone-keyword")) {
                        session.setAttribute("searchBy", "phone");
                        for (Tenant t : fullList) {
                            if (t.getPhone().contains(keyword)) {
                                tenantList.add(t);
                            }
                        }
                    }
                } else if (session.getAttribute("keyword") != null && session.getAttribute("searchBy") != null) {
                    keyword = (String) session.getAttribute("keyword");
                    searchBy = (String) session.getAttribute("searchBy");

                    if (searchBy.equalsIgnoreCase("username")) {
                        //session.setAttribute("searchBy", "username");
                        for (Tenant t : fullList) {
                            if (t.getAccount().getUsername().contains(keyword)) {
                                tenantList.add(t);
                            }
                        }
                    }

                    if (searchBy.equalsIgnoreCase("email")) {
                        //session.setAttribute("searchBy", "email");
                        for (Tenant t : fullList) {
                            if (t.getAccount().getEmail().contains(keyword)) {
                                tenantList.add(t);
                            }
                        }
                    }

                    if (searchBy.equalsIgnoreCase("phone")) {
                        //session.setAttribute("searchBy", "phone");
                        for (Tenant t : fullList) {
                            if (t.getPhone().contains(keyword)) {
                                tenantList.add(t);
                            }
                        }
                    }
                }
                else tenantList = fullList;

                int currentPage = -1;
                if(request.getParameter("currentPage") != null) currentPage = Integer.parseInt(request.getParameter("currentPage"));
                else if(session.getAttribute("currentPage") != null) currentPage = (int) session.getAttribute("currentPage");
                else currentPage = 1;
                
                int startPage = 1;
                int itemsPerPage = 10;
                int totalPage = (int) Math.ceil((double) tenantList.size() / itemsPerPage);
                int endPage = totalPage;

                int startIndex = (currentPage - 1) * itemsPerPage;
                int endIndex = Math.min(currentPage * itemsPerPage, (int) tenantList.size());
                session.setAttribute("tenantList", tenantList.subList(startIndex, endIndex));
                session.setAttribute("endPage", endPage);
                session.setAttribute("currentPage", currentPage);*/

                request.setAttribute("tenantList", tenantList);
                
                request.getRequestDispatcher("/view/adminTenantManagement.jsp").forward(request, response);
            }
            
            if(path.equals("/landlord-management")) {
                ArrayList<Landlord> landlordList = (ArrayList<Landlord>) LandlordDAO.findAll();
                
                request.setAttribute("landlordList", landlordList);
                request.getRequestDispatcher("/view/adminLandlordManagement.jsp").forward(request, response);
            }

            if (path.equals("/accountStatus")) {
                int accountID = Integer.parseInt(request.getParameter("accountID"));
                String query = request.getParameter("query");

                if (query.equals("activate")) {
                    AccountDAO.changeStatus(accountID, true);
                } else if (query.equals("deactivate")) {
                    AccountDAO.changeStatus(accountID, false);
                }
                
                //sau nay hen xui co the gui mail khoa tai khoan/ mo tai khoan cho account do :D
                    
                response.sendRedirect("/sakura/admin/tenant-management");
            }
            
            if(path.equals("/tenant-detail")) {
                int accountID = Integer.parseInt(request.getParameter("accountID"));
                
                Tenant t = TenantDAO.findById(accountID);
                
                request.setAttribute("tenant", t);
                
                request.getRequestDispatcher("/view/adminTenantDetail.jsp").forward(request, response);
            }
            
            
            if(path.equals("/landlord-detail")) {
                int accountID = Integer.parseInt(request.getParameter("accountID"));
                
                Landlord l = LandlordDAO.findById(accountID);
                
                request.setAttribute("landlord", l);
                
                ArrayList<Hostel> hostelList = (ArrayList<Hostel>) HostelDAO.findByLandlord(accountID);
                
                request.setAttribute("hostelList", hostelList);
                
                request.getRequestDispatcher("/view/adminLandlordDetail.jsp").forward(request, response);
            }
            
            if(path.equals("/hostel-management")) {
                ArrayList<Hostel> hostelList = (ArrayList<Hostel>) HostelDAO.findAll();
                
                request.setAttribute("hostelList", hostelList);
                
                request.getRequestDispatcher("/view/adminHostelManagement.jsp").forward(request, response);
            }
            
            if(path.equals("/hostel-detail")) {
                int hostelID = Integer.parseInt(request.getParameter("hostelID"));
                
                Hostel currentHostel = HostelDAO.findById(hostelID);
                
                ArrayList<Hostel> hostelList = (ArrayList<Hostel>) HostelDAO.findByLandlord(currentHostel.getLandlord().getAccount().getAccountID());
                
                request.setAttribute("currentHostel", currentHostel);
                request.setAttribute("hostelList", hostelList);
                
                request.getRequestDispatcher("/view/adminHostelDetail.jsp").forward(request, response);
                
            }
            
            if (path.equals("/hostelStatus")) {
                int hostelID = Integer.parseInt(request.getParameter("hostelID"));
                Hostel hostel = HostelDAO.findById(hostelID);
                String query = request.getParameter("query");
                
                Notification noti = new Notification();
                
                noti.setCreatedDate(new Date());
                noti.setStatus(1);
                noti.setToAccount(hostel.getLandlord().getAccount());

                if (query.equals("activate")) {
                    HostelDAO.updateStatus(hostelID, true);
                    noti.setContent("Nhà trọ " + hostel.getHostelName() + " của bạn đã được mở khóa bởi admin!");
                } else if (query.equals("deactivate")) {
                    HostelDAO.updateStatus(hostelID, false);
                    noti.setContent("Nhà trọ " + hostel.getHostelName() + " của bạn đã bị khóa bởi admin!");
                }
                
                NotificationDAO.saveNotification(noti);

                response.sendRedirect("/sakura/admin/hostel-management");
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
