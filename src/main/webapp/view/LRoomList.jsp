<%-- 
    Document   : LRoomList
    Created on : Jun 23, 2022, 12:30:58 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Danh sách phòng</title>
        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" type="text/css" href="../assets/datatables/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/datatables/buttons.dataTables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <link rel="stylesheet" href="../assets/css/LRoomList.css">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />
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
                            <a href="#" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Phòng trọ
                            </a>
                        </li>
                        <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Danh sách phòng</span>
                            </div>
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

                    <div class="card bg-[#fff] general-info p-[20px] mt-[20px] h-[calc(100vh-225px)]">
                        <table id="room-list-table" class="w-full text-[15px] text-left text-gray-500 border-[1px] border-gray-100 relative">
                            <thead class="text-center text-[16px] text-gray-700 uppercase bg-gray-100">
                                <tr>
                                    <th scope="col" class="text-center px-6 py-3">Mã phòng</th>
                                    <th scope="col" class="text-center px-6 py-3">Tên phòng</th>
                                    <th scope="col" class="text-center px-6 py-3">Loại phòng</th>
                                    <th scope="col" class="text-center px-6 py-3">Trạng thái</th>
                                    <th scope="col" class="text-center px-6 py-3">Số người hiện tại</th>
                                    <!--<th scope="col" class="text-center px-6 py-3">Hóa đơn gần nhất</th>-->
                                    <th scope="col" class="text-center px-6 py-3"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.roomList}" var="room">
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="text-center px-6 py-[5px] font-medium text-gray-900">${room.roomID}</th>
                                        <td class="text-center px-6 py-[5px]">${room.roomNumber}</td>
                                        <td class="text-center px-6 py-[5px]">${room.roomType.roomTypeName}</td>
                                        <td class="text-center px-6 py-[5px]">
                                            <c:if test="${room.status == 0}">
                                                <p class="bg-slate-100 text-slate-600 font-medium w-[100px] py-[3px] mx-auto rounded">Còn trống</p>
                                            </c:if>
                                            <c:if test="${room.status == 1}">
                                                <p class="bg-sky-100 text-sky-600 font-medium w-[100px] py-[3px] mx-auto rounded">Có người ở</p>
                                            </c:if>
                                        </td>
                                        <td class="text-center px-6 py-[5px]">
                                            <c:if test="${room.status == 0}">
                                                0
                                            </c:if>
                                            <c:if test="${room.status == 1 && room.currentNumberOfResidents == 0}">
                                                Chưa cập nhật
                                            </c:if>
                                            <c:if test="${room.status == 1 && room.currentNumberOfResidents != 0}">
                                                ${room.currentNumberOfResidents}
                                            </c:if>
                                        </td>
                                        <td class="text-center px-6 py-[5px] text-right">
                                            <form action="/sakura/landlord/room-detail" method="post">
                                                <input type="hidden" name="roomId" value="${room.roomID}"/>
                                                <button class="rounded py-[3px] px-[10px] text-[13px] text-[#fff] flex items-center bg-[#278d87] hover:bg-[#1e7570]">
                                                    <i class="bi bi-box-arrow-up-right mr-[5px]"></i>Xem chi tiết
                                                </button>
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

        <script>
            $(document).ready(function () {
                $('#room-list-table').DataTable({
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
