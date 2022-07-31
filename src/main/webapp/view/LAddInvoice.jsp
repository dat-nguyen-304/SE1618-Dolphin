<%-- 
    Document   : LAddInvoice
    Created on : Jun 26, 2022, 9:17:41 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% response.setHeader("Cache-Control", "no-cache, no-store");%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Thêm hoá đơn</title>

        <%@include file="../view/assets.jsp" %>
        <link rel="stylesheet" href="../assets/css/LAddInvoice.css">

        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>

        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
    </head>

    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] h-fit">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z"/>
                                <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd"/>
                                </svg>
                                Hoá đơn
                            </p>
                        </li>
                        <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Thêm hoá đơn</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <c:if test="${requestScope.chosenHostel != null}">
                    <!-- Main content -->
                    <div class="grid grid-cols-4 gap-[20px]  mt-[20px]">
                        <div class="card col-span-3 p-5 bg-[#fff] ${requestScope.chosenRoom == null ? 'h-[calc(100vh-225px)]' : ''}">
                            <div class="text-[20px] font-bold text-[#288D87] self-start">
                                Tạo hoá đơn mới
                            </div>

                            <div class="mt-[20px]">
                                <span>Chọn nhà trọ: </span>
                                <button type="button" data-modal-toggle="hostelModal"
                                        class="ml-[20px] inline-block text-white bg-[#288D87] hover:bg-[#1D837D] font-bold rounded text-center text-[16px] px-[10px] py-[5px]">
                                    <span id="hostelName">
                                        ${(requestScope.chosenHostel != null) ? requestScope.chosenHostel.hostelName : "Chọn nhà trọ"}
                                    </span>
                                </button>
                                <%@include file="../view/modalLandlordAddInvoice.jsp" %>
                            </div>

                            <c:if test="${requestScope.chosenRoom != null}">
                                <form action="/sakura/invoice/save" class="invoice-detail " method="POST" id="invoice-form">

                                    <input type="hidden" name="chosenRoomID" value="${requestScope.chosenRoom.roomID}">
                                    <input type="hidden" name="contractID" value="${requestScope.contract.contractID}">

                                    <div class="invoice-detail-info mt-[20px] ">
                                        <c:if test="${requestScope.chosenRoom != null}">
                                            <span>Phòng: </span>
                                            <button class="ml-[20px] inline-block text-white bg-[#288D87] hover:bg-[#1D837D] font-bold rounded text-center text-[16px] px-[10px] py-[5px]" type="button">
                                                <span id="roomNumber">
                                                    ${requestScope.chosenRoom.roomNumber}
                                                </span>
                                            </button>
                                        </c:if>
                                    </div>

                                    <div class="invoice-time-info mt-[30px] text-[17px] grid grid-cols-12">
                                        <div class="flex items-center col-span-4 grid grid-cols-6">
                                            <label for="invoice-month" class="col-span-2 text-slate-700 font-medium">Kỳ thanh toán</label>
                                            <input type="hidden" name="invoice-month" id="invoice-month" value="">
                                            <p id="invoice-month-dipsplay" class="text-slate-800 font-bold">${(requestScope.chosenRoom.latestInvoiceMonth != null) ? chosenRoom.latestInvoiceMonth : requestScope.startMonth}</p>
                                        </div>
                                        <div class="flex items-center col-span-6 grid grid-cols-6">
                                            <p class="col-span-2 text-slate-700 font-medium">Kỳ hoá đơn cũ gần nhất</p>
                                            <p class="col-span-3 text-slate-800 font-bold" id="latestInvoiceMonth">
                                                ${(requestScope.chosenRoom.latestInvoiceMonth != null) ? requestScope.chosenRoom.latestInvoiceMonth : "Hợp đồng này chưa có hóa đơn"}
                                            </p>
                                        </div>
                                    </div>

                                    <div date-rangepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom" class="invoice-time-range mt-[30px] grid grid-cols-6">
                                        <div class="start-date flex items-center col-span-2 grid grid-cols-6">
                                            <label for="invoice-start-date" class="col-span-2 text-slate-700 font-medium">Ngày đầu:</label>
                                            <input type="text" id="invoice-start-date" name="startDate" placeholder="Chọn ngày..." autocomplete="off"
                                                   class="col-span-3 bg-[#fff] border border-gray-300 text-gray-900 rounded p-[5px] text-[15px]">
                                        </div>
                                        <div class="end-date flex items-center col-span-2 grid grid-cols-6">
                                            <label for="invoice-end-date" class="col-span-2 text-slate-700 font-medium">Ngày cuối: </label>
                                            <input type="text" id="invoice-end-date" name="endDate" placeholder="Chọn ngày..." autocomplete="off"
                                                   class="col-span-3 bg-[#fff] border border-gray-300 text-gray-900 rounded p-[5px] text-[15px]">
                                        </div>
                                        <div>
                                            <p id="dateError"></p>
                                        </div>
                                    </div>

                                    <h3 class="mt-[30px] text-[18px] font-bold text-slate-700">Chi tiết hoá đơn</h3>
                                    <!-- invoice table -->
                                    <table class="mt-[20px] text-[16[px]] w-full text-left text-gray-800">
                                        <thead class="text-[14px] text-gray-700 uppercase bg-gray-50 ">
                                            <tr>
                                                <th scope="col" class="text-center px-6 py-3 w-[150px]">Dịch vụ</th>
                                                <th scope="col" class="text-center px-6 py-3 w-[150px]">Đơn vị tính</th>
                                                <th scope="col" class="text-center px-6 py-3 w-[150px]">Giá trị đầu</th>
                                                <th scope="col" class="text-center px-6 py-3 w-[150px]">Giá trị cuối</th>
                                                <th scope="col" class="text-center px-6 py-3 w-[150px]">Số lượng</th>
                                                <th scope="col" class="text-center px-6 py-3">Đơn giá (VNĐ)</th>
                                                <th scope="col" class="text-center px-6 py-3">Thành tiền (VNĐ)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.activeServices}" var="service">
                                                <tr class="">
                                                    <td scope="col" class="px-6 py-3 w-[150px]">${service.serviceName}</td>
                                                    <td scope="col" class="px-6 py-3 w-[150px]">${service.unit}</td>

                                                    <!--start value-->
                                                    <td scope="col" class="px-6 py-3 text-right w-[150px]">  
                                                        <c:if test="${service.type == 1 || service.type == 2}">
                                                            <c:choose>
                                                                <c:when test="${startMonth != null}">
                                                                    <input type="number" name="startInput${service.serviceID}" min="0" value="0" id="startInput${service.serviceID}"
                                                                           class="w-[150px] text-right" onchange="updateSum(${service.serviceID}, ${service.type}, this)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:forEach var="detail" items="${requestScope.prevMonthDetails}">
                                                                        <c:if test="${service.serviceName == detail.service.serviceName}">
                                                                            <span id="startInput${service.serviceID}">${detail.endValue}</span>
                                                                            <input type="hidden" class="w-[150px] text-right" name="startInput${service.serviceID}" value="${detail.endValue}">
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </td>

                                                    <!--end value-->
                                                    <td scope="col" class="px-6 py-3 text-right w-[150px]">
                                                        <c:if test="${service.type == 1 || service.type == 2}">
                                                            <c:choose>
                                                                <c:when test="${startMonth != null}">
                                                                    <input type="number" name="endInput${service.serviceID}" min="0" value="0" id="endInput${service.serviceID}"
                                                                           class="w-[150px] text-right" onchange="updateSum(${service.serviceID}, ${service.type}, this)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:forEach var="detail" items="${requestScope.prevMonthDetails}">
                                                                        <c:if test="${service.serviceName == detail.service.serviceName}">
                                                                            <input type="number" name="endInput${service.serviceID}" min="${detail.endValue}" value="${detail.endValue}"
                                                                                   class="w-[150px] text-right" id="endInput${service.serviceID}" onchange="updateSum(${service.serviceID}, ${service.type}, this)">

                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </td>

                                                    <!--quantity-->
                                                    <td scope="col" class="px-6 py-3 text-right w-[150px]">
                                                        <c:choose>
                                                            <c:when test="${service.type == 1 || service.type == 2}">
                                                                <span id="quantity${service.serviceID}"></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="number" name="quantity${service.serviceID}" oninput="validity.valid||(value='');" min="0"
                                                                       class="w-[150px] text-right" id="quantity${service.serviceID}" value="0" onchange="updateSum(${service.serviceID}, ${service.type}, this)">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                    <td scope="col" class="px-6 py-3 text-right">
                                                        <span id="serviceFee${service.serviceID}" class="rate">${service.serviceFee}</span>
                                                    </td>
                                                    <td scope="col" class="px-6 py-3 text-right">
                                                        <span class="rowSum money" id="rowSum${service.serviceID}">0</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            <tr class="bg-white border-b hover:bg-gray-50 text-[#17535B] font-medium">
                                                <td class="px-6 py-4">Tiền phòng</td>
                                                <td class="px-6 py-4"></td>
                                                <td class="px-6 py-4"></td>
                                                <td class="px-6 py-4"></td>
                                                <td class="px-6 py-4"></td>
                                                <td class="px-6 py-4 text-right">
                                                    <span id="rentalRate" class="rate">${requestScope.contract.rentalFeePerMonth}</span>
                                                </td>
                                                <td class="px-6 py-4 text-right">
                                                    <span id="rentalFee" class="rate rowSum">${contract.rentalFeePerMonth}</span>
                                                </td>
                                            </tr>
                                            <tr class="bg-white border-b hover:bg-gray-50">
                                                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap"></th>
                                                <td class="px-6 py-4"></td>
                                                <td class="px-6 py-4"></td>
                                                <td class="px-6 py-4"></td>
                                                <td class="px-6 py-4"></td>
                                                <td class="px-6 py-4 text-right text-[18px] text-[#17535B] font-bold">
                                                    Tổng tiền
                                                </td>
                                                <td class="px-6 py-4 text-right text-[18px] text-[#288D87] font-bold">
                                                    <span id="invoiceSum" class="money"></span>
                                                    <input id="invoiceSumHidden" type="hidden" name="invoiceSum">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!-- end invoice table -->

                                    <div class="table-extend flex justify-between items-center mt-[30px]">
                                        <!-- Summation -->
                                        <div class="summary w-1/2 grid grid-cols-8">
                                            <div class="col-span-2 text-[22px] text-slate-500 ">Thành tiền</div>
                                            <div class="col-span-4 text-[22px] text-slate-700 font-bold">
                                                <span id="bottomSum" class="money"></span>
                                            </div>
                                        </div>
                                        <!-- End Summation -->

                                        <div class="flex justify-between items-center">
                                            <button type="button" onclick="validate()"
                                                    class=" text-[16px] px-[10px] py-[5px] font-medium text-[#fff] bg-[#288D87] hover:bg-[#17535B] duration-200 rounded ">
                                                Đăng hoá đơn
                                            </button>

                                        </div>
                                    </div>
                                </form>
                            </c:if>
                        </div>

                        <!--table invoice list-->
                        <div class="statistic flex justify-between">
                            <div id="roomArea" class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                                <c:choose>
                                    <c:when test="${requestScope.noInvoiceList != null && requestScope.noInvoiceList.size() != 0}">
                                        <div class="mb-[30px] text-[#288D87] font-bold text-[17px]">
                                            Các phòng cần nhập hóa đơn kỳ <span id="monthPlusOne">${requestScope.noInvoiceList[0].latestInvoiceMonth}</span>
                                        </div>
                                        <input class="" type="text" name="searchRoom" placeholder="Tìm Phòng" id="room-filter">
                                        <div id="roomList" class="mt-[30px] flex flex-wrap">
                                            <c:forEach var="room" items="${requestScope.noInvoiceList}">
                                                <form method="post" action="/sakura/invoice/new" style="display: inline-block;">
                                                    <button class="roomNoInvoice mb-[20px] mr-[20px] inline-block text-white bg-[#288D87] hover:bg-[#1D837D] font-medium rounded text-[16px] px-[10px] py-[5px] text-center"
                                                            name="roomID" value="${room.roomID}" type="submit">
                                                        ${room.roomNumber}</button>
                                                </form>
                                            </c:forEach>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                            Hiện tại chưa có phòng cần nhập hóa đơn
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <!-- End table invoice list -->

                    </div>
                </c:if>
                <c:if test="${requestScope.chosenHostel == null}">
                    Bạn chưa có nhà trọ. Quay về trang "Tổng quan" để thêm thông tin nhà trọ!
                </c:if>

            </div>

            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <script src="../assets/javascript/moment.js"></script>
        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
        <script>x = 1</script>
        <script>
            let invoiceMonth = $("#invoice-month");
            let invoiceMonthDisplay = $("#invoice-month-dipsplay");
            let invoiceStartDate = $("#invoice-start-date");
            let invoiceEndDate = $("#invoice-end-date");
            let monthError = $("#monthError");
            let rentalFee = $("#rentalFee");
            let invoiceSumHidden = $("#invoiceSumHidden");
            let invoiceSum = $("#invoiceSum");
            let dateError = $("#dateError");
            let bottomSum = $("#bottomSum");
            let latestInvoiceMonth = $("#latestInvoiceMonth");
            let allRowSum = $(".rowSum");
            let monthPlusOne = $("#monthPlusOne");

            jQuery(document).ready(function ($) {

                let allRateCells = $(".rate");
                for (let i = 0; i < allRateCells.length; i++) {
                    let node = allRateCells[i];
                    let money = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                }
                let month;
                let monthP1Temp;
                if (latestInvoiceMonth.html() === "Hợp đồng này chưa có hóa đơn") {
                    month = moment(invoiceMonthDisplay.html());
                } else {
                    month = moment(invoiceMonthDisplay.html()).add(1, "M");
                }
                monthP1Temp = moment(monthPlusOne.html()).add(1, "M");
                monthPlusOne.html(monthP1Temp.format('MM/YYYY').toString());
                invoiceMonth.val(month.format('MM/YYYY').toString());
                invoiceMonthDisplay.html(month.format('MM/YYYY').toString());
                latestInvoiceMonth.html(latestInvoiceMonth.html().split('-').reverse().join('/'));
                bottomSum.html(rentalFee.html() + " đồng");
                invoiceSum.html(rentalFee.html());
                invoiceSumHidden.html(rentalFee.html());
                invoiceSumHidden.val(parseInt(rentalFee.html().replace(/,/g, '')));
            });

            $("#confirmButton").on('click', function () {
                console.log("SUBMIT");
                $("#invoice-form").submit();
            });

            invoiceMonth.click(function () {
                $(this).css("border", "");
                monthError.html("");
            });

            invoiceStartDate.click(function () {
                invoiceStartDate.css("border", "");
                invoiceEndDate.css("border", "");
                dateError.html("");
            });

            invoiceEndDate.click(function () {
                invoiceStartDate.css("border", "");
                invoiceEndDate.css("border", "");
                dateError.html("");
            });

            $("#room-filter").on('input', function () {
                console.log("HI");
                let text = $("#room-filter").val();
                let allRoomButtons = $(".roomNoInvoice");
                for (let i = 0; i < allRoomButtons.length; i++) {
                    let node = allRoomButtons[i];
                    if ($(node).html().toLowerCase().indexOf(text.toLowerCase()) < 0) {
                        $(node).css("display", "none");
                    } else
                        $(node).css("display", "inline");
                }
            });

            function toggleRental() {
                console.log($("#rentalFee").html());
                if ($("#checkRental").is(":checked")) {
                    $("#rentalFee").html($("#rentalRate").html());
                    updateSum(0, 0, null);
                } else {
                    $("#rentalFee").html("0");
                    updateSum(0, 0, null);
                }
            }

            function changeHostel(hostelID, hostelName) {
                $("#hostelName").html(hostelName);
                $("#roomNumber").html("Chọn phòng");
                $("#roomList").empty();
                $("#invoice-form").css("display", "none");

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
                        console.log("Complete");
                        let data = JSON.parse(result.responseText);
                        if (data.length === 0) {
                            $("#roomArea").html('<div class="text-[15px] text-gray-700 uppercase bg-gray-50">Hiện tại chưa có phòng cần nhập hóa đơn</div>');
                        } else {
                            $("#roomArea").html('<div class="mb-[30px] text-[15px] text-gray-700 uppercase  bg-gray-50">Các phòng cần nhập hóa đơn kỳ <span id="monthPlusOne">${requestScope.noInvoiceList[0].latestInvoiceMonth}</span>:</div><input class="" type="text" name="searchRoom" placeholder="Tìm Phòng" id="room-filter"><div id="roomList" class="mt-[30px] flex flex-wrap"></div>');
                            let monthPlusOne = $("#monthPlusOne");
                            monthP1Temp = moment(monthPlusOne.html()).add(1, "M");
                            monthPlusOne.html(monthP1Temp.format('MM/YYYY').toString());
                            for (let i = 0; i < data.length; i++) {
                                $("#roomList").append('<form method="post" action="/sakura/invoice/new" style="display: inline-block;"><button class="roomNoInvoice" name="roomID" value="' + data[i].roomID + '" type="submit">'
                                        + data[i].roomNumber + '</button></form>');
                            }
                            $(".roomNoInvoice").addClass("mb-[20px] mr-[20px] inline-block text-white bg-[#17535B] hover:bg-[13484F] font-medium rounded text-sm px-5 py-2.5 text-center");
                            $("#room-filter").on('input', function () {
                                let text = $("#room-filter").val();
                                let allRoomButtons = $(".roomNoInvoice");
                                for (let i = 0; i < allRoomButtons.length; i++) {
                                    let node = allRoomButtons[i];
                                    if ($(node).html().toLowerCase().indexOf(text.toLowerCase()) < 0) {
                                        $(node).css("display", "none");
                                    } else
                                        $(node).css("display", "inline");
                                }
                            });
                        }

                    }
                });
            }

            function updateSum(serviceID, type, element) {
                let rowSum = $("#rowSum" + serviceID);
                rowSum.html("");
                let sum;
                if (type == 1 || type == 2) {
                    if ($(element).val() === "") {
                        $(element).val(0);
                    }
                    let startInput = $("#startInput" + serviceID);
                    let endInput = $("#endInput" + serviceID);

                    if (latestInvoiceMonth.html() === "Hợp đồng này chưa có hóa đơn") {
                        if ($(element).attr('id').indexOf('startInput') >= 0) {
                            if (parseInt(startInput.val()) > parseInt(endInput.val())) {
                                endInput.val(startInput.val());
                            }
                        }
                        if ($(element).attr('id').indexOf('endInput') >= 0) {
                            if (parseInt(startInput.val()) > parseInt(endInput.val())) {
                                startInput.val(endInput.val());
                            }
                        }
                        sum = parseInt(endInput.val()) - parseInt(startInput.val());
                    } else {
                        if ($(element).attr('id').indexOf('endInput') >= 0) {
                            if (parseInt(startInput.html()) > parseInt(endInput.val())) {
                                endInput.val(startInput.html());
                            }
                        }
                        sum = parseInt(endInput.val()) - parseInt(startInput.html());
                    }
                    $("#quantity" + serviceID).html(sum);
                } else {
                    if ($(element).val() === "") {
                        $(element).val(0);
                        sum = 0;
                    } else
                        sum = $("#quantity" + serviceID).val();
                }
                if (serviceID !== 0) {
                    sum = parseInt($("#serviceFee" + serviceID).html().replace(/,/g, '')) * parseInt(sum);
                    rowSum.html(parseInt(sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                }

                let sumService = 0;
                for (let i = 0; i < allRowSum.length; i++) {
                    let node = allRowSum[i];
                    sumService += parseInt($(node).html().replace(/,/g, ''));
                }

                invoiceSum.html(sumService.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                invoiceSumHidden.val(sumService);
                bottomSum.html(sumService.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " đồng");
            }

            function validate() {
                let res = true;
                if (invoiceMonth.val() === "") {
                    invoiceMonth.css("border", "1.5px solid red");
                    res = false;
                }
                if (invoiceStartDate.val() === "") {
                    invoiceStartDate.css("border", "1.5px solid red");
                    res = false;
                }
                if (invoiceEndDate.val() === "") {
                    invoiceEndDate.css("border", "1.5px solid red");
                    res = false;
                }
                if (latestInvoiceMonth.html() !== "Hợp đồng này chưa có hóa đơn") {
                    if (invoiceMonth.val() !== "" && invoiceMonth.val() <= latestInvoiceMonth.html()) {
                        // $("#latestInvoiceMonth").css("border", "1.5px solid red");
                        monthError.html("Người thuê đã thanh toán kì " + invoiceMonth.val() + "!");
                        monthError.css("color", "red");
                        invoiceMonth.css("border", "1.5px solid red");
                        res = false;
                    }
                }

                if (res) {
                    console.log("OK");
                    $("#toggleButton").click();
                }
            }
        </script>
    </body>
</html>
