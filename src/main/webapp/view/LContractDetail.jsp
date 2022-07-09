<%-- 
    Document   : LContractDetail
    Created on : Jun 23, 2022, 5:06:25 PM
    Author     : Admin
--%>

<%@page import="com.dolphin.hostelmanagement.DTO.Contract"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Chi tiết hợp đồng</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/LContractDetail.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <link rel="stylesheet" href="../assets/css/datatables.css">

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
                            <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
                                </svg>
                                Danh sách hợp đồng nhà trọ ${sessionScope.currentHostel.hostelName}
                            </p>
                        </li>
                        <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"> 
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Chi tiết hợp đồng ${requestScope.contract.contractID} - phòng ${requestScope.contract.room.roomNumber}</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

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

                <div class="grid grid-cols-2 gap-[20px]">
                    <div class="card bg-[#fff] p-[20px]">
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
                                    <p class="text-[#929ca5] font-normal">Phòng thuê</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.room.roomNumber}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tiền đặt cọc</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.contract.deposit}</span></p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Giá hằng tháng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.contract.rentalFeePerMonth}</span></p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Trạng thái</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold contractStatus">
                                        <c:if test="${requestScope.contract.status == 0}">Đã kết thúc</c:if>
                                        <c:if test="${requestScope.contract.status == 1}">
                                            Còn hiệu lực
                                            <button class="" id="endContract-1" type="submit" name="action" value="Save">
                                                Kết thúc hợp đồng này
                                            </button>
                                        </c:if>
                                    </p>
                                </div>
                            </div>
                            <c:if test="${requestScope.contract.description != null}">
                                <div class="mt-[20px]">
                                    <p class="text-[#929ca5] font-normal"><i class="bi bi-info-circle mr-[5px]"></i>Nội dung</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.description}</p>
                                </div>
                            </c:if>
                            <c:if test = "${requestScope.contract.status == 1}">
                            <form action = "/sakura/contract/replace-contract" method = "post">
                                <input type ="hidden" name ="contractID" value ="${requestScope.contract.contractID}"/>
                                <button type = "submit">Thay hợp đồng mới</button>
                            </form>
                            </c:if>
                            <p class="col-span-4 text-right">Đã thỏa thuận</p>
                        </div>
                    </div>
                    <div class="card bg-[#fff] p-[20px]">
                        <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px]">
                            Thống kê chi phí
                        </div>
                        <div class="w-full h-fit mx-auto">
                            <div class="grid grid-cols-6 gap-[8px]">
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Thời hạn</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.duration} tháng</p>
                                </div>
                                <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tổng tiền nhà</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.contract.rentalFeePerMonth * requestScope.invoiceList.size()}</span></p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Số điện (kWh)</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.startElectrict} - ${requestScope.endElectrict}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Số lượng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.endElectrict - requestScope.startElectrict}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tổng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.totalElectric}</span></p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Số nước (m<sup>3</sup>)</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.startWater} - ${requestScope.endWater}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Số lượng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.endWater - requestScope.startWater}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tổng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.totalWater}</span></p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Các dịch vụ khác</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.totalAll - requestScope.totalElectric - requestScope.totalWater}</span></p>
                                </div>
                                <div class="col-span-6 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tổng cộng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.totalAll}</span></p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px]">
                    <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px]">
                        Danh sách hóa đơn
                    </div>
                    <table id="invoice-table" class="w-full text-sm text-left text-gray-500 ">
                        <thead>
                            <tr class="text-center text-xs text-gray-700 uppercase bg-gray-50  ">
                                <th scope="col" class="text-center px-6 py-3">Mã hoá đơn</th>
                                <th scope="col" class="text-center px-6 py-3">Tên Phòng</th>
                                <th scope="col" class="text-center px-6 py-3">Thời gian</th>
                                <th scope="col" class="text-center px-6 py-3">Tổng tiền</th>
                                <th scope="col" class="text-center px-6 py-3">Trạng thái</th>
                                <th scope="col" class="text-center px-6 py-3">
                                    <span class="sr-only">Xem chi tiết</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.invoiceList}" var="invoice">
                                <tr class="bg-white border-b ">
                                    <th scope="row" class="text-center px-6 py-4 font-medium text-gray-900  whitespace-nowrap">${invoice.invoiceID}</th>
                                    <td class="text-center px-6 py-4">${requestScope.contract.room.roomNumber}</td>
                                    <td class="text-center px-6 py-4">${invoice.month}</td>
                                    <td class="text-center px-6 py-4 money">${invoice.totalPrice}</td>
                                    <td class="text-center px-6 py-4">
                                        <c:if test="${invoice.status == 0}">
                                            Chưa thanh toán
                                        </c:if>
                                        <c:if test="${invoice.status == 1}">
                                            Đã thanh toán
                                        </c:if>
                                    </td>
                                    <td class="text-center px-6 py-4 text-center">
                                        <form action="/sakura/landlord/contract-detail">
                                            <button type="submit" name="invoiceId" value="${invoice.invoiceID}" class="font-medium text-[#288D87] hover:underline">Xem chi tiết</butotn>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <%@include file="../view/modalLandlordContractDetail.jsp" %>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
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
        </script>
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
            });
        </script>

        <script>
            function endContract() {

                const endContractContent = document.querySelector(".endContractContent");
                const endContractId = document.querySelector("input[name='endContractId']");
                const endContractBtn = document.querySelector(".endContractBtn");
                const contractStatus = document.querySelector(".contractStatus");
                jQuery.ajax({
                    type: 'POST',
                    data: {'endContractId': endContractId.value
                    },
                    url: '/sakura/contract/end-contract',
                    success: function (response) {
                        endContractContent.innerHTML = response;
                        if (response === "Cập nhật thành công")
                            contractStatus.innerHTML = "Trạng thái: Đã kết thúc";
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }
        </script>

        <script>
            var open_modal_1 = document.querySelector('#endContract-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.endContractmodal1');
            });

            var open_modal_2 = document.querySelector('#endContract-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.endContractmodal2');
            });

            // Bấm ngoài modal thì đóng modal
            // const overlay = document.querySelector('.modal .modal-overlay');
            // overlay.addEventListener('click', toggleModal('.modal'));

            var close_modal_1 = document.querySelectorAll('.endContractmodal1 .endContractmodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.endContractmodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.endContractmodal2 .endContractmodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.endContractmodal2');
                    console.log('close 2');
                });
            }

            document.onkeydown = function (evt) {
                evt = evt || window.event;
                var isEscape = false;
                if ("key" in evt) {
                    isEscape = (evt.key === "Escape" || evt.key === "Esc");
                } else {
                    isEscape = (evt.keyCode === 27);
                }
                const modal_1 = document.querySelector('.endContractmodal1');
                const modal_2 = document.querySelector('.endContractmodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.endContractmodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.endContractmodal2');
                }
            };

            function toggleModal(modal_item) {
                const modal = document.querySelector(modal_item);
                modal.classList.toggle('active-modal');
                modal.classList.toggle('opacity-0');
                modal.classList.toggle('pointer-events-none');
            }

        </script>
    </body>

</html>