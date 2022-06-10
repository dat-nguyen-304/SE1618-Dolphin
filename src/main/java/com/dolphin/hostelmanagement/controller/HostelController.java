/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.FavoriteHostelDAO;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.RoomDAO;
import com.dolphin.hostelmanagement.DTO.FavoriteHostel;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Room;
import com.dolphin.hostelmanagement.DTO.Tenant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    private void sortByMinPrice(ArrayList<Hostel> hostelList, boolean asc) {
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

    private void sortByMaxPrice(ArrayList<Hostel> hostelList, boolean asc) {
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

    private void sortByRate(ArrayList<Hostel> hostelList, boolean asc) {
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String path = request.getPathInfo();
            if (path.equals("/list")) {
                ArrayList<Hostel> hostelList = null;
                if (request.getParameter("keyword") != null) {
                    String hostelName = request.getParameter("keyword");
                    hostelList = (ArrayList<Hostel>) HostelDAO.findByName(hostelName);
                    request.setAttribute("keyword", hostelName);
                } else {
                    hostelList = (ArrayList<Hostel>) HostelDAO.findAll();
                }
                if (request.getParameter("sortByMinPrice") != null) {
                    if (request.getParameter("sortByMinPrice").equals("asc")) {
                        sortByMinPrice(hostelList, true);
                    } else {
                        sortByMinPrice(hostelList, false);
                    }
                }
                if (request.getParameter("sortByMaxPrice") != null) {
                    if (request.getParameter("sortByMaxPrice").equals("asc")) {
                        sortByMaxPrice(hostelList, true);
                    } else {
                        sortByMaxPrice(hostelList, false);
                    }
                }
                if (request.getParameter("sortByRate") != null) {
                    if (request.getParameter("sortByRate").equals("asc")) {
                        sortByRate(hostelList, true);
                    } else {
                        sortByRate(hostelList, false);
                    }
                }
                request.setAttribute("hostelList", hostelList);
                request.getRequestDispatcher("/view/hostelList.jsp").forward(request, response);
            } else if (path.equals("/detail")) {
                request.getRequestDispatcher("/view/homepage.jsp").forward(request, response);
            } else if (path.equals("/toggleFavHostel")) {
                try {
                    int hostelID = Integer.parseInt(request.getParameter("hostelID"));
                    System.out.println(hostelID + " line 40");
                    HttpSession session = request.getSession();
                    Tenant t = (Tenant) session.getAttribute("currentUser");
                    int tenantID = t.getAccount().getAccountID();
                    System.out.println(tenantID + " line 44");
                    if (FavoriteHostelDAO.findByHostelTenant(hostelID, tenantID) == null) {
                        FavoriteHostelDAO.save(hostelID, tenantID);
                        System.out.println("Added Fav Hostel!");
                    } else {
                        if (FavoriteHostelDAO.toggleFavoriteHostel(hostelID, tenantID)) {
                            System.out.println("Toggled Fav Hostel!");
                        }
                    }
                    session.setAttribute("favoriteHostels", FavoriteHostelDAO.findByTenantID(tenantID));
                } catch (Exception e) {
                    log("Error at ToggleFavHostelServlet: " + e.toString());
                }
            } else if (path.equals("/roomList")) {
                int hostelID = 1;//Integer.parseInt(request.getParameter("hostelID"));                
                ArrayList<Room> fullRoomList = RoomDAO.findRoomByHostelID(hostelID);

                ArrayList<ArrayList<Room>> roomList = new ArrayList<>();
                roomList.add(new ArrayList<Room>());

                for (Room r : fullRoomList) {
                    ArrayList<Room> lastList = roomList.get(roomList.size() - 1);
                    if (lastList.isEmpty() || lastList.get(lastList.size() - 1).getArea() == r.getArea()) {
                        lastList.add(r);
                        roomList.set(roomList.size() - 1, lastList);
                    } else {
                        lastList = new ArrayList<>();
                        lastList.add(r);
                        roomList.add(lastList);
                    }
                }

                request.setAttribute("roomList", roomList);
                request.getRequestDispatcher("/view/roomList.jsp").forward(request, response);
            } else if (path.equals("/roomDetail")) {
                int roomID = Integer.parseInt(request.getParameter("roomID"));
                System.out.println("RoomID: " + roomID);
                Room room = RoomDAO.findByID(roomID);
                request.setAttribute("room", room);
                request.getRequestDispatcher("/view/roomDetail.jsp").forward(request, response);
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
