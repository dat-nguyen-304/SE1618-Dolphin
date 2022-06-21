/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.AccountDAO;
import com.dolphin.hostelmanagement.DAO.FavoriteHostelDAO;
import com.dolphin.hostelmanagement.DAO.LandlordDAO;
import com.dolphin.hostelmanagement.DAO.TenantDAO;
import com.dolphin.hostelmanagement.DTO.Account;
import com.dolphin.hostelmanagement.DTO.GooglePojo;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Tenant;
import com.dolphin.hostelmanagement.utils.EmailService;
import com.dolphin.hostelmanagement.utils.GoogleUtils;
import com.dolphin.hostelmanagement.utils.PasswordHash;
import com.dolphin.hostelmanagement.utils.StringUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
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
            if (path.equals("/login")) {
                try {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String logout = request.getParameter("logout");
                    //System.out.println("Hajjjj: " + username + " " + password);
                    if (logout == null) {
                        if (username != null && password != null) {

                            String hashedPassword = PasswordHash.doHashing(password);
                            Account acc = null;

                            if (username.contains("@")) {
                                System.out.println("I logged in by email!");
                                acc = AccountDAO.loginByEmail(username, hashedPassword);

                            } else {
                                System.out.println("I logged in by username!");
                                acc = AccountDAO.login(username, hashedPassword);
                            }

                            if (acc != null) {
                                HttpSession session = request.getSession(true);
                                if (acc.getRole() == 1) {
                                    session.setAttribute("role", 1);
                                    Tenant tenant = TenantDAO.findByAccount(acc);
                                    session.setAttribute("currentUser", tenant);
                                    List<Integer> favHostelIds = FavoriteHostelDAO.findFavHostelIds(tenant.getAccount().getAccountID());
                                    session.setAttribute("favoriteHostelIds", favHostelIds);

                                    if (tenant.isRentStatus()) {
                                        response.sendRedirect("/sakura/tenant/dashboard");
                                    }

                                } else {
                                    session.setAttribute("role", 2);
                                    Landlord landlord = LandlordDAO.findByAccount(acc);
                                    session.setAttribute("currentUser", landlord);
                                }
                                response.sendRedirect("/sakura/home");
                                return;
                            } else {
                                request.setAttribute("username", username);
                                request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu");
                                url = "/view/login.jsp";
                            }
                        } else {
                            url = "/view/login.jsp";
                        }

                        request.getRequestDispatcher(url).forward(request, response);
                    } else {
                        HttpSession session = request.getSession(true);
                        session.invalidate();
                        url = "/sakura/";
                        response.sendRedirect(url);
                    }
                } catch (Exception e) {
                    log("Error at LoginServlet: " + e.toString());
                }
            }
            if (path.equals("/register")) {
                HttpSession session = request.getSession(true);

                String username = request.getParameter("username");
                String password = request.getParameter("password");
                if (username != null && password != null) {
                    try {

                        String hashedPassword = PasswordHash.doHashing(password);

                        String email = request.getParameter("email");
                        String fullname = request.getParameter("fullname");
                        String phone = request.getParameter("phone");
                        Date regDate = new Date();
                        int role = Integer.parseInt(request.getParameter("role"));
                        boolean status = true;
                        Account acc = new Account(0, username, hashedPassword, email, regDate, role, status);

                        if (role == 1) {
                            Tenant t = new Tenant(acc, fullname, phone, false);
                            session.setAttribute("tempUser", t);
                            //check = TenantDAO.save(t);
                        } else {
                            Landlord l = new Landlord(acc, fullname, phone);
                            //check = LandlordDAO.save(l);
                            session.setAttribute("tempUser", l);
                            //request.setAttribute("role", 2);
                        }
                        //request.setAttribute("successNotification", "Registered Successfully!");
                        //request.setAttribute("account", acc);
                        //url = "/view/login.jsp";
                        //send verification code

                        if (session.getAttribute("googleToken") != null) { //if user registers with his/her google email
                            String googleToken = (String) session.getAttribute("googleToken");
                            String avatar = (String) session.getAttribute("avatarUrl");

                            Tenant t = null;
                            Landlord l = null;

                            if (role == 1) {
                                t = (Tenant) session.getAttribute("tempUser");
                                TenantDAO.save(t);
                            } else {
                                l = (Landlord) session.getAttribute("tempUser");
                                LandlordDAO.save(l);
                            }

                            Account newAcc = AccountDAO.findByEmail(email);

                            AccountDAO.saveUserImgURL(avatar, newAcc.getAccountID()); // save avatar
                            AccountDAO.saveGoogleAccount(newAcc.getAccountID(), googleToken);

                            session.invalidate(); //reset session to delete old information
                            session = request.getSession(true);

                            if (role == 1) {
                                session.setAttribute("currentUser", t);
                                session.setAttribute("role", 1);
                                List<Integer> favHostelIds = FavoriteHostelDAO.findFavHostelIds(t.getAccount().getAccountID());

                                session.setAttribute("favoriteHostelIds", favHostelIds);

                            } else if (role == 2) {
                                session.setAttribute("currentUser", l);
                                session.setAttribute("role", 2);
                            }

                            response.sendRedirect("/sakura/home");

                        } else {
                            String verificationCode = StringUtils.randomString(10);
                            EmailService sender = new EmailService();
                            sender.sendVerificationEmail(email, verificationCode);

                            session.setAttribute("verificationCode", verificationCode);
                            session.setAttribute("role", role);

                            //end send verification code
                            url = "/access/mailVerification";
                        }
                    } catch (Exception e) {
                        log("Error at SignUpServlet: " + e.toString());
                    }
                } else {
                    System.out.println("Redirect here!");
                    url = "/view/register.jsp";
                }

                request.getRequestDispatcher(url).forward(request, response);
            }
            if (path.equals("/googleAccess")) {
                HttpSession session = request.getSession(true);

                String code = request.getParameter("code");
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                request.setAttribute("id", googlePojo.getId());
                request.setAttribute("name", googlePojo.getName());
                request.setAttribute("email", googlePojo.getEmail());
                request.setAttribute("picture", googlePojo.getPicture());
                //RequestDispatcher dis = request.getRequestDispatcher("/view/index.jsp");
                System.out.println("Where the fuck am I ?");
                boolean emailInSystem = AccountDAO.checkEmail(googlePojo.getEmail());

                //System.out.println("This is login: " + request.getParameter("is_login"));
                if (emailInSystem == true) { //ton tai tai khoan da dang ki trong he thong
                    Account acc = AccountDAO.findByEmail(googlePojo.getEmail());
                    String googleToken = AccountDAO.findGoogleToken(acc.getAccountID());

                    if (googleToken == null || googleToken.equals(googlePojo.getId())) { // duoc phep dang nhap

//                            Account acc = AccountDAO.findByEmail(googlePojo.getEmail());
                        if(googleToken == null) { //Tai khoan chua lien ket voi google (khong co token trong he thong)
                            AccountDAO.saveGoogleAccount(acc.getAccountID(), googlePojo.getId());
                        }

                        if (acc.getRole() == 1) {
                            Tenant t = TenantDAO.findByAccount(acc);
                            session.setAttribute("currentUser", t);
                            session.setAttribute("role", 1);

                            List<Integer> favHostelIds = FavoriteHostelDAO.findFavHostelIds(t.getAccount().getAccountID());
                            session.setAttribute("favoriteHostelIds", favHostelIds);

                            if (t.isRentStatus()) {
                                response.sendRedirect("/sakura/tenant/dashboard");
                            }
                        } else {
                            Landlord l = LandlordDAO.findByAccount(acc);
                            session.setAttribute("currentUser", l);
                            session.setAttribute("role", 2);
                        }

                        response.sendRedirect("/sakura/home");
                    }
                    
                    else {
                        //hihi khong biet, cai nay` danh` cho may thang fake google account chui vo he thong a'
                    }
                }
                else { //email khong co trong he thong thi` chuyen qua page dang ki
                    session.setAttribute("name", googlePojo.getName());
                    session.setAttribute("email", googlePojo.getEmail());
                    session.setAttribute("googleToken", googlePojo.getId());
                    session.setAttribute("avatarUrl", googlePojo.getPicture());

                    response.sendRedirect("/sakura/access/register");
                }
            }
            if (path.equals("/forgotPassword")) {
                try {
                    String email = request.getParameter("email");
                    if (email != null) {
                        String newPwd = StringUtils.randomString(12);

                        Account acc = AccountDAO.findByEmail(email);

                        System.out.println("Email: " + email);

                        if (acc != null) {
                            AccountDAO.changePassword(acc.getAccountID(), PasswordHash.doHashing(newPwd));

                            EmailService sender = new EmailService();
                            sender.sendResetPasswordEmail(email, newPwd);

                        }
                        url = "/view/login.jsp";
                    } else {
                        url = "/view/forgotPassword.jsp";
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                request.getRequestDispatcher(url).forward(request, response);
            }
            if (path.equals("/mailVerification")) {
                HttpSession session = request.getSession(true);
                if (session.getAttribute("tempUser") == null) {
                    System.out.println("????inlogin");
                    url = "/sakura/access/login";
                    response.sendRedirect(url);
                } else {
                    if (request.getParameter("code") != null) {
                        String verificationCode = (String) session.getAttribute("verificationCode");
                        int role = (int) session.getAttribute("role");

                        String inputCode = request.getParameter("code");

                        System.out.println("Code 1: " + verificationCode);
                        System.out.println("Code 2: " + inputCode);
                        if (inputCode.equals(verificationCode)) {
                            if (role == 1) {
                                Tenant t = (Tenant) session.getAttribute("tempUser");
                                TenantDAO.save(t);
                            } else {
                                Landlord l = (Landlord) session.getAttribute("tempUser");
                                LandlordDAO.save(l);
                            }

                            session.invalidate();

                            response.sendRedirect("/sakura/access/login?register=success");
                        } else {
                            request.setAttribute("errorMessage", "Mã xác nhận sai! Mời bạn kiểm tra lại mã và nhập lại.");
                            request.getRequestDispatcher("/view/mailVerification.jsp").forward(request, response);
                        }
                    } else {
                        request.getRequestDispatcher("/view/mailVerification.jsp").forward(request, response);
                    }
                }
            }
            if (path.equals("/checkVerificationCode")) { //check if verification code is equal 
                String inputCode = request.getParameter("code").trim();
                HttpSession session = request.getSession(true);

                String verificationCode = (String) session.getAttribute("verificationCode");
                String servletResponse = "Sai mã xác minh!";
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                out.print(servletResponse);
                out.flush();

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
