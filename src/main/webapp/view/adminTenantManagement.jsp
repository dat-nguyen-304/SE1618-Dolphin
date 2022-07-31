<%-- 
    Document   : adminTenantManagement
    Created on : Jul 3, 2022, 9:46:08 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Quản lý người thuê</title>
        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <link rel="stylesheet" href="../assets/css/admin-tenant-magement.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
        <link rel="stylesheet" href="../assets/css/datatables.css">
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
                                <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                    </path>
                                    </svg>  
                                    Quản lí người thuê
                                </p>
                            </li>
                        </ol>
                    </nav>
                </div>

                <div class="card bg-[#fff] p-[20px] mt-[20px] h-[calc(100vh-220px)]">
                    <table id="tenant-table" class="w-full text-[16px] text-left text-gray-600 border-[1px] border-gray-100 relative">
                        <thead class="text-center text-[15px] text-slate-700 uppercase bg-slate-50">
                            <tr>
                                <th scope="col" class="text-center px-6 py-[10px]">ID người dùng</th>
                                <th scope="col" class="text-center px-6 py-[10px]">Tên đăng nhập</th>
                                <th scope="col" class="text-center px-6 py-[10px]">Email</th>
                                <th scope="col" class="text-center px-6 py-[10px]">Số điện thoại</th>
                                <th scope="col" class="text-center px-6 py-[10px]">Ngày đăng kí</th>
                                <th scope="col" class="text-left px-6 py-[10px]">Trạng thái</th>
                                <th scope="col" class="text-center px-6 py-[10px]"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items = "${requestScope.tenantList}" var = "tenant">
                                <tr class="bg-white border-b hover:bg-gray-50">
                                    <td scope="row" class="text-left px-6 py-[5px] font-medium text-gray-900">${tenant.account.accountID}</td>
                                    <td class="text-left px-6 py-[5px]">${tenant.account.username}</td>
                                    <td class="text-left px-6 py-[5px]">${tenant.account.email}</td>
                                    <td class="text-left px-6 py-[5px]">${tenant.phone}</td>
                                    <td class="text-left px-6 py-[5px]">${tenant.account.registrationDate}</td>
                                    <td class="text-left px-6 py-[5px]">
                                        <c:if test="${tenant.account.activate == false}">
                                            <p class="text-slate-600 font-medium mx-auto text-center"> 
                                                <span class="text-slate-300"><i class="bi bi-circle-fill text-[13px] mr-[5px]"></i></span>Khóa
                                            </p>
                                        </c:if>
                                        <c:if test="${tenant.account.activate == true}">
                                            <p class="text-slate-600 font-medium mx-auto text-center"> 
                                                <span class="text-emerald-500"><i class="bi bi-circle-fill text-[13px] mr-[5px]"></i></span>Hoạt động
                                            </p>
                                        </c:if>
                                    </td>

                                    <td class="text-left px-6 py-[5px] flex items-center justify-around">
                                        <form method = "post" action = "/sakura/admin/accountStatus">
                                            <input type ="hidden" name ="accountID" value ="${tenant.account.accountID}"/>
                                            <c:if test="${tenant.account.activate == false}">
                                                <button type = "submit" value="activate" name = "query" class="w-[120px] text-center bg-[#ebf0fa] hover:bg-[#e8f0ff] text-[#0448c7] font-medium py-[3px] rounded">
                                                    Kích hoạt
                                                </button>
                                            </c:if>
                                            <c:if test="${tenant.account.activate == true}">
                                                <button type = "submit" value="deactivate" name = "query" class="w-[120px] text-center bg-[#ffdbdb] hover:bg-[#fcd2d2] text-[#db0000] font-medium py-[3px] rounded">
                                                    Khóa
                                                </button>
                                            </c:if>
                                        </form>
                                        <form action="/sakura/admin/tenant-detail">
                                            <button name="accountID" value="${tenant.account.accountID}" class="w-[120px] text-center bg-[#fff] border border-gray-300 hover:border-[#17535B] text-gray-500 py-[3px] font-medium rounded"><i class="bi bi-box-arrow-up-right mr-[5px] translate-y-[-5px]"></i>Chi tiết</button>
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
    </body>
    <script>
        $(document).ready(function () {
            $('#tenant-table').DataTable({
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
</html>
