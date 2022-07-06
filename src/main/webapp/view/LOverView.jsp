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
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>

        <c:if test="${sessionScope.currentUser == null}">
            <p>Bạn phải đăng nhập để xem trang này</p>
        </c:if>

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
                        <c:if test="${sessionScope.currentHostel != null}">
                            <div class="flex items-center mr-[20px]">
                                <div class="flex items-center mr-[20px]">
                                    <h3 class="text-sm font-medium text-gray-400 mr-[10px]">Chọn nhà trọ: </h3>
                                    <button type="button" data-modal-toggle="hostelModal"
                                            class="rounded w-fit h-[30px] px-[20px] bg-[#288D87] hover:bg-[#248781] flex flex justify-between items-center">
                                        <p class="font-medium text-[15px] text-[#fff]">${sessionScope.currentHostel.hostelName}</p>
                                    </button>
                                </div>
                                <button id="editHostel-1" type="submit" name="action" value="Save"
                                        class="w-[120px] h-[45px] bg-[#17535B] text-[#f6fafc] rounded">
                                    Chỉnh sửa nhà trọ
                                </button>
                                <button id="deleteHostel-1" type="submit" name="action" value="Save"
                                        class="w-[120px] h-[45px] bg-[#17535B] text-[#f6fafc] rounded">
                                    Xóa nhà trọ này
                                </button>
                            </div>
                        </c:if>
                        <!-- ---------------------------------------------------------------------------------- -->
                        <div class="bg-[#f7f7fa]">
                            <div class="bg-[#fff] rounded shadow">
                                <!-- Modal toggle -->
                                <button id="addHostel-1" type="submit" name="action" value="Save"
                                        class="w-[120px] h-[45px] bg-[#17535B] text-[#f6fafc] rounded">
                                    Thêm nhà trọ
                                </button>

                                <!--Modal-->
                                <div
                                    class="addHostelmodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                    <div
                                        class="modal-container bg-white w-5/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                        <div
                                            class="addHostelmodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
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
                                                <p class="text-2xl font-bold">Thêm nhà trọ mới</p>
                                                <div
                                                    class="addHostelmodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
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
                                                <input type="hidden" name="landlordId" value="${sessionScope.currentUser.account.accountID}"/>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Tên nhà trọ mới</label>
                                                    <input type="text" required name="name" class="text-sm p-1" onkeyup="checkValidHostel(this)"/>
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
                                                    <input type="text" name="streetAddress" required class="w-[400px] text-sm p-1">
                                                    <p class="ml-[200px] text-xs">(Nhập đến cấp phường/xã) VD: 100 Lê Việt - Tăng Nhơn Phú</p>
                                                </div>
                                                <div class="my-2">
                                                    <label class="relative top-[-24px] w-[160px] inline-block" for="">Mô tả</label>
                                                    <textarea required class="text-sm p-1" name="description" id="" cols="48" rows="2"></textarea>
                                                </div>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Thêm Hình ảnh</label>
                                                    <input required type="file" multiple rounded />
                                                </div>
                                            </div>
                                            <!--Footer-->
                                            <div class="flex justify-end p-[20px]">
                                                <button
                                                    class="addHostelmodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                                                <button id="addHostel-2" onclick="addHostel()"
                                                        class="addHostelBtn px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal 2-->
                                <div
                                    class="addHostelmodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                    <div
                                        class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                        <div
                                            class="addHostelmodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
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
                                                    class="addHostelmodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
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
                                                <p class="addHostelMessage"></p>
                                            </div>
                                            <!--Footer-->
                                            <div class="flex justify-end p-[20px]">
                                                <button
                                                    class="addHostelmodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                                                <c:if test="${sessionScope.needReload == true}">
                                                    <form action="/sakura/landlord/overview">
                                                        <button type="submit"
                                                                class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                                                        </button>
                                                    </form>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ---------------------------------------------------------------------------------- -->
                    </div>
                    <!-- Modal list-->
                    <c:if test="${sessionScope.currentHostel != null}">
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

                        <!-- ---------------------------------------------------------------------------------- -->
                        <div class="bg-[#f7f7fa]">
                            <div class="bg-[#fff] rounded shadow">
                                <!--Modal-->
                                <div
                                    class="editHostelmodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                    <div
                                        class="modal-container bg-white w-5/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                        <div
                                            class="editHostelmodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
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
                                                <p class="text-2xl font-bold">Chỉnh sửa nhà trọ</p>
                                                <div
                                                    class="editHostelmodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
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
                                                <input type="hidden" name="hostelId" value="${sessionScope.currentHostel.hostelID}"/>
                                                <input type="hidden" name="landlordId" value="${sessionScope.currentUser.account.accountID}"/>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Tên nhà trọ</label>
                                                    <input type="hidden" required name="currentName" value="${sessionScope.currentHostel.hostelName}"/>
                                                    <input type="text" name="updateName" value="${sessionScope.currentHostel.hostelName}" class="text-sm p-1" onkeyup="checkValidUpdateHostel(this)"/>
                                                    <span class="text-xs validUpdateHostelMessage"></span>
                                                </div>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Chọn tỉnh</label>
                                                    <select id="updateProvince" class="w-[200px] p-1" name="updateProvinceId" onchange="renderDistrictSimple(this)">
                                                        <c:forEach items="${requestScope.provinceList}" var="province">
                                                            <c:if test="${province.provinceID == sessionScope.currentHostel.district.province.provinceID}">
                                                                <option selected value="${province.provinceID}">${province.provinceName}</option>
                                                            </c:if>
                                                            <c:if test="${province.provinceID != sessionScope.currentHostel.district.province.provinceID}">
                                                                <option value="${province.provinceID}">${province.provinceName}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Chọn huyện</label>
                                                    <select id="updateDistrict" name="updateDistrictId" class="w-[200px] p-1">
                                                        <c:forEach items="${requestScope.currentDistrictList}" var="district">
                                                            <c:if test="${district.districtID == sessionScope.currentHostel.district.districtID}">
                                                                <option selected value="${district.districtID}">${district.districtName}</option>
                                                            </c:if>
                                                            <c:if test="${district.districtID != sessionScope.currentHostel.district.districtID}">
                                                                <option value="${district.districtID}">${district.districtName}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select> 
                                                </div>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Địa chỉ chi tiết</label>
                                                    <input type="text" required name="updateStreetAddress" value="${sessionScope.currentHostel.streetAddress}" class="w-[400px] text-sm p-1">
                                                    <p class="ml-[200px] text-xs">(Nhập đến cấp phường/xã) VD: 100 Lê Việt - Tăng Nhơn Phú</p>
                                                </div>
                                                <div class="my-2">
                                                    <label class="relative top-[-24px] w-[160px] inline-block" for="">Mô tả</label>
                                                    <textarea class="text-sm p-1" required name="updateDescription" id="" cols="48" rows="2">${sessionScope.currentHostel.description}</textarea>
                                                </div>
                                                <div class="my-2">
                                                    <label class="w-[160px] inline-block" for="">Thêm Hình ảnh</label>
                                                    <input type="file" required multiple rounded />
                                                </div>
                                            </div>
                                            <!--Footer-->
                                            <div class="flex justify-end p-[20px]">
                                                <button
                                                    class="editHostelmodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                                                <button id="editHostel-2" onclick="updateHostel()"
                                                        class="updateHostelBtn px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal 2-->
                                <div
                                    class="editHostelmodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                    <div
                                        class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                        <div
                                            class="editHostelmodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
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
                                                    class="editHostelmodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
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
                                                <p class="updateHostelMessage"></p>
                                            </div>
                                            <!--Footer-->
                                            <div class="flex justify-end p-[20px]">
                                                <button
                                                    class="editHostelmodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                                                <c:if test="${sessionScope.needReload == true}">
                                                    <form action="/sakura/landlord/overview">
                                                        <input type="hidden" name="hostelId" value="${sessionScope.currentHostel.hostelID}"/>
                                                        <button type="submit"
                                                                class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                                                        </button>
                                                    </form>
                                                </c:if>
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
                                <!--Modal-->
                                <div
                                    class="deleteHostelmodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                    <div
                                        class="modal-container bg-white w-3/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                        <div
                                            class="deleteHostelmodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
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
                                                <p class="text-2xl font-bold">Xóa nhà trọ</p>
                                                <div
                                                    class="deleteHostelmodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
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
                                                <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Tất cả dữ liệu về phòng, hợp đồng, hóa đơn liên quan đến nhà trọ ${sessionScope.currentHostel.hostelName} sẽ bị xóa. <p>Bạn có chắc chắn muốn xóa?</p></h3>
                                                <input type="hidden" name="deleteHostelId" value="${sessionScope.currentHostel.hostelID}"/>
                                            </div>
                                            <!--Footer-->
                                            <div class="flex justify-end p-[20px]">
                                                <button
                                                    class="deleteHostelmodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                                                <button id="deleteHostel-2" onclick="deleteHostel()"
                                                        class="deleteHostelBtn px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Chắc chắn</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal 2-->
                                <div
                                    class="deleteHostelmodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                                    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                    <div
                                        class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                        <div
                                            class="deleteHostelmodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
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
                                                    class="deleteHostelmodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
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
                                                <p class="deleteHostelContent"></p>
                                            </div>
                                            <!--Footer-->
                                            <div class="flex justify-end p-[20px]">
                                                <button
                                                    class="deleteHostelmodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
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
                    </c:if>
                    <!-- End modal list-->
                    <!-- End breadcrumb -->
                </div>


                <!-- General information -->
                <c:if test="${sessionScope.currentHostel != null}">
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
                                    <img class="w-14 h-14 rounded-full" src="${empty sessionScope.currentUser.account.avatar ? "/sakura/assets/images/user-avatars/no_ava.jpg" : sessionScope.currentUser.account.avatar}" alt="" />
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
                </c:if>
                <!-- End Statistics -->
                <c:if test="${sessionScope.currentHostel == null}">
                    <h1>Bạn chưa có phòng trọ nào</h1>
                </c:if>
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
                                                        console.log("da vao add hostel");
                                                        const name = document.querySelector("input[name='name']");
                                                        const districtId = document.querySelector("select[name='districtId']");
                                                        const streetAddress = document.querySelector("input[name='streetAddress']");
                                                        const description = document.querySelector("textarea[name='description']");
                                                        const landlordId = document.querySelector("input[name='landlordId']");
                                                        const addHostelMessage = document.querySelector(".addHostelMessage");
                                                        if (!name.value || !streetAddress.value || !description.value) {
                                                            let message = "";
                                                            if (!name.value) {
                                                                message += "Tên nhà trọ - ";
                                                            }
                                                            if (!streetAddress.value) {
                                                                message += "Địa chỉ chi tiết - ";
                                                            }
                                                            if (!description.value) {
                                                                message += "Mô tả ";
                                                            }
                                                            message += "không được trống";

                                                            addHostelMessage.innerHTML = message;
                                                        } else {
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
                                                    }
        </script>
        <script>
            function checkValidHostel(element) {
                const validHostelMessage = document.querySelector(".validHostelMessage");
                const landlordId = document.querySelector("input[name='landlordId']");
                const adddHostelBtn = document.querySelector(".addHostelBtn");
                const addHostelMessage = document.querySelector(".addHostelMessage");
                console.log("da vao checkvalidhostel");
                console.log(element.value);
                console.log(landlordId.value);
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
                                addHostelMessage.innerHTML = "Tên nhà trọ không được trùng lặp";
                                e.preventDefault();
                            }
                        } else {
                            adddHostelBtn.onclick = () => addHostel();
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
            function deleteHostel() {

                const deleteHostelContent = document.querySelector(".deleteHostelContent");
                const deleteHostelId = document.querySelector("input[name='deleteHostelId']");
                const deleteHostenBtn = document.querySelector(".deleteHostenBtn");

                jQuery.ajax({
                    type: 'POST',
                    data: {'deleteHostelId': deleteHostelId.value
                    },
                    url: '/sakura/landlord/delete-hostel',
                    success: function (response) {
                        deleteHostelContent.innerHTML = response;
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }
        </script>

        <script>
            function checkValidUpdateHostel(element) {
                console.log("Da vao check update hostel");
                const validUpdateHostelMessage = document.querySelector(".validUpdateHostelMessage");
                const landlordId = document.querySelector("input[name='landlordId']");
                const updateHostelBtn = document.querySelector(".updateHostelBtn");
                const currentName = document.querySelector("input[name='currentName']");
                const updateHostelMessage = document.querySelector(".updateHostelMessage");
                jQuery.ajax({
                    type: 'POST',
                    data: {'updateName': element.value,
                        'landlordId': landlordId.value,
                        'currentName': currentName.value
                    },
                    url: '/sakura/landlord/check-update-hostel-valid',
                    success: function (response) {
                        validUpdateHostelMessage.innerHTML = response;
                        if (response) {
                            updateHostelBtn.onclick = (e) => {
                                e.preventDefault();
                                updateHostelMessage.innerHTML = "Tên nhà trọ không được trùng lặp!";
                            }
                        } else {
                            updateHostelBtn.onclick = () => updateHostel();
                        }
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }

            function updateHostel() {

                const name = document.querySelector("input[name='updateName']");
                const updateDistrictId = document.querySelector("select[name='updateDistrictId']");
                const updateStreetAddress = document.querySelector("input[name='updateStreetAddress']");
                const description = document.querySelector("textarea[name='updateDescription']");
                const messageElement = document.querySelector(".updateHostelMessage");
                const hostelId = document.querySelector("input[name='hostelId']");
                if (!name.value || !streetAddress.value || !description.value) {
                    let message = "";
                    if (!name.value) {
                        message += "Tên nhà trọ - ";
                    }
                    if (!streetAddress.value) {
                        message += "Địa chỉ chi tiết - ";
                    }
                    if (!description.value) {
                        message += "Mô tả ";
                    }
                    message += "không được trống";

                    messageElement.innerHTML = message;
                } else {
                    jQuery.ajax({
                        type: 'POST',
                        data: {'name': name.value,
                            'updateDistrictId': updateDistrictId.value,
                            'updateStreetAddress': updateStreetAddress.value,
                            'description': description.value,
                            'hostelId': hostelId.value
                        },
                        url: '/sakura/landlord/update-hostel',
                        success: function (response) {
                            messageElement.innerHTML = response;
                        },
                        error: function () {
                        },
                        complete: function (result) {
                        }
                    });
                }
            }
        </script>

        <script>

            function renderDistrictSimple(element) {
                console.log("da vao render district")
                var provinceID = element.value;
                const provinElement = document.querySelector('#province');
                var districtElemet = null;
                if (provinElement === element)
                    districtElemet = document.querySelector('#district');
                else
                    districtElemet = document.querySelector('#updateDistrict');
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

        <script>
            var open_modal_1 = document.querySelector('#addHostel-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.addHostelmodal1');
            });

            var open_modal_2 = document.querySelector('#addHostel-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.addHostelmodal2');
            });

            var close_modal_1 = document.querySelectorAll('.addHostelmodal1 .addHostelmodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.addHostelmodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.addHostelmodal2 .addHostelmodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.addHostelmodal2');
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
                const modal_1 = document.querySelector('.addHostelmodal1');
                const modal_2 = document.querySelector('.addHostelmodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.addHostelmodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.addHostelmodal2');
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
            var open_modal_1 = document.querySelector('#editHostel-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.editHostelmodal1');
            });

            var open_modal_2 = document.querySelector('#editHostel-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.editHostelmodal2');
            });

            var close_modal_1 = document.querySelectorAll('.editHostelmodal1 .editHostelmodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.editHostelmodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.editHostelmodal2 .editHostelmodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.editHostelmodal2');
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
                const modal_1 = document.querySelector('.editHostelmodal1');
                const modal_2 = document.querySelector('.editHostelmodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.editHostelmodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.editHostelmodal2');
                }
            };

        </script>

        <script>
            var open_modal_1 = document.querySelector('#deleteHostel-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.deleteHostelmodal1');
            });

            var open_modal_2 = document.querySelector('#deleteHostel-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.deleteHostelmodal2');
            });

            var close_modal_1 = document.querySelectorAll('.deleteHostelmodal1 .deleteHostelmodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.deleteHostelmodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.deleteHostelmodal2 .deleteHostelmodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.deleteHostelmodal2');
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
                const modal_1 = document.querySelector('.deleteHostelmodal1');
                const modal_2 = document.querySelector('.deleteHostelmodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.deleteHostelmodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.deleteHostelmodal2');
                }
            };

        </script>
    </body>

</html>
