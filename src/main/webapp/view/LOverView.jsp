<%-- 
    Document   : LOverView
    Created on : Jun 26, 2022, 9:25:17 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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

    </head>

    <body>
        <%@include file="../view/LControllBar.jsp" %>

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
                                    Tổng quan
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
                                    <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Danh sách
                                        hoá đơn</span>
                                </div>
                            </li> -->
                        </ol>
                    </nav>

                    <div class="flex items-center">
                        <div class="flex items-center mr-[20px]">
                            <h3 class="text-sm font-medium text-gray-400 mr-[10px]">Chọn nhà trọ: </h3>
                            <button type="button" data-modal-toggle="hostelModal"
                                    class="rounded w-fit h-[30px] px-[20px] bg-[#288D87] hover:bg-[#248781] flex flex justify-between items-center">
                                <h3 class="font-medium text-[15px] text-[#fff]">${sessionScope.currentHostel.hostelName}</h3>
                            </button>
                            <button type="button" data-modal-toggle="editHostel"
                                    class="rounded w-[150px] h-[30px] bg-[#fff] border order-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                                <p class="font-normal text-[15px] text-gray-400 group-hover:text-[#288D87]">Chỉnh sửa nhà trọ</p>
                            </button>
                            <button
                                class="w-fit inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                type="button" data-modal-toggle="deleteHostel">
                                Xóa nhà trọ này
                            </button>


                        </div>
                        <button type="button" data-modal-toggle="addHostel"
                                class="rounded w-[150px] h-[30px] bg-[#fff] border order-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                            <p class="font-normal text-[15px] text-gray-400 group-hover:text-[#288D87]">Thêm nhà trọ <i
                                    class="bi bi-plus-lg"></i></p>
                        </button>

                    </div>
                    <!-- Modal list-->
                    <div id="hostelModal" tabindex="-1" aria-hidden="true"
                         class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Chọn nhà trọ
                                    </h3>
                                    <button type="button"
                                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
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

                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Chỉnh sửa
                                    </h3>
                                    <p class="text-xs addHostelMessage"></p>
                                    <button type="button"
                                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
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
                    <div id="deleteHostel" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 md:inset-0 h-modal md:h-full">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="deleteHostel">
                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                </button>
                                <div class="p-6 text-center">
                                    <svg class="mx-auto mb-4 w-14 h-14 text-gray-400 dark:text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                    <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Nhà trọ này hiện đang có 10 phòng và 12 yêu cầu thuê phòng. Dữ liệu sẽ bị mất nếu như bạn xóa. <p>Bạn có chắc chắn muốn xóa?</p></h3>
                                    <button data-modal-toggle="deleteHostel" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 dark:focus:ring-red-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                                        Tôi chắc chắn
                                    </button>
                                    <button data-modal-toggle="deleteHostel" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">Hủy bỏ</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="addHostel" tabindex="-1" aria-hidden="true"
                         class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Thêm nhà trọ mới
                                    </h3>
                                    <p class="text-xs addHostelMessage"></p>
                                    <button type="button"
                                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
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
                <div class="general-info flex justify-between mt-[20px] grid grid-16 gap-[20px]">
                    <a href="#"
                       class="card col-span-2 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                        <div class="overall-info-head">
                            <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Số
                                phòng trọ</h3>
                        </div>
                        <div class="overall-info-content ">
                            <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">${sessionScope.currentHostel.totalRoom}</p>
                        </div>
                    </a>
                    <a href="#"
                       class="card col-span-2 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                        <div class="overall-info-head">
                            <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Số
                                người thuê</h3>
                        </div>
                        <div class="overall-info-content ">
                            <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">${sessionScope.currentHostel.totalRoom - sessionScope.currentHostel.availableRoom}</p>
                        </div>
                    </a>
                    <a href="#"
                       class="card col-span-2  overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                        <div class="overall-info-head">
                            <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Số cư
                                dân</h3>
                        </div>
                        <div class="overall-info-content ">
                            <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">46</p>
                        </div>
                    </a>
                    <a href="#"
                       class="card col-span-3 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                        <div class="overall-info-head">
                            <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Doanh
                                thu năm</h3>
                        </div>
                        <div class="overall-info-content ">
                            <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">650.000.000</p>
                        </div>
                    </a>
                    <a href="#"
                       class="card col-span-3 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                        <div class="overall-info-head">
                            <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Tổng
                                doanh thu</h3>
                        </div>
                        <div class="overall-info-content ">
                            <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">1.870.460.000</p>
                        </div>
                    </a>
                    <div href="#"
                         class="card rounded col-span-4 overall-info h-[120px] bg-[#fff] group relative">
                        <div
                            class="overall-info-head h-[30%] bg-[#F5FDFA] flex flex-col justify-center items-end pr-[10px]">
                            <p class="text-[14px] font-medium text-[#17535B]">Trang quản lý dành cho chủ nhà</p>
                        </div>
                        <div class="desc h-[70%] px-[20px] flex items-center">
                            <div class="user-ava mr-[20px] inline-block border border-[3px] border-[#fff] rounded-full ">
                                <img class="w-14 h-14 rounded-full" src="${sessionScope.currentUser.account.avatar}" alt="Jese Leos image" />
                            </div>
                            <div class="user-info text-[14px] font-normal text-[#7B8692]">
                                <p><span class="text-[#40576C] font-bold">${sessionScope.currentUser.fullname}</span> - ${sessionScope.currentUser.account.username}</p>
                                <p>${sessionScope.currentUser.account.email}</p>
                                <p>${sessionScope.currentUser.phone}</p>
                            </div>

                        </div>
                    </div>

                </div>
                <!-- End general information -->

                <!-- Statistics -->
                <div class="statistic flex justify-between mt-[20px] grid grid-cols-4 grid-rows-2 gap-5">
                    <div class="card chart bg-[#fff] p-5 flex flex-col col-span-3 row-span-2">
                        <div class="text-[20px] font-bold text-[#2A3C46] self-center pb-[20px]">Thống kê doanh thu
                        </div>
                        <div class="w-[90%] h-[90%] mx-auto">
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>

                    <div class="grid grid-rows-2 row-span-2">
                        <div class="card room-member bg-[#fff] p-5 flex flex-col">
                            <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                                <p>Doanh thu</p>
                                <!-- Hiển thị doanh thu 5 tháng gần đây nhất -->
                                <a href="#" class="text-[15px] font-light flex items-baseline">
                                    <p><i class="bi bi-box-arrow-up-right text-[12px]"></i> </p>
                                    <p class="translate-y-[3px] ml-[5px]">Xem chi tiết</p>
                                </a>
                            </div>
                            <div class="relative overflow-y-auto">
                                <table class="w-full text-sm text-left text-gray-500">
                                    <tbody>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                06 / 2022
                                            </th>
                                            <td class="px-6 py-4">
                                                đ60.500.000
                                            </td>
                                            <td class="px-6 py-4 text-right">
                                                <a href="#" class="font-medium text-[#288D87] hover:underline"><i
                                                        class="bi bi-eye-fill"></i></a>
                                            </td>
                                        </tr>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                05 / 2022
                                            </th>
                                            <td class="px-6 py-4">
                                                đ85.900.000
                                            </td>
                                            <td class="px-6 py-4 text-right">
                                                <a href="#" class="font-medium text-[#288D87] hover:underline"><i
                                                        class="bi bi-eye-fill"></i></a>
                                            </td>
                                        </tr>
                                        <tr class="bg-white hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                04 / 2020
                                            </th>
                                            <td class="px-6 py-4">
                                                đ89.700.00
                                            </td>
                                            <td class="px-6 py-4 text-right">
                                                <a href="#" class="font-medium text-[#288D87] hover:underline"><i
                                                        class="bi bi-eye-fill"></i></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="card room-member bg-[#fff] p-5 flex flex-col mt-[20px]">
                            <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                                <p>Tháng 6 / 2022</p>
                                <a href="#" class="text-[15px] font-light flex items-baseline">
                                    <p><i class="bi bi-box-arrow-up-right text-[12px]"></i> </p>
                                    <p class="translate-y-[3px] ml-[5px]">Xem chi tiết</p>
                                </a>
                            </div>
                            <div class="relative overflow-x-auto">
                                <table class="w-full text-sm text-left text-gray-500">
                                    <tbody>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                Doanh thu
                                            </th>
                                            <td class="px-6 py-4">
                                                0020354
                                            </td>
                                        </tr>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                Thay đổi so với tháng trước
                                            </th>
                                            <td class="px-6 py-4 text-[#1CBA8B]">
                                                12% <i class="bi bi-arrow-up"></i>
                                            </td>
                                        </tr>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                Thay đổi so với tháng trước
                                            </th>
                                            <td class="px-6 py-4 text-[#FF5757]">
                                                4% <i class="bi bi-arrow-down"></i>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="mt-[20px] text-[15px] font-light text-[#929CA5]">
                                <em>(tóm tắt tính hình tháng mới nhất)</em>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Requests -->
                <div class="statistic flex justify-between mt-[20px] grid grid-cols-2 gap-[20px]">
                    <div class="card w-full bg-[#fff] p-5 flex flex-col">
                        <div class="text-[20px] font-bold text-[#2A3C46] self-start pb-[20px]">Yêu cầu thuê phòng
                        </div>
                        <div class="w-full h-full mx-auto">
                            <div class="relative overflow-x-auto">
                                <table class="w-full text-sm text-left text-gray-500">
                                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 ">
                                        <tr>
                                            <th scope="col" class="px-6 py-3">
                                                Thời gian
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                                Nội dung
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                                Đã xử lý
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Chưa xử lý -->
                                        <tr class="bg-white border-b hover:bg-gray-50 text-[#17535B] font-medium">
                                            <td class="px-6 py-4">
                                                16:04 - 05/05/2022
                                            </td>
                                            <td class="px-6 py-4">
                                                Nguyễn Văn An yêu cầu thuê phòng A1, nhà trọ An Khang
                                            </td>
                                            <td class="px-6 py-4 flex justify-center">
                                                <input checked id="teal-checkbox" type="checkbox" value=""
                                                       class="w-4 h-4 text-teal-600 bg-gray-100 rounded border-[#17535B] focus:ring-[#17535B] focus:ring-2 duration-200">

                                            </td>
                                        </tr>
                                        <!-- Đã xử lý -->
                                        <tr class="bg-white border-b hover:bg-gray-50 text-[#929CA5]">
                                            <td class="px-6 py-4">
                                                16:04 - 05/05/2022
                                            </td>
                                            <td class="px-6 py-4">
                                                Nguyễn Văn An yêu cầu thuê phòng A1, nhà trọ An Khang
                                            </td>
                                            <td class="px-6 py-4 flex justify-center">
                                                <input checked id="teal-checkbox" type="checkbox" value=""
                                                       class="w-4 h-4 text-teal-600 bg-gray-100 rounded border-[#17535B] focus:ring-[#17535B] focus:ring-2 duration-200">

                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Rating -->
                    <div class="card w-full bg-[#fff] p-5 flex flex-col">
                        <div class="text-[20px] font-bold text-[#2A3C46] self-start pb-[20px]">Đánh giá
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
        <script src="js/chart.js"></script>
        <!-- Breadcrumb -->
        <script src="js/breadcrumb.js"></script>
        <script src="../assets/javascript/jquery/jquery.min.js"></script>
        <script src="../assets/javascript/render-district.js"></script>
        <script>
                                        function addHostel() {
                                            const name = document.querySelector("input[name='name']");
                                            const districtId = document.querySelector("select[name='districtId']");
                                            const streetAddress = document.querySelector("input[name='streetAddress']");
                                            const description = document.querySelector("textarea[name='description']");
                                            const landlordId = document.querySelector("input[name='landlordId']");
                                            const addHostelMessage = document.querySelector(".addHostelMessage");
                                            jQuery.ajax({
                                                type: 'POST',
                                                data: {'name': name.value,
                                                    'districtId': districtId.value,
                                                    'streetAddress': streetAddress.value,
                                                    'description': description.value,
                                                    'landlordId': landlordId.value
                                                },
                                                url: '/sakura/landlord/add-hostel',
                                                success: function (response) {
                                                    name.value = "";
                                                    districtId.value = "";
                                                    streetAddress.value = "";
                                                    description.value = "";
                                                    addHostelMessage.innerHTML = response;
                                                },
                                                error: function () {
                                                },
                                                complete: function (result) {
                                                }
                                            });
                                        }
        </script>
        <script>
            function checkValidHostel(element) {
                const validHostelMessage = document.querySelector(".validHostelMessage");
                const landlordId = document.querySelector("input[name='landlordId']");
                const adddHostelBtn = document.querySelector(".addHostelBtn");
                console.log("da vao checkvalidhostel")
                jQuery.ajax({
                    type: 'POST',
                    data: {'hostelName': element.value,
                        'landlordId': landlordId.value
                    },
                    url: '/sakura/landlord/check-hostel-valid',
                    success: function (response) {
                        validHostelMessage.innerHTML = response;
                        if (response) {
                            adddHostelBtn.onclick = (e) => {
                                e.preventDefault();
                            }
                        } else {
                            adddHostelBtn.onclick = (e) => {
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

            function renderDistrictSimple(element) {
                var provinceID = element.value;
                var districtElemet = document.querySelector('#district');
                jQuery.ajax({
                    type: 'POST',
                    data: {'provinceID': provinceID
                    },
                    url: '/sakura/hostel/address',
                    success: function (response) {
                        districtElemet.innerHTML = response;
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
