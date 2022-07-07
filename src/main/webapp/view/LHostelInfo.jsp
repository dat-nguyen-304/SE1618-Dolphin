<%-- 
    Document   : LHostelInfo
    Created on : Jul 4, 2022, 3:27:37 PM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Thông tin nhà trọ</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- <link rel="stylesheet" href="app.css"> -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>


        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/js/splide.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/css/splide.min.css">

        <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />

        <script src="https://cdn.jsdelivr.net/npm/donutty@2.3.1/dist/donutty.min.js"></script>

        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/LHostelInfo.css">

    </head>
    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">
                <div class="head-control flex justify-between">
                    <!-- Breadcrumb -->
                    <!-- <div class="bc-container">
                    <div class="bc"><a href="#">Quản lý phòng thuê </a></div>
                    </div> -->
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center">
                                <a href="#"
                                   class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                    </path>
                                    </svg>
                                    Thông tin nhà trọ
                                </a>
                            </li>
                            <li aria-current="page">
                                <div class="flex items-center">
                                    <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                    </svg>
                                    <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">${sessionScope.currentHostel.hostelName}</span>
                                </div>
                            </li> 
                        </ol>
                    </nav>
                    <!-- End breadcrumb -->

                </div>

                <!-- General information -->
                <div class="flex justify-between mt-[20px] grid grid-cols-5 gap-5">

                    <!--Hostel info-->
                    <div class="card bg-[#fff] p-5 flex flex-col col-span-2">
                        <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px]">Thông tin cơ bản</div>
                        <div class="w-full h-fit mx-auto">
                            <div class="grid grid-cols-6 gap-[8px]">
                                <div class="col-span-2 grid grid-rows-2 gap-[3px]">
                                    <p class="text-[#929ca5] font-normal">Mã nhà trọ</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${sessionScope.currentHostel.hostelID}</p>
                                </div>
                                <div class="col-span-4 grid grid-rows-2 gap-[3px]">
                                    <p class="text-[#929ca5] font-normal">Tên nhà trọ</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${sessionScope.currentHostel.hostelName}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[0px]">
                                    <p class="text-[#929ca5] font-normal">Trạng thái</p>
                                    <c:if test="${sessionScope.currentHostel.activate == true}">
                                        <p class="w-2/3 text-center px-2 py-[2px] bg-[#dcfce7] rounded text-[18px] text-[#17535B] font-semibold">Hoạt động</p>
                                    </c:if>
                                    <c:if test="${sessionScope.currentHostel.activate == false}">
                                        <p class="w-1/2 text-center px-2 py-[2px] bg-[#f0f1f2] rounded text-[16px] text-[#616569] font-semibold">Đóng cửa</p>
                                    </c:if>
                                </div>
                                <div class="col-span-4 grid grid-rows-2 gap-[0px]">
                                    <p class="text-[#929ca5] font-normal">Ngày tạo</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${sessionScope.currentHostel.registeredDate}</p>
                                </div>
                            </div>

                            <div class="mt-[20px]">
                                <p class="text-[#929ca5] font-normal"><i class="bi bi-geo-alt-fill mr-[5px]"></i>Địa chỉ</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold mt-[5px]">${sessionScope.currentHostel.streetAddress}, ${sessionScope.currentHostel.district.districtName}, ${sessionScope.currentHostel.district.province.provinceName}</p>
                            </div>

                            <div class="grid grid-rows-2 grid-cols-6 gap-[5px] mt-[20px]">
                                <p class="text-[#929ca5] font-normal col-span-2"><i class="bi bi-house-fill mr-[5px]"></i>Số phòng</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold col-span-4">${sessionScope.currentHostel.totalRoom}</p>
                                <p class="text-[#929ca5] font-normal col-span-2"><i class="bi bi-house mr-[5px]"></i>Phòng trống</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold col-span-4">${sessionScope.currentHostel.availableRoom}</p>
                            </div>
                            <div class="grid grid-rows-2 grid-cols-6 gap-[5px] mt-[20px]">
                                <fmt:setLocale value = "vi_VN"/>
                                <p class="text-[#929ca5] font-normal col-span-2"><i class="bi bi-tags-fill mr-[5px]"></i>Giá thuê</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold col-span-4"><fmt:formatNumber value = "${sessionScope.currentHostel.minPrice}" type = "number" pattern="###,###,###VNĐ"/> - <fmt:formatNumber value = "${sessionScope.currentHostel.maxPrice}" type = "number" pattern="###,###,###VNĐ"/></p>
                                <p class="text-[#929ca5] font-normal col-span-2"><i class="bi bi-slash-square mr-[5px]"></i>Diện tích phòng</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold col-span-4">${sessionScope.currentHostel.minArea}m<sup>2</sup> - ${sessionScope.currentHostel.maxArea}m<sup>2</sup></p>
                            </div>

                            <div class="mt-[20px]">
                                <p class="text-[#929ca5] font-normal"><i class="bi bi-info-circle mr-[5px]"></i>Mô tả</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">${sessionScope.currentHostel.description}</p>
                            </div>

                        </div>
                    </div>
                    <!--End hostel info-->

                    <!--Hostel image-->
                    <div class="col-span-3">
                        <div class="card bg-[#fff] p-5 flex flex-col">
                            <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                                <p>Hình ảnh </p>
                                <div class="flex ">
                                    <span id="cnt-images" class="font-light text-[18px] mr-[10px]"></span>
                                    <button onclick="unselectAllImages()" class="text-[15px] rounded w-[150px] h-[30px] font-light flex justify-center items-center mr-[10px] bg-[#17535B] hover:bg-[#13484F] text-[#fff]" id="unselect-all-images" >
                                        <p><i class="bi bi-slash-circle mr-[5px]"></i>Bỏ chọn tất cả</p>
                                    </button>
                                    <!-- Modal remove image toggle -->
                                    <button class="text-[15px] rounded w-[150px] h-[30px] font-light flex justify-center items-center mr-[10px] bg-[#17535B] hover:bg-[#13484F] text-[#fff]" id="delete-images" >
                                        <p><i class="bi bi-trash3-fill mr-[5px]"></i>Xoá hình đã chọn</p>
                                    </button>
                                    <!-- Modal add image toggle -->
                                    <button class="text-[15px] rounded w-[150px] h-[30px] font-light flex justify-center items-center border border-gray-400" id="add-images" >
                                        <p><i class="bi bi-plus-lg mr-[5px]"></i>Thêm hình ảnh</p>
                                    </button>    
                                </div>
                                <!--Modal remove an image-->
                                <div class="modal remove-an-image opacity-0 duration-100 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[10000]">
                                    <div class="modal-overlay absolute w-full h-full bg-[#0c1112] opacity-80"></div>
                                    <div class="modal-container bg-white w-[500px] h-fit mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                        <div class="modal-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-[20px]">
                                            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                                            <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                                            </svg>
                                            <span class="text-sm">(Esc)</span>
                                        </div>
                                        <div class="modal-content h-full flex flex-col">
                                            <!--Title-->
                                            <div class="flex justify-between items-center px-[20px] py-[10px] border-b">
                                                <p class="text-[20px] font-bold text-[#17535B]">Xác nhận</p>
                                                <div class="modal-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                                                    <svg class="fill-current text-[#17535B]" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                                                    <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                                                    </svg>
                                                </div>
                                            </div>
                                            <!--Body-->
                                            <p class="p-[20px] font-normal text-[18px]">Bạn chắc chắn muốn xoá hình ảnh này khỏi hệ thống?</p>
                                            <!--Footer-->
                                            <div class="flex justify-end p-[20px]">
                                                <button class="modal-close px-5 py-2 text-[#7e7e7e] text-[18px] font-medium rounded hover:text-[#FF6532]">Huỷ</button>
                                                <button type="button" id="remove-an-image-btn" class="px-5 py-2 bg-[#f53b3b] hover:bg-[#e84343] text-[#fff] text-[18px] font-medium rounded">Xoá</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal remove image-->
                                <div class="modal remove-image opacity-0 duration-100 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[10000]">
                                    <div class="modal-overlay absolute w-full h-full bg-[#0c1112] opacity-80"></div>
                                    <div class="modal-container bg-white w-[500px] h-fit mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                        <div class="modal-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-[20px]">
                                            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                                            <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                                            </svg>
                                            <span class="text-sm">(Esc)</span>
                                        </div>
                                        <div class="modal-content h-full flex flex-col">
                                            <!--Title-->
                                            <div class="flex justify-between items-center px-[20px] py-[10px] border-b">
                                                <p class="text-[20px] font-bold text-[#17535B]">Xác nhận</p>
                                                <div class="modal-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                                                    <svg class="fill-current text-[#17535B]" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                                                    <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                                                    </svg>
                                                </div>
                                            </div>
                                            <!--Body-->
                                            <p class="p-[20px] font-normal text-[18px]">Bạn chắc chắn muốn xoá những hình ảnh này khỏi hệ thống?</p>
                                            <!--Footer-->
                                            <div class="flex justify-end p-[20px]">
                                                <button class="modal-close px-5 py-2 text-[#7e7e7e] text-[18px] font-medium rounded hover:text-[#FF6532]">Huỷ</button>
                                                <button type="button" onclick="confirmRemoveMultipleFile()" id="remove-image-btn" class="px-5 py-2 bg-[#f53b3b] hover:bg-[#e84343] text-[#fff] text-[18px] font-medium rounded">Xoá</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal add image-->
                                <div class="modal add-image opacity-0 duration-100 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[10000]">
                                    <div class="modal-overlay absolute w-full h-full bg-[#0c1112] opacity-80"></div>
                                    <div class="modal-container bg-white w-[43%] h-[65%] mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                        <div class="modal-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-[20px]">
                                            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                                            <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                                            </svg>
                                            <span class="text-sm">(Esc)</span>
                                        </div>
                                        <div class="modal-content h-full flex flex-col">
                                            <!--Title-->
                                            <div class="flex-none flex justify-between items-center px-[20px] py-[10px] border-b">
                                                <p class="text-[20px] font-bold text-[#17535B]">Tải lên hình nhà trọ</p>
                                                <div class="modal-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                                                    <svg class="fill-current text-[#17535B]" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                                                    <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                                                    </svg>
                                                </div>
                                            </div>
                                            <!--Body-->
                                            <div class="grow p-[20px]">
                                                <p class="mb-[10px] text-[18px] font-normal">Có thể đăng tối đa 10 ảnh!</p>
                                                <form method="post" action="/sakura/landlord/add-hostel-image" enctype="multipart/form-data"
                                                      class="dropzone border border-dashed overflow-y-auto w-full h-[85%] relative p-[20px]"
                                                      id="my-dropzone">
                                                    <div class="fallback">
                                                        <input name="file" type="file" multiple="multiple" />
                                                    </div>
                                                    <div class="dz-message needsclick flex flex-col justify-center items-center text-[#929CA5] absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-full">
                                                        <div class="mb-3">
                                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 font-normal text-[#929CA5]" fill="none"
                                                                 viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                                  d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12" />
                                                            </svg>
                                                        </div>
                                                        <h4 class="text-[15px] font-normal text-[#929CA5]">Kéo thả hoặc ấn vào đây để tải ảnh lên.</h4>
                                                    </div>
                                                </form>
                                                <p id="error-file-qty-message" class="dz-max-files-reached hidden text-[14px] font-light italic text-[#ff4747]">
                                                    Tối đa 10 ảnh</p>
                                                <p id="error-file-size-message" class="dz-max-files-reached hidden text-[14px] font-light italic text-[#ff4747]">
                                                    Ảnh tải lên quá lớn (trên 5MB) sẽ không được tải lên.</p>
                                                <p id="success-upload-message" class="hidden text-[20px] font-medium text-center text-[#0e9c72]">
                                                    Tải lên thành công!</p>
                                            </div>
                                            <!--Footer-->
                                            <div class="flex-none flex justify-end p-[20px]">
                                                <button class="modal-close px-5 text-[#7e7e7e] text-[20px] font-medium py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                                                <button type="button" id="upload-file" class="px-5 py-2 bg-[#17535B] hover:bg-[#11444b] text-[#fff] text-[20px] font-medium rounded">Tải lên</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="w-full h-fit mx-auto z-0 " id="display-image">
                                <div class="hidden h-[600px] flex flex-col items-center justify-around" id="empty-image-list">
                                    <h4 class="w-[60%] mx-auto text-center text-[47px] font-bold tracking-wide text-[#c9c9c9]">Chưa có hình ảnh nào cho nhà trọ này!</h4>
                                    <p class="text-gray-700 font-semibold text-[18px]">Bạn cần cập nhật hình ảnh để thông tin nhà trọ của bạn đáng tin cậy hơn.</p>
                                </div>
                                <c:choose>
                                    <c:when test="${empty sessionScope.currentHostel.imgList}">
                                        <div class="h-[600px] flex flex-col items-center justify-around" id="empty-image-list">
                                            <h4 class="w-[60%] mx-auto text-center text-[47px] font-bold tracking-wide text-[#c9c9c9]">Chưa có hình ảnh nào cho nhà trọ này!</h4>
                                            <p class="text-gray-700 font-semibold text-[18px]">Bạn cần cập nhật hình ảnh để thông tin nhà trọ của bạn đáng tin cậy hơn.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <section id="main-carousel" class="splide w-full" aria-label="">
                                            <div class="splide__track w-full">
                                                <ul class="splide__list">
                                                    <c:forEach items="${sessionScope.currentHostel.imgList}" var="imgHostel">
                                                        <li class="splide__slide image-item-container overflow-hidden relative group cursor-pointer" > 
                                                            <img class="z-[1] mx-auto" alt="" src="${imgHostel}" size="" id="${imgHostel}">
                                                            <div class="image-control flex justify-between items-center z-[3] h-[20px] w-full text-[#fff] text-[20px] absolute top-[5px] px-[5px]">
                                                                <a class="remove-image m-0 p-0 h-full flex items-center" onclick="removeFile('${imgHostel}', event);"> 
                                                                    <i class="bi bi-x"></i>
                                                                </a>
                                                                <input type="checkbox" name="select-image" value="${imgHostel}" class="checkbox-input hidden" id="ip_${imgHostel}" onchange="toggleSelectImage(event)">
                                                                <label for="ip_${imgHostel}">
                                                                    <span class="checkbox transparent border border-[#fff] rounded w-[16px] h-[16px] inline-block relative cursor-pointer"></span>
                                                                </label>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </section>
                                        <ul id="thumbnails" class="thumbnails w-full min-w-0 flex mt-[10px] p-0">
                                            <c:forEach items="${sessionScope.currentHostel.imgList}" var="imgHostel">
                                                <li class="thumbnail image-item-container mr-[2px] overflow-hidden relative group cursor-pointer" id="tb_${imgHostel}"> 
                                                    <div class="image-overlay w-full h-full bg-[#000] opacity-0 absolute top-0 left-0 z-[2] duration-150"></div>
                                                    <img class="z-[1] w-full h-full object-cover group-hover:blur-sm duration-150" alt="" src="${imgHostel}" size="">
                                                    <div class="image-control flex justify-between items-center z-[3] h-[20px] w-full text-[#fff] text-[20px] absolute top-[5px] px-[5px]">
                                                        <a class="remove-image m-0 p-0 h-full flex items-center" onclick="removeFile('${imgHostel}', event);"> 
                                                            <i class="bi bi-x"></i>
                                                        </a>
                                                        <input type="checkbox" name="select-image" value="${imgHostel}" class="checkbox-input hidden" id="tb_ip_${imgHostel}" onchange="toggleSelectThumbnail(event)">
                                                        <label for="tb_ip_${imgHostel}">
                                                            <span class="checkbox transparent border border-[#fff] rounded w-[16px] h-[16px] inline-block relative cursor-pointer"></span>
                                                        </label>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End general information-->

                <!-- Feedback, review -->
                <div class="feedback mt-[20px] grid grid-cols-5 gap-[20px]">
                    <div class="card w-full h-fit bg-[#fff] p-[20px] flex flex-col">
                        <div class="text-[20px] font-bold text-[#2A3C46] self-start pb-[20px]">Đánh giá</div>
                        <div class="w-full h-fit mx-auto">
                            <div class="relative w-[80%] h-fit mx-auto mt-[20px]">
                                <div id="donut-chart" dir="ltr" dnt></div>
                                <div>Điểm đánh giá trung bình</div>
                                <p class="text-center">${requestScope.feedbacks.size()} lượt đánh giá</p>
                            </div>
                        </div>
                    </div>

                    <!-- Rating -->
                    <div class="card col-span-4 w-full bg-[#fff] p-[20px]">
                        <div class="text-[20px] font-bold text-[#2A3C46] self-start pb-[20px]">Chi tiết đánh giá
                        </div>
                        <div class="w-full mx-auto overflow-y-auto">
                            <table class="w-full text-[15px] text-left text-gray-500 ">
                                <thead class="text-[15px] text-gray-700 uppercase bg-gray-50 ">
                                    <tr class="grid grid-16 gap-[5px]">
                                        <th scope="col" class="px-2 py-3 col-span-2">Thời gian</th>
                                        <th scope="col" class="px-2 py-3 col-span-2">Người đánh giá</th>
                                        <th scope="col" class="text-center px-1 py-3 col-span-2">Số điểm</th>
                                        <th scope="col" class="px-1 py-3 col-span-10">Nội dung</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.feedbacks}" var="feedback">
                                        <tr class="bg-white border-b hover:bg-gray-50 grid grid-16 gap-[5px]">
                                            <td class="px-2 py-4 col-span-2">${feedback.date}</td>
                                            <td class="px-2 py-4 col-span-2">${feedback.tenant.fullname}</td>
                                            <td class="text-center px-1 py-4 col-span-2">${feedback.rating}</td>
                                            <td class="px-1 py-4 col-span-10">${feedback.content}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
                <!-- End Statistics -->
            </div>

            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script type="text/javascript">
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

                                                            if (${not empty sessionScope.currentHostel.imgList}) {
                                                                var splide = new Splide('#main-carousel', {
                                                                    pagination: false,
                                                                    rewind: true
                                                                });

                                                                var thumbnails = document.getElementsByClassName('thumbnail');
                                                                var current;
                                                                for (var i = 0; i < thumbnails.length; i++) {
                                                                    initThumbnail(thumbnails[i], i);
                                                                }

                                                                function initThumbnail(thumbnail, index) {
                                                                    thumbnail.addEventListener('click', function () {
                                                                        splide.go(index);
                                                                    });
                                                                }

                                                                splide.on('mounted move', function () {
                                                                    var thumbnail = thumbnails[splide.index];
                                                                    if (thumbnail) {
                                                                        if (current) {
                                                                            current.classList.remove('is-active');
                                                                        }
                                                                        thumbnail.classList.add('is-active');
                                                                        current = thumbnail;
                                                                    }
                                                                });

                                                                splide.mount();
                                                            }

                                                            // MODAL 
                                                            var open_modal_1 = document.querySelector('#add-images');
                                                            open_modal_1.addEventListener('click', function (event) {
                                                                event.preventDefault();
                                                                toggleModal('.modal.add-image');
                                                            });
                                                            var close_modal_1 = document.querySelectorAll('.modal.add-image .modal-close');
                                                            for (let i = 0; i < close_modal_1.length; ++i) {
                                                                close_modal_1[i].addEventListener('click', () => {
                                                                    toggleModal('.modal.add-image');
                                                                });
                                                            }
                                                            var open_modal_2 = document.querySelector('#delete-images');
                                                            open_modal_2.addEventListener('click', function (event) {
                                                                event.preventDefault();
                                                                if (checkSelectImage() === false)
                                                                    return;
                                                                toggleModal('.modal.remove-image');
                                                            });

                                                            var close_modal_2 = document.querySelectorAll('.modal.remove-image .modal-close');
                                                            for (let i = 0; i < close_modal_2.length; ++i) {
                                                                close_modal_2[i].addEventListener('click', () => {
                                                                    toggleModal('.modal.remove-image');
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
                                                                const modal_1 = document.querySelector('.modal.add-image');
                                                                if (isEscape && modal_1.classList.contains('active-modal')) {
                                                                    toggleModal('.modal.add-image');
                                                                }
                                                                const modal_2 = document.querySelector('.modal.remove-image');
                                                                if (isEscape && modal_2.classList.contains('active-modal')) {
                                                                    toggleModal('.modal.remove-image');
                                                                }
                                                            };
                                                            function toggleModal(modal_item) {
                                                                const modal = document.querySelector(modal_item);
                                                                modal.classList.toggle('active-modal');
                                                                modal.classList.toggle('opacity-0');
                                                                modal.classList.toggle('pointer-events-none');
                                                            }

                                                            function checkSelectImage() {
                                                                if (document.querySelectorAll('input[type="checkbox"]:checked').length === 0) {
                                                                    showToast('error', 'Chưa chọn ảnh nào!');
                                                                    return false;
                                                                }
                                                                return true;
                                                            }

                                                            function confirmRemoveMultipleFile() {
                                                                removeMultipleFile();
                                                                toggleModal('.modal.remove-image');
                                                                showToast('info', 'Đang xoá, đợi vài giây!');
                                                                setTimeout(function () {
                                                                    window.location.reload();
                                                                }, 3000);
                                                            }

                                                            function removeMultipleFile() {
                                                                let checkboxes = document.querySelectorAll('.thumbnails .checkbox-input');
                                                                let selected = new Array();
                                                                for (let i = 0; i < checkboxes.length; i++) {
                                                                    if (checkboxes[i].checked) {
                                                                        selected.push(checkboxes[i].value);
                                                                    }
                                                                }
                                                                console.log(selected);
                                                                jQuery.ajax({
                                                                    type: "POST",
                                                                    dataType: 'json',
                                                                    data: {toDelete: selected, hostelId: ${sessionScope.currentHostel.hostelID}},
                                                                    url: "/sakura/landlord/remove-multiple-images",
                                                                    success: function () {
                                                                    },
                                                                    complete: function () {
                                                                        countSelectedImage();
                                                                        //window.location.reload();
                                                                        //updateImageList();
                                                                        /*for (let i = 0; i < selected.length; i++) {
                                                                         console.log(selected[i]);
                                                                         document.getElementById(selected[i]).parentElement.style.display = 'none';
                                                                         let thumbnailID = "tb_" + selected[i];
                                                                         document.getElementById(thumbnailID).style.display = 'none';
                                                                         }*/
                                                                    }
                                                                });
                                                            }

                                                            function updateImageList() {

                                                                jQuery.ajax({
                                                                    url: '/sakura/landlord/update-image',
                                                                    type: 'GET',
                                                                    data: {hostelId: ${sessionScope.currentHostel.hostelID}},
                                                                    dataType: 'text',
                                                                    complete: function (result) {
                                                                        var data = JSON.parse(result.responseText);
                                                                        console.log(data);
                                                                        if (data.length === 0) {
                                                                            // let container = document.getElementById('display-image');
                                                                            $('#empty-image-list').toggleClass('hidden');
                                                                        }
                                                                        $(".splide__list").empty();
                                                                        $("#thumbnails").empty();

                                                                        for (let i = 0; i < data.length; ++i) {
                                                                            $(".splide__list").append(`
                                                                <li class="splide__slide image-item-container overflow-hidden relative group cursor-pointer">
                                                                    <img class="z-[1] mx-auto" alt="" src="` + data[i].imgLink + `" id="` + data[i].imgLink + `">
                                                                    <div class="image-control flex justify-between items-center z-[3] h-[20px] w-full text-[#fff] text-[20px] absolute top-[5px] px-[5px]">
                                                                        <a class="remove-image m-0 p-0 h-full flex items-center" onclick="removeFile('` + data[i].imgLink + `');">
                                                                            <i class="bi bi-x"></i>
                                                                        </a>
                                                                        <input type="checkbox" name="select-image" value="` + data[i].imgLink + `" class="checkbox-input hidden" id="ip_` + data[i].imgLink + `" onchange="toggleSelectImage(event)">
                                                                        <label for="ip_` + data[i].imgLink + `">
                                                                            <span class="checkbox transparent border border-[#fff] rounded w-[16px] h-[16px] inline-block relative cursor-pointer"></span>
                                                                        </label>
                                                                    </div>
                                                                </li>`);
                                                                            $("#thumbnails").append('<li class="thumbnail image-item-container mr-[2px] overflow-hidden relative group cursor-pointer" id="tb_' + data[i].imgLink + '"><div class="image-overlay w-full h-full bg-[#000] opacity-0 absolute top-0 left-0 z-[2] duration-150"></div><img class="z-[1] w-full h-full object-cover group-hover:blur-sm duration-150" alt="" src="' + data[i].imgLink + '" size=""><div class="image-control flex justify-between items-center z-[3] h-[20px] w-full text-[#fff] text-[20px] absolute top-[5px] px-[5px]"><a class="remove-image m-0 p-0 h-full flex items-center" onclick="removeFile(\'' + data[i].imgLink + '\');"><i class="bi bi-x"></i></a><input type="checkbox" name="select-image" value="' + data[i].imgLink + '" class="checkbox-input hidden" id="tb_ip_' + data[i].imgLink + '" onchange="toggleSelectThumbnail(event)"><label for="tb_ip_' + data[i].imgLink + '"><span class="checkbox transparent border border-[#fff] rounded w-[16px] h-[16px] inline-block relative cursor-pointer"></span></label></div></li>');
                                                                        }
                                                                        countSelectedImage();
                                                                    }
                                                                });
                                                            }

                                                            function removeFile(filePath, event) {
                                                                toggleModal('.modal.remove-an-image');
                                                                let cfBtn = document.getElementById('remove-an-image-btn');
                                                                cfBtn.addEventListener('click', () => {
                                                                    console.log(filePath);
                                                                    jQuery.ajax({
                                                                        type: 'POST',
                                                                        data: {path: filePath, hostelId: ${sessionScope.currentHostel.hostelID}},
                                                                        url: '/sakura/landlord/remove-image',
                                                                        complete: function () {
                                                                            toggleModal('.modal.remove-an-image');
                                                                            window.location.reload();
                                                                            //showToast('success', 'Xoá ảnh thành công!');
                                                                            //setTimeout(function () {
                                                                            //    window.location.reload();
                                                                            //}, 3000);
                                                                        }
                                                                    });
                                                                });
                                                                //document.getElementById(filename).style.display = 'none';
                                                            }

                                                            // DROPZONE JS
                                                            Dropzone.options.myDropzone = {// camelized version of the 'id'\\
                                                                autoProcessQueue: false,
                                                                uploadMultiple: true,
                                                                parallelUploads: 10,
                                                                //paramName: "file", // The name that will be used to transfer the file
                                                                addRemoveLinks: true,
                                                                maxFiles: 10, // Số ảnh tối đa
                                                                dictMaxFilesExceeded: "Tối đa 10 ảnh!",
                                                                dictRemoveFile: "<i class='bi bi-x-circle-fill'></i>",
                                                                dictCancelUpload: "",
                                                                dictCancelUploadConfirmation: null, // "Xác nhận dừng tải ảnh lên?",
                                                                // dictResponseError: "",
                                                                maxFilesize: 5,
                                                                dictFileTooBig: "File quá lớn ({{filesize}}MB). Kích thước tối đa: {{maxFilesize}}MB.",

                                                                init: function () {
                                                                    let submitButton = document.querySelector("#upload-file");
                                                                    upload = this;
                                                                    submitButton.addEventListener("click", function () {
                                                                        let formUpload = document.querySelector("#my-dropzone");
                                                                        console.log('submit');
                                                                        upload.processQueue();
                                                                    });
                                                                    this.on("sending", function (file, xhr, formData) {
                                                                        formData.append("hostelId", ${sessionScope.currentHostel.hostelID});
                                                                    });
                                                                    this.on("successmultiple", function () {
                                                                        let msg = document.querySelector("#success-upload-message");
                                                                        msg.classList.toggle("hidden");
                                                                        setTimeout(function () {
                                                                            window.location.reload();
                                                                        }, 2000);
                                                                    });
                                                                    this.on("maxfilesexceeded", function (file, message) {
                                                                        let form = document.querySelector("#my-dropzone");
                                                                        form.classList.remove('dz-max-files-reached');
                                                                        let msg = document.querySelector("#error-file-qty-message");
                                                                        msg.classList.remove("hidden");
                                                                        msg.classList.add("block");
                                                                        this.removeFile(file);
                                                                    });
                                                                    this.on("error", function (file, message) {
                                                                        if (message.startsWith('File quá lớn')) {
                                                                            console.log(message);
                                                                            let msg = document.querySelector("#error-file-size-message");
                                                                            msg.classList.remove("hidden");
                                                                            msg.classList.add("block");
                                                                            this.removeFile(file);
                                                                        }
                                                                    });
                                                                    this.on("removedfile", function (file) {
                                                                        console.log(file.name);
//                                                                jQuery.ajax({
//                                                                    type: 'POST',
//                                                                    data: 'name=' + file.name,
//                                                                    url: 'RemoveFileServlet'
//                                                                });
                                                                    });
                                                                }
                                                            };

                                                            function toggleSelectImage(event) {
                                                                let par = event.currentTarget.parentElement;
                                                                let imgEl = par.parentElement;
                                                                par.classList.toggle('checked-box');
                                                                //imgEl.classList.toggle('selected');

                                                                let id = event.currentTarget.value;
                                                                id1 = "tb_" + id;
                                                                let thumbnail = document.getElementById(id1);
                                                                thumbnail.classList.toggle('selected');
                                                                thumbnail.children[2].classList.toggle('checked-box');

                                                                id2 = "tb_ip_" + id;
                                                                let inputEl = document.getElementById(id2);
                                                                inputEl.checked = !inputEl.checked;

                                                                countSelectedImage();
                                                            }

                                                            function toggleSelectThumbnail(event) {
                                                                let par = event.currentTarget.parentElement;
                                                                let imgEl = par.parentElement;
                                                                par.classList.toggle('checked-box');
                                                                imgEl.classList.toggle('selected');

                                                                let id = event.currentTarget.value;
                                                                id1 = "ip_" + id;
                                                                let inputEl = document.getElementById(id1);
                                                                //console.log(inputEl);
                                                                inputEl.checked = !inputEl.checked;
                                                                inputEl.parentElement.classList.toggle('checked-box');
                                                                countSelectedImage();
                                                            }

                                                            function countSelectedImage() {
                                                                let images = document.querySelectorAll('.thumbnail.selected');
                                                                //console.log(images.length);
                                                                let msg = document.querySelector('#cnt-images');
                                                                console.log(images);
                                                                if (images === null)
                                                                    msg.innerHTML = "";
                                                                if (images.length !== 0)
                                                                    msg.innerHTML = "(Đã chọn: " + images.length + ")";
                                                                else
                                                                    msg.innerHTML = "";
                                                            }

                                                            function unselectAllImages() {
                                                                let images = document.querySelectorAll('.checkbox-input');
                                                                console.log(images);
                                                                images.forEach(e => {
                                                                    console.log(e.checked);
                                                                    let par = e.parentElement;
                                                                    let imgEl = par.parentElement;
                                                                    if (e.checked === true) {
                                                                        par.classList.toggle('checked-box');
                                                                        imgEl.classList.toggle('selected');
                                                                        e.checked = false;
                                                                    }
                                                                });
                                                                images.forEach(e => {
                                                                    console.log(e.checked);
                                                                });
                                                                countSelectedImage();
                                                            }

                                                            let chart = new Donutty(document.getElementById('donut-chart'), {
                                                                min: 0,
                                                                max: 5,
                                                                bg: '#e4ecf4',
                                                                value: ${requestScope.avgRating},
                                                                round: true,
                                                                color: '#17535B',
                                                                thickness: 4,
                                                                circle: false,
                                                                padding: 2,
                                                                text: function (state) {
                                                                    let label = state.value + " / 5";
                                                                    //return (state.value / (state.max - state.min) * 100) + "%";
                                                                    return label;
                                                                    // return the percentage of the donut
                                                                }

                                                            });
        </script>
    </body>
</html>
