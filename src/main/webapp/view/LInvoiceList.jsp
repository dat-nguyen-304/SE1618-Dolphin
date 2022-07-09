<%-- 
    Document   : LInvoiceList
    Created on : Jun 26, 2022, 4:51:05 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Danh sách hoá đơn</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/LInvoiceList.css">

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
        <link rel="stylesheet" href="../assets/css/datatables.css">
    </head>

    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <a href="#" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                                <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd" />
                                </svg>
                                Hoá đơn
                            </a>
                        </li>
                        <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Danh sách hoá đơn</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <!-- Search and filter -->
                <div class="general-info flex justify-between mt-[20px]">
                    <div class="w-full flex justify-between items-center">
                        <div class="left-part">
                            <%@include file="../view/modalLandlordInvoiceList.jsp" %>
                            <!-- Choose hostel -->
                            <div class="flex items-center">
                                <div class="pr-[20px] mr-[20px] border-r border-gray-300">
                                    <span>Nhà trọ: </span>
                                    <button class="ml-[10px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-[15px] px-[10px] py-[5px] text-center" type="button" data-modal-toggle="hostelModal">
                                        <span id="hostelName">
                                            ${(requestScope.chosenHostel != null) ? requestScope.chosenHostel.hostelName : "Chọn nhà trọ"}
                                        </span>
                                    </button>
                                </div>
                                <div id="chooseRoom">
                                    <span>Phòng: </span>
                                    <button class="ml-[10px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-[15px] px-[10px] py-[5px] text-center" type="button" data-modal-toggle="roomModal">
                                        <span id="roomNumber">
                                            ${(requestScope.chosenRoom == null) ? "Chọn phòng" : requestScope.chosenRoom.roomID == 0 ? "Tất cả" : requestScope.chosenRoom.roomNumber}
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <c:if test="${chosenRoom != null}">
                            <div class="right-part flex justify-between items-center">
                                <form id="filter-form" class="w-full flex justify-between items-center" action="/sakura/invoice/search" method="post">
                                    <input type="hidden" value="${requestScope.chosenHostel.hostelID}" name="hostelID">
                                    <input type="hidden" value="${requestScope.chosenRoom.roomID}" name="roomID">

                                    <div class="right-part flex justify-between items-center">
                                        <!-- Filter by date -->
                                        <div class="date-picker mr-[20px]">
                                            <div date-rangepicker="" datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom right" class="flex items-center">
                                                <div class="relative">
                                                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                                        <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path>
                                                        </svg>
                                                    </div>
                                                    <input name="start" type="text" id="start-date" autocomplete="off" placeholder="Ngày đầu"
                                                           class="bg-gray-50 border border-gray-300 text-gray-900 rounded block w-[160px] pl-10 py-[5px] datepicker-input"
                                                           <c:if test="${!requestScope.reset}">value="${param.start}"</c:if>>
                                                    </div>
                                                    <span class="mx-4 text-gray-500">đến</span>
                                                    <div class="relative">
                                                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                                            <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path>
                                                            </svg>
                                                        </div>
                                                        <input name="end" type="text" id="end-date" autocomplete="off" placeholder="Ngày cuối"
                                                               class="bg-gray-50 border border-gray-300 text-gray-900 rounded block w-[160px] pl-10 py-[5px] datepicker-input"
                                                        <c:if test="${!requestScope.reset}">value="${param.end}"</c:if>>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--Filter by status-->
                                            <div class="mr-[20px]">
                                                <select name="sortByStatus" class="box-border text-[#17535B] bg-[#fff] hover:bg-[#F6F8FA] font-medium rounded text-[15px] px-[10px] py-[5px] text-left border border-[#17535B]">
                                                    <option value="0">Trạng thái</option>
                                                    <option value="1" <c:if test="${!requestScope.reset && param.sortByStatus == 1}">selected</c:if>>
                                                        Chưa thanh toán
                                                    </option>
                                                    <option value="2" <c:if test="${!requestScope.reset && param.sortByStatus == 2}">selected</c:if>>
                                                        Đã thanh toán
                                                    </option>
                                                    <option value="3" <c:if test="${!requestScope.reset && param.sortByStatus == 3}">selected</c:if>>
                                                        Quá hạn
                                                    </option>
                                                </select>
                                            </div>
                                            <!--Reset filter button-->
                                            <button type="submit" name="resetButton" value="true" class="mr-[20px] px-[10px] py-[5px] text-[15px] font-medium text-[#fff] bg-[#17535B] rounded hover:bg-[#13484F]">
                                                Hủy tất cả
                                            </button>

                                            <!-- Submit button -->
                                            <button type="submit" class="mr-[20px] px-[10px] py-[5px] text-[15px] font-medium text-[#fff] bg-[#17535B] rounded hover:bg-[#13484F]">
                                                Lọc
                                            </button>
                                        </div>
                                    </form>
                                </div>
                        </c:if>

                    </div>
                </div>
                <!-- End Search and filter -->

                <!-- table invoice list -->
                <div class="statistic flex justify-between mt-[20px] w-full">
                    <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                        <table id="invoice-table" class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                            <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3">Mã hoá đơn</th>
                                    <th scope="col" class="px-6 py-3">Phòng</th>
                                    <th scope="col" class="px-6 py-3">Hóa đơn tháng</th>
                                    <th scope="col" class="px-6 py-3">Ngày bắt đầu</th>
                                    <th scope="col" class="px-6 py-3">Ngày kết thúc</th>
                                    <th scope="col" class="px-6 py-3">Giá tiền</th>
                                    <th scope="col" class="px-6 py-3">Trạng thái</th>
                                    <th scope="col" class="px-6 py-3">
                                        <span class="sr-only">Edit</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="invoiceList">
                                <c:choose>
                                    <c:when test="${requestScope.invoiceList.size() != 0}">
                                        <c:forEach items="${requestScope.invoiceList}" var="invoice">
                                            <tr class="bg-white border-b hover:bg-gray-50">
                                                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                    <a href="#" class="hover:text-[#288D87] hover:underline">${invoice.invoiceID}</a>
                                                </th>
                                                <td class="px-6 py-4">${invoice.contract.room.roomNumber}</td>
                                                <td class="px-6 py-4">${invoice.month}</td>
                                                <td class="px-6 py-4 date">${invoice.startDate}</td>
                                                <td class="px-6 py-4 date">${invoice.endDate}</td>
                                                <td class="px-6 py-4"><span class="money">${invoice.totalPrice}</span> đ
                                                </td>
                                                <td class="px-6 py-4">
                                                    <c:if test="${invoice.status == 0}">
                                                        <span class="bg-red-100 text-red-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Chưa thanh toán</span>
                                                    </c:if>
                                                    <c:if test="${invoice.status == 1}">
                                                        <span class="bg-green-100 text-green-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Đã thanh toán</span>
                                                    </c:if>
                                                </td>
                                                <td class="px-6 py-4 text-center">
                                                    <form action="/sakura/invoice/detail">
                                                        <button name="invoiceID" value="${invoice.invoiceID}" class="font-medium text-[#288D87] hover:underline">Xem chi tiết</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td><p style="color: red;">Không có hóa đơn</p></td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>

                    </div>
                </div>

                <!-- End table invoice list -->
            </div>

            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
        <script src="js/monthpicker.js"></script>

        <script>
            $(document).ready(function () {
                $('#invoice-table').DataTable({
                    dom: 'Bfrtip',
                    "fnDrawCallback": function (oSettings) {
                        if ($('#room-list-table tr').length < 10) {
                            $('.dataTables_paginate').hide();
                        }
                    },
                    language: {
                        "emptyTable": "Không có dữ liệu!",
                        "zeroRecords": "Không có kết quả phù hợp!",
                        "infoEmpty": "Hiển thị 0 kết quả",
                        "info": "Hiển thị _START_ - _END_ của _TOTAL_ kết quả",
                        "infoFiltered": "",
                        search: "Tìm kiếm",
                        paginate: {
                            previous: '<i class="bi bi-caret-left-fill"></i>',
                            next: '<i class="bi bi-caret-right-fill"></i>'
                        },
                        aria: {
                            paginate: {
                                previous: 'Trước',
                                next: 'Sau'
                            }
                        }
                    },
                    buttons: [
                        {
                            extend: 'excelHtml5',
                            text: 'Xuất file excel <i class="bi bi-filetype-xlsx text-[20px]"></i>',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4]
                            }
                        }
                    ],
                    "pageLength": 10, // items per page
                    info: true
                });
            });
            $(document).ready(function () {
                let allDateCells = $(".date");
                let allMoneyCells = $(".money");
                for (let i = 0; i < allDateCells.length; i++) {
                    let node = allDateCells[i];
                    let isoDate = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = isoDate.split('-').reverse().join('/');
                }

                for (let i = 0; i < allMoneyCells.length; i++) {
                    let node = allMoneyCells[i];
                    let money = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                }
            });
            function changeHostel(hostelID, hostelName) {
                $("#hostelName").html(hostelName);
                $("#roomNumber").html("Chọn phòng");
                $("#chooseRoom").css("display", "block");
                $("#roomList").empty();
                $("#hostelID").val(hostelID);
                console.log($("#hostelID").val());
                $("#invoiceList").empty();
                $("#filter-form").css("display", "none");
                jQuery.ajax({
                    url: '/sakura/room/roomsByHostel',
                    type: 'GET',
                    data: {hostelID: hostelID},
                    dataType: 'text',
                    success: function (result) {
                    },
                    error: function () {
                    },
                    complete: function (result) {
                        console.log("Compelte");
                        let data = JSON.parse(result.responseText);
                        for (let i = 0; i < data.length; i++) {
                            $("#roomList").append('<form method="post" action="/sakura/invoice/list" style="display: inline-block;"><button class="room" name="roomID" value="' + data[i].roomID + '" type="submit">'
                                    + data[i].roomNumber + '</button></form>');
                        }
                        $(".room").addClass("ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[13484F] font-medium rounded text-sm px-5 py-2.5 text-center");
                        if (data.length === 0) {
                            $("#roomList").append('<p style="color: red" class="col-span-3">Nhà trọ này không có phòng!</p>');
                        }
                    }
                });
            }
        </script>
        <script>
            $("#search-room").on("input", function () {
                let rooms = $(".room");
                let text = $("#search-room").val();
                console.log(text);
                // console.log(rooms.length);
                for (let i = 0; i < rooms.length; i++) {
                    let node = rooms[i];
                    if ($(node).html().toLowerCase().indexOf(text.toLowerCase()) < 0) {
                        // console.log($(node).html());
                        $(node).css("display", "none");
                    } else {
                        // $("#roomList").append(node);
                        $(node).css("display", "inline-block");
                    }
                }

            });
        </script>
    </body>

</html>