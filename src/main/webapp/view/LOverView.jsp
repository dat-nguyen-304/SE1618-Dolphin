<%-- 
    Document   : LOverView
    Created on : Jun 26, 2022, 9:25:17 AM
    Author     : Admin
--%>

<%@page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Tổng quan</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- <link rel="stylesheet" href="app.css"> -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/LOverView.css">
        <link rel="stylesheet" href="../assets/css/toastr.css">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
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
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center">
                                <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                    </path>
                                    </svg>
                                    Tổng quan
                                </p>
                            </li>
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

                                <button id="deleteHostel-1" type="submit" name="action" value="Save"
                                        class="mr-[20px] rounded w-[150px] h-[30px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                                    <p class="font-normal text-[15px] text-gray-400 group-hover:text-[#288D87]">Xóa nhà trọ này</p>
                                </button>
                            </div>
                        </c:if>

                        <!-- Modal toggle -->
                        <button id="addHostel-1" type="submit" name="action" value="Save" class="rounded w-[150px] h-[30px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                            <p class="font-normal text-[15px] text-gray-400 group-hover:text-[#288D87]"><i class="bi bi-plus-lg mr-[5px]"></i>Thêm nhà trọ</p>
                        </button>
                    </div>
                    <!-- End breadcrumb -->
                </div>
                <!-- Modal list-->
                <%@include file="../view/modalLandlordOverview.jsp" %>
                <!-- End modal list-->

                <!-- General information -->
                <c:if test="${sessionScope.currentHostel != null}">
                    <div class="general-info flex justify-between mt-[20px] grid grid-16 gap-[20px]">
                        <a href="#" class="card col-span-3 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                            <div class="overall-info-head">
                                <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Tổng doanh thu</h3>
                            </div>
                            <div class="overall-info-content ">
                                <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">
                                    <fmt:setLocale value = "vi_VN"/>
                                    <fmt:formatNumber value = "${requestScope.totalRevenue}" type = "number" pattern="###,###,###"/>
                                </p>
                            </div>
                        </a>
                        <a href="#" class="card col-span-3 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                            <div class="overall-info-head">
                                <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Doanh thu năm</h3>
                            </div>
                            <div class="overall-info-content ">
                                <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">
                                    <fmt:setLocale value = "vi_VN"/>
                                    <fmt:formatNumber value = "${requestScope.currentYearRevenue}" type = "number" pattern="###,###,###"/>
                                </p>
                            </div>
                        </a>
                        <a href="#" class="card col-span-2 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                            <div class="overall-info-head">
                                <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Tổng số phòng</h3>
                            </div>
                            <div class="overall-info-content ">
                                <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">${sessionScope.currentHostel.totalRoom}</p>
                            </div>
                        </a>
                        <a href="#" class="card col-span-2 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                            <div class="overall-info-head">
                                <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Đã cho thuê</h3>
                            </div>
                            <div class="overall-info-content ">
                                <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">${sessionScope.currentHostel.totalRoom - sessionScope.currentHostel.availableRoom}</p>
                            </div>
                        </a>
                        <a href="#" class="card col-span-2  overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                            <div class="overall-info-head">
                                <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Số cư dân</h3>
                            </div>
                            <div class="overall-info-content ">
                                <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">${requestScope.noResidents}</p>
                            </div>
                        </a>


                        <div href="#" class="card rounded col-span-4 overall-info h-[120px] bg-[#fff] group relative">
                            <div class="overall-info-head h-[30%] bg-[#F5FDFA] flex flex-col justify-center items-end pr-[10px]">
                                <p class="text-[14px] font-medium text-[#17535B]">Trang quản lý dành cho chủ nhà</p>
                            </div>
                            <div class="desc h-[70%] px-[20px] flex items-center">
                                <div class="user-ava mr-[20px] inline-block border border-[3px] border-[#fff] rounded-full overflow-hidden">
                                    <img class="w-14 h-14 object-cover" src="${empty sessionScope.currentUser.account.avatar ? "/sakura/assets/images/user-avatars/no_ava.jpg" : sessionScope.currentUser.account.avatar}" alt="" />
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
                                    <a href="/sakura/landlord/revenue-list" class="text-[15px] font-light flex items-baseline">
                                        <p><i class="bi bi-box-arrow-up-right text-[12px]"></i> </p>
                                        <p class="translate-y-[3px] ml-[5px]">Xem tất cả</p>
                                    </a>
                                </div>
                                <div class="relative overflow-y-auto">
                                    <table class="w-full text-sm text-left text-gray-500">
                                        <tbody>
                                            <c:forEach items="${requestScope.revenueDate}" var = "revDate" varStatus="ptr">
                                                <tr class="bg-white border-b hover:bg-gray-50">
                                                    <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                        ${revDate}
                                                    </th>
                                                    <td class="px-6 py-4">
                                                        <fmt:setLocale value = "vi_VN"/>
                                                        <fmt:formatNumber value = "${requestScope.revenueValue[ptr.index]}" type = "number" pattern="###,###,###VNĐ"/>
                                                    </td>
                                                    <td class="px-6 py-4 text-right">
                                                        <a href="/sakura/landlord/revenue-detail?revenueDate=${revDate}" class="font-medium text-[#288D87] hover:underline"><i
                                                                class="bi bi-eye-fill"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="mt-[20px] text-[15px] font-light text-[#929CA5]">
                                    <em>(5 tháng gần đây nhất)</em>
                                </div>
                            </div>

                            <div class="card room-member bg-[#fff] p-5 flex flex-col mt-[20px]">
                                <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                                    <p>Tháng ${requestScope.revenueDate[0]}</p>
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
                                                    <fmt:setLocale value = "vi_VN"/>
                                                    <fmt:formatNumber value = "${requestScope.revenueValue[0]}" type = "number" pattern="###,###,###VNĐ"/>
                                                </td>
                                            </tr>
                                            <c:choose>
                                                <c:when test="${requestScope.revenueChange eq 0}">
                                                    <tr class="bg-white border-b hover:bg-gray-50">
                                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                            Thay đổi so với tháng trước
                                                        </th>
                                                        <td class="px-6 py-4 text-[#000000]">
                                                            0% <i class="bi bi-arrow-up"></i>
                                                        </td>
                                                    </tr>
                                                </c:when>
                                                <c:when test = "${requestScope.revenueChange > 0}">
                                                    <tr class="bg-white border-b hover:bg-gray-50">
                                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                            Thay đổi so với tháng trước
                                                        </th>
                                                        <td class="px-6 py-4 text-[#1CBA8B]">
                                                            ${requestScope.revenueChange}% <i class="bi bi-arrow-up"></i>
                                                        </td>
                                                    </tr>
                                                </c:when>
                                                <c:when test = "${requestScope.revenueChange < 0}">
                                                    <tr class="bg-white border-b hover:bg-gray-50">
                                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                            Thay đổi so với tháng trước
                                                        </th>
                                                        <td class="px-6 py-4 text-[#FF5757]">
                                                            ${requestScope.revenueChange}% <i class="bi bi-arrow-down"></i>
                                                        </td>
                                                    </tr>
                                                </c:when>
                                            </c:choose>
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
<!--                        <div class="card w-full bg-[#fff] p-5 flex flex-col">
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
                                             Chưa xử lý 
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
                                             Đã xử lý 
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
                        </div>-->

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
                                                    ${sessionScope.currentHostel.hostelName}
                                                </td>
                                                <td class="px-6 py-4 text-[#FFB03A]">
                                                    ${sessionScope.currentHostel.rating} <i class="bi bi-star-fill"></i>
                                                </td>
                                                <td class="px-6 py-4">
                                                    ${requestScope.ratingCount}
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
                    <h1>Bạn chưa có nhà trọ. Hãy thêm thông tin nhà trọ!</h1>
                </c:if>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            var revenueDates = new Array();
            var revenueMValues = new Array();
            <c:forEach items="${requestScope.revenueDate}" var="revDate">
            revenueDates.push("${revDate}");
            </c:forEach>
            <c:forEach items="${requestScope.revenueValue}" var="revVal">
            revenueMValues.push(${revVal});
            </c:forEach>
            console.log("Date: ");
            console.log(revenueDates);
            console.log("Val ");
            console.log(revenueMValues);
        </script>
        <script>
            const data = {
                labels: revenueDates,
                datasets: [{
                        label: 'Doanh thu theo tháng',
                        data: revenueMValues,
                        barPercentage: 0.5,
                        barThickness: 50,
                        backgroundColor: [
                            '#288D87'
                        ]
                    }]
            };

            const config = {
                type: 'bar',
                data: data,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            grid: {
                                color: ''
                            }
                        },
                        x: {
                            grid: {
                                color: '#EEF0F1'
                            },
                            ticks: {
                                color: '#40576C'
                            }
                        }
                    }
                }
            };

            // =================

            var ctx = document.getElementById('myChart');
            const myChart = new Chart(
                    ctx,
                    config
                    );


        </script>

        <script src = "../assets/javascript/jquery/jquery.min.js" ></script>
        <script src="../assets/javascript/render-district.js"></script>

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
                    message += "không được trống!";

                    //addHostelMessage.innerHTML = message;
                    showToast("error", message);
                } else {
                    jQuery.ajax({
                        type: 'POST',
                        data: {'name': name.value,
                            'districtId': districtId.value,
                            'streetAddress': streetAddress.value,
                            'description': description.value,
                            'landlordId': landlordId.value
                        },
                        url: '/sakura/hostel/add-hostel',
                        success: function (response) {
                            name.value = "";
                            streetAddress.value = "";
                            description.value = "";
                            addHostelMessage.innerHTML = response;
                            toggleModal('.addHostelmodal2');
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
                    url: '/sakura/hostel/check-hostel-valid',
                    success: function (response) {
                        validHostelMessage.innerHTML = response;
                        if (response) {
                            adddHostelBtn.onclick = (e) => {
                                //addHostelMessage.innerHTML = "Tên nhà trọ không được trùng lặp";
                                showToast("error", "Tên nhà trọ không được trùng lặp!");
                                e.preventDefault();
                                //addHostelBtn.disabled = true;
                            };
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
                    url: '/sakura/hostel/delete-hostel',
                    success: function (response) {
                        let icon = '<p class="text-[#0e9c72] text-center text-[50px] mb-[10px]"><i class="bi bi-check-circle"></i></p>';
                        deleteHostelContent.innerHTML = icon + response;
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
                    url: '/sakura/hostel/check-update-hostel-valid',
                    success: function (response) {
                        validUpdateHostelMessage.innerHTML = response;
                        if (response) {
                            updateHostelBtn.onclick = (e) => {
                                e.preventDefault();
                                updateHostelMessage.innerHTML = "Tên nhà trọ không được trùng lặp!";
                            };
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
                if (!name.value || !updateStreetAddress.value || !description.value) {
                    let message = "";
                    if (!name.value) {
                        message += "Tên nhà trọ - ";
                    }
                    if (!updateStreetAddress.value) {
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
                        url: '/sakura/hostel/update-hostel',
                        success: function (response) {
                            //messageElement.innerHTML = response;
                            showToast("success", "Chỉnh sửa thông tin thành công!");
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
                console.log("da vao render district");
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

            //            var open_modal_2 = document.querySelector('#addHostel-2');
            //            open_modal_2.addEventListener('click', function (event) {
            //                event.preventDefault();
            //                toggleModal('.addHostelmodal2');
            //            });

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
                modal.classList.toggle('active-modal');
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

            var close_modal_1 = document.querySelectorAll('.editHostelmodal1 .editHostelmodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.editHostelmodal1');
                    console.log('close 1');
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
                if (isEscape && modal_1.classList.contains('active-modal')) {
                    toggleModal('.editHostelmodal1');
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
