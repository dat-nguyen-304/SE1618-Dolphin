<%-- 
    Document   : tenantPageInvoiceDetail
    Created on : Jun 21, 2022, 8:39:08 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý phòng thuê - Chi tiết hoá đơn</title>
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

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Chi tiết hoá đơn</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <!-- Search and filter -->
                <div class="general-info flex justify-between mt-[20px]">

                </div>
                <div class="card p-5 mt-[20px]">
                    <div class="grid grid-cols-5 grid-rows-2 ">
                        <div>
                            Mã hoá đơn: ${invoice.invoiceID}
                        </div>
                        <div>
                            Người thuê: ${invoice.contract.tenant.fullname}
                        </div>
                        <div>Mã hợp đồng: ${invoice.contract.contractID}</div>
                        <div>Từ: <span class="date">${invoice.startDate}</span></div>
                        <div>Ngày xuất hoá đơn: <span class="date">${invoice.createdDate}</span></div>
                        <div>Trạng thái: ${(invoice.status == 1) ? "Chưa thanh toán" : (invoice.status == 2) ? "Đã thanh toán" : "Quá hạn"}
                        </div>
                        <div>Phòng: ${invoice.contract.room.roomNumber}</div>
                        <div>Kỳ thanh toán ${invoice.month}</div>
                        <div>Đến: <span class="date">${invoice.endDate}</span></div>
                    </div>
                </div>
                <!-- End Search and filter -->

                <!-- table invoice list -->
                <div class="statistic flex justify-between mt-[20px] w-full">
                    <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                        <form class="w-full flex justify-between items-center">
                            <input hidden type=text" name=tenantID" value="101" />
                            <input hidden type="text" name=roomID" value="101" />

                            <!--                            <div class="left-part">
                                                             Search invoice by id 
                                                            <label for="default-search"
                                                                   class="mb-2 text-[14px] font-[14px] text-gray-900 sr-only">Search</label>
                                                            <div class="relative h-full">
                                                                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                                                    <svg class="w-5 h-5 text-gray-500" fill="none" stroke="currentColor"
                                                                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                          d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                                                    </svg>
                                                                </div>
                                                                <input type="search" id="search-invoice-id"
                                                                       class="block pl-10 w-full text-[14px] text-gray-900 bg-gray-50 rounded-[4px] border border-gray-300 focus:ring-0 focus:border-[#17535B]"
                                                                       placeholder="Tìm theo mã hoá đơn..." required="">
                                                            </div>
                                                        </div>-->
                        </form>
                        <table class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                            <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3">
                                        Mô tả
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
                                        Đơn giá (VNĐ)
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Thành tiền (VNĐ)
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        <span class="sr-only">Edit</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="detail" items="${requestScope.detailList}">
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            <a href="#" class="hover:text-[#288D87] hover:underline">${detail.service.serviceName}</a>
                                        </th>
                                        <td class="px-6 py-4">
                                            ${detail.service.unit}
                                        </td>
                                        <td class="px-6 py-4">
                                            ${(detail.service.type == 1) ? detail.startValue : ""}
                                        </td>
                                        <td class="px-6 py-4">
                                            ${(detail.service.type == 1) ? detail.endValue : ""}
                                        </td>
                                        <td class="px-6 py-4">
                                            ${detail.quantity}
                                        </td>
                                        <td class="px-6 py-4 money">
                                            ${detail.service.serviceFee}
                                        </td>
                                        <td class="px-6 py-4 money rowSum">
                                            ${(detail.quantity) * detail.service.serviceFee}
                                        </td>
                                    </tr>
                                </c:forEach>
                                <!--                                <tr class="bg-white border-b hover:bg-gray-50">
                                                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                                        <a href="#" class="hover:text-[#288D87] hover:underline">Điện</a>
                                                                    </th>
                                                                    <td class="px-6 py-4">
                                                                        2223
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        2288
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        kWh
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        65
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        đ12.000
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        đ780.000
                                                                    </td>
                                                                </tr>
                                                                <tr class="bg-white border-b hover:bg-gray-50">
                                                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                                        <a href="#" class="hover:text-[#288D87] hover:underline">Nước</a>
                                                                    </th>
                                                                    <td class="px-6 py-4">
                                                                        132
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        143
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        m<sup>3</sup>
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        9
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        đ7.000
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        đ63.000
                                                                    </td>
                                                                </tr>
                                                                <tr class="bg-white border-b hover:bg-gray-50">
                                                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                                        <a href="#" class="hover:text-[#288D87] hover:underline">Internet</a>
                                                                    </th>
                                                                    <td class="px-6 py-4">
                                
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        0
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        0
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        đ90.000
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        đ0
                                                                    </td>
                                                                </tr>
                                                                <tr class="bg-white border-b hover:bg-gray-50">
                                                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                                        <a href="#" class="hover:text-[#288D87] hover:underline">Gửi xe</a>
                                                                    </th>
                                                                    <td class="px-6 py-4">
                                                                        cái
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        2
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        đ100.000
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        đ200.000
                                                                    </td>
                                                                </tr>
                                                                <tr class="bg-white border-b hover:bg-gray-50">
                                                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                                        <a href="#" class="hover:text-[#288D87] hover:underline">Xử lý rác</a>
                                                                    </th>
                                                                    <td class="px-6 py-4">
                                
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        1
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        đ50.000
                                                                    </td>
                                                                    </td>
                                                                    <td class="px-6 py-4">
                                                                        đ50.000
                                                                    </td>
                                                                </tr>
                                -->                                                                <tr class="bg-white border-b hover:bg-gray-50">
                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                        <a href="#" class="hover:text-[#288D87] hover:underline">Phí thuê phòng</a>
                                    </th>
                                    <td class="px-6 py-4">
                                        phòng
                                    </td>
                                    <td class="px-6 py-4">

                                    </td>
                                    <td class="px-6 py-4">

                                    </td>
                                    <td class="px-6 py-4">
                                        1
                                    </td>
                                    <td class="px-6 py-4 money">
                                        ${invoice.contract.rentalFeePerMonth}
                                    </td>
                                    <td class="px-6 py-4 money rowSum">
                                        ${invoice.contract.rentalFeePerMonth}
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
                                        <span id="invoiceSum" class="money"></span>
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                        <!-- Pagination + Export excel -->
                        <div class="table-extend flex justify-between">

                            <!-- Summation -->
                            <div class="summary grid grid-cols-5 grid-rows-2 w-[50%]">
                                <div class="col-span-1 text-[20px] text-[#17535B] font-bold">Thành tiền</div>
                                <div class="col-span-4 text-[20px] text-[#17535B] "><span id="bottomSum" class="money"></span></div>
                                <!--                                <div class="col-span-1">bằng chữ</div>
                                                                <div class="col-span-4"><em>Năm triệu không trăm chín mươi ba nghìn đồng</em></div>-->
                            </div>
                            <!-- End Summation -->

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
                        <!-- End Pagination + Export excel -->


                    </div>

                </div>


                <!-- End table invoice list -->
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

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="../assets/javascript/chart-tenant-page.js"></script>
        <script src="../assets/javascript/jquery.js"></script>
        <script>
            $(document).ready(function () {
                var allDateCells = $(".date");
                var allMoneyCells = $(".money");
                var allRowSum = $(".rowSum");
                var sum = 0;
                for (var i = 0; i < allRowSum.length; i++) {
                    var node = allRowSum[i];
                    sum += parseInt(node.childNodes[0].nodeValue);
                }
//                console.log(sum);
                $("#invoiceSum").html(sum);
                $("#bottomSum").html(sum + " đồng");


                for (var i = 0; i < allDateCells.length; i++) {
                    var node = allDateCells[i];
                    var isoDate = node.childNodes[0].nodeValue;
//                    var date = moment().toString();
//                    console.log(date);
//                    console.log(date.format("dd/MM/YYYY"));
//                var vnDate = new Moment(isoDate);
                    node.childNodes[0].nodeValue = isoDate.split('-').reverse().join(' / ');
                }

                for (var i = 0; i < allMoneyCells.length; i++) {
                    var node = allMoneyCells[i];
                    var money = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                }
            });
        </script>
    </body>
</html>
