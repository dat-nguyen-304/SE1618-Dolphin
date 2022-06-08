/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller2;

import com.dolphin.hostelmanagement.DAO.AccountDAO;
import com.dolphin.hostelmanagement.DAO.FavoriteHostelDAO;
import com.dolphin.hostelmanagement.DAO.LandlordDAO;
import com.dolphin.hostelmanagement.DAO.TenantDAO;
import com.dolphin.hostelmanagement.DTO.Account;
import com.dolphin.hostelmanagement.DTO.FavoriteHostel;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Tenant;
import com.dolphin.hostelmanagement.controller.SendNewPasswordServlet;
import com.dolphin.hostelmanagement.utils.EmailService;
import com.dolphin.hostelmanagement.utils.StringUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AccessController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String url = ERROR;
            String path = request.getPathInfo();
            System.out.println("Path: " + path);
            if (path.equals("/loginPage")) {
                url = "/view/login.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            if (path.equals("/registerPage")) {
                url = "/view/register.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            if (path.equals("/forgotPasswordPage")) {
                url = "/view/forgotPassword.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            if (path.equals("/login")) {
                try {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    System.out.println("Hajjjj: " + username + " " + password);
                    if (username != null && !username.equals("") && password != null && !password.equals("")) {
                        Account acc = AccountDAO.login(username, password);
                        if (acc != null) {

                            HttpSession session = request.getSession(true);
                            if (acc.getRole() == 1) {
                                session.setAttribute("role", 1);
                                Tenant tenant = TenantDAO.findById(acc.getAccountID());
                                session.setAttribute("currentUser", tenant);
                            } else {
                                System.out.println("line 41 landlord");
                                session.setAttribute("role", 2);
                                Landlord landlord = LandlordDAO.findById(acc.getAccountID());
                                session.setAttribute("currentUser", landlord);
                            }
                            url = "/hostel/list";

                            List<FavoriteHostel> favoriteHostels = FavoriteHostelDAO.findByTenantID(acc.getAccountID());
                            session.setAttribute("favoriteHostels", favoriteHostels);

                        } else {
                            request.setAttribute("error", "Invalid username or password!");
                            url = "/view/login.jsp";
                        }
                    } else {
                        url = "/view/login.jsp";
                    }
                } catch (Exception e) {
                    log("Error at LoginServlet: " + e.toString());
                } finally {
                    request.getRequestDispatcher(url).forward(request, response);
                }
            }
            if (path.equals("/register")) {
                System.out.println("I was in here!");

                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String fullname = request.getParameter("fullname");
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                Date regDate = new Date();
                int role = Integer.parseInt(request.getParameter("role"));
                boolean status = true;
                boolean check = false;
                try {
                    if (role == 1) {
                        Tenant t = new Tenant(new Account(0, username, password, email, regDate, role, status), fullname, phone, false);
                        check = TenantDAO.save(t);
                    } else {
                        Landlord l = new Landlord(new Account(0, username, password, email, regDate, role, status), fullname, phone);
                        check = LandlordDAO.save(l);
                    }
                    if (check) {
                        request.setAttribute("successNotification", "Registered Successfully!");
                        url = "/view/login.jsp";
                    }
                } catch (Exception e) {
                    log("Error at SignUpServlet: " + e.toString());
                } finally {
                    request.getRequestDispatcher(url).forward(request, response);
                }
            }
            if (path.equals("/forgotPassword")) {
                try {
                    String email = request.getParameter("txt-email");
                    String newPwd = StringUtils.randomString(12);

                    Account acc = AccountDAO.findByEmail(email);

                    System.out.println("Email: " + email);

                    if (acc != null) {
                        AccountDAO.changePassword(acc.getAccountID(), newPwd);

                        EmailService sender = new EmailService();
                        sender.sendMail(email, newPwd);

                        url = "/view/login.jsp";
                    }
                } catch (Exception ex) {
                    Logger.getLogger(SendNewPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
                } finally {
                    url = "/view/login.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                }
            }
            if (path.equals("/logout")) {
                System.out.println("This is log out");
                HttpSession session = request.getSession();
                session.invalidate();

                response.sendRedirect("/view/homepage.jsp");
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
