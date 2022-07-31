<%-- 
    Document   : adminTenantProfile
    Created on : Jul 6, 2022, 8:53:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Thông tin chủ nhà ${requestScope.landlord.fullname}</title>
        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/admin-page.css">

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
        <link rel="stylesheet" href="../assets/css/admin-tenant-magement.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
        <style>
            .dataTables_wrapper {
                height: 92% !important;
            }
        </style>
    </head>
    <body>
        <%@include file="../view/headerAdminDashboard.jsp" %>
        <%@include file="../view/navbarAdminDashboard.jsp" %>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

                <div class="head-control flex justify-between">
                    <!-- Breadcrumb -->
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center">
                                <a href="#" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                    </path>
                                    </svg>  
                                    Quản lí chủ nhà
                                </a>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px]">
                    <div class="flex space-x-[40px]">
                        <div class="w-[300px] h-[300px] overflow-hidden bg-slate-50 shadow p-4 rounded">
                            <img class="w-full h-full object-cover" src="${not empty requestScope.landlord.account.avatar ? requestScope.landlord.account.avatar : "../assets/images/user-avatars/no_ava.jpg"}">
                        </div>
                        <div class="grid grid-cols-6 gap-[8px] w-1/3">
                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Tên đầy đủ</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    ${requestScope.landlord.fullname}
                                </p>
                            </div>
                            <div class="col-span-4 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Tên tài khoản</p>
                                <p class="text-[18px] text-slate-700 font-bold">${requestScope.landlord.account.username}</p>
                            </div>

                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Ngày tạo</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    ${requestScope.landlord.account.registrationDate}
                                </p>
                            </div>
                            <div class="col-span-4 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Email</p>
                                <p class="text-[18px] text-slate-700 font-bold"> ${requestScope.landlord.account.email}</p>
                            </div>

                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Số điện thoại</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    ${requestScope.landlord.phone}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px] h-[780px] ">
                    <div class="text-[20px] font-bold text-[#288D87] pb-[20px]">Danh sách nhà trọ</div>
                    <table id = "landlord-detail-hostel-table" class="w-full text-[16px] text-left text-gray-600 border-[1px] border-gray-100 relative">
                        <thead class="text-center text-[15px] text-slate-700 uppercase bg-slate-50">
                            <tr>
                                <th scope="col" class="text-center px-6 py-3">ID Nhà trọ</th>
                                <th scope="col" class="text-center px-6 py-3">Tên nhà trọ</th>
                                <th scope="col" class="text-center px-6 py-3"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.hostelList}" var = "hostel">
                                <tr class="bg-white border-b hover:bg-gray-50 text-[16px] ">
                                    <th scope="row" class="text-center px-6 py-4 font-medium text-gray-900">${hostel.hostelID}</th>
                                    <td class="text-center px-6 py-4">${hostel.hostelName}</td>
                                    <td class="text-center px-6 py-4">
                                        <form action = "/sakura/admin/hostel-detail" method = "post">
                                            <button name = "hostelID" value = "${hostel.hostelID}" type = "submit"
                                                    class="rounded py-[3px] px-[10px] text-[15px] text-[#fff] flex items-center bg-[#278d87] hover:bg-[#1e7570]">
                                                <i class="bi bi-box-arrow-up-right mr-[5px]"></i>Xem chi tiết
                                            </button>
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

                $('#landlord-detail-hostel-table').DataTable({
                    dom: 'fprtiB',

                    language: {
                        "emptyTable": "Không có dữ liệu!",
                        "zeroRecords": "Không có kết quả phù hợp!",
                        "infoEmpty": "Hiển thị 0 kết quả",
                        "info": "Hiển thị <b>_START_ - _END_</b> của <b>_TOTAL_</b> kết quả",
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
                        },
                        {
                            extend: 'pdfHtml5',
                            text: 'Xuất file PDF <i class="bi bi-filetype-pdf text-[20px]"></i>',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4]
                            }
                        },
                        {
                            extend: 'print',
                            text: 'In <i class="bi bi-printer text-[20px]"></i>',
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
