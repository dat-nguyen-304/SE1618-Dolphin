<%-- 
    Document   : tenantPage
    Created on : Jun 21, 2022, 7:52:22 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang người thuê - Tổng quan</title>

        <%@include file="../view/assets.jsp" %>

        <!--CSS-->
        <link rel="stylesheet" href="../assets/css/tenant-page.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">

        <script src="../assets/pacejs/pace.min.js" type="text/javascript"></script>
        <link href="../assets/pacejs/pace-theme-default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/pacejs/flash.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="cover w-screen h-screen fixed top-0 left-0 bg-white opacity-60 z-[1000]"></div>
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] ${empty sessionScope.currentContract ? 'h-[calc(100vh-80px)]' : ''}">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <a href="#"
                               class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Tổng quan
                            </a>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->
                <c:if test="${empty sessionScope.currentContract}">
                    <p class="text-gray-300 text-[25px] font-bold absolute top-1/2 left-1/2 translate-x-[-30%] translate-y-[-50%]">Hiện tại bạn không thuê phòng trọ nào.</p>
                </c:if>
                <c:if test="${not empty sessionScope.currentContract}">
                    <!-- General information -->
                    <div class="general-info grid grid-cols-4 gap-[20px] mt-[20px]">
                        <div class="card hostel-info h-[120px] bg-[#fff] p-5 flex flex-col justify-between">
                            <div class="hostel-info-head flex justify-between items-baseline">
                                <div class="hostel-name text-[20px] font-bold text-[#2A3C46]">
                                    <h3>Nhà trọ ${sessionScope.currentContract.hostel.hostelName}</h3>
                                </div>
                                <div class="hostel-rating text-[18px] font-semibold text-[#FFB31F] flex items-center">
                                    <h3 class="rating mr-[3px]">${sessionScope.currentContract.hostel.rating}/5</h3>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                            </div>
                            <div class="hostel-address text-[14px] font-normal text-[#597187] bottom-0">
                                <p class="">${sessionScope.currentContract.hostel.streetAddress}, ${sessionScope.currentContract.hostel.district.districtName}
                                    , ${sessionScope.currentContract.hostel.district.province.provinceName}</p>
                            </div>
                        </div>

                        <div class="card landlord-info h-[120px] bg-[#fff] p-5 flex flex-col justify-between">
                            <div class="landlord-name text-[20px] font-bold text-[#2A3C46]">
                                <h3>Chủ nhà - ${sessionScope.currentContract.landlord.fullname}</h3>
                            </div>

                            <div class="landlord-contact text-[14px] font-normal text-[#597187]">
                                <p class=""><i class="bi bi-telephone-fill mr-[10px]"></i> ${sessionScope.currentContract.landlord.phone}</p>
                                <p class=""><i class="bi bi-envelope-fill mr-[10px]"></i> ${sessionScope.currentContract.landlord.account.email}</p>
                            </div>
                        </div>

                        <div class="card room-info h-[120px] bg-[#fff] p-5 flex flex-col justify-between">
                            <div class="room-code text-[20px] font-bold text-[#2A3C46]">
                                <h3>Phòng ${currentContract.room.roomNumber}</h3>
                            </div>

                            <div class="room-type text-[14px] font-normal text-[#597187]">
                                <div class="grid grid-cols-3 w-[65%]">
                                    <p class="">Diện tích</p>
                                    <p class="col-span-2 font-medium">${currentContract.room.roomType.area}m<sup>2</sup></p>
                                </div>
                                <div class="grid grid-cols-3 w-[65%]">
                                    <p class="">Giá thuê</p>
                                    <p class="col-span-2 font-medium">
                                        <fmt:setLocale value = "vi_VN"/>
                                        <fmt:formatNumber type = "number" pattern = "###,###,###VNĐ" value = "${currentContract.rentalFeePerMonth}"/> / tháng
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div href="#" class="card rounded overall-info h-[120px] bg-[#fff] group relative">
                            <div class="overall-info-head h-[30%] bg-[#F5FDFA] flex flex-col justify-center items-end pr-[10px]">
                                <p class="text-[14px] font-medium text-[#17535B]">Trang thông tin dành cho người thuê</p>
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
                            <div class="text-[20px] font-bold text-[#2A3C46] self-center pb-[20px]">Thống kê chi phí hoá đơn
                            </div>
                            <c:if test="${empty sessionScope.invoiceList}">
                                <div class="w-full h-full flex justify-center items-center">
                                    <p class="text-[#45px] text-slate-200 font-bold">Không có dữ liệu</p>
                                </div>
                            </c:if>
                            <c:if test="${not empty sessionScope.invoiceList}">
                                <div class="w-[90%] h-[90%] mx-auto">
                                    <canvas id="myChart"></canvas>
                                </div>
                            </c:if>
                        </div>

                        <div class="grid grid-rows-2 row-span-2">
                            <div class="card room-member bg-[#fff] p-5 flex flex-col">
                                <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px]">Thành viên khác</div>
                                <div class="relative overflow-y-auto h-[250px]">
                                    <c:if test="${empty sessionScope.roomResidentList}">
                                        <p class="text-gray-200 font-bold text-[22px] w-fit absolute left-1/2 top-1/3 translate-y-[-50%] translate-x-[-50%]">Chưa có thêm thành viên</p>
                                        <p class="text-gray-500 font-normal text-[15px] text-center w-[250px] absolute left-1/2 top-2/3 translate-y-[20%] translate-x-[-50%]">
                                            Có thể thêm thành viên khác bằng cách gửi yêu cầu 
                                            <a href="/sakura/tenant/notifications" class="text-emerald-500 font-medium hover:underline hover:text-emerald-600">ở đây</a>
                                        </p>
                                    </c:if>                               

                                    <table class="w-full text-sm text-left text-gray-500">
                                        <tbody>
                                            <c:forEach items = "${sessionScope.roomResidentList}" var = "roomResident">
                                                <tr class="bg-white border-b hover:bg-gray-50">
                                                    <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">${roomResident.fullname}</th>
                                                    <td class="px-6 py-4">${roomResident.phone}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="card room-member bg-[#fff] p-5 flex flex-col mt-[20px]">
                                <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                                    <p>Hoá đơn mới nhất</p>
                                    <form action="/sakura/invoice/detail" method="post">
                                        <input type="hidden" name="invoiceID" value="${sessionScope.latestInvoice.invoiceID}">
                                        <button type="submit" class="text-[15px] font-light flex items-baseline hover:text-[#288D87]">
                                            <p><i class="bi bi-box-arrow-up-right text-[12px]"></i> </p>
                                            <p class="translate-y-[3px] ml-[5px]">Xem chi tiết</p>
                                        </button>
                                    </form>
                                </div>
                                <div class="relative overflow-y-auto h-full">
                                    <c:choose>
                                        <c:when test="${empty sessionScope.latestInvoice}">
                                            <p class="text-gray-200 font-bold text-[22px] w-fit absolute left-1/2 top-1/2 translate-y-[-70%] translate-x-[-50%]">Chưa có hoá đơn</p>
                                        </c:when>
                                        <c:otherwise>
                                            <table class="w-full text-sm text-left text-gray-500">
                                                <tbody>
                                                    <tr class="bg-white border-b hover:bg-gray-50">
                                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-700 whitespace-nowrap">Mã hoá đơn</th>
                                                        <td class="px-6 py-4">${sessionScope.latestInvoice.invoiceID}</td>
                                                    </tr>
                                                    <tr class="bg-white border-b hover:bg-gray-50">
                                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">Kỳ thanh toán</th>
                                                        <td class="px-6 py-4">${sessionScope.latestInvoice.month}</td>
                                                    </tr>
                                                    <tr class="bg-white  border-b hover:bg-gray-50">
                                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">Giá tiền</th>
                                                        <td class="px-6 py-4">
                                                            <fmt:formatNumber type = "number" pattern = "###,###,###VNĐ" value = "${sessionScope.latestInvoice.totalPrice}"/>
                                                        </td>
                                                    </tr>
                                                    <tr class="bg-white hover:bg-gray-50">
                                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">Trạng thái</th>
                                                        <td class="px-6 py-4">
                                                            <c:choose>
                                                                <c:when test = "${sessionScope.latestInvoice.status == 0}">
                                                                    <span class="bg-red-100 text-red-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Chưa thanh toán</span>
                                                                </c:when>
                                                                <c:when test = "${sessionScope.latestInvoice.status == 1}">
                                                                    <span class="bg-green-100 text-green-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Đã thanh toán</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- End Statistics -->
                </c:if>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>
        <script type="text/javascript">
            window.onload = function () {
                $(".cover").fadeOut(1500);
            };
        </script>
        <!-- chartJS -->
        <script src="../webjars/chart.js/3.8.0/dist/chart.js"></script>
        <script>
            var invoiceValue = new Array();
            var invoiceDate = new Array();
            <c:forEach items="${sessionScope.invoiceList}" var="invoice">
            invoiceValue.push("${invoice.totalPrice}");
            invoiceDate.push("${invoice.month}");
            </c:forEach>
            console.log("Value ");
            console.log(invoiceValue);
            console.log("Date ");
            console.log(invoiceDate);
        </script>
        <script>
            const data = {
                labels: invoiceDate,
                datasets: [{
                        label: '`Tổng hoá đơn hằng tháng',
                        data: invoiceValue,
                        barPercentage: 0.5,
                        barThickness: 40,
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

            var ctx = document.getElementById('myChart');
            const myChart = new Chart(
                    ctx,
                    config
                    );


        </script>
    </body>
</html>
