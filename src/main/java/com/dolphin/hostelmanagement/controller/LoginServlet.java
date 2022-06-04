package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.AccountDAO;
import com.dolphin.hostelmanagement.DAO.HostelDAO;
import com.dolphin.hostelmanagement.DAO.LandlordDAO;
import com.dolphin.hostelmanagement.DAO.TenantDAO;
import com.dolphin.hostelmanagement.DTO.Account;
import com.dolphin.hostelmanagement.DTO.Hostel;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Tenant;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vu Thien An - SE160296
 */
public class LoginServlet extends HttpServlet {

    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            System.out.println(username + " " + password);
            if (username != null && !username.equals("") && password != null && !password.equals("")) {
                Account acc = AccountDAO.login(username, password);
                if (acc != null) {
                    System.out.println("line 31");
                    HttpSession session = request.getSession(true);
                    if (acc.getRole() == 1) {
                        System.out.println("line 36 tenant");
                        session.setAttribute("role", 1);
                        Tenant tenant = TenantDAO.findById(acc.getAccountID());
                        session.setAttribute("currentUser", tenant);
                        ArrayList<Hostel> activeHostels = new ArrayList();
                        for (Hostel hostel : HostelDAO.findAll()) {
                            if (hostel.isActivate()) {
                                activeHostels.add(hostel);
                            }
                        }
                        request.setAttribute("hostelList", activeHostels);
                    } else {
                        System.out.println("line 41 landlord");
                        session.setAttribute("role", 2);
                        Landlord landlord = LandlordDAO.findById(acc.getAccountID());
                        session.setAttribute("currentUser", landlord);
                    }
                    url = "/view/hostelList.jsp";
                } else {
                    request.setAttribute("error", "Invalid username or password!");
                    url = "/view/login.jsp";
                }
            }
        } catch (Exception e) {
            log("Error at LoginServlet: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
