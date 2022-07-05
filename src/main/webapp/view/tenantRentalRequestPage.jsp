<%-- 
    Document   : tenantBookingRequestPage
    Created on : Jun 26, 2022, 8:48:08 AM
    Author     : Admin
--%>
<%-- 
    Document   : tenantPage
    Created on : Jun 21, 2022, 7:52:22 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý phòng thuê</title>

        <!--Favicon-->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

        <!--CSS-->
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/tenant-page.css">

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <a href="#"
                               class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Yêu cầu thuê phòng
                            </a>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->


                <!-- Rental request list -->
                <div class="statistic w-full mt-[20px]">
                    <div class="card w-full room-member bg-[#fff] p-5 flex flex-col mt-[20px]">
                        <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                            <p>Danh sách yêu cầu thuê phòng</p>
                        </div>
                        <div class="relative overflow-x-auto">
                            <table class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                                <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                    <tr>
                                        <th scope="col" class="px-6 py-3">
                                            Nhà trọ
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Loại phòng
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Thời gian gửi
                                        </th>
                                        <th scope="col" class="px-6 py-3">

                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items = "${requestScope.bookingList}" var="booking">
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                ${booking.roomType.hostel.hostelName}
                                            </td>
                                            <td class="px-6 py-4 date">
                                                ${booking.roomType.roomTypeName}
                                            </td>
                                            <td class="px-6 py-4 date">
                                                ${booking.createdDate}
                                            </td>
                                            <td class="px-6 py-4 money">
                                                <form method = "post" action="/sakura/hostel/detail">
                                                    <input type ="hidden" name ="hostelId" value ="${booking.roomType.hostel.hostelID}">
                                                    <button type = "submit" class="w-fit px-[10px] py-[5px] bg-[#17535B] hover:bg-[#13484F] text-[#fafafa] rounded">
                                                        Xem nhà trọ
                                                    </button>
                                                </form>    
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                    <div class="card room-member bg-[#fff] p-5 flex flex-col mt-[20px]">
                        <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                            <p>Lời mời thuê nhà</p>
                        </div>
                        <div class="relative overflow-x-auto">
                            <c:if test="${empty requestScope.invitationList}">
                                Không có
                            </c:if>
                            <c:if test="${not empty requestScope.invitationList}">

                                <table class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                                    <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                        <tr>
                                            <th scope="col" class="px-6 py-3">
                                                Nhà trọ
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                                Loại phòng
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                                Thời gian gửi
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items = "${requestScope.invitationList}" var="invitation">
                                            <tr class="bg-white border-b hover:bg-gray-50">
                                                <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                    1${invitation.roomType.hostel.hostelName}
                                                </td>
                                                <td class="px-6 py-4 ">
                                                    1${invitation.roomType.roomTypeName}
                                                </td>
                                                <td class="px-6 py-4 ">
                                                    1${invitation.createdDate}
                                                </td>
                                                <td class="px-6 py-4">
                                                    <form method = "post" action = "/sakura/tenant/rentalRequestList">
                                                        <input type ="hidden" name ="contractID" value ="${invitation.roomType.roomTypeID}">
                                                        <button type = "submit" class="w-fit px-[10px] py-[5px] bg-[#17535B] hover:bg-[#13484F] text-[#fafafa] rounded">
                                                            Xem hợp đồng
                                                        </button>
                                                        <input type ="hidden" name ="queryType" value ="accept">
                                                        <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                                                        <button type = "submit" class="w-fit px-[10px] py-[5px] bg-[#17535B] hover:bg-[#13484F] text-[#fafafa] rounded">
                                                            Đồng ý
                                                        </button>
                                                        <input type ="hidden" name ="queryType" value ="refuse">
                                                        <input type ="hidden" name ="contractID" value ="${invitation.roomType.roomTypeID}">
                                                        <button type = "submit" class="w-fit px-[10px] py-[5px] bg-[#17535B] hover:bg-[#13484F] text-[#fafafa] rounded">
                                                            Từ chối
                                                        </button>
                                                    </form>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                    </div>
                </div>
                <!-- End rental request list -->
            </div>

            <!-- Footer -->
            <footer class="w-full px-[20px] pb-[20px]">
                <div class="card w-full h-fit bg-[#fff] rounded flex items-center justify-between p-[20px]">
                    <span class="text-sm text-gray-500 sm:text-center">© 2022 <a href="https://flowbite.com"
                                                                                 class="hover:text-[#17535B]">Sakura™</a>. All Rights Reserved.
                    </span>
                    <ul class="flex flex-wrap items-center mt-3 text-sm text-gray-400 sm:mt-0">
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6 ">Về Sakura</a>
                        </li>
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6">Chính sách bảo mật</a>
                        </li>
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6">FAQ</a>
                        </li>
                        <li>
                            <a href="#" class="hover:text-[#17535B]">Liên hệ</a>
                        </li>
                    </ul>
                </div>
            </footer>
            <!-- End footer -->


        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="../assets/javascript/chart-tenant-page.js"></script>
    </body>
</html>

