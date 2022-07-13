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
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/LContractList.css">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />

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
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">

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
                    </ol>
                </nav>
                <!-- End breadcrumb -->
                <c:if test="${sessionScope.hostelList == null}">
                    Bạn chưa có nhà trọ nào.
                    <a href="/sakura/landlord/overview">Quay về trang thêm thông tin nhà trọ</a>
                </c:if>
                <!-- General information -->
                <c:if test="${sessionScope.hostelList != null}">
                    <%@include file="../view/modalLandlordContractList.jsp" %>
                    <div class="general-info flex items-center mt-[20px]">
                        <div class="pr-[20px] mr-[20px] border-r border-gray-300">
                            <span>Nhà trọ: </span>
                            <button class="ml-[10px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-[15px] px-[10px] py-[5px] text-center" type="button" data-modal-toggle="hostelModal">
                                ${sessionScope.currentHostel.hostelName}
                            </button>
                        </div>
                        <div class="">
                            <span>Phòng: </span>
                            <button class="ml-[10px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-[15px] px-[10px] py-[5px] text-center" type="button" data-modal-toggle="roomModal">
                                <c:if test="${requestScope.roomNumber == null}">
                                    Tất cả
                                </c:if>
                                <c:if test="${requestScope.roomNumber != null}">
                                    ${requestScope.roomNumber}
                                </c:if>
                            </button>
                        </div>
                    </div>
                    <div class="card bg-[#fff] p-[20px] mt-[20px]">
                        <table id="contract-table" class="w-full text-sm text-left text-gray-500">
                            <thead>
                                <tr class="text-center text-xs text-gray-700 uppercase bg-gray-50">
                                    <th scope="col" class="text-center px-6 py-3">Mã hợp đồng</th>
                                    <th scope="col" class="text-center px-6 py-3">Người thuê</th>
                                    <th scope="col" class="text-center px-6 py-3">Phòng</th>
                                    <th scope="col" class="text-center px-6 py-3">Từ ngày</th>
                                    <th scope="col" class="text-center px-6 py-3">Đến ngày</th>
                                    <th scope="col" class="text-center px-6 py-3">Trạng thái</th>
                                    <th scope="col" class="text-center px-6 py-3 text-[#288D87]">
                                        <span class="sr-only">Xem chi tiết</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.contractList}" var="contract">
                                    <tr class="text-[15px] bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="text-center px-6 py-4 font-medium text-gray-900">${contract.contractID}</th>
                                        <td class="text-left px-6 py-4">${contract.tenant.fullname}</td>
                                        <td class="text-center px-6 py-4">${contract.room.roomNumber}</td>
                                        <td class="text-center px-6 py-4">${contract.startDate}</td>
                                        <td class="text-center px-6 py-4">${contract.endDate}</td>
                                        <td class="text-center px-6 py-4">
                                            <c:if test="${contract.status == 0}">
                                                <span class="bg-blue-100 text-blue-900 text-[14px] font-medium px-2.5 py-0.5 rounded">
                                                    Đã kết thúc
                                                </span>
                                            </c:if>
                                            <c:if test="${contract.status == 1}">
                                                <span class="bg-green-100 text-green-900 text-[14px] font-medium px-2.5 py-0.5 rounded">
                                                    Còn hiệu lực
                                                </span>
                                            </c:if>
                                        </td>
                                        <td class="text-center px-6 py-4 text-center">
                                            <form action="/sakura/landlord/contract-detail">
                                                <button name="contractID" value="${contract.contractID}"
                                                        class="font-medium text-[#288D87] hover:underline">Xem chi tiết</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
        <script>
            $(document).ready(function () {
                $('#contract-table').DataTable({
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
    </body>

</html>