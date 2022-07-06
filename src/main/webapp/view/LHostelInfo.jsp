<%-- 
    Document   : LHostelInfo
    Created on : Jul 4, 2022, 3:27:37 PM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý phòng thuê</title>

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
        <link rel="stylesheet" href="../assets/css/LOverView.css">

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/js/splide.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/css/splide.min.css">

        <style>
            * {
                font-family: 'Mulish', sans-serif;
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            .thumbnails {
                overflow-x: auto !important;
            }
            .thumbnail {
                min-width: 70px;
                height: 70px;
                list-style: none;
                margin: 0 2px;
                cursor: pointer;
                display: block;
            }

            .splide__slide img, .thumbnail img {
                width: 100% !important;
                height: 100% !important;
                object-fit: cover !important;
            }

            .thumbnail {
                opacity: 0.4;
            }

            .thumbnail.is-active {
                opacity: 1;
                border: 2px solid #17535B;
            }
        </style>
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
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
                                         xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                    </path>
                                    </svg>
                                    Thông tin nhà trọ
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
                                    <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">${sessionScope.currentHostel.hostelName}</span>
                                </div>
                            </li> 
                        </ol>
                    </nav>

                    <div class="flex items-center">
                        <div class="flex items-center mr-[20px]">
                            <div class="flex items-center mr-[20px]">
                                <h3 class="text-sm font-medium text-gray-400 mr-[10px]">Chọn nhà trọ: </h3>
                                <button type="button" data-modal-toggle="hostelModal"
                                        class="rounded w-fit h-[30px] px-[20px] bg-[#288D87] hover:bg-[#248781] flex flex justify-between items-center">
                                    <p class="font-medium text-[15px] text-[#fff]">${sessionScope.currentHostel.hostelName}</h3>
                                </button>
                            </div>
                            <button type="button" data-modal-toggle="editHostel"
                                    class="mr-[20px] rounded w-[150px] h-[30px] bg-[#fff] border order-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                                <p class="font-normal text-[15px] text-gray-400 group-hover:text-[#288D87]">Chỉnh sửa nhà trọ</p>
                            </button>
                            <button type="button" data-modal-toggle="deleteHostel"
                                    class="mr-[20px] rounded w-[150px] h-[30px] bg-[#fff] border order-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                                <p class="font-normal text-[15px] text-gray-400 group-hover:text-[#288D87]">Xóa nhà trọ này</p>
                            </button>

                        </div>
                        <button type="button" data-modal-toggle="addHostel"
                                class="rounded w-[150px] h-[30px] bg-[#fff] border order-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                            <p class="font-normal text-[15px] text-gray-400 group-hover:text-[#288D87]"><i class="bi bi-plus-lg mr-[5px]"></i>Thêm nhà trọ</p>
                        </button>

                    </div>
                    <!-- Modal list-->
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
                    <div id="editHostel" tabindex="-1" aria-hidden="true"
                         class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                            <div class="relative bg-white rounded-lg shadow">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b">
                                    <h3 class="text-xl font-semibold text-gray-900">
                                        Chỉnh sửa
                                    </h3>
                                    <p class="text-xs updateHostelMessage"></p>
                                    <button type="button"
                                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center"
                                            data-modal-toggle="editHostel">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                             xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                              clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </div>

                                <div class="p-4">
                                    <input type="hidden" name="landlordId" value="${sessionScope.currentUser.account.accountID}"/>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Tên nhà trọ mới</label>
                                        <input type="text" name="updateName" class="text-sm p-1" onkeyup="checkValidHostel(this)"/>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Chọn tỉnh</label>
                                        <select id="updateProvince" class="w-[200px] p-1" name="updateProvinceId" onchange="renderDistrictSimple(this)">
                                            <c:forEach items="${requestScope.provinceList}" var="province">
                                                <option value="${province.provinceID}">${province.provinceName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Chọn huyện</label>
                                        <select id="updateDistrict" name="updateDistrictId" class="w-[200px] p-1">
                                            <c:forEach items="${requestScope.districtList}" var="district">
                                                <option value="${district.districtID}">${district.districtName}</option>
                                            </c:forEach>
                                        </select> 
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Địa chỉ chi tiết</label>
                                        <input type="text" name="updateStreetAddress" class="w-[400px] text-sm p-1">
                                        <p class="ml-[200px] text-xs">(Nhập đến cấp phường/xã) VD: 100 Lê Việt - Tăng Nhơn Phú</p>
                                    </div>
                                    <div class="my-2">
                                        <label class="relative top-[-24px] w-[160px] inline-block" for="">Mô tả</label>
                                        <textarea class="text-sm p-1" name="updateDescription" id="" cols="48" rows="2">abcxyz</textarea>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Thêm Hình ảnh</label>
                                        <input type="file" multiple rounded />
                                    </div>
                                </div>
                                <div class="grid justify-items-end">
                                    <button class="updateHostelBtn px-8 py-2 mx-4 my-2 border-2 rounded" onclick="updateHostel()">Xác nhận</button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div id="deleteHostel" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 md:inset-0 h-modal md:h-full">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
                            <div class="relative bg-white rounded shadow">
                                <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="deleteHostel">
                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                </button>
                                <div class="p-6 text-center">
                                    <svg class="mx-auto mb-4 w-14 h-14 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                    <h3 class="mb-5 text-lg font-normal text-gray-500">Nhà trọ này hiện đang có 10 phòng và 12 yêu cầu thuê phòng. Dữ liệu sẽ bị mất nếu như bạn xóa. <p>Bạn có chắc chắn muốn xóa?</p></h3>
                                    <button data-modal-toggle="deleteHostel" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                                        Tôi chắc chắn
                                    </button>
                                    <button data-modal-toggle="deleteHostel" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">Hủy bỏ</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="addHostel" tabindex="-1" aria-hidden="true"
                         class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                            <div class="relative bg-white rounded shadow">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b">
                                    <h3 class="text-xl font-semibold text-gray-900">
                                        Thêm nhà trọ mới
                                    </h3>
                                    <p class="text-xs addHostelMessage"></p>
                                    <button type="button"
                                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center"
                                            data-modal-toggle="addHostel">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                             xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                              clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </div>

                                <div class="p-4">
                                    <input type="hidden" name="landlordId" value="${sessionScope.currentUser.account.accountID}"/>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Tên nhà trọ mới</label>
                                        <input type="text" name="name" class="text-sm p-1" onkeyup="checkValidHostel(this)"/>
                                        <span class="text-xs validHostelMessage"></span>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Chọn tỉnh</label>
                                        <select id="province" class="w-[200px] p-1" name="provinceId" onchange="renderDistrictSimple(this)">
                                            <c:forEach items="${requestScope.provinceList}" var="province">
                                                <option value="${province.provinceID}">${province.provinceName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Chọn huyện</label>
                                        <select id="district" name="districtId" class="w-[200px] p-1">
                                            <c:forEach items="${requestScope.districtList}" var="district">
                                                <option value="${district.districtID}">${district.districtName}</option>
                                            </c:forEach>
                                        </select> 
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Địa chỉ chi tiết</label>
                                        <input type="text" name="streetAddress" class="w-[400px] text-sm p-1">
                                        <p class="ml-[200px] text-xs">(Nhập đến cấp phường/xã) VD: 100 Lê Việt - Tăng Nhơn Phú</p>
                                    </div>
                                    <div class="my-2">
                                        <label class="relative top-[-24px] w-[160px] inline-block" for="">Mô tả</label>
                                        <textarea class="text-sm p-1" name="description" id="" cols="48" rows="2">abcxyz</textarea>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Thêm Hình ảnh</label>
                                        <input type="file" multiple rounded />
                                    </div>
                                </div>
                                <div class="grid justify-items-end">
                                    <button class="addHostelBtn px-8 py-2 mx-4 my-2 border-2 rounded" onclick="addHostel()">Xác nhận</button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- End modal list-->
                    <!-- End breadcrumb -->
                </div>

                <!-- General information -->
                <div class="statistic flex justify-between mt-[20px] grid grid-cols-5 gap-5">
                    <div class="card bg-[#fff] p-5 flex flex-col col-span-2">
                        <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px]">Thông tin cơ bản
                        </div>
                        <div class="w-full h-fit mx-auto">
                            <p>Mã nhà trọ: <span>${sessionScope.currentHostel.hostelID}</span></p>
                            <p>Tên nhà trọ: <span>${sessionScope.currentHostel.hostelName}</span></p>
                            <p>Trạng thái: <span>${sessionScope.currentHostel.activate == true ? 'Đang hoạt động' : 'Đóng cửa'}</span></p>
                            <p>Ngày tạo: <span>${sessionScope.currentHostel.registeredDate}</span></p>
                            <p>Địa chỉ: <span>${sessionScope.currentHostel.streetAddress}, ${sessionScope.currentHostel.district.districtName}, ${sessionScope.currentHostel.district.province.provinceName}</span></p>

                            <p>Số phòng: <span>${sessionScope.currentHostel.totalRoom}</span></p>
                            <p>Phòng trống: <span>${sessionScope.currentHostel.availableRoom}</span></p>

                            <p>Giá thuê: <span>${sessionScope.currentHostel.minPrice} VNĐ - ${sessionScope.currentHostel.maxPrice} VNĐ</span></p>
                            <p>Diện tích phòng: <span>${sessionScope.currentHostel.minArea}m<sup>2</sup> - ${sessionScope.currentHostel.maxArea}m<sup>2</sup></span></p>

                            <p>Mô tả: <span>${sessionScope.currentHostel.description}</span></p>
                        </div>
                    </div>

                    <div class="col-span-3">
                        <div class="card bg-[#fff] p-5 flex flex-col">
                            <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                                <p>Hình ảnh</p>
                                <a href="#" class="text-[15px] font-light flex items-baseline">
                                    <p><i class="bi bi-plus-lg mr-[5px]"></i>Thêm hình ảnh</p>
                                </a>
                            </div>
                            <div class="relative w-full h-fit mx-auto">
                                <section id="main-carousel" class="splide w-full" aria-label="My Awesome Gallery">
                                    <div class="splide__track w-full">
                                        <ul class="splide__list">
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/05072019084505212-ccasa-hostel.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/095d67bac50164f31090ee05d767e748.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/10-fedora-hostel-danang-vntrip-e1528450335353.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/10-hostel-fedora-vntrip-e1528450347200.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/16_80-e1544617090945.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/172549149.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                            <li class="splide__slide">
                                                <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                            </li>
                                        </ul>
                                    </div>
                                </section>

                                <ul id="thumbnails" class="thumbnails w-full min-w-0 flex mt-[10px] p-0">
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/05072019084505212-ccasa-hostel.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/095d67bac50164f31090ee05d767e748.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/10-fedora-hostel-danang-vntrip-e1528450335353.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/10-hostel-fedora-vntrip-e1528450347200.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/16_80-e1544617090945.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/172549149.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                    <li class="thumbnail">
                                        <img src="../assets/images/hostel-list-images/20200722144822-8bf2.jpg" alt="">
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Requests -->
                <div class="statistic flex justify-between mt-[20px] grid grid-cols-3 gap-[20px]">
                    <div class="card w-full bg-[#fff] p-5 flex flex-col">
                        <div class="text-[20px] font-bold text-[#2A3C46] self-start pb-[20px]">Đánh giá
                        </div>
                        <div class="w-full h-full mx-auto">
                            <div class="relative overflow-x-auto">
                                <canvas id="myChart"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Rating -->
                    <div class="card col-span-2 w-full bg-[#fff] p-5 flex flex-col">
                        <div class="text-[20px] font-bold text-[#2A3C46] self-start pb-[20px]">Chi tiết đánh giá
                        </div>
                        <div class="w-full h-full mx-auto">
                            <div class="relative overflow-x-auto">
                                <table class="w-full text-sm text-left text-gray-500">
                                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 ">
                                        <tr>
                                            <th scope="col" class="px-6 py-3">
                                                Nhà trọ
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                                Trung bình
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                                Số đánh giá
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <td class="px-6 py-4">
                                                An Khang
                                            </td>
                                            <td class="px-6 py-4 text-[#FFB03A]">
                                                4.8 / 5 <i class="bi bi-star-fill"></i>
                                            </td>
                                            <td class="px-6 py-4">
                                                53 lượt
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- End Statistics -->
            </div>

            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="../assets/javascript/chart/hostel-feedback.js"></script>
        <script type="text/javascript">
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
        </script>
    </body>
</html>
