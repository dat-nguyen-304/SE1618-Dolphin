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
        <title>Admin - Quản lý người thuê</title>
        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/admin-page.css">

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
                        <!-- requestScope.currentHostel.imgList la image list cua hostel nay`. T khong biet lam cai sliding image nen de lai cho m a', ehe :3 -->
                        <p>Tên đầy đủ: ${requestScope.currentHostel.hostelName}</p>
                        <p>Địa chỉ: ${requestScope.currentHostel.streetAddress}, ${requestScope.currentHostel.district.districtName}, 
                            ${requestScope.currentHostel.district.province.provinceName}</p>
                        <p>Ngày tạo: ${requestScope.currentHostel.registeredDate}</p>
                        <p>Ðánh giá: ${requestScope.currentHostel.rating}</p>
                        <p>Mô tả: ${requestScope.currentHostel.description}</p>
                        <p>Tổng số phòng: ${requestScope.currentHostel.totalRoom}</p>
                        <form action = "/sakura/admin/landlord-detail" method = "post">
                            <button name = "accountID" value = "${requestScope.currentHostel.landlord.account.accountID}" type = "submit">Thông tin chủ trọ</button>
                        </form>
                    </div>
                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px]">
                    <c:if test="${requestScope.hostelList.size() > 1}">
                        <div>
                            <h2>Danh sách nhà trọ cùng chủ</h2>
                            <table id = "hostel-detail-hostel-table">
                                <thead>
                                    <tr>
                                        <th>ID Nhà trọ</th>
                                        <th>Tên nhà trọ</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.hostelList}" var = "hostel">
                                        <c:if test="${requestScope.currentHostel.hostelID != hostel.hostelID}">
                                            <tr>
                                                <td>${hostel.hostelID}</td>
                                                <td>${hostel.hostelName}</td>
                                                <td>
                                                    <form action = "/sakura/admin/hostel-detail" method = "post">
                                                        <button name = "hostelID" value = "${hostel.hostelID}" type = "submit">Xem chi tiết</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach> 
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>
            <%@include file="../view/footerDashboard.jsp" %>
        </div>

        <script>
            $(document).ready(function () {

                $('#hostel-detail-hostel-table').DataTable({
                    "pageLength": 4, //so luong item per page
                    "info": false, //false thi` khong show so luong entry hien tai
                    "lengthChange": false // false thi khong cho thay doi so luong entry per page
                });
            });
        </script>
    </body>

</html>
