<%-- 
    Document   : LRoomDetail
    Created on : Jun 20, 2022, 8:56:54 PM
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
                                <!-- Carousel wrapper -->
                                <div class="overflow-hidden relative h-56 rounded-lg sm:h-64 xl:h-80 2xl:h-96">
                                    <!-- Item 1 -->
                                    <div class="hidden duration-700 ease-in-out" data-carousel-item>
                                        <span
                                            class="absolute top-1/2 left-1/2 text-2xl font-semibold text-white -translate-x-1/2 -translate-y-1/2 sm:text-3xl">First
                                            Slide</span>
                                        <img class="h-full w-full object-cover"
                                             src="https://news.mogi.vn/wp-content/uploads/2020/03/tim-phong-tro.jpg"
                                             class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2"
                                             alt="...">
                                    </div>
                                    <!-- Item 2 -->
                                    <div class="hidden duration-700 ease-in-out" data-carousel-item>
                                        <img class="h-full w-full object-cover"
                                             src="https://timtro.vn/images/2021/08/tim-tro.jpg"
                                             class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2"
                                             alt="...">
                                    </div>
                                    <!-- Item 3 -->
                                    <div class="hidden duration-700 ease-in-out" data-carousel-item>
                                        <img class="h-full w-full object-cover"
                                             src="https://pt123.cdn.static123.com/images/2021/02/22/cho-thue-phong-tro_1613975723.jpg"
                                             class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2"
                                             alt="...">
                                    </div>
                                </div>
                                <!-- Slider indicators -->
                                <div class="flex absolute bottom-5 left-1/2 z-30 space-x-3 -translate-x-1/2">
                                    <button type="button" class="w-3 h-3 rounded-full" aria-current="false"
                                            aria-label="Slide 1" data-carousel-slide-to="0"></button>
                                    <button type="button" class="w-3 h-3 rounded-full" aria-current="false"
                                            aria-label="Slide 2" data-carousel-slide-to="1"></button>
                                    <button type="button" class="w-3 h-3 rounded-full" aria-current="false"
                                            aria-label="Slide 3" data-carousel-slide-to="2"></button>
                                </div>
                                <!-- Slider controls -->
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
                                    <button
                                        class="w-fit inline-block text-white bg-[#17535B] hover:bg-[13484F] font-medium rounded-lg text-sm px-5 py-2.5 text-center "
                                        type="button" data-modal-toggle="editRoom">
                                        Chỉnh sửa
                                    </button>
                                    <div id="editRoom" tabindex="-1" aria-hidden="true"
                                         class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                            <div class="relative bg-white rounded-lg shadow">

                                                <div
                                                    class="flex justify-between items-start p-4 rounded-t border-b">
                                                    <h3 class="text-xl font-semibold text-gray-900">
                                                        Chỉnh sửa cho phòng ${requestScope.currentRoom.roomNumber}
                                                    </h3>
                                                    <button type="button"
                                                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center "
                                                            data-modal-toggle="editRoom">
                                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd"
                                                              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                              clip-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                </div>

                                                <div class="p-4">
                                                    <div class="my-2">
                                                        <label class="w-[160px] inline-block" for="">Loại phòng</label>
                                                        <select name="roomType" id="" class="w-[180px] p-1">
                                                            <c:forEach items="${requestScope.roomTypeList}" var="roomtype">
                                                                <option>${roomtype.roomTypeName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="my-2">
                                                        <label class="w-[160px] inline-block" for="">Tên phòng</label>
                                                        <input type="text" name="roomNumber" value="${requestScope.currentRoom.roomNumber}" class="text-sm p-1">
                                                        <span class="ml-2 text-xs">VD: 101, 102, 510 ...</span>
                                                    </div>
                                                    <div class="grid justify-items-end">
                                                        <button class=" px-8 py-2 mx-4 my-2 border-2 rounded">Xác nhận</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button
                                        class="w-fit inline-block text-white bg-[#17535B] hover:bg-[13484F] font-medium rounded-lg text-sm px-5 py-2.5 text-center "
                                        type="button" data-modal-toggle="deleteRoom">
                                        Xóa Phòng này
                                    </button>

                                    <div id="deleteRoom" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 md:inset-0 h-modal md:h-full">
                                        <div class="relative p-4 w-full max-w-md h-full md:h-auto">
                                            <div class="relative bg-white rounded-lg shadow">
                                                <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center " data-modal-toggle="deleteRoom">
                                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                                </button>
                                                <div class="p-6 text-center">
                                                    <svg class="mx-auto mb-4 w-14 h-14 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                                    <h3 class="mb-5 text-lg font-normal text-gray-500">Phòng hiện đang có 4 người ở. Dữ liệu sẽ bị mất nếu như bạn xóa. <p>Bạn có chắc chắn muốn xóa?</p></h3>
                                                    <button data-modal-toggle="deleteRoom" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                                                        Tôi chắc chắn
                                                    </button>
                                                    <button data-modal-toggle="deleteRoom" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">Hủy bỏ</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                            <div class="mt-5 w-96 shadow-lg rounded text-center p-2 bg-red-300">Số
                                người hiện
                                tại: 4
                            </div>
                            <div class="mt-[20px]">
                                <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                                    <form action="" class="w-full">
                                        <h2 class="text-[22px] font-medium text-[#40576C]">Thành viên 1</h2>
                                        <div class="room-resident text-[18px] font-normal text-[#17535B] w-full grid grid-cols-3 gap-[20px] mt-[10px] mb-[20px]">
                                            <input type="text" name="name" placeholder="Họ tên"
                                                   class=" px-[10px] py-[5px] outline-none rounded duration-100 border border-gray-300 focus:border-[#17535B]" />
                                            <input type="phone" name="phone" placeholder="Số điện thoại"
                                                   class=" px-[10px] py-[5px] outline-none rounded duration-100 border border-gray-300 focus:border-[#17535B]" />
                                            <div class="relative w-full">
                                                <div class="absolute inset-y-0 left-0 flex items-center pl-[5px] pointer-events-none ">
                                                    <svg class="w-6 h-6 text-gray-500" fill="currentColor" viewBox="0 0 20 20"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                          d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z"
                                                          clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                                <input datepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom" type="text" name="dob"
                                                       class="pl-[40px] pr-[10px] py-[5px] w-full h-full text-[18px] font-normal text-[#17535B] outline-none rounded duration-100 border border-gray-300 focus:border-[#17535B]"
                                                       placeholder="Ngày sinh">
                                            </div>
                                        </div>
                                        <h1><a href="add-new-form" class="w-full py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-[#fff] flex items-center justify-center focus:outline-none bg-[#17535B] rounded hover:bg-[#13484F]">Thêm thành viên +</a></h1>
                                    </form>
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
            $(function () {
                var duplicates = 0,
                        $original = $('.room-resident').clone(true);

                function DuplicateForm() {
                    var newForm;

                    duplicates++;

                    newForm = $original.clone(true).insertBefore($('h1'));

                    $.each($('input', newForm), function (i, item) {
                        $(item).attr('name', $(item).attr('name') + duplicates);
                    });

                    $('<h2>Thành viên ' + (duplicates + 1) + '</h2>').insertBefore(newForm);
                }

                $('a[href="add-new-form"]').on('click', function (e) {
                    e.preventDefault();
                    console.log(count);
                    DuplicateForm();
                    var count = $('form .room-resident ').length;
                    if (count == 5) {
                        $('a[href="add-new-form"]').removeAttr("style").hide();
                        return;
                    }
                });
            });
        </script>
    </body>

</html>