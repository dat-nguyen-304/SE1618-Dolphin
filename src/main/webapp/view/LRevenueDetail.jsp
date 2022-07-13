<%-- 
    Document   : LRevenueDetail
    Created on : Jul 11, 2022, 3:26:04 PM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Doanh thu tháng ${requestScope.revenueDate}, nhà trọ ${sessionScope.currentHostel.hostelName}</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css"/>

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/datetime/1.1.2/js/dataTables.dateTime.min.js"></script>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- <link rel="stylesheet" href="app.css"> -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
              rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/LOverView.css">
        <link rel="stylesheet" href="../assets/css/datatables.css">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />

    </head>
    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">
            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">
                <div class="head-control flex justify-between">
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center">
                                <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                    </path>
                                    </svg>
                                    Doanh thu
                                </p>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px]">
                    <table id="revenue-list-table" class="display nowrap" style="width:100%">
                        <thead>
                        <th>Phòng</th>
                        <th>Tiền nước</th>
                        <th>Tiền điện</th>
                        <th>Dịch vụ khác</th>
                        <th>Tổng doanh thu</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.invoiceList}" var = "invoice" varStatus="ptr">    
                                <c:if test = "${invoice.month eq requestScope.revenueDate}">
                                    <tr>
                                        <td>${invoice.contract.room.roomNumber}</td>
                                        <td>${invoice.waterPrice}</td>
                                        <td>${invoice.electricPrice}</td>
                                        <td>${invoice.totalPrice - waterPrice - electricPrice}</td>
                                        <td>${invoice.totalPrice}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>
            <%@include file="../view/footerDashboard.jsp" %>
        </div>

    </body>
    <script>
        $(document).ready(function () {
            $('#revenue-list-table').DataTable({
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
</html>
