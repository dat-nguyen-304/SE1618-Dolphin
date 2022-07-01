<%-- 
    Document   : LRoomType
    Created on : Jun 23, 2022, 12:33:26 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang người thuê</title>

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
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/LRoomType.css">

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
                        <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                      clip-rule="evenodd"></path>
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
                <!-- General information -->
                <c:if test="${sessionScope.hostelList != null}">
                    <div class="general-info flex justify-between mt-[20px]">
                        <div class="">
                            <span>Chọn nhà trọ: </span>
                            <button
                                class="ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-sm px-5 py-2.5 text-center"
                                type="button" data-modal-toggle="hostelModal">
                                ${sessionScope.currentHostel.hostelName}
                            </button>

                            <div id="hostelModal" tabindex="-1" aria-hidden="true"
                                 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                    <div class="relative bg-white rounded shadow">

                                        <div
                                            class="flex justify-between items-start p-4 rounded-t border-b">
                                            <h3 class="text-xl font-semibold text-gray-900">
                                                Chọn nhà trọ
                                            </h3>
                                            <button type="button"
                                                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center"
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
                                                <form action="/sakura/landlord/overview" class="inline-block">
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
                            <c:if test="${requestScope.currentRoomType !=null}">
                                <span>Chọn loại phòng: </span>
                                <button
                                    class="ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-sm px-5 py-2.5 text-center"
                                    type="button" data-modal-toggle="roomModal">
                                    ${requestScope.currentRoomType.roomTypeName}
                                </button>
                                <div id="roomModal" tabindex="-1" aria-hidden="true"
                                     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                        <div class="relative bg-white rounded shadow">

                                            <div
                                                class="flex justify-between items-start p-4 rounded-t border-b">
                                                <h3 class="text-xl font-semibold text-gray-900">
                                                    Chọn loại Phòng
                                                </h3>
                                                <button type="button"
                                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center"
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
                                                <c:forEach items="${requestScope.roomTypeList}" var="roomtype">
                                                    <form action="/sakura/landlord/room-type" class="inline-block">
                                                        <button type="submit" name="roomTypeId" value="${roomtype.roomTypeID}" class="px-4 py-2 mx-2 rounded border-2">${roomtype.roomTypeName}</button>
                                                    </form>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button
                                    class="w-fit inline-block text-white bg-[#17535B] hover:bg-[#13484F]  font-medium rounded text-sm px-5 py-2.5 text-center"
                                    type="button" data-modal-toggle="deleteRoomType">
                                    Xóa Loại phòng này
                                </button>

                                <div id="deleteRoomType" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 md:inset-0 h-modal md:h-full">
                                    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
                                        <div class="relative bg-white rounded shadow">
                                            <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="deleteRoomType">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                            </button>
                                            <div class="p-6 text-center">
                                                <svg class="mx-auto mb-4 w-14 h-14 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                                <h3 class="mb-5 text-lg font-normal text-gray-500">Loại phòng này hiện đang có 10 phòng và 12 yêu cầu thuê phòng. Dữ liệu sẽ bị mất nếu như bạn xóa. <p>Bạn có chắc chắn muốn xóa?</p></h3>
                                                <button data-modal-toggle="deleteRoomType" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                                                    Tôi chắc chắn
                                                </button>
                                                <button data-modal-toggle="deleteRoomType" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">Hủy bỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button
                                    class="ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[#13484F]  font-medium rounded text-sm px-5 py-2.5 text-center"
                                    type="button" data-modal-toggle="editModal">
                                    Chỉnh sửa
                                </button>
                                <div id="editModal" tabindex="-1" aria-hidden="true"
                                     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">

                                    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                            <div
                                                class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                    Chỉnh sửa loại phòng
                                                </h3>
                                                <button type="button"
                                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                                        data-modal-toggle="editModal">
                                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                          d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                          clip-rule="evenodd"></path>
                                                    </svg>
                                                </button>
                                            </div>
                                            <div class="updateMessage pl-4">
                                                <!--                                        <span class="inline-block text-green-600">Thêm loại phòng Chất chơi thành công! Xem
                                                                                            <form class="inline-block w-[1px] text-left" action="/sakura/landlord/room-type">
                                                                                                <input name="roomTypeId" value="">
                                                                                                <input type="submit" value=" tại đây">
                                                                                            </form>
                                                                                        </span>-->
                                            </div>

                                            <form action="/sakura/landlord/room-type" >
                                                <div class="p-4">

                                                    <div class="my-2">
                                                        <label class="w-[160px] inline-block" for="">Tên</label>
                                                        <input type="text" name="updateName" required class="text-sm p-1">
                                                        <span class="ml-2 text-xs">VD: bình dân, cao cấp, ...</span>
                                                    </div>
                                                    <div class="my-2">
                                                        <label class="w-[160px] inline-block" for="">Giá</label>
                                                        <input type="text" name="updatePrice" required class="text-sm p-1">
                                                        <span class="ml-2 text-xs">VD: 3000000, 5000000 ...</span>
                                                    </div>
                                                    <div class="my-2">
                                                        <label class="w-[160px] inline-block" for="">Diện tích</label>
                                                        <input type="text" name="updateArea" required class="text-sm p-1">
                                                        <span class="ml-2 text-xs">VD: 24, 30, ...</span>
                                                    </div>
                                                    <div class="my-2">
                                                        <label class="w-[160px] inline-block" for="">Số người tối đa</label>
                                                        <input type="text" name="updateMaxNumberOfResidents" required class="text-sm p-1">
                                                        <span class="ml-2 text-xs">VD: 4, 5, 6, ...</span>
                                                    </div>
                                                    <div class="my-2">
                                                        <label class="relative top-[-24px] w-[160px] inline-block" for="">Mô tả</label>
                                                        <textarea class="text-sm p-1" name="updateDescription" id="" cols="48" rows="2"></textarea>
                                                    </div>
                                                    <div class="my-2">
                                                        <label class="w-[160px] inline-block" for="">Thêm Hình ảnh</label>
                                                        <input type="file" multiple rounded />
                                                    </div>
                                                    <input type="hidden" name="updateHostelId" value="${sessionScope.currentHostel.hostelID}" />

                                                </div>
                                                <div class="grid justify-items-end">
                                                    <button type="button" class="px-8 py-2 mx-4 my-2 border-2 rounded" onclick="updateRoomType()">Thêm</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <button
                                class="ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[#13484F]  font-medium rounded text-sm px-5 py-2.5 text-center"
                                type="button" data-modal-toggle="addModal">
                                Thêm loại phòng mới
                            </button>

                            <div id="addModal" tabindex="-1" aria-hidden="true"
                                 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">

                                <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                    <div class="relative bg-white rounded shadow">

                                        <div
                                            class="flex justify-between items-start p-4 rounded-t border-b">
                                            <h3 class="text-xl font-semibold text-gray-900">
                                                Thêm loại Phòng mới
                                            </h3>
                                            <button type="button"
                                                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center"
                                                    data-modal-toggle="addModal">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd"
                                                      d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                      clip-rule="evenodd"></path>
                                                </svg>
                                            </button>
                                        </div>
                                        <div class="addRoomMessage pl-4">
                                            <!--                                        <span class="inline-block text-green-600">Thêm loại phòng Chất chơi thành công! Xem
                                                                                        <form class="inline-block w-[1px] text-left" action="/sakura/landlord/room-type">
                                                                                            <input name="roomTypeId" value="">
                                                                                            <input type="submit" value=" tại đây">
                                                                                        </form>
                                                                                    </span>-->
                                        </div>

                                        <form action="/sakura/landlord/room-type" >
                                            <div class="p-4">

                                                <div class="my-2">
                                                    <p class="text-xs validRoomTypeMessage"></p>
                                                    <label class="w-[160px] inline-block" for="">Tên</label>
                                                    <input type="text" name="name" required class="text-sm p-1" onkeyup="checkValidRoomType(this)" />
                                                    <span class="ml-2 text-xs">VD: bình dân, cao cấp, ...</span>
                                                </div>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Giá</label>
                                                    <input type="text" name="price" required class="text-sm p-1">
                                                    <span class="ml-2 text-xs">VD: 3000000, 5000000 ...</span>
                                                </div>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Diện tích</label>
                                                    <input type="text" name="area" required class="text-sm p-1">
                                                    <span class="ml-2 text-xs">VD: 24, 30, ...</span>
                                                </div>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Số người tối đa</label>
                                                    <input type="text" name="maxNumberOfResidents" required class="text-sm p-1">
                                                    <span class="ml-2 text-xs">VD: 4, 5, 6, ...</span>
                                                </div>
                                                <div class="my-2">
                                                    <label class="relative top-[-24px] w-[160px] inline-block" for="">Mô tả</label>
                                                    <textarea class="text-sm p-1" name="description" id="" cols="48" rows="2"></textarea>
                                                </div>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Thêm Hình ảnh</label>
                                                    <input type="file" multiple rounded />
                                                </div>
                                                <input type="hidden" name="hostelId" value="${sessionScope.currentHostel.hostelID}" />

                                            </div>
                                            <div class="grid justify-items-end">
                                                <button type="button" class="px-8 py-2 mx-4 my-2 border-2 rounded addRoomTypeBtn" onclick="addRoomType()">Thêm</button>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>


                            <c:if test="${requestScope.currentRoomType !=null}">
                                <div class="mt-[24px] grid grid-cols-12">
                                    <div class="col-span-5 mx-8">
                                        <input type="file" multiple />
                                        <div class="mt-[24px] grid grid-cols-3 gap-4">
                                            <div class="w-full border-2">Hinh anh</div>
                                            <div class="w-full border-2">Hinh anh</div>
                                            <div class="w-full border-2">Hinh anh</div>
                                            <div class="w-full border-2">Hinh anh</div>
                                            <div class="w-full border-2">Hinh anh</div>
                                        </div>
                                    </div>
                                    <div class="col-span-7 mx-8">
                                        <div class="text-lg">Thông số chung: </div>
                                        <div class="mt-[24px] grid grid-cols-3 gap-4">
                                            <div class="">
                                                <span>Giá: </span>
                                                <span class="w-full border-none text-sm text-right p-1 w-full">
                                                    ${requestScope.currentRoomType.advertisedPrice}
                                                </span>
                                            </div>
                                            <div class="">
                                                <span>Diện tích: </span>
                                                <span class="border-none text-sm text-right p-1 w-full">
                                                    ${requestScope.currentRoomType.area} m2</span>
                                            </div>
                                            <div class="">
                                                <span>Số người tối đa: </span>
                                                <span class="border-none text-sm text-right p-1 w-full">
                                                    ${requestScope.currentRoomType.maxNumberOfResidents} người</span>
                                            </div>
                                            <div class="col-span-3">
                                                <span class="">Mô tả: </span>
                                                <span class="mt-[8px] p-2 border-none text-sm">${requestScope.currentRoomType.description}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-[24px]">
                                    <div class="grid grid-cols-6 gap-x-4">
                                        <div class="text-center p-2 text-sm">Danh sách phòng hiện tại: </div>
                                        <!-- <div class="border-2 rounded text-center p-2 text-sm">Thêm Phòng</div> -->
                                        <button
                                            class="ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[#13484F]  font-medium rounded text-sm px-5 py-2.5 text-center"
                                            type="button" data-modal-toggle="addRoom">
                                            Thêm Phòng
                                        </button>
                                        <div id="addRoom" tabindex="-1" aria-hidden="true"
                                             class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                            <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                                <div class="relative bg-white rounded shadow">

                                                    <div
                                                        class="flex justify-between items-start p-4 rounded-t border-b">
                                                        <h3 class="text-xl font-semibold text-gray-900">
                                                            Thêm Phòng mới
                                                        </h3>

                                                        <button type="button"
                                                                class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center"
                                                                data-modal-toggle="addRoom">
                                                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd"
                                                                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                                  clip-rule="evenodd"></path>
                                                            </svg>
                                                        </button>
                                                    </div>

                                                    <div class="p-4">
                                                        <span class="text-xs validRoomMessage"></span>
                                                        <form action="/sakura/landlord/room-type" class="my-2">
                                                            <label class="w-[160px] inline-block" for="">Tên phòng</label>
                                                            <input type="hidden" name="roomTypeId" value="${requestScope.currentRoomType.roomTypeID}"/>
                                                            <input type="text" name="addRoomNumber" class="text-sm p-1" onkeyup="checkValidRoom(this)"/>
                                                            <span class="ml-2 text-xs">VD: 101, 102, 510 ...</span>

                                                            <div class="grid justify-items-end">
                                                                <button type="submit" class="addRoom px-8 py-2 mx-4 my-2 border-2 rounded">Thêm</button>
                                                            </div>
                                                        </form>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-[24px] grid grid-cols-10 gap-x-8">
                                        <c:forEach items="${requestScope.roomList}" var="room">
                                            <form action="/sakura/landlord/room-detail" class="border-2 rounded text-center p-1">
                                                <button name="roomId" value="${room.roomID}" class="w-full">${room.roomNumber}</button>
                                            </form>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>
                        </div>

                    </div>

                </c:if>
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
        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="../assets/javascript/jquery/jquery.min.js"></script>
        <script>
                                                            const hasResident = document.querySelectorAll('input[name="status"]');
                                                            const inputResident = document.querySelector('.inputResident');
                                                            hasResident.forEach(element => {
                                                                element.onclick = () => {
                                                                    if (element.value == "2" || element.value == "3") {
                                                                        inputResident.style.display = "block";
                                                                    } else
                                                                        inputResident.style.display = "none";
                                                                }
                                                            });
        </script>
        <script>
            function addRoomType() {
                console.log("da vao add roomtype");
                const name = document.querySelector("input[name='name']");
                const price = document.querySelector("input[name='price']");
                const area = document.querySelector("input[name='area']");
                const maxNumberOfResidents = document.querySelector("input[name='maxNumberOfResidents']");
                const description = document.querySelector("textarea[name='description']");
                const hostelId = document.querySelector("input[name='hostelId']");
                const messageElement = document.querySelector(".addRoomMessage");
                jQuery.ajax({
                    type: 'POST',
                    data: {'name': name.value,
                        'price': price.value,
                        'area': area.value,
                        'maxNumberOfResidents': maxNumberOfResidents.value,
                        'description': description.value,
                        'hostelId': hostelId.value
                    },
                    url: '/sakura/landlord/add-roomtype',
                    success: function (response) {
                        name.value = "";
                        price.value = "";
                        area.value = "";
                        maxNumberOfResidents.value = "";
                        description.value = "";
                        messageElement.innerHTML = response;
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }

            function checkValidRoom(element) {
                const hostelId = document.querySelector("input[name='hostelId']").value;
                const validRoomMessage = document.querySelector(".validRoomMessage");
                const addRoomElement = document.querySelector(".addRoom");
                jQuery.ajax({
                    type: 'POST',
                    data: {'roomNumber': element.value,
                        'hostelId': hostelId
                    },
                    url: '/sakura/landlord/check-room-valid',
                    success: function (response) {
                        validRoomMessage.innerHTML = response;
                        if (response) {
                            addRoomElement.onclick = (e) => {
                                e.preventDefault();
                            }
                        } else {
                            addRoomElement.onclick = (e) => {
                                e.returnValue = true;
                            }
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
            function checkValidRoomType(element) {
                const validRoomTypeMessage = document.querySelector(".validRoomTypeMessage");
                const hostelId = document.querySelector("input[name='hostelId']");
                const addRoomTypeBtn = document.querySelector(".addRoomTypeBtn");
                jQuery.ajax({
                    type: 'POST',
                    data: {'roomTypeName': element.value,
                        'hostelId': hostelId.value
                    },
                    url: '/sakura/landlord/check-roomtype-valid',
                    success: function (response) {
                        validRoomTypeMessage.innerHTML = response;
                        if (response) {
                            addRoomTypeBtn.onclick = (e) => {
                                e.preventDefault();
                            }
                        } else {
                            addRoomTypeBtn.onclick = () => addRoomType();

                        }

                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }
        </script>

    </body>

</html>