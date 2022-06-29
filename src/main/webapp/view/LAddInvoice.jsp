<%-- 
    Document   : LAddInvoice
    Created on : Jun 26, 2022, 9:17:41 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý phòng thuê - Chi tiết hoá đơn</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="images/logo.png">

        <!-- <link rel="stylesheet" href="app.css"> -->
        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/LAddInvoice.css">

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

        <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>


    </head>

    <body>
        <%@include file="../view/LControllBar.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

                <!-- Breadcrumb -->
                <!-- <div class="bc-container">
                    <div class="bc"><a href="#">Quản lý phòng thuê </a></div>
                </div> -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <a href="#"
                               class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20"
                                     fill="currentColor">
                                <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                                <path fill-rule="evenodd"
                                      d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z"
                                      clip-rule="evenodd" />
                                </svg>
                                Hoá đơn
                            </a>
                        </li>
                        <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                      clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Thêm hoá đơn</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <!-- Main content -->
                <div class="grid grid-cols-4 gap-[20px]  mt-[20px]">
                    <div class="card col-span-3 p-5 bg-[#fff]">
                        <div class="text-[20px] font-bold text-[#2A3C46] self-start">Tạo hoá đơn mới
                        </div>

                        <div class="">
                            <span>Nhà trọ: </span>
                            <button
                                class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                type="button" data-modal-toggle="hostelModal">
                                <span id="hostelName">
                                    ${(requestScope.chosenHostel != null) ? requestScope.chosenHostel.hostelName : "Chọn nhà trọ"}</span>
                                <%--<c:choose>--%>
                                    <%--<c:when test="${requestScope.chosenHostel != null}">${requestScope.chosenHostel.hostelName}</c:when>--%>
                                    <%--<c:otherwise>Chọn nhà trọ</c:otherwise>--%>
                                <%--</c:choose>--%>
                            </button>

                            <div id="hostelModal" tabindex="-1" aria-hidden="true"
                                 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                    <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                        <div
                                            class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                            <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                Chọn Nhà Trọ
                                            </h3>
                                            <button type="button"
                                                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                                    data-modal-toggle="hostelModal">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd"
                                                      d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                      clip-rule="evenodd"></path>
                                                </svg>
                                            </button>
                                        </div>

                                        <div class="p-6 space-y-6">
                                            <c:forEach var="hostel" items="${requestScope.hostelList}">
                                                <!--<a href="" class="px-4 py-2 mx-2 rounded border-2" onclick="changeHostelName()">${hostel.hostelName}</a>-->
                                                <button class="px-4 py-2 mx-2 rounded border-2" data-modal-toggle="hostelModal" onclick="changeHostel(${hostel.hostelID}, '${hostel.hostelName}')">${hostel.hostelName} </button>
                                            </c:forEach>
<!--                                            <a href="" class="px-4 py-2 mx-2 rounded border-2">Huyền Thiết</a>
                                            <a href="" class="px-4 py-2 mx-2 rounded border-2">Châu Tấn</a>
                                            <a href="" class="px-4 py-2 mx-2 rounded border-2">Á Bằng</a>
                                            <a href="" class="px-4 py-2 mx-2 rounded border-2">Doanh Doanh</a>-->
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>

                            <form action="/sakura/invoice/save" class="invoice-detail " method="POST">
                                
                                <input type="hidden" name="chosenRoomID" value="${requestScope.chosenRoom.roomID}">
                                <input type="hidden" name="contractID" value="${requestScope.contract.contractID}">
                                
                            <div class="invoice-detail-info mt-[20px] grid grid-cols-6">

                                <span>Chọn phòng: </span>
                                <button
                                    class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                    type="button" data-modal-toggle="roomModal">
                                    <span id="roomNumber">${(requestScope.chosenRoom != null) ? requestScope.chosenRoom.roomNumber : "Chọn phòng"}</span>
                                </button>

                                <div id="roomModal" tabindex="-1" aria-hidden="true"
                                     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                            <div
                                                class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                    Chọn Phòng
                                                    <!--<input class="ml-2" type="text" name="sefarchRoom" placeholder="Tìm Phòng"/>-->

                                                </h3>
                                                <button type="button"
                                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                                        data-modal-toggle="roomModal">
                                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                          d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                          clip-rule="evenodd"></path>
                                                    </svg>
                                                </button>
                                            </div>

                                            <div class="p-6 space-y-6" id="roomList">
<!--                                                <a href="" class="mt-1 px-4 py-2 mx-2 rounded border-2">101</a>
                                                <a href="" class="mt-1 px-4 py-2 mx-2 rounded border-2">102</a>
                                                <a href="" class="mt-1 px-4 py-2 mx-2 rounded border-2">103</a>
                                                <a href="" class="mt-1 px-4 py-2 mx-2 rounded border-2">104</a>
                                                <a href="" class="mt-1 px-4 py-2 mx-2 rounded border-2">101</a>
                                                <a href="" class="mt-1 px-4 py-2 mx-2 rounded border-2">102</a>
                                                <a href="" class="mt-1 px-4 py-2 mx-2 rounded border-2">103</a>
                                                <a href="" class="mt-6 px-4 py-2 mx-2 rounded border-2">104</a>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="invoice-time-info mt-[30px] grid grid-cols-6">
                                <div class="flex items-center col-span-2 grid grid-cols-6">
                                    <label for="invoice-month"
                                           class="col-span-2 text-[15px] text-[#929CA5] font-normal flex items-center">Kỳ thanh
                                        toán: </label>
                                    <!-- <input type="month" name="invoice-month" id="invoice-month"> -->
                                    <input datepicker datepicker-format="mm/yyyy" datepicker-orientation="bottom"
                                           type="text" name="invoice-month" id="invoice-month"
                                           class="col-span-3 bg-[#fff] border border-gray-300 text-gray-900 rounded p-[5px] text-[15px]"
                                           placeholder="Chọn tháng...">
                                </div>
<!--                                <div class="flex items-center col-span-2 grid grid-cols-6">
                                    <label for="invoice-start-date "
                                           class="col-span-2 text-[15px] text-[#929CA5] font-normal flex items-center">Hạn
                                        thanh toán: </label>
                                    <input datepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom"
                                           type="text" name="due-date" id="invoice-due-date"
                                           class="col-span-3 bg-[#fff] border border-gray-300 text-gray-900 rounded p-[5px] text-[15px]"
                                           placeholder="Chọn ngày...">
                                </div>-->
                            </div>
                            <div class="invoice-time-range mt-[30px] grid grid-cols-6">
                                <div class="start-date flex items-center col-span-2 grid grid-cols-6">
                                    <label for="invoice-start-date"
                                           class="col-span-2 text-[15px] text-[#929CA5] font-normal flex items-center">Ngày
                                        đầu:</label>
                                    <input datepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom"
                                           type="text" id="invoice-start-date" name="startDate"
                                           class="col-span-3 bg-[#fff] border border-gray-300 text-gray-900 rounded p-[5px] text-[15px]"
                                           placeholder="Chọn ngày...">
                                </div>
                                <div class="end-date flex items-center col-span-2 grid grid-cols-6">
                                    <label for="invoice-end-date"
                                           class="col-span-2 text-[15px] text-[#929CA5] font-normal flex items-center">Ngày
                                        cuối: </label>
                                    <input datepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom"
                                           type="text" id="invoice-end-date" name="endDate"
                                           class="col-span-3 bg-[#fff] border border-gray-300 text-gray-900 rounded p-[5px] text-[15px]"
                                           placeholder="Chọn ngày...">
                                </div>

                            </div>


                            <h3 class="mt-[20px]">Chi tiết hoá đơn</h3>
                            <!-- invoice table -->
                            <table class="mt-[20px] w-full text-sm text-left text-gray-500">
                                <thead class="text-xs text-gray-700 uppercase bg-gray-50 ">
                                    <tr>
                                        <th scope="col" class="px-6 py-3">
                                            Dịch vụ
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Đơn vị tính
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Giá trị đầu
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Giá trị cuối
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Số lượng
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Đơn giá
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Thành tiền
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.activeServices}" var="service">
                                        <tr>
                                            <td scope="col" class="px-6 py-3">${service.serviceName}</td>
                                            <td scope="col" class="px-6 py-3">${service.unit}</td>
                                            <td scope="col" class="px-6 py-3">
                                                <c:if test="${service.type == 1}">
                                                    <input type="number" name="startInput${service.serviceID}" oninput="validity.valid||(value='');" min="0" value="0" id="startInput${service.serviceID}" onchange="updateSum(${service.serviceID}, ${service.type}, this)">
                                                </c:if>
                                            </td>
                                            <td scope="col" class="px-6 py-3">
                                                <c:if test="${service.type == 1}">
                                                    <input type="number" name="endInput${service.serviceID}" oninput="validity.valid||(value='');" min="0" value="0" id="endInput${service.serviceID}" onchange="updateSum(${service.serviceID}, ${service.type}, this)"></td>
                                                </c:if>
                                            <td scope="col" class="px-6 py-3">
                                                <c:choose>
                                                    <c:when test="${service.type == 1}">
                                                        <span id="quantity${service.serviceID}"></span></td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="number" name="quantity${service.serviceID}" oninput="validity.valid||(value='');" min="0" id="quantity${service.serviceID}" value="0" onchange="updateSum(${service.serviceID}, ${service.type}, this)">
                                                    </c:otherwise>
                                                </c:choose>
                                            <td scope="col" class="px-6 py-3"><span id="serviceFee${service.serviceID}" class="rate">${service.serviceFee}</span></td>
                                            <!--<td><input type="checkbox" class="useCheckBox" checked="" onclick="enableInput(${service.serviceID})"></td>-->
                                            <td scope="col" class="px-6 py-3"><span class="rowSum money" id="rowSum${service.serviceID}">0</span></td>
                                        </tr>
                                    </c:forEach>
                                    <!--                                <tr class="bg-white border-b hover:bg-gray-50 text-[#17535B] font-medium">
                                                                        <td class="px-6 py-4">
                                                                            Điện
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            kWh
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            <input id="start-electric" type="number" min="0" value=""
                                                                                   class="bg-[#] p-[5px] w-[100px] rounded border border-gray-300 duration-200">
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            <input id="start-electric" type="number" min="0" value=""
                                                                                   class="bg-[#] p-[5px] w-[100px] rounded border border-gray-300 duration-200">
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            đ12.000
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            đ0
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="bg-white border-b hover:bg-gray-50 text-[#17535B] font-medium">
                                                                        <td class="px-6 py-4">
                                                                            Nước
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            m<sup>3</sup>
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            <input id="start-electric" type="number" min="0" value=""
                                                                                   class="bg-[#] p-[5px] w-[100px] rounded border border-gray-300 duration-200">
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            <input id="start-electric" type="number" min="0" value=""
                                                                                   class="bg-[#] p-[5px] w-[100px] rounded border border-gray-300 duration-200">
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            đ7.000
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            đ0
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="bg-white border-b hover:bg-gray-50 text-[#17535B] font-medium">
                                                                        <td class="px-6 py-4">
                                                                            Internet
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            thuê bao
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            0
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            0
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            <input id="start-electric" type="number" min="0" value=""
                                                                                   class="bg-[#] p-[5px] w-[100px] rounded border border-gray-300 duration-200">
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            đ90.000
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            đ0
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="bg-white border-b hover:bg-gray-50 text-[#17535B] font-medium">
                                                                        <td class="px-6 py-4">
                                                                            Gửi xe
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            cái
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            0
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            0
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            <input id="start-electric" type="number" min="0" value=""
                                                                                   class="bg-[#] p-[5px] w-[100px] rounded border border-gray-300 duration-200">
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            đ150.000
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            đ0.000
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="bg-white border-b hover:bg-gray-50 text-[#17535B] font-medium">
                                                                        <td class="px-6 py-4">
                                                                            Xử lý rác
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                    
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            0
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            0
                                                                        </td>
                                                                         Xử lý rác là bắt buộc 
                                                                        <td class="px-6 py-4">
                                                                            1
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            đ50.000
                                                                        </td>
                                                                        <td class="px-6 py-4">
                                                                            đ780.000
                                                                        </td>
                                                                    </tr>-->
                                    <tr class="bg-white border-b hover:bg-gray-50 text-[#17535B] font-medium">
                                        <td class="px-6 py-4">
                                            Phí thuê phòng
                                        </td>
                                        <td class="px-6 py-4">
                                        </td>
                                        <td class="px-6 py-4">
                                        </td>
                                        <td class="px-6 py-4">
                                        </td>
                                        <td class="px-6 py-4">
                                        </td>
                                        <td class="px-6 py-4 rate">
                                            ${requestScope.contract.rentalFeePerMonth}
                                        </td>
                                        <td class="px-6 py-4">
                                            <span id="rentalFee" class="rate">${contract.rentalFeePerMonth}</span>
                                        </td>
                                    </tr>
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            <a href="#" class="hover:text-[#288D87] hover:underline"></a>
                                        </th>
                                        <td class="px-6 py-4">
                                        </td>
                                        <td class="px-6 py-4">
                                        </td>
                                        <td class="px-6 py-4">
                                        </td>
                                        <td class="px-6 py-4">
                                        </td>
                                        <td class="px-6 py-4 text-[17px] text-[#17535B] font-medium">
                                            Tổng tiền
                                        </td>
                                        <td class="px-6 py-4 text-[17px] text-[#17535B] font-bold">
                                            <span id="invoiceSum" style="color:red" class="money"></span>
                                            <input id="invoiceSumHidden" type="hidden" name="invoiceSum">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- end invoice table -->
                            <!-- Pagination + Export excel -->
                            <div class="table-extend flex justify-between items-center mt-[30px]">

                                <!-- Summation -->
                                <div class="summary grid grid-cols-5">
                                    <div class="col-span-1 text-[20px] text-[#17535B] font-bold">Thành tiền</div>
                                    <div class="col-span-4 text-[20px] text-[#17535B] "><span id="bottomSum" class="money" style="color:red"></span></div>
                                </div>
                                <!-- End Summation -->

                                <div class="flex justify-between items-center">
                                    <button type="submit"
                                            class="py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-[#fff] flex items-center justify-center focus:outline-none bg-[#17535B] rounded hover:bg-[#13484F]">Đăng
                                        hoá đơn
                                    </button>
                                    <!-- Export excel button -->
                                    <button type="button"
                                            class="py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-gray-900 flex items-center justify-center focus:outline-none bg-white rounded border border-gray-200 hover:bg-gray-100 hover:text-[#288D87] focus:z-10 group">Xuất
                                        file excel
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                             class="w-4 h-4 ml-[5px] text-[#288D87] group-hover:text-[#288D87]">
                                        <path fill="none" d="M0 0h24v24H0z" />
                                        <path
                                            d="M2.859 2.877l12.57-1.795a.5.5 0 0 1 .571.495v20.846a.5.5 0 0 1-.57.495L2.858 21.123a1 1 0 0 1-.859-.99V3.867a1 1 0 0 1 .859-.99zM17 3h4a1 1 0 0 1 1 1v16a1 1 0 0 1-1 1h-4V3zm-6.8 9L13 8h-2.4L9 10.286 7.4 8H5l2.8 4L5 16h2.4L9 13.714 10.6 16H13l-2.8-4z" />
                                        </svg>

                                    </button>
                                </div>
                            </div>
                            <!-- End Pagination + Export excel -->
                        </form>
                    </div>

                    <!-- table invoice list -->
                    <div class="statistic flex justify-between">
                        <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                            <table class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                                <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                    <tr>
                                        <th scope="col" class="px-6 py-3">
                                            Phòng
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Đã thêm hoá đơn
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            <a href="#" class="hover:text-[#288D87] hover:underline">A101</a>
                                        </th>
                                        <td class="px-6 py-4">
                                            2223
                                        </td>
                                    </tr>
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            <a href="#" class="hover:text-[#288D87] hover:underline">A102</a>
                                        </th>
                                        <td class="px-6 py-4">
                                            132
                                        </td>
                                    </tr>
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            <a href="#" class="hover:text-[#288D87] hover:underline">A103</a>
                                        </th>
                                        <td class="px-6 py-4">

                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>

                    <!-- End table invoice list -->
                </div>



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
        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
        <script src="js/monthpicker.js"></script>

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="js/chart.js"></script>

        <!-- Breadcrumb -->
        <script src="js/breadcrumb.js"></script>
        <script>
            $(document).ready(function () {
                var allRateCells = $(".rate");
                for (var i = 0; i < allRateCells.length; i++) {
                var node = allRateCells[i];
                var money = node.childNodes[0].nodeValue;
                node.childNodes[0].nodeValue = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
            });
            
            function changeHostel(hostelID, hostelName) {
                $("#hostelName").html(hostelName);
                $("#roomNumber").html("Chọn phòng");
//                var roomAnchors = $("#roomList").children();
//                console.log(roomAnchors.length);
                $("#roomList").empty();
//                const roomList = document.getElementById('roomList');
//                roomList.replaceChildren();
                
                jQuery.ajax({
                    url: '/sakura/room/roomsNeedInvoice',
                    type: 'GET',
                    data: {hostelID: hostelID},
                    dataType: 'text',
                    success: function (result) {
                    },
                    error: function () {
                    },
                    complete: function (result) {
                        console.log("Compelte");
                        var data = JSON.parse(result.responseText);
                        for (var i = 0; i < data.length; i++) {
                            $("#roomList").append('<a href="/sakura/invoice/new?hostelID=' + hostelID +'&roomID=' + data[i].roomID + '" class="mt-1 px-4 py-2 mx-2 rounded border-2">' + data[i].roomNumber + '</a>');
                        }
                    }
                });
            }
            
        function enableInput(serviceID) {
            $("#startInput" + serviceID).val("");
            $("#endInput" + serviceID).val("");
            $("#rowSum" + serviceID).html("");
            if ($("#startInput" + serviceID).prop("disabled") === true) {
                $("#startInput" + serviceID).prop("disabled", false);
                $("#endInput" + serviceID).prop("disabled", false);
            } else {
                $("#startInput" + serviceID).prop("disabled", true);
                $("#endInput" + serviceID).prop("disabled", true);
            }
        }
        
        function updateSum(serviceID, type, element) {
            if ($(element).attr('id').indexOf('startInput') >= 0) {
                if ($("#startInput" + serviceID).val() > $("#endInput" + serviceID).val()) {
                    $("#endInput" + serviceID).val($("#startInput" + serviceID).val());
                }
            }
            
            if ($(element).attr('id').indexOf('endInput') >= 0) {
                if ($("#startInput" + serviceID).val() > $("#endInput" + serviceID).val()) {
                    $("#startInput" + serviceID).val($("#endInput" + serviceID).val());
                }
            }
            
            $("#rowSum" + serviceID).html("");
            var sum; 
//            console.log(type);
            if (type === 1) {
                if ($(element).val() === "") sum = 0;
                else {
                    sum = parseInt($("#endInput" + serviceID).val()) - parseInt($("#startInput" + serviceID).val());
                }
//                console.log(sum);
                $("#quantity" + serviceID).html(sum);
            } else {
                sum = $("#quantity" + serviceID).val();
            }       
            sum = parseInt($("#serviceFee" + serviceID).html().replace(/,/g, '')) * parseInt(sum);
            $("#rowSum" + serviceID).html(parseInt(sum));
            
            
            var allRowSum = $(".rowSum");
            var sumService = 0;
            for (var i = 0; i < allRowSum.length; i++) {
                var node = allRowSum[i];
//                console.log($(node).html());
                sumService += parseInt($(node).html().replace(/,/g, ''));
            }
            
            $("#serviceSum").html(sumService);
            $("#invoiceSum").html(sumService + parseInt($("#rentalFee").html().replace(/,/g, '')));
            $("#invoiceSumHidden").val(sumService + parseInt($("#rentalFee").html().replace(/,/g, '')));
            console.log("hidden " + $("#invoiceSumHidden").val());
            $("#invoiceSum").html($("#invoiceSum").html().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            
            $("#bottomSum").html(sumService + parseInt($("#rentalFee").html().replace(/,/g, '')));
            $("#bottomSum").html($("#bottomSum").html().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " đồng");
            
            var allSumCells = $(".rowSum");
            for (var i = 0; i < allSumCells.length; i++) {
                var node = allSumCells[i];
                var money = node.childNodes[0].nodeValue;
                node.childNodes[0].nodeValue = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
        }
        </script>
    </body>
</html>
