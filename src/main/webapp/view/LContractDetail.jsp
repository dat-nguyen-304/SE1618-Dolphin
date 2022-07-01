<%-- 
    Document   : LContractDetail
    Created on : Jun 23, 2022, 5:06:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang người thuê</title>

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
        <link rel="stylesheet" href="../assets/css/LContractDetail.css">

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
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Phòng
                            </a>
                        </li>
                        <!-- <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                        clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Danh sách hoá đơn</span>
                            </div>
                        </li> -->
                    </ol>
                </nav>
                <!-- End breadcrumb -->



                <div class="grid grid-cols-2 gap-x-8 mt-4 border-2 rounded p-4">
                    <div class="">
                        <div class="images border-2 p-4 rounded mt-[12px] grid grid-cols-4 gap-4">
                            <div class="col-span-2">Hợp đồng ID: ${requestScope.contract.contractID}</div>
                            <div class="col-span-2 text-xs italic text-right">Ngày tạo: 1/1/2022</div>
                            <div class="col-span-2 text-xs">Thời gian: ${requestScope.contract.startDate} - ${requestScope.contract.endDate}</div>
                            <div class="col-span-2 text-xs italic text-right">Trạng thái: 
                                <c:if test="${requestScope.contract.status == 0}">Đã kết thúc</c:if>
                                <c:if test="${requestScope.contract.status == 1}">Còn hiệu lực</c:if>
                                </div>
                                <div class="col-span-4 text-xs">Người cho thuê: ${requestScope.contract.landlord.fullname}</div>
                            <div class="col-span-2 text-xs">Người thuê: ${requestScope.contract.tenant.fullname}</div>
                            <div class="col-span-2 text-xs text-right">Phòng cho thuê: 101</div>
                            <div class="col-span-2 text-xs">Tiền đặt cọc: <span class="money">${requestScope.contract.deposit}</span></div>
                            <div class="col-span-2 text-xs text-right">Giá hằng tháng: <span class="money">${requestScope.contract.rentalFeePerMonth}</span></div>
                                <c:if test="${requestScope.contract.description != null}">
                                <div class="col-span-4 text-xs">Nội dung: -${requestScope.contract.description}-
                                </div>
                            </c:if>
                            <button class="col-span-4 text-right">Đã ký tên</button>
                        </div>
                    </div>
                    <div class="mt-4 border-2 rounded p-4">
                        <div class="grid grid-cols-6 gap-4">
                            <div class="text-sm col-span-3">Thời hạn: ${requestScope.contract.duration} Tháng</div>
                            <div class="text-sm col-span-3">Tổng tiền nhà: <span class="money">${requestScope.contract.rentalFeePerMonth * requestScope.invoiceList.size()}</span></div>
                            <div class="text-sm col-span-2">Số điện: ${requestScope.startElectrict} - ${requestScope.endElectrict}</div>
                            <div class="text-sm col-span-2">Số lượng: ${requestScope.endElectrict - requestScope.startElectrict}</div>
                            <div class="text-sm col-span-2">Tổng: <span class="money">${requestScope.totalElectric}</span></div>
                            <div class="text-sm col-span-2">Số nước: ${requestScope.startWater} - ${requestScope.endWater}</div>
                            <div class="text-sm col-span-2">Số lượng: ${requestScope.endWater - requestScope.startWater}</div>
                            <div class="text-sm col-span-2">Tổng: <span class="money">${requestScope.totalWater}</span></div>
                            <div class="text-sm col-span-6">Các dịch vụ khác: <span class="money">${requestScope.totalAll - requestScope.totalElectric - requestScope.totalWater}</span></div>
                            <div class="text-md col-span-6">Tổng cộng: <span class="money">${requestScope.totalAll}</span></div>
                        </div>
                    </div>
                    <p class="mt-8">Danh sách hóa đơn:</p>
                    <div class="mt-[20px] col-span-2">
                        <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                            <table class="w-full text-sm text-left text-gray-500 ">
                                <thead
                                    class="text-center text-xs text-gray-700 uppercase bg-gray-50  ">
                                    <tr>
                                        <th scope="col" class="text-center px-6 py-3">
                                            Hóa đơn ID
                                        </th>
                                        <th scope="col" class="text-center px-6 py-3">
                                            Tên Phòng
                                        </th>
                                        <th scope="col" class="text-center px-6 py-3">
                                            Thời gian
                                        </th>
                                        <th scope="col" class="text-center px-6 py-3">
                                            Tổng tiền
                                        </th>
                                        <th scope="col" class="text-center px-6 py-3">
                                            Trạng thái
                                        </th>
                                        <th scope="col" class="text-center px-6 py-3">
                                            <span class="sr-only">Xem chi tiết</span>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.invoiceList}" var="invoice">
                                        <tr class="bg-white border-b ">
                                            <th scope="row"
                                                class="text-center px-6 py-4 font-medium text-gray-900  whitespace-nowrap">
                                                ${invoice.invoiceID}
                                            </th>
                                            <td class="text-center px-6 py-4">
                                                ${requestScope.contract.room.roomNumber}
                                            </td>
                                            <td class="text-center px-6 py-4">
                                                ${invoice.month}
                                            </td>
                                            <td class="text-center px-6 py-4 money">
                                                ${invoice.totalPrice}
                                            </td>
                                            <td class="text-center px-6 py-4">
                                                <c:if test="${invoice.status == 0}">Chưa thanh toán</c:if>
                                                <c:if test="${invoice.status == 1}">Đã thanh toán</c:if>
                                                </td>
                                                <td class="text-center px-6 py-4 text-center">
                                                    <a href="#"
                                                       class="font-medium text-blue-600 hover:underline">Xem
                                                        chi tiết</a>
                                                </td>
                                            </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
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

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            var formatMoney = function (n) {
                var s = '' + (Math.floor(n)), i = s.length, r = '';
                while ((i -= 3) > 0) {
                    r = '.' + s.substr(i, 3) + r;
                }
                return s.substr(0, i + 3) + r + " VNÐ";
            };
            const moneyElements = document.querySelectorAll('.money');
            moneyElements.forEach(money => {
                const originMoney = money.innerHTML;
                console.log(originMoney);
                money.innerHTML = formatMoney(originMoney);
            })
        </script>
    </body>

</html>