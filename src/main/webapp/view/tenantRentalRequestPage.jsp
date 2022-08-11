<%-- 
    Document   : tenantPage
    Created on : Jun 21, 2022, 7:52:22 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang người thuê - Yêu cầu thuê phòng</title>

        <%@include file="../view/assets.jsp" %>
        <link rel="stylesheet" href="../assets/css/tenant-page-booking-request.css" />
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
        <link href="../assets/toastr/toastr.min.css" rel="stylesheet" />
        <link href="../assets/toastr/toastr-custom.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/tailwind-elements/index.min.css" />

        <script src="../assets/pacejs/pace.min.js" type="text/javascript"></script>
        <link href="../assets/pacejs/pace-theme-default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/pacejs/flash.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Yêu cầu thuê phòng
                            </p>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <!-- Rental request list -->
                <div class="statistic w-full mt-[20px]">
                    <div class="card w-full room-member bg-[#fff] p-5 flex flex-col mt-[20px] ${(requestScope.bookingList.size() > 7 || requestScope.invitationList.size() > 7) ? '' : 'h-[calc(100vh-225px)]'} h-[calc(100vh-225px)] ">
                        <ul class="nav nav-tabs flex space-x-[20px] list-none border-b-0 pl-0 mb-4" id="tabs-tab"
                            role="tablist">
                            <li class="nav-item" role="presentation">
                                <a href="#tabs-home" class="text-[18px] font-semibold px-[10px] py-[5px] rounded active" id="tabs-home-tab" data-bs-toggle="pill" data-bs-target="#tabs-home" role="tab" aria-controls="tabs-home"
                                   aria-selected="true">
                                    Yêu cầu xem phòng
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a href="#tabs-profile" class="text-[18px] font-semibold px-[10px] py-[5px] rounded" id="tabs-profile-tab" data-bs-toggle="pill" data-bs-target="#tabs-profile" role="tab" aria-controls="tabs-profile" aria-selected="false">
                                    Lời mời thuê nhà
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content" id="tabs-tabContent">
                            <div class="tab-pane fade show active relative h-[calc(100vh-320px)] overflow-y-auto" id="tabs-home" role="tabpanel" aria-labelledby="tabs-home-tab">
                                <c:if test="${empty requestScope.bookingList}">
                                    <div class="w-full h-full flex items-center justify-center">
                                        <p class="text-[55px] font-bold text-slate-200">Không có yêu cầu</p>
                                    </div>
                                </c:if>
                                <c:if test="${not empty requestScope.bookingList}">
                                    <table class="w-full text-[16px] text-left text-gray-500 mb-[20px]">
                                        <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                            <tr>
                                                <th scope="col" class="text-center px-6 py-3">Nhà trọ</th>
                                                <th scope="col" class="text-center px-6 py-3">Loại phòng</th>
                                                <th scope="col" class="text-center px-6 py-3">Thời gian gửi</th>
                                                <th scope="col" class="text-center px-6 py-3">Trạng thái</th>
                                                <th scope="col" class="text-center px-6 py-3">Ghi chú/Mô tả</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items = "${requestScope.bookingList}" var="booking">
                                                <tr class="bg-white border-b hover:bg-gray-50">
                                                    <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">${booking.roomType.hostel.hostelName}</td>
                                                    <td class="text-center px-6 py-4 date">${booking.roomType.roomTypeName}</td>
                                                    <td class="text-center px-6 py-4 date">${booking.createdDate}</td>
                                                    <td class="text-center px-6 py-4 date">
                                                        <c:choose>
                                                            <c:when test="${booking.status == 1}">
                                                                <p class="bg-sky-100 text-sky-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Đang chờ
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${booking.status == 3}">
                                                                <p class="bg-slate-100 text-slate-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Đã huỷ
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${booking.status == 4}">
                                                                <p class="bg-rose-100 text-rose-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Chủ nhà hủy
                                                                </p>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <c:if test="${booking.status == 1}">
                                                        <td class=" py-4 flex items-center space-x-[20px]">
                                                            <form method = "post" action="/sakura/hostel/detail">
                                                                <input type ="hidden" name ="hostelId" value ="${booking.roomType.hostel.hostelID}">
                                                                <button type = "submit" class="w-fit px-[10px] py-[3px] bg-[#288D87] hover:bg-[#1D837D] text-[#fafafa] rounded">
                                                                    Xem nhà trọ
                                                                </button>
                                                            </form>    
                                                            <form method = "post" action="/sakura/tenant/rental-request">
                                                                <input type ="hidden" name ="bookingID" value ="${booking.bookingRequestID}"/>
                                                                <input type ="hidden" name="queryType" value="refuse-booking"/>
                                                                <button type = "submit" class="w-fit px-[10px] py-[3px] bg-[#288D87] hover:bg-[#1D837D] text-[#fafafa] rounded">
                                                                    Hủy yêu cầu
                                                                </button>
                                                            </form>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${booking.status == 4}">
                                                        <td class="text-left px-0 py-4 overflow-x-auto">
                                                            ${booking.description}
                                                            <!--                                                            <button type = "button" class="view-deny-desc w-fit px-[10px] py-[3px] bg-[#fff] border border-slate-300 hover:border-[#17535B] text-slate-400 hover:text-[#17535B] rounded">
                                                                                                                            Xem chi tiết
                                                                                                                        </button>-->
                                                            <!--Modal view deny desc-->
                                                            <!--                                                            <div class="viewDenyDesc opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
                                                                                                                            <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                                                                                                                            <div class="modal-container bg-white w-1/3 mx-auto rounded shadow-lg z-50 overflow-y-auto">
                                                                                                                                <div class="viewDenyDesc-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
                                                                                                                                    <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                                                                                                                                    <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                                                                                                                    </path>
                                                                                                                                    </svg>
                                                                                                                                    <span class="text-sm"></span>
                                                                                                                                </div>
                                                                                                                                <div class="modal-content">
                                                                                                                                    Body
                                                                                                                                    <div class="p-[20px]">
                                                                                                                                        <svg class="mx-auto mb-4 w-14 h-14 text-slate-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                                                                                                                        <h3 class="text-[20px] font-semibold text-gray-800">Lý do từ chối</h3>
                                                                                                                                        <p class="text-[17px] text-slate-700 font-medium my-[20px]">
                                                            ${(empty booking.description || booking.description.length() == 0) ? "Không có" : booking.description}
                                                            ${booking.description}
                                                        </p>
                                                    </div>
                                                    Footer
                                                    <div class="flex justify-end p-[20px]">
                                                            ${booking.description}
                                                            <button class="viewDenyDesc-close px-5 py-2 rounded bg-emerald-800 text-white hover:bg-emerald-700">Đóng</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>-->
                                                            <!--End modal view deny desc-->
                                                        </td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                            </div>
                            <div class="tab-pane fade relative h-[calc(100vh-320px)] overflow-y-auto" id="tabs-profile" role="tabpanel" aria-labelledby="tabs-profile-tab">
                                <c:if test="${empty requestScope.invitationList}">
                                    <div class="w-full h-full flex items-center justify-center">
                                        <p class="text-[55px] font-bold text-slate-200">Không có lời mời</p>
                                    </div>
                                </c:if>
                                <c:if test="${not empty requestScope.invitationList}">

                                    <table class="w-full text-[16px] text-left text-gray-500 mb-[20px]">
                                        <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                            <tr>
                                                <th scope="col" class="text-center px-6 py-3">Nhà trọ</th>
                                                <th scope="col" class="text-center px-6 py-3">Loại phòng</th>
                                                <th scope="col" class="text-center px-6 py-3">Thời gian gửi</th>
                                                <th scope="col" class="text-center px-6 py-3">Trạng thái</th>
                                                <th scope="col" class="text-center px-6 py-3"></th>
                                                <th scope="col" class="text-center px-6 py-3"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items = "${requestScope.invitationList}" var="invitation">
                                                <tr class="bg-white border-b hover:bg-gray-50">
                                                    <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">${invitation.roomType.hostel.hostelName}</td>
                                                    <td class="text-center px-6 py-4 ">${invitation.roomType.roomTypeName}</td>
                                                    <td class="text-center px-6 py-4 ">${invitation.createdDate}</td>
                                                    <td class="text-center px-6 py-4 ">
                                                        <c:choose>
                                                            <c:when test="${invitation.status == 2}">
                                                                <p class="bg-sky-100 text-sky-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Đang chờ
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${invitation.status == 5}">
                                                                <p class="bg-rose-100 text-rose-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Từ chối
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${invitation.status == 6}">
                                                                <p class="bg-slate-100 text-slate-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Chủ nhà hủy
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${invitation.status == 7}">
                                                                <p class="bg-emerald-100 text-emerald-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Thuê thành công 
                                                                </p>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>

                                                    <td class="px-6 py-4 flex items-center space-x-[20px]">
                                                        <c:if test="${invitation.status == 2}">
                                                            <form method = "post" action = "/sakura/tenant/rental-request">
                                                                <input type ="hidden" name ="queryType" value ="accept">
                                                                <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                                                                <button type = "submit" class="w-fit px-[10px] py-[3px] bg-[#288D87] hover:bg-[#1D837D] text-[#fafafa] rounded">
                                                                    Đồng ý
                                                                </button>
                                                            </form>
                                                            <form method = "post" action = "/sakura/tenant/rental-request">
                                                                <input type ="hidden" name ="queryType" value ="refuse">
                                                                <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                                                                <button type = "submit" class="deny-contract w-fit px-[10px] py-[3px] bg-[#288D87] hover:bg-[#1D837D] text-[#fafafa] rounded">
                                                                    Từ chối
                                                                </button>
                                                                <%@include file="../view/modalTenantBookingRequest3.jsp" %>
                                                            </form>
                                                        </c:if>
                                                        <form method = "post" action = "/sakura/tenant/contract-detail">
                                                            <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                                                            <button type = "submit" class="w-fit px-[10px] py-[3px] bg-[#288D87] hover:bg-[#1D837D] text-[#fafafa] rounded">
                                                                Xem hợp đồng
                                                            </button>
                                                        </form>
                                                    </td>
                                                    <c:if test="${invitation.status == 5}">
                                                        <td class="text-left py-4 overflow-x-auto">
                                                            ${(invitation.description == null || invitation.description.length() == 0) ? "Không có" : invitation.description}
                                                        </td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End rental request list -->
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>
        <script src="../assets/toastr/toastr.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                let allDateCells = $(".date");

                for (let i = 0; i < allDateCells.length; i++) {
                    let node = allDateCells[i];
                    let isoDate = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = isoDate.split('-').reverse().join('/');
                }
            });
            function showToast(type, msg) {
                toastr.options.positionClass = 'toast-bottom-right';
                // toastr.options.extendedTimeOut = 0; //1000;
                toastr.options.timeOut = 7000;
                toastr.options.hideDuration = 250;
                toastr.options.showDuration = 250;
                toastr.options.hideMethod = 'slideUp';
                toastr.options.showMethod = 'slideDown';
                toastr.options.preventDuplicates = true;
                toastr.options.closeButton = true;
                toastr.options.progressBar = true;
                toastr[type](msg);
            }
            if (sessionStorage.getItem("message") && sessionStorage.getItem("msg-type")) {
                showToast(sessionStorage.getItem("msg-type"), sessionStorage.getItem("message"));
                sessionStorage.removeItem("message");
                sessionStorage.removeItem("msg-type");
            }
        </script>
        <script src="../assets/tailwind-elements/index.min.js"></script>
        <script>
            var open_modal_1 = document.querySelectorAll('.view-deny-desc');
            for (let i = 0; i < open_modal_1.length; ++i) {
                open_modal_1[i].addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal('.viewDenyDesc');
                    console.log(i);
                });
            }

            var close_modal_1 = document.querySelectorAll('.viewDenyDesc .viewDenyDesc-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.viewDenyDesc');
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
                const modal_1 = document.querySelector('.viewDenyDesc');
                if (isEscape && modal_1.classList.contains('active-modal')) {
                    toggleModal('.viewDenyDesc');
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
            var open_modal_view_deny_msg = document.querySelectorAll('.view-deny-msg');
            for (let i = 0; i < open_modal_view_deny_msg.length; ++i) {
                open_modal_view_deny_msg[i].addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal('.viewDenyMsg');
                });
            }

            var close_modal_view_deny_msg = document.querySelectorAll('.viewDenyMsg .viewDenyMsg-close');
            for (let i = 0; i < close_modal_view_deny_msg.length; ++i) {
                close_modal_view_deny_msg[i].addEventListener('click', () => {
                    toggleModal('.viewDenyMsg');
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
                const modal_1 = document.querySelector('.viewDenyMsg');
                if (isEscape && modal_1.classList.contains('active-modal')) {
                    toggleModal('.viewDenyMsg');
                }
            };

        </script> 
        <script>
            var open_modal_deny_contract = document.querySelectorAll('.deny-contract');
            for (let i = 0; i < open_modal_deny_contract.length; ++i) {
                open_modal_deny_contract[i].addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal('.denyContract');
                });
            }

            var close_modal_deny_contract = document.querySelectorAll('.denyContract .denyContract-close');
            for (let i = 0; i < close_modal_deny_contract.length; ++i) {
                close_modal_deny_contract[i].addEventListener('click', () => {
                    toggleModal('.denyContract');
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
                const modal_1 = document.querySelector('.denyContract');
                if (isEscape && modal_1.classList.contains('active-modal')) {
                    toggleModal('.denyContract');
                }
            };

        </script> 
    </body>
</html>
