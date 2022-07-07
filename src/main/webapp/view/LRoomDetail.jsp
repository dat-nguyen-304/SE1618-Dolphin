<%-- 
    Document   : LRoomDetail
    Created on : Jun 20, 2022, 8:56:54 PM
    Author     : Admin
--%>

<%@page import="com.dolphin.hostelmanagement.DTO.RoomResident"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang người cho thuê</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="images/logo.png">

        <!-- <link rel="stylesheet" href="app.css"> -->
        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../assets/css/LRoomDetail.css">
        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

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
                            <a href="#"
                               class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Phòng
                            </a>
                        </li>
                        <!-- <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                        clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Danh sách hoá đơn</span>
                            </div>
                        </li> -->
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <!-- General information -->
                <div class="general-info flex justify-between mt-[20px]">
                    <div class="">
                        <span>Chọn nhà trọ: </span>
                        <button
                            class="ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[13484F] font-medium rounded-lg text-sm px-5 py-2.5 text-center "
                            type="button" data-modal-toggle="hostelModal">
                            ${sessionScope.currentHostel.hostelName}
                        </button>

                        <div id="hostelModal" tabindex="-1" aria-hidden="true"
                             class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                            <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                <div class="relative bg-white rounded-lg shadow">

                                    <div
                                        class="flex justify-between items-start p-4 rounded-t border-b">
                                        <h3 class="text-xl font-semibold text-gray-900">
                                            Chọn nhà trọ
                                        </h3>
                                        <button type="button"
                                                class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center"
                                                data-modal-toggle="hostelModal">
                                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                  clip-rule="evenodd"></path>
                                            </svg>
                                        </button>
                                    </div>

                                    <div class="p-6 space-y-6">
                                        <c:forEach items="${sessionScope.hostelList}" var="hostel">
                                            <form action="/sakura/landlord/room-detail" class="inline-block">
                                                <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-4 py-2 mx-2 rounded border-2">${hostel.hostelName}</button>
                                            </form>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="mt-[20px]">
                    <div class="">
                        <span>Chọn phòng: </span>
                        <button
                            class="ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[13484F] font-medium rounded-lg text-sm px-5 py-2.5 text-center "
                            type="button" data-modal-toggle="roomModal">
                            ${requestScope.currentRoom.roomNumber}
                        </button>

                        <div id="roomModal" tabindex="-1" aria-hidden="true"
                             class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                            <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                <div class="relative bg-white rounded-lg shadow">

                                    <div
                                        class="flex justify-between items-start p-4 rounded-t border-b">
                                        <h3 class="text-xl font-semibold text-gray-900">
                                            Chọn Phòng
                                        </h3>
                                        <button type="button"
                                                class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center"
                                                data-modal-toggle="roomModal">
                                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                  clip-rule="evenodd"></path>
                                            </svg>
                                        </button>
                                    </div>

                                    <div class="p-6 space-y-6">
                                        <c:forEach items="${requestScope.roomList}" var="room">
                                            <form action="/sakura/landlord/room-detail" class="inline-block px-4 py-2 mx-2 rounded border-2">
                                                <button type="submit" name="roomId" value="${room.roomID}" class="w-full">${room.roomNumber}</button>
                                            </form>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form action="/sakura/landlord/invoice-list" class="inline-block bg-gray-100 py-2 px-4 ml-[24px]">
                            <button type="submit" name="roomId" value="${requestScope.currentRoom.roomID}" class="w-full">Xem hóa đơn</button>
                        </form>
                    </div>
                    <div class="grid grid-cols-12 gap-x-8">
                        <div class="col-span-5 border-4 p-4 border-2 rounded mt-[24px]">
                            <div id="default-carousel" class="relative" data-carousel="static">
                                <div class="overflow-hidden relative h-56 rounded-lg sm:h-64 xl:h-80 2xl:h-96">
                                    Item 1 
                                    <div class="hidden duration-700 ease-in-out" data-carousel-item>
                                        <span
                                            class="absolute top-1/2 left-1/2 text-2xl font-semibold text-white -translate-x-1/2 -translate-y-1/2 sm:text-3xl">First
                                            Slide</span>
                                        <img class="h-full w-full object-cover"
                                             src="https://news.mogi.vn/wp-content/uploads/2020/03/tim-phong-tro.jpg"
                                             class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2"
                                             alt="...">
                                    </div>
                                    Item 2 
                                    <div class="hidden duration-700 ease-in-out" data-carousel-item>
                                        <img class="h-full w-full object-cover"
                                             src="https://timtro.vn/images/2021/08/tim-tro.jpg"
                                             class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2"
                                             alt="...">
                                    </div>
                                    Item 3 
                                    <div class="hidden duration-700 ease-in-out" data-carousel-item>
                                        <img class="h-full w-full object-cover"
                                             src="https://pt123.cdn.static123.com/images/2021/02/22/cho-thue-phong-tro_1613975723.jpg"
                                             class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2"
                                             alt="...">
                                    </div>
                                </div>
                                <div class="flex absolute bottom-5 left-1/2 z-30 space-x-3 -translate-x-1/2">
                                    <button type="button" class="w-3 h-3 rounded-full" aria-current="false"
                                            aria-label="Slide 1" data-carousel-slide-to="0"></button>
                                    <button type="button" class="w-3 h-3 rounded-full" aria-current="false"
                                            aria-label="Slide 2" data-carousel-slide-to="1"></button>
                                    <button type="button" class="w-3 h-3 rounded-full" aria-current="false"
                                            aria-label="Slide 3" data-carousel-slide-to="2"></button>
                                </div>
                                <button type="button"
                                        class="flex absolute top-0 left-0 z-30 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none"
                                        data-carousel-prev>
                                    <span
                                        class="inline-flex justify-center items-center w-8 h-8 rounded-full sm:w-10 sm:h-10 bg-white/30 group-hover:bg-white/50  group-focus:ring-4 group-focus:ring-white group-focus:outline-none">
                                        <svg class="w-5 h-5 text-white sm:w-6 sm:h-6" fill="none"
                                             stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M15 19l-7-7 7-7"></path>
                                        </svg>
                                        <span class="hidden">Previous</span>
                                    </span>
                                </button>
                                <button type="button"
                                        class="flex absolute top-0 right-0 z-30 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none"
                                        data-carousel-next>
                                    <span
                                        class="inline-flex justify-center items-center w-8 h-8 rounded-full sm:w-10 sm:h-10 bg-white/30  group-hover:bg-white/50  group-focus:ring-4 group-focus:ring-white  group-focus:outline-none">
                                        <svg class="w-5 h-5 text-white sm:w-6 sm:h-6 " fill="none"
                                             stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M9 5l7 7-7 7"></path>
                                        </svg>
                                        <span class="hidden">Next</span>
                                    </span>
                                </button>
                            </div>
                            <p class="mt-[24px]">Hợp đồng gần nhất: </p>
                            <div class="images border-2 p-2 rounded mt-[12px] grid grid-cols-4 gap-4">
                                <div class="col-span-2">Hợp đồng ID: ${requestScope.contract.contractID}</div>
                                <div class="col-span-1 text-xs italic text-right">Ngày tạo: ${requestScope.contract.createdDate}</div>
                                <form action="/sakura/landlord/contract-detail" class="inline-block col-span-1 text-xs text-center italic border-2 rounded italic decoration-rose-900">
                                    <button type="submit" name="contractId" value="${requestScope.contract.contractID}" class="w-full">Xem hóa đơn</button>
                                </form>
                                <div class="col-span-2 text-xs">Thời hạn: ${requestScope.contract.startDate} - ${requestScope.contract.endDate}</div>
                                <div class="col-span-2 text-xs italic text-right">
                                    <c:if test="${requestScope.contract.status == 0}">
                                        Trạng thái: Đã kết thúc
                                    </c:if>
                                    <c:if test="${requestScope.contract.status == 1}">
                                        Trạng thái: Còn hiệu lực
                                    </c:if>
                                </div>
                                <div class="col-span-4 text-xs">Người cho thuê: ${requestScope.contract.tenant.fullname}</div>
                                <div class="col-span-4 text-xs">Người thuê: ${requestScope.contract.landlord.fullname}</div>
                                <div class="col-span-2 text-xs">Tiền đặt cọc: <span class="money">${requestScope.contract.deposit}</span></div>
                                <div class="col-span-2 text-xs">Giá hằng tháng: <span class="money">${requestScope.contract.rentalFeePerMonth}</span></div>
                                <div class="col-span-4 text-xs">Nội dung: ${requestScope.contract.description}
                                </div>
                                <button class="col-span-4 text-right">Đã xác nhận</button>
                            </div>
                            <form action="/sakura/contract-list" class="mt-2 inline-block px-4 py-2 border-2 rounded">
                                <button type="submit" name="roomId" value="${requestScope.currentRoom.roomID}" class="w-full">Xem lịch hợp đồng của phòng này</button>
                            </form>
                        </div>

                        <div class="col-span-7 border-4 p-4 border-2 rounded mt-[24px]">
                            <div class="grid grid-cols-2 gap-8">
                                <div class="shadow-lg rounded text-center p-2 bg-red-300">Loại Phòng: ${requestScope.currentRoom.roomType.roomTypeName}
                                </div>
                                <div class="grid grid-cols-2 gap-8">
                                    <!-- ---------------------------------------------------------------------------------- -->
                                    <div class="bg-[#f7f7fa]">
                                        <div class="bg-[#fff] rounded shadow">
                                            <!-- Modal toggle -->
                                            <button id="updateRoom-1" type="submit" name="action" value="Save"
                                                    class="w-[120px] h-[45px] bg-[#17535B] text-[#f6fafc] rounded">
                                                Chỉnh sửa thông tin phòng 
                                            </button>

                                            <!--Modal-->
                                            <div
                                                class="updateRoommodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                                <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                                <div
                                                    class="modal-container bg-white w-5/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                                    <div
                                                        class="updateRoommodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
                                                        <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                                             viewBox="0 0 18 18">
                                                        <path
                                                            d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                        </path>
                                                        </svg>
                                                        <span class="text-sm">(Esc)</span>
                                                    </div>
                                                    <div class="modal-content">
                                                        <!--Title-->
                                                        <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                                                            <p class="text-2xl font-bold">Chỉnh sửa loại phòng ${requestScope.currentRoom.roomNumber}</p>
                                                            <div
                                                                class="updateRoommodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                                                                <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18"
                                                                     height="18" viewBox="0 0 18 18">
                                                                <path
                                                                    d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                                </path>
                                                                </svg>
                                                            </div>
                                                        </div>
                                                        <!--Body-->
                                                        <div class="p-4">
                                                            <div class="my-2">
                                                                <label class="w-[160px] inline-block" for="">Loại phòng</label>
                                                                <select name="updateRoomType" id="" class="w-[180px] p-1">
                                                                    <c:forEach items="${requestScope.roomTypeList}" var="roomtype">
                                                                        <c:if test="${requestScope.currentRoom.roomType.roomTypeID == roomtype.roomTypeID}">
                                                                            <option selected value="${roomtype.roomTypeID}">${roomtype.roomTypeName}</option>
                                                                        </c:if>
                                                                        <c:if test="${requestScope.currentRoom.roomType.roomTypeID != roomtype.roomTypeID}">
                                                                            <option value="${roomtype.roomTypeID}">${roomtype.roomTypeName}</option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="my-2">
                                                                <input type="hidden" name="hostelId" value="${sessionScope.currentHostel.hostelID}"/>
                                                                <input type="hidden" name="roomId" value="${requestScope.currentRoom.roomID}"/>
                                                                <input type="hidden" name="roomNumber" value="${requestScope.currentRoom.roomNumber}"/>
                                                                <p class="text-xs validRoomMessage"></p>
                                                                <label class="w-[160px] inline-block" for="">Tên phòng</label>
                                                                <input type="text" name="updateRoomNumber" value="${requestScope.currentRoom.roomNumber}" onkeyup="checkValidRoom(this)" class="text-sm p-1">
                                                                <span class="ml-2 text-xs">VD: 101, 102, 510 ...</span>
                                                            </div>
                                                        </div>

                                                        <!--Footer-->
                                                        <div class="flex justify-end p-[20px]">
                                                            <button
                                                                class="updateRoommodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                                                            <button id="updateRoom-2" onclick="updateRoom()"
                                                                    class="updateRoom px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu thay đổi</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--Modal 2-->
                                            <div
                                                class="updateRoommodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                                <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                                <div
                                                    class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                                    <div
                                                        class="updateRoommodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
                                                        <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                                             viewBox="0 0 18 18">
                                                        <path
                                                            d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                        </path>
                                                        </svg>
                                                        <span class="text-sm">(Esc)</span>
                                                    </div>
                                                    <div class="modal-content">
                                                        <!--Title-->
                                                        <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                                                            <p class="text-2xl font-bold">Xác nhận</p>
                                                            <div
                                                                class="updateRoommodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                                                                <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18"
                                                                     height="18" viewBox="0 0 18 18">
                                                                <path
                                                                    d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                                </path>
                                                                </svg>
                                                            </div>
                                                        </div>
                                                        <!--Body-->
                                                        <div class="p-[20px]">
                                                            <p class="updateRoomMessage"></p>
                                                        </div>
                                                        <!--Footer-->
                                                        <div class="flex justify-end p-[20px]">
                                                            <button
                                                                class="updateRoommodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>

                                                            <form action="/sakura/landlord/room-detail">
                                                                <input type="hidden" name="roomId" value="${requestScope.currentRoom.roomID}"/>
                                                                <button type="submit"
                                                                        class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ---------------------------------------------------------------------------------- -->

                                    <!-- ---------------------------------------------------------------------------------- -->
                                    <div class="bg-[#f7f7fa]">
                                        <div class="bg-[#fff] rounded shadow">
                                            <!-- Modal toggle -->
                                            <button id="deleteRoom-1" type="submit" name="action" value="Save"
                                                    class="w-[120px] h-[45px] bg-[#17535B] text-[#f6fafc] rounded">
                                                Xóa phòng 
                                            </button>

                                            <!--Modal-->
                                            <div
                                                class="deleteRoommodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                                <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                                <div
                                                    class="modal-container bg-white w-5/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                                    <div
                                                        class="deleteRoommodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
                                                        <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                                             viewBox="0 0 18 18">
                                                        <path
                                                            d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                        </path>
                                                        </svg>
                                                        <span class="text-sm">(Esc)</span>
                                                    </div>
                                                    <div class="modal-content">
                                                        <!--Title-->
                                                        <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                                                            <p class="text-2xl font-bold">Xóa phòng ${requestScope.currentRoom.roomNumber}</p>
                                                            <div
                                                                class="deleteRoommodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                                                                <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18"
                                                                     height="18" viewBox="0 0 18 18">
                                                                <path
                                                                    d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                                </path>
                                                                </svg>
                                                            </div>
                                                        </div>
                                                        <!--Body-->
                                                        <div class="p-4">
                                                            <svg class="mx-auto mb-4 w-14 h-14 text-gray-400 dark:text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                                            <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Tất cả dữ liệu về hợp đồng, hóa đơn liên quan đến phòng ${requestScope.currentRoom.roomNumber} sẽ bị xóa. <p>Bạn có chắc chắn muốn xóa?</p></h3>
                                                        </div>

                                                        <!--Footer-->
                                                        <div class="flex justify-end p-[20px]">
                                                            <button
                                                                class="deleteRoommodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                                                            <button id="deleteRoom-2" onclick="deleteRoom()"
                                                                    class="deleteRoom px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Tôi chắc chắn</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--Modal 2-->
                                            <div
                                                class="deleteRoommodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                                <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                                <div
                                                    class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                                    <div
                                                        class="deleteRoommodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
                                                        <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                                             viewBox="0 0 18 18">
                                                        <path
                                                            d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                        </path>
                                                        </svg>
                                                        <span class="text-sm">(Esc)</span>
                                                    </div>
                                                    <div class="modal-content">
                                                        <!--Title-->
                                                        <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                                                            <p class="text-2xl font-bold">Xác nhận</p>
                                                            <div
                                                                class="deleteRoommodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                                                                <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18"
                                                                     height="18" viewBox="0 0 18 18">
                                                                <path
                                                                    d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                                </path>
                                                                </svg>
                                                            </div>
                                                        </div>
                                                        <!--Body-->
                                                        <div class="p-[20px]">
                                                            <p class="deleteRoomContent"></p>
                                                        </div>
                                                        <!--Footer-->
                                                        <div class="flex justify-end p-[20px]">
                                                            <button
                                                                class="deleteRoommodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>

                                                            <form action="/sakura/landlord/overview">
                                                                <button type="submit"
                                                                        class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ---------------------------------------------------------------------------------- -->
                                </div>
                            </div>
                            <div class="grid grid-cols-3 py-4">
                                <div class="shadow-lg rounded text-center py-2 px-4 bg-red-300 w-fit">Giá thuê: <span class="money">${requestScope.contract.rentalFeePerMonth}</span></div>
                                <div class="shadow-lg rounded text-center py-2 px-4 bg-red-300 w-fit">Diện tích: ${requestScope.currentRoom.roomType.area}m2</div>
                                <div class="shadow-lg rounded text-center py-2 px-4 bg-red-300 w-fit">Số người tối đa: ${requestScope.currentRoom.roomType.maxNumberOfResidents}
                                </div>
                            </div>
                            <div class="border-2 rounded p-4 text-sm">
                                Mô tả: ${requestScope.currentRoom.roomType.description}
                            </div>
                            <div class="mt-5 w-96 shadow-lg rounded text-center p-2 bg-red-300">
                                Số người hiện tại: <span class="residentQuantity">${requestScope.residentList.size()}</span>
                            </div>
                            <!-- ---------------------------------------------------------------------------------- -->
                            <div class="addMemberElement">
                                <c:if test="${requestScope.residentList.size() < requestScope.currentRoom.roomType.maxNumberOfResidents}">
                                    <div class="actBtn bg-[#f7f7fa]">
                                        <div class="bg-[#fff] rounded shadow">
                                            <!-- Modal toggle -->
                                            <button id="addMember-1" type="submit" name="action" value="Save"
                                                    class="w-[120px] h-[45px] bg-[#17535B] text-[#f6fafc] rounded">
                                                Thêm người ở mới
                                            </button>
                                        </div>
                                    </div>
                                    <div class="disBtn hidden">
                                        <button class="inline-block w-[120px] h-[45px] bg-[#ccc] text-[#f6fafc] rounded">
                                            Thêm người ở mới
                                        </button>
                                        <span class="text-xs h-[45px] leading-[45px]">Số người của phòng này đã đạt tối đa</span>
                                    </div>
                                </c:if>

                                <c:if test="${requestScope.residentList.size() >= requestScope.currentRoom.roomType.maxNumberOfResidents}">
                                    <div class="actBtn hidden bg-[#f7f7fa]">
                                        <div class="bg-[#fff] rounded shadow">
                                            <!-- Modal toggle -->
                                            <button id="addMember-1" type="submit" name="action" value="Save"
                                                    class="w-[120px] h-[45px] bg-[#17535B] text-[#f6fafc] rounded">
                                                Thêm người ở mới
                                            </button>
                                        </div>
                                    </div>
                                    <div class="disBtn">
                                        <button class="inline-block w-[120px] h-[45px] bg-[#ccc] text-[#f6fafc] rounded">
                                            Thêm người ở mới
                                        </button>
                                        <span class="text-xs h-[45px] leading-[45px]">Số người của phòng này đã đạt tối đa</span>
                                    </div>
                                </c:if>
                            </div>
                            <!--Modal-->
                            <div
                                class="addMembermodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                <div
                                    class="modal-container bg-white w-5/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                    <div
                                        class="addMembermodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
                                        <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                             viewBox="0 0 18 18">
                                        <path
                                            d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                        </path>
                                        </svg>
                                        <span class="text-sm">(Esc)</span>
                                    </div>
                                    <div class="modal-content">
                                        <!--Title-->
                                        <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                                            <p class="text-2xl font-bold">Thêm người ở mới</p>
                                            <div
                                                class="addMembermodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                                                <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18"
                                                     height="18" viewBox="0 0 18 18">
                                                <path
                                                    d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                </path>
                                                </svg>
                                            </div>
                                        </div>
                                        <!--Body-->
                                        <div class="p-4">
                                            <div class="my-2">
                                                <label class="w-[160px] inline-block" for="">Tên người ở</label>
                                                <input type="text" name="memberName" required class="w-[400px] text-sm p-1">
                                            </div>
                                            <div class="my-2">
                                                <label class="w-[160px] inline-block" for="">Số điện thoại</label>
                                                <input type="text" name="memberPhone" required class="w-[400px] text-sm p-1">
                                                <p class="ml-[200px] text-xs">Số điện thoại gồm 10 chữ số</p>
                                            </div>
                                            <div class="my-2">
                                                <label class="w-[160px] inline-block" for="">Ngày sinh</label>
                                                <input type="date" name="memberDob" required class="w-[400px] text-sm p-1">
                                            </div>
                                        </div>
                                        <!--Footer-->
                                        <div class="flex justify-end p-[20px]">
                                            <button
                                                class="addMembermodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                                            <button id="addMember-2" onclick="addMember()"
                                                    class="addMemberBtn px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Modal 2-->
                            <div
                                class="addMembermodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                <div
                                    class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                    <div
                                        class="addMembermodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
                                        <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                             viewBox="0 0 18 18">
                                        <path
                                            d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                        </path>
                                        </svg>
                                        <span class="text-sm">(Esc)</span>
                                    </div>
                                    <div class="modal-content">
                                        <!--Title-->
                                        <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                                            <p class="text-2xl font-bold">Xác nhận</p>
                                            <div
                                                class="addMembermodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                                                <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18"
                                                     height="18" viewBox="0 0 18 18">
                                                <path
                                                    d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                </path>
                                                </svg>
                                            </div>
                                        </div>
                                        <!--Body-->
                                        <div class="p-[20px]">
                                            <p class="addMemberMessage"></p>
                                        </div>
                                        <!--Footer-->
                                        <div class="flex justify-end p-[20px]">
                                            <button type="button"
                                                    class="addMembermodal2-close px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">OK
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ---------------------------------------------------------------------------------- -->
                            <div class="mt-[20px]">
                                <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                                    <table class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                                        <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                            <tr>
                                                <th scope="col" class="px-3 py-3 text-center">
                                                    Mã số
                                                </th>
                                                <th scope="col" class="px-3 py-3 text-center">
                                                    Tên
                                                </th>
                                                <th scope="col" class="px-3 py-3 text-center">
                                                    SÐT
                                                </th>
                                                <th scope="col" class="px-3 py-3 text-center">
                                                    Ngày sinh
                                                </th>
                                                <th scope="col" class="px-3 py-3 text-center">
                                                    <span class="sr-only">Update</span>
                                                </th>
                                                <th scope="col" class="px-3 py-3 text-center">
                                                    <span class="sr-only">Remove</span>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody class="member-list">
                                        <input type="hidden" name="residentQuantity" value="${requestScope.residentList.size()}"/>

                                        <c:forEach items="${requestScope.residentList}" var="resident">

                                            <tr class="bg-white border-b hover:bg-gray-50">
                                                <td class="px-3 py-4 text-center">
                                                    ${resident.roomResidentID}
                                                </td>
                                                <td class="px-3 py-4 text-center">
                                                    <input name="updateFullName" type="text" class="text-xs" value="${resident.fullname}"/>

                                                </td>
                                                <td class="px-3 py-4 text-center">
                                                    <input name="updatePhone" type="text" class="text-xs" value="${resident.phone}"/>
                                                </td>
                                                <td class="px-3 py-4 text-center">
                                                    <input name="updateDob" type="date" value="${resident.dob}"/>
                                                </td>
                                                <td class="px-3 py-4 text-right text-center">
                                                    <button onclick="updateMember(this)" type="submit" value="${resident.roomResidentID}" class="font-medium text-[#17535B]" data-modal-toggle="updateMemberModal">Lưu thay đổi</button>
                                                </td>
                                                <td class="px-3 py-4 text-right text-center">
                                                    <button onclick="deleteMember(this)" type="submit" value="${resident.roomResidentID}" class="font-medium text-[#17535B]">Xóa</button>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                        <tbody>
                                    </table>
                                    <div id="updateMemberModal" tabindex="-1" aria-hidden="true"
                                         class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                            <div class="relative bg-white rounded shadow">

                                                <div
                                                    class="flex justify-between items-start p-4 rounded-t border-b">
                                                    <h3 class="text-xl font-semibold text-gray-900">
                                                        Lưu thay đổi
                                                    </h3>
                                                    <button type="button"
                                                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center"
                                                            data-modal-toggle="updateMemberModal">
                                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd"
                                                              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                              clip-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                </div>

                                                <div class="updateMemberMessage p-6 space-y-6">

                                                </div>
                                                <div class="flex flex-row-reverse items-center p-6 space-x-2 rounded-b border-t border-gray-200 dark:border-gray-600">
                                                    <button data-modal-toggle="updateMemberModal" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">OK</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!------------------------------------------------ -->

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Footer -->

            <footer class="w-full px-[20px] pb-[20px]">
                <div class="card w-full h-fit bg-[#fff] rounded flex items-center justify-between p-[20px]">
                    <span class="text-sm text-gray-500 sm:text-center">© 2022 <a href="https://flowbite.com"
                                                                                 class="hover:text-[#17535B]">Sakura™</a>. All Rights Reserved.
                    </span>
                    <ul class="flex flex-wrap items-center mt-3 text-sm text-gray-400 sm:mt-0">
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6 ">Về Sakura</a>
                        </li>
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6">Chính sách bảo mật</a>
                        </li>
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6">FAQ</a>
                        </li>
                        <li>
                            <a href="#" class="hover:text-[#17535B]">Liên hệ</a>
                        </li>
                    </ul>
                </div>

            </footer>

            <!-- End footer -->

        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
                                                        function checkValidRoom(element) {
                                                            const hostelId = document.querySelector("input[name='hostelId']");
                                                            const validRoomMessage = document.querySelector(".validRoomMessage");
                                                            const updateRoomBtn = document.querySelector(".updateRoom");
                                                            const roomNumber = document.querySelector("input[name='roomNumber']");
                                                            console.log("current: ", roomNumber.value.trim());
                                                            console.log("new: ", element.value.trim());
                                                            if (roomNumber.value.trim() !== element.value.trim()) {
                                                                jQuery.ajax({
                                                                    type: 'POST',
                                                                    data: {
                                                                        'roomNumber': element.value,
                                                                        'hostelId': hostelId.value
                                                                    },
                                                                    url: '/sakura/landlord/check-room-valid',
                                                                    success: function (response) {
                                                                        validRoomMessage.innerHTML = response;
                                                                        if (response) {
                                                                            updateRoomBtn.onclick = (e) => {
                                                                                e.preventDefault();
                                                                            }
                                                                        } else {
                                                                            updateRoomBtn.onclick = () => updateRoom();
                                                                        }
                                                                    },

                                                                    error: function () {
                                                                    },
                                                                    complete: function (result) {
                                                                    }
                                                                });
                                                            } else {
                                                                validRoomMessage.innerHTML = "";
                                                            }
                                                        }



                                                        function updateRoom() {
                                                            console.log("----- da vao update room ------------");
                                                            const roomId = document.querySelector("input[name='roomId']");
                                                            const updateRoomNumber = document.querySelector("input[name='updateRoomNumber']");
                                                            const updateRoomType = document.querySelector("select[name='updateRoomType']");
                                                            const messageElement = document.querySelector(".updateRoomMessage");
                                                            console.log("roomId ", roomId.value);
                                                            console.log("updateRoomNumber ", updateRoomNumber.value);
                                                            console.log("updateRoomType ", updateRoomType.value);
                                                            jQuery.ajax({
                                                                type: 'GET',
                                                                data: {'roomId': roomId.value,
                                                                    'updateRoomNumber': updateRoomNumber.value,
                                                                    'updateRoomType': updateRoomType.value
                                                                },
                                                                url: '/sakura/landlord/update-room',
                                                                success: function (response) {
                                                                    messageElement.innerHTML = response;
                                                                },
                                                                error: function () {
                                                                },
                                                                complete: function (result) {
                                                                }
                                                            });
                                                        }
        </script>
        <script>
            function deleteRoom(element) {

                const deleteRoomContent = document.querySelector(".deleteRoomContent");
                const deleteRoomId = document.querySelector("input[name='roomId']");
                const deleteRoomBtn = document.querySelector(".deleteRoomBtn");

                jQuery.ajax({
                    type: 'POST',
                    data: {'deleteRoomId': deleteRoomId.value
                    },
                    url: '/sakura/landlord/delete-room',
                    success: function (response) {
                        deleteRoomContent.innerHTML = response;
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }
        </script>

        <script>
            function updateMember(element) {
                console.log("da vao update member");
                const memberElement = element.parentElement.parentElement;
                const residentId = element;
                const updateFullName = memberElement.querySelector("input[name='updateFullName']");
                const updatePhone = memberElement.querySelector("input[name='updatePhone']");
                const updateDob = memberElement.querySelector("input[name='updateDob']");
                const updateMemberMessage = document.querySelector(".updateMemberMessage");
                console.log("updateFullName: ", updateFullName.value);
                console.log("updatePhone: ", updatePhone.value);
                if (!updateFullName.value || !updatePhone.value || !updateDob.value) {
                    let message = "";
                    if (!updateFullName.value) {
                        message += "Tên người ở - ";
                    }
                    if (!updatePhone.value) {
                        message += "SÐT - ";
                    }
                    if (!updateDob.value) {
                        message += "Ngày sinh ";
                    }
                    message += "không được trống!";
                    updateMemberMessage.innerHTML = message;
                } else {
                    let goAjax = true;
                    let message = "";
                    if (updatePhone.value.length !== 10) {
                        message += "Số điện thoại phải có 10 chữ số";
                        goAjax = false;
                        updateMemberMessage.innerHTML = message;
                    } else
                        for (let i = 0; i < updatePhone.value.length; i++) {
                            if (updatePhone.value.charAt(i) < '0' || updatePhone.value.charAt(i) > '9') {
                                message += "Số điện thoại gồm 10 chữ số!";
                                goAjax = false;
                                updateMemberMessage.innerHTML = message;
                                break;
                            }
                        }
                    if (goAjax === true) {
                        jQuery.ajax({
                            type: 'POST',
                            data: {'residentId': residentId.value,
                                'updateFullName': updateFullName.value,
                                'updatePhone': updatePhone.value,
                                'updateDob': updateDob.value
                            },
                            url: '/sakura/room/update-member',
                            success: function (response) {
                                updateMemberMessage.innerHTML = response;
                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
                    }
                }
            }
        </script>

        <script>
            function deleteMember(element) {
                const memberElement = element.parentElement.parentElement;
                const residentQuantityElement = document.querySelector(".residentQuantity");
                const residentQuantity = Number(residentQuantityElement.innerHTML);
                const residentId = element;
                console.log("Da vao delete member")
                jQuery.ajax({
                    type: 'POST',
                    data: {'residentId': residentId.value
                    },
                    url: '/sakura/room/delete-member',
                    success: function (response) {
                        memberElement.remove();
                        residentQuantityElement.innerHTML = residentQuantity - 1;
                        updateCurrentResident(residentQuantity - 1);
                        if (${requestScope.currentRoom.roomType.maxNumberOfResidents} > residentQuantity - 1) {
                            const actBtn = document.querySelector(".actBtn");
                            const disBtn = document.querySelector(".disBtn");
                            actBtn.style.display = "inline-block";
                            disBtn.style.display = "none";
                        }
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });


            }
        </script>

        <script>
            function addMember() {
                console.log("da vao add member");
                const roomId = document.querySelector("input[name='roomId']");
                const memberName = document.querySelector("input[name='memberName']");
                const memberPhone = document.querySelector("input[name='memberPhone']");
                const memberDob = document.querySelector("input[name='memberDob']");
                const addMemberMessage = document.querySelector(".addMemberMessage");
                const memberList = document.querySelector(".member-list");
                const residentQuantityElement = document.querySelector(".residentQuantity");
                const residentQuantity = Number(residentQuantityElement.innerHTML);

                if (!memberName.value || !memberPhone.value || !memberDob.value) {
                    let message = "";
                    if (!memberName.value) {
                        message += "Tên người ở - ";
                    }
                    if (!memberPhone.value) {
                        message += "SÐT - ";
                    }
                    if (!memberDob.value) {
                        message += "Ngày sinh ";
                    }
                    message += "không được trống!";
                    addMemberMessage.innerHTML = message;
                } else {
                    let goAjax = true;
                    let message = "";
                    if (memberPhone.value.length !== 10) {
                        message += "Số điện thoại phải có 10 chữ số";
                        goAjax = false;
                        addMemberMessage.innerHTML = message;
                    } else
                        for (let i = 0; i < memberPhone.value.length; i++) {
                            if (memberPhone.value.charAt(i) < '0' || memberPhone.value.charAt(i) > '9') {
                                message += "Số điện thoại gồm 10 chữ số!";
                                goAjax = false;
                                addMemberMessage.innerHTML = message;
                                break;
                            }
                        }
                    if (goAjax === true) {
                        jQuery.ajax({
                            type: 'POST',
                            data: {'memberName': memberName.value,
                                'memberPhone': memberPhone.value,
                                'memberDob': memberDob.value,
                                'roomId': roomId.value
                            },
                            url: '/sakura/room/add-member',
                            success: function (response) {
                                memberName.value = "";
                                memberPhone.value = "";
                                memberDob.value = "";
                                const res = response.toString();
                                if (res.includes("px-3 py-4 text-center")) {
                                    memberList.innerHTML += response;
                                    residentQuantityElement.innerHTML = residentQuantity + 1;
                                    addMemberMessage.innerHTML = "Thêm thành công";
                                    if (${requestScope.currentRoom.roomType.maxNumberOfResidents} <= residentQuantity + 1) {
                                        const actBtn = document.querySelector(".actBtn");
                                        const disBtn = document.querySelector(".disBtn");
                                        actBtn.style.display = "none";
                                        disBtn.style.display = "block";
                                    }
                                    updateCurrentResident(residentQuantity + 1);
                                } else {
                                    addMemberMessage.innerHTML = response;
                                }

                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
                    }
                }
            }
        </script>

        <script>
            function updateCurrentResident(quantity) {
                const updateResidentRoomId = document.querySelector("input[name='roomId']");
                jQuery.ajax({
                    type: 'POST',
                    data: {'roomId': updateResidentRoomId.value,
                        'currentResidentQuantity': quantity
                    },
                    url: '/sakura/room/update-current-resident-number',
                    success: function (response) {
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }
        </script>

        <script>
            var open_modal_1 = document.querySelector('#updateRoom-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.updateRoommodal1');
            });

            var open_modal_2 = document.querySelector('#updateRoom-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.updateRoommodal2');
            });

            var close_modal_1 = document.querySelectorAll('.updateRoommodal1 .updateRoommodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.updateRoommodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.updateRoommodal2 .updateRoommodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.updateRoommodal2');
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
                const modal_1 = document.querySelector('.updateRoommodal1');
                const modal_2 = document.querySelector('.updateRoommodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.updateRoommodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.updateRoommodal2');
                }
            };
            function toggleModal(modal_item) {
                const modal = document.querySelector(modal_item);
                modal.classList.toggle('active-modal')
                modal.classList.toggle('opacity-0');
                modal.classList.toggle('pointer-events-none');
            }
        </script>

        <script>
            var open_modal_1 = document.querySelector('#deleteRoom-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.deleteRoommodal1');
            });

            var open_modal_2 = document.querySelector('#deleteRoom-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.deleteRoommodal2');
            });

            var close_modal_1 = document.querySelectorAll('.deleteRoommodal1 .deleteRoommodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.deleteRoommodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.deleteRoommodal2 .deleteRoommodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.deleteRoommodal2');
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
                const modal_1 = document.querySelector('.deleteRoommodal1');
                const modal_2 = document.querySelector('.deleteRoommodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.deleteRoommodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.deleteRoommodal2');
                }
            };
            function toggleModal(modal_item) {
                const modal = document.querySelector(modal_item);
                modal.classList.toggle('active-modal')
                modal.classList.toggle('opacity-0');
                modal.classList.toggle('pointer-events-none');
            }
        </script>

        <script>
            var open_modal_1 = document.querySelector('#addMember-1');
            console.log(open_modal_1);
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.addMembermodal1');
            });

            var open_modal_2 = document.querySelector('#addMember-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.addMembermodal2');
            });

            var close_modal_1 = document.querySelectorAll('.addMembermodal1 .addMembermodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.addMembermodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.addMembermodal2 .addMembermodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.addMembermodal2');
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
                const modal_1 = document.querySelector('.addMembermodal1');
                const modal_2 = document.querySelector('.addMembermodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.addMembermodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.addMembermodal2');
                }
            };

        </script>


    </body>

</html>