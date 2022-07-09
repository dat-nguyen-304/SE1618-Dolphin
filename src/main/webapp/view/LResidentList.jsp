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
        <title>Trang chủ nhà - Loại phòng</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
              rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>


        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

        <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/js/splide.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/css/splide.min.css">

        <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/LRoomType.css">
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
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Loại phòng</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <c:if test="${sessionScope.hostelList == null}">
                    Bạn chưa có nhà trọ nào.
                    <a href="/sakura/landlord/overview">Quay về trang thêm thông tin nhà trọ</a>
                </c:if>
                <c:if test="${sessionScope.hostelList != null}">
                    <!--Modal select hostel-->
                    <div id="hostelModal" tabindex="-1" aria-hidden="true"
                         class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
                            <div class="relative bg-white rounded shadow">
                                <div class="flex justify-between items-start p-4 rounded-t border-b">
                                    <h3 class="text-xl font-semibold text-gray-900">Chọn nhà trọ</h3>
                                    <button type="button"
                                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded w-[250px] text-[18px] p-[10px].5 ml-auto inline-flex items-center"
                                            data-modal-toggle="hostelModal">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </div>
                                <div class="p-6 space-y-6">
                                    <c:forEach items="${sessionScope.hostelList}" var="hostel">
                                        <form action="/sakura/landlord/resident" class="inline-block">
                                            <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-4 py-2 mx-2 rounded border-2">${hostel.hostelName}</button>
                                        </form>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End modal select hostel-->

                    <!--Modal select room-->
                    <div id="roomModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
                            <div class="relative bg-white rounded shadow">
                                <div class="flex justify-between items-start p-4 rounded-t border-b">
                                    <h3 class="text-xl font-semibold text-gray-900">Chọn phòng</h3>
                                    <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded w-[250px] text-[18px] p-[10px].5 ml-auto inline-flex items-center"
                                            data-modal-toggle="roomModal">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </div>

                                <div class="p-6 space-y-6">
                                    <form action="/sakura/landlord/resident" class="inline-block">
                                        <button type="submit" name="" value="" class="px-4 py-2 mx-2 rounded border-2">Tất cả</button>
                                    </form>
                                    <c:forEach items="${requestScope.roomList}" var="room">
                                        <form action="/sakura/landlord/resident" class="inline-block">
                                            <button type="submit" name="roomID" value="${room.roomID}" class="px-4 py-2 mx-2 rounded border-2">${room.roomNumber}</button>
                                        </form>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End modal select room-->
                    <div class="mt-[20px] flex">
                        <div class="flex items-center mr-[20px] pr-[20px] border-r border-gray-300">
                            <span>Chọn nhà trọ: </span>
                            <button class="ml-[10px] inline-block rounded w-fit h-fit py-[5px] px-[20px] bg-[#17535B] hover:bg-[#13484F] flex flex justify-between items-center" type="button" data-modal-toggle="hostelModal">
                                <p class="font-medium text-[16px] text-[#fff]">${sessionScope.currentHostel.hostelName}</p>
                            </button>
                        </div>

                        <div class="mr-[20px] flex items-center">    
                            <span>Chọn phòng: </span>
                            <button class="ml-[10px] inline-block rounded w-fit h-fit py-[5px] px-[20px] bg-[#288D87] hover:bg-[#248781] flex flex justify-between items-center" type="button" data-modal-toggle="roomModal">
                                <c:if test="${requestScope.currentRoom == null}">
                                <p class="font-medium text-[16px] text-[#fff]">Tất cả</p>
                                </c:if>
                                <c:if test="${requestScope.currentRoom != null}">
                                    <p class="font-medium text-[16px] text-[#fff]">${requestScope.currentRoom.roomNumber}</p>
                                </c:if>
                            </button>
                        </div>
                    </div>
                </c:if>
            </div>

            <div class="statistic flex justify-between mt-[20px] w-full">
                <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                    <table id="invoice-table" class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                        <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                            <tr>
                                <th scope="col" class="px-6 py-3">Mã</th>
                                <th scope="col" class="px-6 py-3">Phòng</th>
                                <th scope="col" class="px-6 py-3">Tên</th>
                                <th scope="col" class="px-6 py-3">SÐT</th>
                                <th scope="col" class="px-6 py-3">Ngày sinh</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${requestScope.residentList.size() != 0}">
                                    <c:forEach items="${requestScope.residentList}" var="resident">
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                <a href="#" class="hover:text-[#288D87] hover:underline">${resident.roomResidentID}</a>
                                            </th>
                                            <td class="px-6 py-4">${resident.room.roomNumber}</td>
                                            <td class="px-6 py-4">${resident.fullname}</td>
                                            <td class="px-6 py-4 date">${resident.phone}</td>
                                            <td class="px-6 py-4 date">${resident.dob}</td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td><p style="color: red;">Không có người ở</p></td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>

                </div>
            </div>

            <%@include file="footerDashboard.jsp" %>
        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script>
            function showToast(type, msg) {
                toastr.options.positionClass = 'toast-bottom-right';
                toastr.options.extendedTimeOut = 0; //1000;
                toastr.options.timeOut = 3000;
                toastr.options.hideDuration = 250;
                toastr.options.showDuration = 250;
                toastr.options.hideMethod = 'slideUp';
                toastr.options.showMethod = 'slideDown';
                toastr.options.preventDuplicates = true;
                toastr.options.closeButton = true;
                toastr.options.progressBar = true;
                toastr[type](msg);
            }
        </script>
    </body>

</html>