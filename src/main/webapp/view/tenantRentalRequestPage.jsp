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
        <title>Trang người thuê - Yêu cầu thuê phòng</title>

        <%@include file="../view/assets.jsp" %>
        <link rel="stylesheet" href="../assets/css/tenant-page.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">

    </head>
    <body>
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] h-[calc(100vh-80px)] ${requestScope.invitationList.size() < 10 ? 'h-[calc(100vh-80px)]' : ''}">

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
                <div class="statistic w-full mt-[20px] grid grid-cols-8 gap-[20px]">
                    <div class="card col-span-3 w-full room-member bg-[#fff] p-5 flex flex-col">
                        <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                            <p>Danh sách yêu cầu thuê phòng</p>
                        </div>
                        <div class="relative overflow-x-auto">
                            <c:if test="${empty requestScope.bookingList}">
                                Không có
                            </c:if>
                            <c:if test="${not empty requestScope.bookingList}">
                                <table class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                                    <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                        <tr>
                                            <th scope="col" class=" py-3">Nhà trọ</th>
                                            <th scope="col" class=" py-3">Loại phòng</th>
                                            <th scope="col" class=" py-3">Thời gian gửi</th>
                                            <th scope="col" class=" py-3">Trạng thái</th>
                                            <th scope="col" class=" py-3"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items = "${requestScope.bookingList}" var="booking">
                                            <tr class="bg-white border-b hover:bg-gray-50">
                                                <td scope="row" class=" py-4 font-medium text-gray-900 whitespace-nowrap">
                                                    ${booking.roomType.hostel.hostelName}
                                                </td>
                                                <td class=" py-4 date">
                                                    ${booking.roomType.roomTypeName}
                                                </td>
                                                <td class=" py-4 date">
                                                    ${booking.createdDate}
                                                </td>
                                                <td class=" py-4 date">
                                                    <c:choose>
                                                        <c:when test="${booking.status == 1}">Đang chờ</c:when>
                                                        <c:when test="${booking.status == 3}">Đã hủy</c:when>
                                                        <c:when test="${booking.status == 4}">Bị từ chối</c:when>
                                                    </c:choose>
                                                </td>
                                                <c:if test="${booking.status == 1}">
                                                    <td class=" py-4 money">
                                                        <form method = "post" action="/sakura/hostel/detail">
                                                            <input type ="hidden" name ="hostelId" value ="${booking.roomType.hostel.hostelID}">
                                                            <button type = "submit" class="w-fit px-[10px] py-[5px] bg-[#17535B] hover:bg-[#13484F] text-[#fafafa] rounded">
                                                                Xem nhà trọ
                                                            </button>
                                                        </form>    
                                                    </td>
                                                    <td class=" py-4 money">
                                                        <form method = "post" action="/sakura/tenant/rental-request">
                                                            <input type ="hidden" name ="bookingID" value ="${booking.bookingRequestID}"/>
                                                            <input type ="hidden" name="queryType" value="refuse-booking"/>
                                                            <button type = "submit" class="w-fit px-[10px] py-[5px] bg-[#17535B] hover:bg-[#13484F] text-[#fafafa] rounded">
                                                                Hủy yêu cầu
                                                            </button>
                                                        </form>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                    </div>
                    <div class="card col-span-5 room-member bg-[#fff] p-5 flex flex-col">
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
                                                Trạng thái
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items = "${requestScope.invitationList}" var="invitation">
                                            <tr class="bg-white border-b hover:bg-gray-50">
                                                <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                    ${invitation.roomType.hostel.hostelName}
                                                </td>
                                                <td class="px-6 py-4 ">
                                                    ${invitation.roomType.roomTypeName}
                                                </td>
                                                <td class="px-6 py-4 ">
                                                    ${invitation.createdDate}
                                                </td>
                                                <td class="px-6 py-4 ">
                                                    <c:choose>
                                                        <c:when test="${invitation.status == 2}">Đang chờ</c:when>
                                                        <c:when test="${invitation.status == 5}">Đã từ chối</c:when>
                                                        <c:when test="${invitation.status == 6}">Bị hủy</c:when>
                                                        <c:when test="${invitation.status == 7}">Thành công</c:when>
                                                    </c:choose>
                                                </td>
                                                <c:if test="${invitation.status == 2}">
                                                    <td class="px-6 py-4">
                                                        <form method = "post" action = "/sakura/tenant/rental-request">
                                                            <input type ="hidden" name ="queryType" value ="accept">
                                                            <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                                                            <button type = "submit" class="w-fit px-[10px] py-[5px] bg-[#17535B] hover:bg-[#13484F] text-[#fafafa] rounded">
                                                                Đồng ý
                                                            </button>
                                                        </form>
                                                    </td>
                                                    <td class="px-6 py-4">
                                                        <form method = "post" action = "/sakura/tenant/rental-request">
                                                            <input type ="hidden" name ="queryType" value ="refuse">
                                                            <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                                                            <button type = "submit" class="w-fit px-[10px] py-[5px] bg-[#17535B] hover:bg-[#13484F] text-[#fafafa] rounded">
                                                                Từ chối
                                                            </button>
                                                        </form>
                                                    </td>
                                                    <td class="px-6 py-4 ">
                                                        <form method = "post" action = "/sakura/tenant/contract-detail">
                                                            <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                                                            <button type = "submit" class="w-fit px-[10px] py-[5px] bg-[#17535B] hover:bg-[#13484F] text-[#fafafa] rounded">
                                                                Xem hợp đồng
                                                            </button></form>
                                                    </td>
                                                </c:if>
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

            <%@include file="../view/footerDashboard.jsp" %>
        </div>
    </body>
</html>
