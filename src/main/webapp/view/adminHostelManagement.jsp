<%-- 
    Document   : adminHostelManagement
    Created on : Jul 3, 2022, 10:51:05 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Quản lý người thuê</title>

        <!--Favicon-->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">

        <!--CSS-->
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/admin-page.css">

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
                                <a href="#"
                                   class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
                                         xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                    </path>
                                    </svg>
                                    Trang quản lí nhà trọ
                                </a>
                            </li>

                        </ol>
                    </nav>
                </div>
            </div>
            <div>
                <table id="hostel-table" class="w-full text-sm text-left text-gray-500">
                    <thead>
                        <tr class="text-center text-xs text-gray-700 uppercase bg-gray-50">
                            <th scope="col" class="text-center px-6 py-3">ID Nhà trọ</th>
                            <th scope="col" class="text-center px-6 py-3">Tên nhà trọ</th>
                            <th scope="col" class="text-center px-6 py-3">Quận/huyện</th>
                            <th scope="col" class="text-center px-6 py-3">Tỉnh/thành phố</th>
                            <th scope="col" class="text-center px-6 py-3">Ngày đăng kí</th>
                            <th scope="col" class="text-center px-6 py-3">Trạng thái</th>
                            <th scope="col" class="text-center px-6 py-3">Mở/khóa nhà trọ</th>
                            <th scope="col" class="text-center px-6 py-3"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items = "${requestScope.hostelList}" var = "hostel">
                            <tr class="bg-white border-b">
                                <td scope="row"
                                    class="text-left px-6 py-4 font-medium text-gray-900">
                                    ${hostel.hostelID}
                                </td>
                                <td class="text-left px-6 py-4">
                                    ${hostel.hostelName}
                                </td>
                                <td class="text-left px-6 py-4">
                                    ${hostel.district.districtName}
                                </td>
                                <td class="text-left px-6 py-4">
                                    ${hostel.district.province.provinceName}
                                </td>
                                <td class="text-left px-6 py-4">
                                    ${hostel.registeredDate}
                                </td>
                                <td class="text-left px-6 py-4">
                                    <c:if test="${hostel.activate == false}">Khóa</c:if>
                                    <c:if test="${hostel.activate == true}">Mở</c:if>
                                    </td>

                                    <td class="text-left px-6 py-4">
                                        <form method = "post" action = "/sakura/admin/hostelStatus">
                                            <input type ="hidden" name ="hostelID" value ="${hostel.hostelID}"/>
                                        <c:if test="${hostel.activate == false}">
                                            <button type = "submit" value="activate" name = "query" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                                                Mở nhà trọ</button>
                                            </c:if>
                                            <c:if test="${hostel.activate == true}">
                                            <button type = "submit" value="deactivate" name = "query" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                                                Khóa nhà trọ</button>
                                            </c:if>
                                    </form>
                                </td>
                                <td class="text-left px-6 py-4 text-center">
                                    <form action="/sakura/admin/hostel-detail">
                                        <button name="hostelID" value="${hostel.hostelID}"
                                                class="font-medium text-blue-600">Chi tiết</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
    </body>
    <script>
        $(document).ready(function () {

            $('#hostel-table').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'excelHtml5',
                        exportOptions: {
                            columns: [1, 2, 3, 4, 5]
                        }
                    }
                ],
                "pageLength": 8, //so luong item per page
                info: false
            });
        });



    </script>
</html>
