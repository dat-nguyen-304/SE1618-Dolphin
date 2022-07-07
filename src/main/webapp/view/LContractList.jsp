<%-- 
    Document   : LContractList
    Created on : Jun 23, 2022, 5:05:38 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Danh sách hợp đồng</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/LContractList.css">

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    </head>

    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>

        <c:if test="${sessionScope.currentUser == null}">
            <p>Bạn phải đăng nhập để xem trang này</p>
        </c:if>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <a href="#"
                               class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Danh sách hợp đồng
                            </a>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->
                <c:if test="${sessionScope.hostelList == null}">
                    Bạn chưa có nhà trọ nào.
                    <a href="/sakura/landlord/overview">Quay về trang thêm thông tin nhà trọ</a>
                </c:if>
                <!-- General information -->
                <c:if test="${sessionScope.hostelList != null}">
                    <div class="general-info flex mt-[20px]">
                        <div class="">
                            <span>Nhà trọ: </span>
                            <button class="ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-sm px-5 py-2.5 text-center"
                                    type="button" data-modal-toggle="hostelModal">
                                ${sessionScope.currentHostel.hostelName}
                            </button>

                            <div id="hostelModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
                                    <div class="relative bg-white rounded shadow">
                                        <div class="flex justify-between items-start p-4 rounded-t border-b">
                                            <h3 class="text-xl font-semibold text-gray-900">Chọn nhà trọ</h3>
                                            <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="hostelModal">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                                </svg>
                                            </button>
                                        </div>

                                        <div class="p-6 space-y-6">
                                            <c:forEach items="${sessionScope.hostelList}" var="hostel">
                                                <form action="/sakura/landlord/contract-list" class="inline-block">
                                                    <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-4 py-2 mx-2 rounded border-2">${hostel.hostelName}</button>
                                                </form>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div class="ml-32">
                            <span>Phòng: </span>
                            <button
                                class="ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-sm px-5 py-2.5 text-center"
                                type="button" data-modal-toggle="roomModal">
                                Tất cả
                            </button>

                            <div id="roomModal" tabindex="-1" aria-hidden="true"
                                 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                    <div class="relative bg-white rounded shadow">

                                        <div
                                            class="flex justify-between items-start p-4 rounded-t border-b">
                                            <h3 class="text-xl font-semibold text-gray-900">
                                                Chọn Phòng
                                            </h3>
                                            <button type="button"
                                                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center"
                                                    data-modal-toggle="roomModal">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd"
                                                      d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                      clip-rule="evenodd"></path>
                                                </svg>
                                            </button>
                                        </div>

                                        <div class="p-6 space-y-6">
                                            <form action="/sakura/landlord/contract-list">
                                                <button type="submit" name="roomId" value="0" class="px-4 py-2 mx-2 rounded border-2">Tất cả</button>
                                                <c:forEach items="${requestScope.roomList}" var="room">
                                                    <button type="submit" name="roomId" value="${room.roomID}" class="px-4 py-2 mx-2 rounded border-2">${room.roomNumber}</button>
                                                </c:forEach>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-[20px]">
                        <div class="mt-[20px]">
                            <div class="relative overflow-x-auto shadow-md sm:rounded">
                                <table class="w-full text-sm text-left text-gray-500">
                                    <thead
                                        class="text-center text-xs text-gray-700 uppercase bg-gray-50">
                                        <tr>
                                            <th scope="col" class="text-center px-6 py-3">
                                                Mã hợp đồng
                                            </th>
                                            <th scope="col" class="text-center px-6 py-3">
                                                Người thuê
                                            </th>
                                            <th scope="col" class="text-center px-6 py-3">
                                                Phòng
                                            </th>
                                            <th scope="col" class="text-center px-6 py-3">
                                                Từ ngày
                                            </th>
                                            <th scope="col" class="text-center px-6 py-3">
                                                Đến ngày
                                            </th>
                                            <th scope="col" class="text-center px-6 py-3">
                                                Trạng thái
                                            </th>
                                            <th scope="col" class="text-center px-6 py-3 text-[#288D87]">
                                                <span class="sr-only">Xem chi tiết</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.contractList}" var="contract">
                                            <tr class="bg-white border-b">
                                                <th scope="row"
                                                    class="text-center px-6 py-4 font-medium text-gray-900">
                                                    ${contract.contractID}
                                                </th>
                                                <td class="text-center px-6 py-4">
                                                    ${contract.tenant.fullname}
                                                </td>
                                                <td class="text-center px-6 py-4">
                                                    ${contract.room.roomNumber}
                                                </td>
                                                <td class="text-center px-6 py-4">
                                                    ${contract.startDate}
                                                </td>
                                                <td class="text-center px-6 py-4">
                                                    ${contract.endDate}
                                                </td>

                                                <td class="text-center px-6 py-4">
                                                    <c:if test="${contract.status == 0}">Đã kết thúc</c:if>
                                                    <c:if test="${contract.status == 1}">Còn hiệu lực</c:if>
                                                    </td>
                                                    <td class="text-center px-6 py-4 text-center">
                                                        <form action="/sakura/landlord/contract-detail">
                                                            <button name="contractId" value="${contract.contractID}"
                                                                class="font-medium text-[#288D87] hover:underline">Xem chi tiết</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <nav class="mt-[20px]" aria-label=" Page navigation example">
                                <ul class="inline-flex -space-x-px">
                                    <li>
                                        <a href="#"
                                           class="py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">Trước</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                           class="py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">1</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                           class="py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">2</a>
                                    </li>
                                    <li>
                                        <a href="#" aria-current="page"
                                           class="py-2 px-3 text-blue-600 bg-blue-50 border border-gray-300 hover:bg-blue-100 hover:text-blue-700">3</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                           class="py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">4</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                           class="py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">5</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                           class="py-2 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">Sau</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </c:if>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="js/chart.js"></script>

    </body>

</html>