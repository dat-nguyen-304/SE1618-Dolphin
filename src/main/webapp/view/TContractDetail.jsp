<%-- 
    Document   : TContractDetail
    Created on : Jul 9, 2022, 10:15:05 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.dolphin.hostelmanagement.DTO.Contract"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang người thuê - Hợp đồng</title>

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
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] h-[calc(100vh-80px)]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <a href="#"
                               class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Chi tiết hợp đồng
                            </a>
                        </li>
                    </ol>
                </nav>
                <c:choose>
                    <c:when test = "${requestScope.contract eq null}">Không có hợp đồng</c:when>
                    <c:when test = "${requestScope.contract.status == 0}"><p>Trạng thái: Hết hiệu lực</p></c:when>
                    <c:when test = "${requestScope.contract.status == 1}"><p>Trạng thái: Còn hiệu lực</p></c:when>
                    <c:when test = "${requestScope.contract.status == 2}"><p>Trạng thái: Chờ xác nhận</p></c:when>
                </c:choose>
                <c:if test = "${requestScope.contract ne null}">
                    <%
                        Contract contract = (Contract) request.getAttribute("contract");
                        Date createdTime = contract.getCreatedDate();
                        Date startTime = contract.getStartDate();
                        Date endTime = contract.getEndDate();
                        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                        String createdDate = formatter.format(createdTime);
                        String startDate = formatter.format(startTime);
                        String endDate = formatter.format(endTime);
                    %>
                    <div class="card bg-[#fff] p-[20px] w-2/3 mt-[20px]">
                        <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px]">
                            Mã hợp đồng: <fmt:formatNumber value = "${requestScope.contract.contractID}" groupingUsed="false" type = "number" minIntegerDigits="5"/>
                        </div>
                        <div class="w-full h-fit mx-auto">
                            <div class="grid grid-cols-6 gap-[8px]">
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Ngày tạo</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><%=createdDate%></p>
                                </div>
                                <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Thời gian</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><%=startDate%> - <%=endDate%></p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Người cho thuê</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.landlord.fullname}</p>
                                </div>
                                <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Người thuê</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.tenant.fullname}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Nhà trọ</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.hostel.hostelName}</p>
                                </div>
                                <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Phòng thuê</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.room.roomNumber}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tiền đặt cọc</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">
                                        <fmt:setLocale value = "vi_VN"/>
                                        <fmt:formatNumber value = "${requestScope.contract.deposit}" type = "number" pattern="###,###,###VNĐ"/>
                                    </p>
                                </div>
                                <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Giá hằng tháng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">
                                        <fmt:setLocale value = "vi_VN"/>
                                        <fmt:formatNumber value = "${requestScope.contract.rentalFeePerMonth}" type = "number" pattern="###,###,###VNĐ"/>
                                    </p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Trạng thái</p>
                                    <c:choose>
                                        <c:when test = "${requestScope.contract.status == 0}">
                                            <p class="text-[18px] text-[#2A3C46] font-semibold">
                                                Hết hiệu lực
                                            </p>
                                        </c:when>
                                        <c:when test = "${requestScope.contract.status == 1}">
                                            <p class="text-[18px] text-[#2A3C46] font-semibold">
                                                Còn hiệu lực
                                            </p>
                                        </c:when>
                                        <c:when test = "${requestScope.contract.status == 2}">
                                            <p class="text-[18px] text-[#2A3C46] font-semibold">
                                                Chờ xác nhận
                                            </p>
                                        </c:when>
                                        <c:if test="${contract.status == 3}">
                                            <span class="bg-green-100 text-green-900 text-[14px] font-medium px-2.5 py-0.5 rounded">
                                                Đã hủy
                                            </span>
                                        </c:if>
                                    </c:choose>
                                </div>

                            </div>
                            <div class="mt-[20px]">
                                <p class="text-[#929ca5] font-normal"><i class="bi bi-info-circle mr-[5px]"></i>Nội dung</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">${not empty requestScope.contract.description ? requestScope.contract.description : 'Không có'}</p>
                            </div>

                        </div>
                    </div>
                </c:if>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
    </body>
</html>
