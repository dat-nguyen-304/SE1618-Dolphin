<%-- 
    Document   : adminTenantProfile
    Created on : Jul 6, 2022, 8:53:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Thông tin chủ nhà ${requestScope.landlord.fullname}</title>
        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/admin-page.css">
       
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <link rel="stylesheet" href="../assets/css/admin-tenant-magement.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
        <link rel="stylesheet" href="../assets/css/datatables.css">
    </head>
    <body>
        <%@include file="../view/headerAdminDashboard.jsp" %>
        <%@include file="../view/navbarAdminDashboard.jsp" %>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

                <div class="head-control flex justify-between">
                    <!-- Breadcrumb -->
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center">
                                <a href="#" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                    </path>
                                    </svg>  
                                    Quản lí chủ nhà
                                </a>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px]">
                    <div>
                        <img src="${not empty requestScope.landlord.account.avatar ? requestScope.landlord.account.avatar : "../assets/images/user-avatars/no_ava.jpg"}">
                        <p>Tên đầy đủ: ${requestScope.landlord.fullname}</p>
                        <p>Tên tài khoản: ${requestScope.landlord.account.username}</p>
                        <p>Ngày tạo: ${requestScope.landlord.account.registrationDate}</p>
                        <p>Email: ${requestScope.landlord.account.email}</p>
                        <p>Số điện thoại: ${requestScope.landlord.phone}</p>
                    </div>
                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px] ">
                    <div>
                        <h2>Danh sách nhà trọ</h2>
                        <table id = "landlord-detail-hostel-table">
                            <thead>
                                <tr>
                                    <th>ID Nhà trọ</th>
                                    <th>Tên nhà trọ</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.hostelList}" var = "hostel">
                                    <tr>
                                        <td>${hostel.hostelID}</td>
                                        <td>${hostel.hostelName}</td>
                                        <td>
                                            <form action = "/sakura/admin/hostel-detail" method = "post">
                                                <button name = "hostelID" value = "${hostel.hostelID}" type = "submit">Xem chi tiết</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <%@include file="../view/footerDashboard.jsp" %>
        </div>
        <script>
            $(document).ready(function () {

                $('#landlord-detail-hostel-table').DataTable({
                    "pageLength": 4, //so luong item per page
                    "info": false, //false thi` khong show so luong entry hien tai
                    "lengthChange": false // false thi khong cho thay doi so luong entry per page
                });
            });
        </script>
    </body>

</html>
