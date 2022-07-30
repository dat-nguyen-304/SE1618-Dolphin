<%-- 
    Document   : tenantPageInvoiceList
    Created on : Jun 21, 2022, 8:35:09 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang người thuê - Danh sách hoá đơn</title>

        <%@include file="../view/assets.jsp" %>
        <%@include file="../assets/datatables/dataTables.jsp" %>
        <link rel="stylesheet" href="../assets/css/tenant-page-invoice-list.css">


        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
        <link rel="stylesheet" href="../assets/css/datatables.css">
    </head>
    <body>
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px]  pt-[calc(60px+20px)] pb-[20px] h-[calc(100vh-80px)]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                                <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd" />
                                </svg>
                                Hoá đơn
                            </p>
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
                <c:if test="${empty sessionScope.currentContract}">
                    <p class="text-gray-300 text-[25px] font-bold absolute top-1/2 left-1/2 translate-x-[-30%] translate-y-[-50%]">Hiện tại bạn không thuê phòng trọ nào.</p>
                </c:if>
                <c:if test="${not empty sessionScope.currentContract}">
                    <!-- Search and filter -->
                    <div class="general-info flex justify-between mt-[20px]">
                        <form class="w-full flex justify-between items-center" action="/sakura/invoice/list" method="post">
                            <div class="left-part">
                                <!-- Search invoice by id -->
                                <!--                            <label for="default-search" class="mb-2 text-[14px] font-[14px] text-gray-900 sr-only">Search</label>
                                                            <div class="relative h-full">
                                                                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                                                    <svg class="w-5 h-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                                                    </svg>
                                                                </div>
                                                                <input type="search" id="search-invoice-id" placeholder="Tìm theo mã hoá đơn..."
                                                                       class="block pl-10 w-full text-[14px] text-gray-900 bg-gray-50 rounded-[4px] border border-gray-300 focus:ring-0 focus:border-[#17535B]">
                                                            </div>-->
                            </div>

                            <div class="right-part flex justify-between items-center">
                                <!-- Filter by date -->
                                <div class="date-picker mr-[20px]">
                                    <div class="flex items-center">
                                        <div class="relative">
                                            <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                                <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path>
                                                </svg>
                                            </div>
                                            <input datepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom right" name="start" type="text" id="start-date" autocomplete="off" placeholder="Ngày đầu"
                                                   class="bg-gray-50 border border-gray-300 text-gray-900 rounded block w-[160px] pl-10 py-[5px] datepicker-input"
                                                   <c:if test="${param.start != null}">value="${param.start}"</c:if>>
                                            </div>
                                            <span class="mx-4 text-gray-500">đến</span>
                                            <div class="relative">
                                                <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                                    <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                                <input datepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom right" name="end" type="text" id="end-date" autocomplete="off" placeholder="Ngày cuối"
                                                       class="bg-gray-50 border border-gray-300 text-gray-900 rounded block w-[160px] pl-10 py-[5px] datepicker-input"
                                                <c:if test="${param.end != null}">value="${param.end}"</c:if>>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mr-[20px]">
                                        <select name="sortByStatus" class="box-border text-[#17535B] bg-[#fff] hover:bg-[#F6F8FA] font-medium rounded text-[15px] px-[10px] py-[5px] text-left border border-[#17535B]">
                                            <option value="-1">Trạng thái</option>
                                            <option value="0"
                                            <c:if test="${param.sortByStatus != null && param.sortByStatus == 0}">selected</c:if>>
                                                Chưa thanh toán
                                            </option>
                                            <option value="1"
                                            <c:if test="${param.sortByStatus != null && param.sortByStatus == 1}">selected</c:if>>
                                                Đã thanh toán
                                            </option>
                                        </select>
                                    </div>
                                    <!--Reset filter button-->
                                    <button type="submit" name="resetButton" value="true" class="mr-[20px] px-[10px] py-[5px] text-[15px] font-medium text-[#fff] focus:outline-none bg-[#17535B] rounded hover:bg-[#13484F] focus:z-10">
                                        Hủy bộ lọc
                                    </button>

                                    <!-- Submit button -->
                                    <button type="submit" class="mr-[20px] px-[10px] py-[5px] text-[15px] font-medium text-[#fff] focus:outline-none bg-[#17535B] rounded hover:bg-[#13484F] focus:z-10">
                                        Lọc
                                    </button>
                                </div>
                            </form>
                        </div>
                        <!-- End Search and filter -->

                        <!-- table invoice list -->
                        <div class="statistic flex justify-between mt-[20px] w-full">
                            <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                                <table id="invoice-table" class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                                    <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                        <tr>
                                            <th scope="col" class="px-6 py-3">Mã hoá đơn</th>
                                            <th scope="col" class="px-6 py-3">Ngày đầu</th>
                                            <th scope="col" class="px-6 py-3">Ngày cuối</th>
                                            <th scope="col" class="px-6 py-3">Giá tiền</th>
                                            <th scope="col" class="px-6 py-3">Trạng thái</th>
                                            <th scope="col" class="px-6 py-3">
                                                <span class="sr-only">Edit</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="invoice-list">
                                    <c:forEach var="invoice" items="${requestScope.invoiceList}">
                                        <tr class="bg-white text-[15px] border-b hover:bg-gray-50 invoice-row py-[10px]">
                                            <td scope="row" class="px-6 py-[10px] font-medium text-gray-900 whitespace-nowrap invoice-id">
                                                <fmt:formatNumber type = "number" groupingUsed="false" minIntegerDigits = "5" value = "${invoice.invoiceID}" />
                                            </td>
                                            <td class="px-6 py-[10px]"><p class="date startDate">${invoice.startDate}</p></td>
                                            <td class="px-6 py-[10px]"><p class="date endDate">${invoice.endDate}</p></td>
                                            <td class="px-6 py-[10px]"><p class="money">${invoice.totalPrice} đ</p></td>
                                            <td class="px-6 py-[10px]">
                                                <c:if test="${invoice.status == 0}">
                                                    <span class="bg-red-100 text-red-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Chưa thanh toán</span>
                                                </c:if>
                                                <c:if test="${invoice.status == 1}">
                                                    <span class="bg-green-100 text-green-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Đã thanh toán</span>
                                                </c:if>
                                            </td>
                                            <td class="px-6 py-[10px] text-center">
                                                <form action="/sakura/invoice/detail" method="post">
                                                    <input type="hidden" name="invoiceID" value="${invoice.invoiceID}">
                                                    <button type="submit" class="font-medium text-[#288D87] hover:underline">Xem chi tiết</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- End table invoice list -->

                </c:if>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>

        <script src="../webjars/flowbite/1.3.4/dist/datepicker.js"></script>

        <script>
            $(document).ready(function () {
                $('#invoice-table').DataTable({
                    dom: 'Bfrtip',
//                    "fnDrawCallback": function (oSettings) {
//                        if ($('#room-list-table tr').length < 10) {
//                            $('.dataTables_paginate').hide();
//                        }
//                    },
                    language: {
                        "emptyTable": "Không có dữ liệu!",
                        "zeroRecords": "Không có kết quả phù hợp!",
                        "infoEmpty": "Hiển thị 0 kết quả",
                        "info": "Hiển thị <b>_START_</b> - <b>_END_</b> của <b>_TOTAL_</b> kết quả",
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
        </script>
        <script>
            let invoiceRows = $(".invoice-row");

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

            $("#search-invoice-id").on("input", function () {
                let text = $("#search-invoice-id").val();
                console.log(text);
                for (let i = 0; i < invoiceRows.length; i++) {
                    let node = invoiceRows[i];
                    if ($(node).find(".invoice-id a").html().indexOf(text) < 0) {
                        $(node).remove();
                    } else {
                        $("#invoice-list").append($(node));
                    }
                }
            });
        </script>
    </body>
</html>
