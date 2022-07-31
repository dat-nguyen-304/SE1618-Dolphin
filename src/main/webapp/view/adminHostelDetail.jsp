<%-- 
    Document   : adminTenantProfile
    Created on : Jul 6, 2022, 8:53:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Quản lý người thuê</title>
        <%@include file="../view/assets.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/js/splide.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/css/splide.min.css">

        <link rel="stylesheet" href="../assets/css/admin-page.css">
        <link rel="stylesheet" href="../assets/css/admin-tenant-magement.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">

    </head>
    <body>
        <%@include file="../view/headerAdminDashboard.jsp" %>
        <%@include file="../view/navbarAdminDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">
            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">
                <div class="head-control flex justify-between">
                    <!-- Breadcrumb -->
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center">
                                <a href="#" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                    </path>
                                    </svg>  
                                    Quản lí chủ nhà
                                </a>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="mt-[20px] grid grid-cols-5 gap-5">
                    <!--Hostel info-->
                    <div class="card bg-[#fff] p-5 flex flex-col col-span-2">
                        <div class="flex justify-between">
                            <div class="text-[20px] font-bold text-[#288D87] pb-[20px]">Thông tin cơ bản</div>
                            <form action = "/sakura/admin/landlord-detail" method = "post">
                                <button name = "accountID" value = "${requestScope.currentHostel.landlord.account.accountID}" type = "submit">Thông tin chủ trọ</button>
                            </form>
                        </div>
                        <div class="w-full h-fit mx-auto">
                            <div class="grid grid-cols-6 gap-[8px]">
                                <div class="col-span-2">
                                    <p class="text-slate-400 font-normal">Mã nhà trọ</p>
                                    <p class="text-[18px] text-slate-800 font-semibold">
                                        <fmt:formatNumber value="${requestScope.currentHostel.hostelID}" groupingUsed="false" minIntegerDigits="5"/>
                                    </p>
                                </div>
                                <div class="col-span-2">
                                    <p class="text-slate-400 font-normal">Tên nhà trọ</p>
                                    <p class="text-[18px] text-slate-800 font-semibold">${requestScope.currentHostel.hostelName}</p>
                                </div>
                                <div class="col-span-2">
                                    <p class="text-slate-400 font-normal">Ngày tạo</p>
                                    <p class="text-[18px] text-slate-800 font-semibold date">${requestScope.currentHostel.registeredDate}</p>
                                </div>
                            </div>

                            <div class="mt-[20px]">
                                <p class="text-slate-400 font-normal"><i class="bi bi-geo-alt-fill mr-[5px]"></i>Địa chỉ</p>
                                <p class="text-[18px] text-slate-800 font-semibold mt-[5px]">${requestScope.currentHostel.streetAddress}, ${requestScope.currentHostel.district.districtName}, ${requestScope.currentHostel.district.province.provinceName}</p>
                            </div>

                            <div class="grid grid-rows-2 grid-cols-6 gap-[5px] mt-[20px]">
                                <p class="text-slate-400 font-normal col-span-2"><i class="bi bi-house-fill mr-[5px]"></i>Số phòng</p>
                                <p class="text-[18px] text-slate-800 font-semibold col-span-4">${requestScope.currentHostel.totalRoom}</p>
                                <p class="text-slate-400 font-normal col-span-2"><i class="bi bi-house mr-[5px]"></i>Phòng trống</p>
                                <p class="text-[18px] text-slate-800 font-semibold col-span-4">${requestScope.currentHostel.availableRoom}</p>
                            </div>
                            <div class="grid grid-rows-2 grid-cols-6 gap-[5px] mt-[20px]">
                                <fmt:setLocale value = "vi_VN"/>
                                <p class="text-slate-400 font-normal col-span-2"><i class="bi bi-tags-fill mr-[5px]"></i>Giá thuê</p>
                                <p class="text-[18px] text-slate-800 font-semibold col-span-4"><fmt:formatNumber value = "${requestScope.currentHostel.minPrice}" type = "number" pattern="###,###,###VNĐ"/> - <fmt:formatNumber value = "${sessionScope.currentHostel.maxPrice}" type = "number" pattern="###,###,###VNĐ"/></p>
                                <p class="text-slate-400 font-normal col-span-2"><i class="bi bi-slash-square mr-[5px]"></i>Diện tích phòng</p>
                                <p class="text-[18px] text-slate-800 font-semibold col-span-4">${requestScope.currentHostel.minArea}m<sup>2</sup> - ${requestScope.currentHostel.maxArea}m<sup>2</sup></p>
                            </div>

                            <div class="mt-[20px]">
                                <p class="text-slate-400 font-normal"><i class="bi bi-info-circle mr-[5px]"></i>Mô tả</p>
                                <p class="text-[18px] text-slate-800 font-semibold h-[370px] mt-[5px] overflow-y-auto">${requestScope.currentHostel.description}</p>
                            </div>

                        </div>
                    </div>
                    <!--End hostel info-->

                    <!--Hostel image-->
                    <div class="col-span-3">
                        <div class="card bg-[#fff] p-5 flex flex-col">
                            <div class="text-[20px] font-bold text-slate-800 pb-[20px] flex justify-between items-center">
                                <p>Hình ảnh </p>
                            </div>
                            <div class="w-full h-fit mx-auto z-0 " id="display-image">
                                <c:choose>
                                    <c:when test="${empty requestScope.currentHostel.imgList}">
                                        <div class="h-[700px] flex flex-col items-center justify-around" id="empty-image-list">
                                            <h4 class="w-[60%] mx-auto text-center text-[47px] font-bold tracking-wide text-[#c9c9c9]">Chưa có hình ảnh nào cho nhà trọ này!</h4>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <section id="main-carousel" class="splide w-full" aria-label="">
                                            <div class="splide__track w-full">
                                                <ul class="splide__list">
                                                    <c:forEach items="${requestScope.currentHostel.imgList}" var="imgHostel">
                                                        <li class="splide__slide image-item-container overflow-hidden relative group cursor-pointer" > 
                                                            <img class="z-[1] mx-auto" alt="" src="${imgHostel}" size="" id="${imgHostel}">
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </section>
                                        <ul id="thumbnails" class="thumbnails w-full min-w-0 flex mt-[10px] p-0">
                                            <c:forEach items="${requestScope.currentHostel.imgList}" var="imgHostel">
                                                <li class="thumbnail image-item-container mr-[2px] overflow-hidden relative group cursor-pointer" id="tb_${imgHostel}"> 
                                                    <img class="z-[1] w-full h-full object-cover group-hover:blur-sm duration-150" alt="" src="${imgHostel}" size="">
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <!--End hostel image-->
                </div>
            </div>
            <%@include file="../view/footerDashboard.jsp" %>
        </div>
        <script>
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
        </script>
    </body>

</html>
