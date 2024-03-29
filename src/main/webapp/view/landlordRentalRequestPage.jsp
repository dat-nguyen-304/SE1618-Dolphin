<%-- 
    Document   : landlordRequestPage
    Created on : Jun 26, 2022, 2:21:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Yêu cầu thuê phòng</title>

        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/landlord-rental-request.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
        <link rel="stylesheet" href="../assets/tailwind-elements/index.min.css" />
    </head>
    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
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
                                    Lời mời thuê nhà đã gửi
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content" id="tabs-tabContent">
                            <div class="tab-pane fade show active relative h-[calc(100vh-320px)] overflow-y-auto" id="tabs-home" role="tabpanel" aria-labelledby="tabs-home-tab">
                                <c:if test="${empty requestScope.bookingList}">
                                    Không có
                                </c:if>
                                <c:if test="${not empty requestScope.bookingList}">
                                    <table class="w-full text-[16px] text-left text-gray-800 mb-[20px] relative ">
                                        <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                            <tr class="">
                                                <th scope="col" class="px-6 py-3 text-center">Tên nhà trọ</th>
                                                <th scope="col" class="px-6 py-3 text-center">Tên khách thuê</th>
                                                <th scope="col" class="px-6 py-3 text-center">Số điện thoại</th>
                                                <th scope="col" class="px-6 py-3 text-center">Email</th>
                                                <th scope="col" class="px-6 py-3 text-center">Loại phòng</th>
                                                <th scope="col" class="px-6 py-3 text-center">Thời gian gửi</th>
                                                <th scope="col" class="px-6 py-3 text-center">Trạng thái</th>
                                                <th scope="col" class="px-6 py-3"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items = "${requestScope.bookingList}" var="booking">
                                                <tr class="bg-white border-b hover:bg-gray-50">
                                                    <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">${booking.roomType.hostel.hostelName}</td>
                                                    <td class="px-6 py-4">${booking.tenant.fullname}</td>
                                                    <td class="px-6 py-4">${booking.tenant.phone}</td>
                                                    <td class="px-6 py-4">${booking.tenant.account.email}</td>
                                                    <td class="px-6 py-4">${booking.roomType.roomTypeName}</td>
                                                    <td class="px-6 py-4 text-center date">${booking.createdDate}</td>
                                                    <td class="px-6 py-4">
                                                        <c:choose>
                                                            <c:when test="${booking.status == 1}">
                                                                <p class="bg-sky-100 text-sky-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Đang chờ
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${booking.status == 4}">
                                                                <p class="bg-rose-100 text-rose-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Từ chối
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${booking.status == 3}">
                                                                <p class="bg-slate-100 text-slate-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Khách huỷ
                                                                </p>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <c:if test="${booking.status == 1}">
                                                        <td class="px-6 py-4 flex space-x-[20px]">
                                                            <form method = "post" action="/sakura/landlord/rentalRequestList">
                                                                <input type ="hidden" name ="queryType" value ="accept"/>
                                                                <input type ="hidden" name ="bookingRequestID" value="${booking.bookingRequestID}"/>
                                                                <input type ="hidden" name ="hostelID" value="${requestScope.hostelID}">
                                                                <button type = "submit" class="w-fit px-[10px] py-[3px] bg-[#288D87] hover:bg-[#1D837D] text-[#fafafa] rounded">
                                                                    Đồng ý
                                                                </button>
                                                            </form>   
                                                            <form method = "post" action="/sakura/landlord/rentalRequestList">
                                                                <input type ="hidden" name ="queryType" value ="reject"/>
                                                                <input type ="hidden" name ="hostelID" value="${requestScope.hostelID}">
                                                                <input type ="hidden" name ="bookingRequestID" value="${booking.bookingRequestID}"/>
                                                                <button type = "button" class="deny-request w-fit px-[10px] py-[3px] bg-[#fff] border border-slate-300 hover:border-[#17535B] text-slate-400 hover:text-[#17535B] rounded">
                                                                    Từ chối
                                                                </button>
                                                                <%@include file="../view/modalLandlordBookingRequest.jsp" %>
                                                            </form>    
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${booking.status == 4}">
                                                        <td class="py-4">
                                                            ${(booking.description == null || booking.description.length() == 0) ? "Không có" : booking.description}
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
                                    Không có
                                </c:if>
                                <c:if test="${not empty requestScope.invitationList}">
                                    <table class="w-full text-[16px] text-left text-gray-800 mb-[20px] overflow-x-auto">
                                        <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                            <tr>
                                                <th scope="col" class="px-6 py-3 text-center">Tên nhà trọ</th>
                                                <th scope="col" class="px-6 py-3 text-center">Tên người nhận</th>
                                                <th scope="col" class="px-6 py-3 text-center">Số điện thoại</th>
                                                <th scope="col" class="px-6 py-3 text-center">Email</th>
                                                <th scope="col" class="px-6 py-3 text-center">Thời gian gửi</th>
                                                <th scope="col" class="px-6 py-3 text-center">Trạng thái</th>
                                                <th scope="col" class="px-6 py-3 text-center">Hợp đồng</th>
                                                <th scope="col" class="px-6 py-3 text-center"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items = "${requestScope.invitationList}" var="invitation">
                                                <tr class="bg-white border-b hover:bg-gray-50">
                                                    <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                        ${invitation.roomType.hostel.hostelName}
                                                    </td>
                                                    <td class="px-6 py-4 ">
                                                        ${invitation.tenant.fullname}
                                                    </td>
                                                    <td class="px-6 py-4 ">
                                                        ${invitation.tenant.phone}
                                                    </td>
                                                    <td class="px-6 py-4 ">
                                                        ${invitation.tenant.account.email}
                                                    </td>
                                                    <td class="px-6 py-4 text-center">
                                                        ${invitation.createdDate}
                                                    </td>
                                                    <td class="px-6 py-4 ">
                                                        <c:choose>
                                                            <c:when test="${invitation.status == 2}">
                                                                <p class="bg-sky-100 text-sky-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Đang chờ
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${invitation.status == 5}">
                                                                <p class="bg-rose-100 text-rose-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Bị từ chối
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${invitation.status == 6}">
                                                                <p class="bg-slate-100 text-slate-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Đã hủy
                                                                </p>
                                                            </c:when>
                                                            <c:when test="${invitation.status == 7}">
                                                                <p class="bg-emerald-100 text-emerald-800 font-semibold w-[120px] mx-auto py-[3px] rounded text-center">
                                                                    Thành công
                                                                </p>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>

                                                    <td class="px-6 py-4 flex items-center space-x-[20px]">
                                                        <form method = "post" action="/sakura/landlord/contract-detail">
                                                            <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                                                            <button type = "submit" class="w-fit px-[10px] py-[3px] bg-[#288D87] hover:bg-[#1D837D] text-[#fff] rounded">
                                                                Xem
                                                            </button>
                                                        </form>
                                                        <c:if test="${invitation.status == 2}">
                                                            <form method = "post" action="/sakura/contract/add-contract">
                                                                <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                                                                <input type ="hidden" name ="queryType" value ="edit"/>
                                                                <button type = "submit" class="w-fit px-[10px] py-[3px] bg-[#288D87] hover:bg-[#1D837D] text-[#fff] rounded">
                                                                    Sửa
                                                                </button>
                                                            </form>
                                                            <form method = "post" action="/sakura/contract/deny-contract">
                                                                <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                                                                <button type = "submit" class="w-fit px-[10px] py-[3px] bg-[#288D87] hover:bg-[#1D837D] text-[#fff] rounded">
                                                                    Hủy
                                                                </button>
                                                            </form>
                                                        </c:if>
                                                    </td>
                                                    <td class="text-left px-6 py-4 overflow-x-auto">
                                                        <c:if test="${invitation.status == 5}">
                                                            ${(invitation.description == null || invitation.description.length() == 0) ? "Không có" : invitation.description}
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <!-- Modal list-->
                                                <!-- End modal list-->
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

        <script src="../assets/tailwind-elements/index.min.js"></script>
        <script>
            var open_modal_1 = document.querySelectorAll('.deny-request');
            for (let i = 0; i < open_modal_1.length; ++i) {
                open_modal_1[i].addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal('.confirmDenyRequest');
                });
            }

            var close_modal_1 = document.querySelectorAll('.confirmDenyRequest .confirmDenyRequest-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.confirmDenyRequest');
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
                const modal_1 = document.querySelector('.confirmDenyRequest');
                if (isEscape && modal_1.classList.contains('active-modal')) {
                    toggleModal('.confirmDenyRequest');
                }
            };

            function toggleModal(modal_item) {
                const modal = document.querySelector(modal_item);
                modal.classList.toggle('active-modal');
                modal.classList.toggle('opacity-0');
                modal.classList.toggle('pointer-events-none');
            }

            $(document).ready(function () {
                let allDateCells = $(".date");
                for (let i = 0; i < allDateCells.length; i++) {
                    let node = allDateCells[i];
                    let isoDate = node.childNodes[0].nodeValue;
                    console.log(isoDate);
                    node.childNodes[0].nodeValue = isoDate.split('-').reverse().join('/');
                }
            });
        </script> 
        <script>
            var open_modal_view_desc = document.querySelectorAll('.view-desc');
            for (let i = 0; i < open_modal_view_desc.length; ++i) {
                open_modal_view_desc[i].addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal('.viewDesc');
                });
            }

            var close_modal_view_desc = document.querySelectorAll('.viewDesc .viewDesc-close');
            for (let i = 0; i < close_modal_view_desc.length; ++i) {
                close_modal_view_desc[i].addEventListener('click', () => {
                    toggleModal('.viewDesc');
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
                const modal_1 = document.querySelector('.viewDesc');
                if (isEscape && modal_1.classList.contains('active-modal')) {
                    toggleModal('.viewDesc');
                }
            };

        </script> 
        <script>
            var open_modal_view_inv_desc = document.querySelectorAll('.view-invite-desc');
            for (let i = 0; i < open_modal_view_inv_desc.length; ++i) {
                open_modal_view_inv_desc[i].addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal('.viewInviteDesc');
                });
            }

            var close_modal_view_inv_desc = document.querySelectorAll('.viewInviteDesc .viewInviteDesc-close');
            for (let i = 0; i < close_modal_view_inv_desc.length; ++i) {
                close_modal_view_inv_desc[i].addEventListener('click', () => {
                    toggleModal('.viewInviteDesc');
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
                const modal_1 = document.querySelector('.viewInviteDesc');
                if (isEscape && modal_1.classList.contains('active-modal')) {
                    toggleModal('.viewInviteDesc');
                }
            };

        </script> 
    </body>
</html>
