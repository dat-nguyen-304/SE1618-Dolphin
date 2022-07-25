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
        <title>Trang người thuê - Danh sách hợp đồng</title>

        <%@include file="../view/assets.jsp" %>
        <%@include file="../assets/datatables/dataTables.jsp" %>

        <link href="../assets/css/LContractList.css" rel="stylesheet">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />

        <link rel="stylesheet" href="../assets/css/datatables.css">

    </head>

    <body>
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>

        <c:if test="${sessionScope.currentUser == null}">
            <p>Bạn phải đăng nhập để xem trang này</p>
        </c:if>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] h-[calc(100vh-80px)]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
                                </svg>
                                Danh sách hợp đồng nhà trọ của tài khoản ${sessionScope.currentUser.fullname}
                            </p>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

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
                                        <c:if test="${contract.status == 2}">
                                            <span class="bg-green-100 text-green-900 text-[14px] font-medium px-2.5 py-0.5 rounded">
                                                Đang chờ
                                            </span>
                                        </c:if>
                                    </td>
                                    <td class="text-center px-6 py-4 text-center">
                                        <form action="/sakura/tenant/contract-detail">
                                            <button name="contractID" value="${contract.contractID}"
                                                    class="font-medium text-[#288D87] hover:underline">Xem chi tiết</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>

        <script>
            $(document).ready(function () {
                $('#contract-table').DataTable({
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
    </body>

</html>