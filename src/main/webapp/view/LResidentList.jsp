<%-- 
    Document   : LRoomType
    Created on : Jun 23, 2022, 12:33:26 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Cư dân</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/LRoomType.css">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />

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

        <link href="../assets/css/datatables.css" rel="stylesheet" />
    </head>

    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">
            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] ">
                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <a href="#" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Cư dân
                            </a>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <c:if test="${sessionScope.hostelList == null}">
                    Bạn chưa có nhà trọ nào.
                    <a href="/sakura/landlord/overview">Quay về trang thêm thông tin nhà trọ</a>
                </c:if>
                <c:if test="${sessionScope.hostelList != null}">


                    <%@include file="../view/modalLandlordResidentList.jsp" %>
                    <div class="mt-[20px] flex">
                        <div class="flex items-center mr-[20px] pr-[20px] border-r border-gray-300">
                            <span>Chọn nhà trọ: </span>
                            <button class="ml-[10px] inline-block rounded w-fit h-fit py-[5px] px-[20px] bg-[#17535B] hover:bg-[#13484F] flex flex justify-between items-center" type="button" data-modal-toggle="hostelModal">
                                <p class="font-medium text-[16px] text-[#fff]">${sessionScope.currentHostel.hostelName}</p>
                            </button>
                        </div>
                    </div>
                </c:if>

                <div class="statistic flex justify-between mt-[20px] w-full">
                    <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                        <c:if test="${requestScope.residentList.size() != 0}">
                            <table id="resident-table" class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                                <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                    <tr>
                                        <th scope="col" class="px-6 py-3">Mã cư dân</th>
                                        <th scope="col" class="px-6 py-3">Phòng</th>
                                        <th scope="col" class="px-6 py-3">Họ và tên</th>
                                        <th scope="col" class="px-6 py-3">SÐT</th>  
                                        <th scope="col" class="px-6 py-3">Ngày sinh</th>
                                        <th scope="col" class="px-6 py-3"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.residentList}" var="resident">
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <td class="px-6 py-4">${resident.roomResidentID}</td>
                                            <td class="px-6 py-4">${resident.room.roomNumber}</td>
                                            <td class="px-6 py-4">${resident.fullname}</td>
                                            <td class="px-6 py-4 date">${resident.phone}</td>
                                            <td class="px-6 py-4 date">${resident.dob}</td>
                                            <td class="px-6 py-4">
                                                <form action="/sakura/landlord/room-detail" method="post">
                                                    <button type="submit" name="roomId" value="${resident.room.roomID}">Xem tại chi tiết phòng</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${requestScope.residentList == null || requestScope.residentList.size() == 0}">
                            <h1>Không có dữ liệu</h1>
                        </c:if>
                    </div>
                </div>

            </div>
            <%@include file="footerDashboard.jsp" %>
        </div>
        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>

        <script>
            function searchRoomOnModal() {
                const hostelId = ${sessionScope.currentHostel.hostelID};
                const keyword = document.querySelector('input[name="searchRoom"]').value;
                jQuery.ajax({
                    type: 'POST',
                    data: {'hostelId': hostelId,
                        'keyword': keyword
                    },
                    url: '/sakura/room/search-room-on-modal',
                    success: function (response) {
                        const roomListModal = document.querySelector(".room-list-modal");
                        roomListModal.innerHTML = response;
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }
        </script>
        <script>
            $(document).ready(function () {
                $('#resident-table').DataTable({
                    dom: 'Bfrtip',
                    
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