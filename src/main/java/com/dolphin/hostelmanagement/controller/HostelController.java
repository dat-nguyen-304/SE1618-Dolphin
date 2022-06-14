/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.FavoriteHostelDAO;
import com.dolphin.hostelmanagement.DAO.FeedbackDAO;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DTO.Feedback;
import com.dolphin.hostelmanagement.DTO.Hostel;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String path = request.getPathInfo();
            if (path.equals("/list")) {
                List<Hostel> hostelList = null;
                int currentPage = 1;
                int itemsOnOnePage = 8;
                if (request.getParameter("paging") != null) {
                    currentPage = Integer.parseInt(request.getParameter("paging"));
                }
                if (request.getParameter("favorite") != null && request.getParameter("favorite").equals("true")) {

                    HttpSession session = request.getSession();
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

                } else if (request.getParameter("keyword") != null) {
                    String hostelName = request.getParameter("keyword");
                    hostelList = (ArrayList<Hostel>) HostelDAO.findByName(hostelName);
                    request.setAttribute("keyword", hostelName);
                } else {
                    hostelList = (ArrayList<Hostel>) HostelDAO.findAll();
                }
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

                List<Boolean> toggleList = new ArrayList<>();
                HttpSession session = request.getSession(true);
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
                int itemQuantity = hostelList.size();
                int pagingQuantity = (int) Math.ceil((double) itemQuantity / itemsOnOnePage);
                int beginIndex = (currentPage - 1) * itemsOnOnePage;
                int endIndex = currentPage * itemsOnOnePage;
                int beginPage = 1;
                int endPage = pagingQuantity;

                if (pagingQuantity > 5) {
                    if (currentPage >= 3 && currentPage <= pagingQuantity - 2) {
                        beginPage = currentPage - 2;
                        endPage = currentPage + 2;
                    } else if (currentPage >= pagingQuantity - 1) {
                        beginPage = pagingQuantity - 4;
                        endPage = pagingQuantity;
                    }
                }
                hostelList = (List<Hostel>) hostelList.subList(beginIndex, (endIndex > itemQuantity) ? itemQuantity : endIndex);
                request.setAttribute("itemQuantity", itemQuantity);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("beginPage", beginPage);
                request.setAttribute("endPage", endPage);
                request.setAttribute("pagingQuantity", pagingQuantity);
                request.setAttribute("toggleList", toggleList);
                request.setAttribute("hostelList", hostelList);

                request.getRequestDispatcher("/view/hostelList.jsp").forward(request, response);
            } else if (path.equals("/detail")) {
                int currentPage = 1;
                int itemsOnOnePage = 8;
                if (request.getParameter("paging") != null) {
                    currentPage = Integer.parseInt(request.getParameter("paging"));
                }

                HttpSession session = request.getSession();
                Tenant t = (Tenant) session.getAttribute("currentUser");

                int hostelId = Integer.parseInt(request.getParameter("hostelId"));
                Hostel hostel = HostelDAO.findById(hostelId);

                List<Feedback> feedbackList = FeedbackDAO.findByHostelId(hostelId);
                boolean isFavorite = FavoriteHostelDAO.findByHostelTenant(hostelId, t.getAccount().getAccountID());

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
                
                if (request.getParameter("feedbackContent") != null) {
                    String feedbackContent = request.getParameter("feedbackContent");
                    int rating = Integer.parseInt(request.getParameter("rating"));
                    int feedbackQuantity = feedbackList.size();
                    float currentHostelRating = hostel.getRating();
                    float newHostelRating = (float)Math.round((currentHostelRating * feedbackQuantity + rating) / (feedbackQuantity + 1) * 10) / 10;
                    hostel.setRating((float)Math.round((currentHostelRating * feedbackQuantity + rating) / (feedbackQuantity + 1) * 10) / 10);
                    HostelDAO.updateRating(hostelId, newHostelRating);
                    FeedbackDAO.add(t.getAccount().getAccountID(), hostelId, feedbackContent, rating);
                    feedbackList = FeedbackDAO.findByHostelId(hostelId);
                }

                int itemQuantity = feedbackList.size();
                int pagingQuantity = (int) Math.ceil((double) itemQuantity / itemsOnOnePage);
                int beginIndex = (currentPage - 1) * itemsOnOnePage;
                int endIndex = currentPage * itemsOnOnePage;
                int beginPage = 1;
                int endPage = pagingQuantity;

                if (pagingQuantity > 5) {
                    if (currentPage >= 3 && currentPage <= pagingQuantity - 2) {
                        beginPage = currentPage - 2;
                        endPage = currentPage + 2;
                    } else if (currentPage >= pagingQuantity - 1) {
                        beginPage = pagingQuantity - 4;
                        endPage = pagingQuantity;
                    }
                }
                feedbackList = (List<Feedback>) feedbackList.subList(beginIndex, (endIndex > itemQuantity) ? itemQuantity : endIndex);
                request.setAttribute("itemQuantity", itemQuantity);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("beginPage", beginPage);
                request.setAttribute("endPage", endPage);
                request.setAttribute("pagingQuantity", pagingQuantity);

                request.setAttribute("isFavorite", isFavorite);
                request.setAttribute("feedbackList", feedbackList);
                request.setAttribute("hostel", hostel);
                request.getRequestDispatcher("/view/hostelDetail.jsp").forward(request, response);
            } else if (path.equals("/toggleFavHostel")) {
                //Hàm bắt xử lí khi nhấn toggle favorite
                int hostelID = Integer.parseInt(request.getParameter("hostelID"));
                HttpSession session = request.getSession();
                Tenant t = (Tenant) session.getAttribute("currentUser");
                int tenantID = t.getAccount().getAccountID();
                if (FavoriteHostelDAO.findByHostelTenant(hostelID, tenantID) == false) {
                    FavoriteHostelDAO.save(hostelID, tenantID);
                } else {
                    FavoriteHostelDAO.remove(hostelID, tenantID);
                }
                session.setAttribute("favoriteHostelIds", FavoriteHostelDAO.findFavHostelIds(t.getAccount().getAccountID()));
            } /*else if (path.equals("/findWardDistrict")) {
                try {
                    String param = request.getParameter("param");
                    if (param.equals("district")) {
                        System.out.println(param);
                        JSONArray list = new JSONArray();
                        for (District district : DistrictDAO.findAll()) {
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
                    if (param.equals("ward")) {
                        System.out.println(param);
                        System.out.println(request.getParameter("districtID"));
                        JSONArray list = new JSONArray();
                        int districtID = Integer.parseInt(request.getParameter("districtID"));
                        System.out.println("Line 85 " + districtID);
                        for (Ward ward : WardDAO.findByDistrictID(districtID)) {
                            JSONObject obj = new JSONObject();
                            String wardID = Integer.toString(ward.getWardID());
                            String wardName = ward.getWardName();
                            obj.put("wardID", wardID);
                            obj.put("wardName", wardName);
                            list.add(obj);
                        }
                        out.write(list.toJSONString());
                        out.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }*/
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
