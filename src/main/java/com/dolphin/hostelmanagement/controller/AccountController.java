/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.dolphin.hostelmanagement.controller;

import com.dolphin.hostelmanagement.DAO.AccountDAO;
import com.dolphin.hostelmanagement.DAO.LandlordDAO;
import com.dolphin.hostelmanagement.DAO.NotificationDAO;
import com.dolphin.hostelmanagement.DAO.TenantDAO;
import com.dolphin.hostelmanagement.DTO.Account;
import com.dolphin.hostelmanagement.DTO.Landlord;
import com.dolphin.hostelmanagement.DTO.Notification;
import com.dolphin.hostelmanagement.DTO.Tenant;
import com.dolphin.hostelmanagement.utils.PasswordHash;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URISyntaxException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AccountController extends HttpServlet {

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
        String url = ERROR;
        String path = request.getPathInfo();
        if (path.equals("/changePassword")) {
            try {
                HttpSession session = request.getSession(true);
                String currentPassword = (String) request.getParameter("currentPwd");
                String newPassword = (String) request.getParameter("newPwd");
                String newPasswordConfirm = (String) request.getParameter("newPwdConfirm");

                if (currentPassword != null) {

                    System.out.println("Current pwd: " + currentPassword);
                    System.out.println("New pwd: " + newPassword);
                    System.out.println("Newc pwd: " + newPasswordConfirm);

                    String hashedCurrentPassword = PasswordHash.doHashing(currentPassword);
                    String hashedNewPassword = PasswordHash.doHashing(newPassword);

                    int role = (int) session.getAttribute("role");
                    url = "/view/changePassword.jsp";
                    //System.out.println("Role: " + role);
                    Account acc = null;

                    if (role == 1) {
                        Tenant t = (Tenant) session.getAttribute("currentUser");
                        acc = t.getAccount();
                    } else {
                        Landlord l = (Landlord) session.getAttribute("currentUser");
                        acc = l.getAccount();
                    }

                    //System.out.println("username: " + acc.getUsername());
                    if (acc.getPassword().compareTo(hashedCurrentPassword) != 0) {
                        request.setAttribute("errorMessage", "Wrong current password!");
                    } else if (newPassword.compareTo(newPasswordConfirm) != 0) {
                        request.setAttribute("errorMessage", "New passwords don't match!");
                    } else {
                        request.setAttribute("errorMessage", "Successfully changed password!");
                        AccountDAO.changePassword(acc.getAccountID(), hashedNewPassword);
                        acc.setPassword(hashedNewPassword);
                    }
                } else {
                    url = "/view/changePassword.jsp";
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            request.getRequestDispatcher(url).forward(request, response);
        } else if (path.equals("/cprofile")) {
            request.setAttribute("message", null);
            url = "/view/userProfile.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } else if (path.equals("/checkUsername")) {
            String username = request.getParameter("username");
            try {
                String servletResponse = "";
                if (AccountDAO.checkUsername(username)) {
                    servletResponse = "Username đã được dùng!";
                }
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(servletResponse);
                out.flush();
            } catch (Exception e) {
                e.getMessage();
            }
        } else if (path.equals(
                "/checkEmail")) {
            String email = request.getParameter("email").trim();
            try {
                String servletResponse = "";
                if (AccountDAO.checkEmail(email)) {
                    servletResponse = "Email đã được dùng!";
                }
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(servletResponse);
                out.flush();
            } catch (Exception e) {
                e.getMessage();
            }
        } else if (path.equals("/profile")) {
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            int changed = 0;
            if (fullname != null) {
                HttpSession session = request.getSession(true);

                int role = (int) session.getAttribute("role");
                Account acc = null;

                if (role == 1) { //tenant
                    Tenant t = (Tenant) session.getAttribute("currentUser");
                    if (!t.getFullname().equals(fullname) || !t.getPhone().equals(phone) || !t.getAccount().getEmail().equals(email)) {
                        changed = 1;
                    }
                    t.setFullname(fullname);
                    t.setPhone(phone);
                    t.getAccount().setEmail(email);

                    acc = t.getAccount();
                    System.out.println("AccountID: " + t.getAccount());
                    System.out.println("Email: " + t.getAccount().getEmail());

                    if (TenantDAO.updateTenant(t)) {
                        System.out.println("Successfully updated tenant's information!");
                    }
                    if (AccountDAO.updateAccount(t.getAccount())) {
                        System.out.println("Successfully updated account's information!");
                    }
                } else if (role == 2) { //landlord, "else if" in case we need a new role :D 
                    Landlord l = (Landlord) session.getAttribute("currentUser");
                    if (!l.getFullname().equals(fullname) || !l.getPhone().equals(phone) || !l.getAccount().getEmail().equals(email)) {
                        changed = 1;
                    }
                    l.setFullname(fullname);
                    l.setPhone(phone);
                    l.getAccount().setEmail(email);

                    acc = l.getAccount();

                    if (LandlordDAO.updateLandlord(l)) {
                        System.out.println("Successfully updated landlord's information!");
                    }
                    if (AccountDAO.updateAccount(l.getAccount())) {
                        System.out.println("Successfully updated account's information!");
                    }
                }

                try {
                    Part part = request.getPart("image");
                    if (extractFileName(part).length() > 0) { //upload avatar
                        String fileName = String.valueOf(acc.getAccountID()) + "_ava.jpg";
                        String fullPath = this.getFolderUpload(request).getAbsolutePath() + File.separator + fileName;

                        System.out.println(fullPath);
                        String src = this.getFolderUpload(request).getAbsolutePath() + File.separator + fileName;
                        String dest = this.getRuntimeFolder(request).getAbsolutePath() + File.separator + fileName;
                        AccountDAO.saveUserImgURL("/sakura/assets/images/user-avatars/" + fileName, acc.getAccountID());
                        acc.setAvatar("/sakura/assets/images/user-avatars/" + fileName);
                        part.write(src);
                        copy(src, dest);
                        request.setAttribute("fileName", fileName);
                        changed = 1;
                    } else {
                        System.out.println("Empty file");
                    }
                } catch (Exception e) {
                    System.out.println("Error at uploading avatar function!");
                    e.printStackTrace();
                }

                if (changed == 1) {
                    System.out.println("Thay ava");
                    request.setAttribute("message", "Lưu thành công!");
                }
                url = "/view/userProfile.jsp";
            } else {
                request.setAttribute("message", "");
                url = "/view/userProfile.jsp";
            }

            request.getRequestDispatcher(url).forward(request, response);
        } else if (path.equals("/myNotification")) {
            HttpSession session = request.getSession(true);

            Account acc = null;

            int role = (int) session.getAttribute("role");
            if (role == 1) { //tenant
                Tenant t = (Tenant) session.getAttribute("currentUser");
                acc = t.getAccount();
            } else {
                Landlord l = (Landlord) session.getAttribute("currentUser");
                acc = l.getAccount();
            }

//            ArrayList<Notification> notiList = NotificationDAO.getNotificationByToID(acc.getAccountID());
//            for(Notification noti: notiList) {
//                System.out.println(noti.getContent());
//            }
//            request.setAttribute("notiList", notiList);
//            request.getRequestDispatcher("/view/myNotification.jsp").forward(request, response);
        }
    }

    private void copy(String src, String dest) throws IOException {
        InputStream is = null;
        OutputStream os = null;
        try {
            is = new FileInputStream(src);
            os = new FileOutputStream(dest);
            // buffer size 1K
            byte[] buf = new byte[1024];

            int bytesRead;
            while ((bytesRead = is.read(buf)) > 0) {
                os.write(buf, 0, bytesRead);
            }
        } finally {
            is.close();
            os.close();
        }
    }

    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload(HttpServletRequest request) throws URISyntaxException {
        String path = request.getServletContext().getRealPath("/").replace("\\", "/");
        File target = new File(path);
        File par = new File(target.getParent());
        File folderUpload = new File(par.getParent() + "/src/main/webapp/assets/images/user-avatars");

//        File folderUpload = new File(request.getServletContext().getRealPath("/") + "assets/images/user-avatars/");
        // System.out.println(folderUpload);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    public File getRuntimeFolder(HttpServletRequest request) throws URISyntaxException {
        File folderUpload = new File(request.getServletContext().getRealPath("/") + "/assets/images/user-avatars");
        System.out.println("Runtime folder: " + folderUpload);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
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
