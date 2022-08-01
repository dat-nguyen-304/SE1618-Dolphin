<%-- 
    Document   : LRoomDetail
    Created on : Jun 20, 2022, 8:56:54 PM
    Author     : Admin
--%>

<%@page import="com.dolphin.hostelmanagement.DTO.RoomResident"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Chi tiết phòng trọ </title>
        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/LRoomDetail.css">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />
        <link href="../assets/toastr/toastr.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/toastr/toastr-custom.css" rel="stylesheet" type="text/css"/>

        <script src="../assets/pacejs/pace.min.js" type="text/javascript"></script>
        <link href="../assets/pacejs/pace-theme-default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/pacejs/flash.css" rel="stylesheet" type="text/css"/>
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
                            <a href="#" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Phòng trọ
                            </a>
                        </li>
                        <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Loại phòng ${requestScope.currentRoom.roomType.roomTypeName}</span>
                            </div>
                        </li>
                        <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Phòng ${requestScope.currentRoom.roomNumber}</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <!-- General information -->
                <%@include file="../view/modaLandlordRoomDetail.jsp" %>
                <div class="head-control flex items-center mt-[20px]">
                    <div class="pr-[20px] mr-[20px] border-r border-gray-300">
                        <span>Chọn nhà trọ: </span>
                        <button class="ml-[10px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-[16px] px-[10px] py-[5px] text-center"
                                type="button" data-modal-toggle="hostelModal">
                            ${sessionScope.currentHostel.hostelName}
                        </button>
                    </div>  
                    <div class="">
                        <span>Chọn phòng: </span>
                        <button class="ml-[10px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-[16px] px-[10px] py-[5px] text-center " type="button" data-modal-toggle="roomModal">
                            ${requestScope.currentRoom.roomNumber}
                        </button>
                        <form action="/sakura/landlord/invoice-list" method="post" class="ml-[20px] inline-block bg-[#fff] rounded border border-gray-300 hover:border-[#288D87] py-[5px] px-[10px] group">
                            <button type="submit" name="roomId" value="${requestScope.currentRoom.roomID}" class="font-medium text-[15px] text-gray-600 group-hover:text-[#288D87]">Xem hóa đơn</button>
                        </form>
                    </div>
                </div>

                <div class="grid grid-cols-5 gap-[20px]">
                    <!--LEFT--> 
                    <div class="card col-span-2 bg-[#fff] mt-[20px] p-[20px]">
                        <div class="w-full mb-[20px] flex items-center justify-between">
                            <p class="text-[20px] font-bold text-[#2A3C46">Hợp đồng gần nhất</p>
                            <div>
                                <c:if test="${requestScope.contract != null}">
                                    <form action="/sakura/landlord/contract-detail" method="post" class="inline-block bg-[#fff] rounded border border-gray-300 hover:border-[#288D87] py-[5px] px-[10px] group">
                                        <button type="submit" name="contractID" value="${requestScope.contract.contractID}" class="font-medium text-[15px] text-gray-600 group-hover:text-[#288D87]">
                                            Xem hóa đơn
                                        </button>
                                    </form>
                                    <form action="/sakura/landlord/contract-list" method="post" class="ml-[10px] inline-block bg-[#fff] rounded border border-gray-300 hover:border-[#288D87] py-[5px] px-[10px] group">
                                        <button type="submit" name="roomId" value="${requestScope.currentRoom.roomID}" class="font-medium text-[15px] text-gray-600 group-hover:text-[#288D87]">
                                            Xem tất cả hợp đồng
                                        </button>
                                    </form>
                                </c:if>
                                <c:if test="${requestScope.contract == null}">
                                    Phòng chưa có hợp đồng nào
                                </c:if>

                            </div>
                        </div>
                        <div class="grid grid-cols-6 gap-[8px]">
                            <div class="col-span-2 grid grid-rows-2 gap-0 mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]" >Mã hợp đồng</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold"><fmt:formatNumber groupingUsed = "false" minIntegerDigits="5" value="${requestScope.contract.contractID}" /></p>
                            </div>
                            <div class="col-span-4 grid grid-rows-2 gap-0 mb-[10px] mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Ngày tạo</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">
                                    <fmt:formatDate pattern = "dd/MM/yyyy" value="${requestScope.contract.createdDate}" />
                                </p>
                            </div>

                            <div class="col-span-2 grid grid-rows-2 gap-0 mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Trạng thái</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">
                                    <c:if test="${requestScope.contract.status == 0}">
                                        Kết thúc
                                    </c:if>
                                    <c:if test="${requestScope.contract.status == 1}">
                                        Còn hiệu lực
                                    </c:if>
                                </p>
                            </div>
                            <div class="col-span-4 grid grid-rows-2 gap-0 mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Thời hạn</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">
                                    <fmt:formatDate pattern = "dd/MM/yyyy" value="${requestScope.contract.startDate}" /> - <fmt:formatDate pattern = "dd/MM/yyyy" value="${requestScope.contract.endDate}" />
                                </p>
                            </div>

                            <div class="col-span-2 grid grid-rows-2 gap-0 mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Người cho thuê</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.landlord.fullname}</p>
                            </div>
                            <div class="col-span-4 grid grid-rows-2 gap-0 mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Người thuê</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.tenant.fullname}</p>
                            </div>

                            <div class="col-span-2 grid grid-rows-2 gap-0 mb-[10px]">
                                <fmt:setLocale value = "vi_VN"/>
                                <p class="text-[#929ca5] font-normal text-[15px]">Tiền đặt cọc</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">
                                    <span class="money">
                                        <fmt:formatNumber value = "${requestScope.contract.deposit}" type = "number" pattern="###,###,###VNĐ"/>
                                    </span>
                                </p>
                            </div>
                            <div class="col-span-4 grid grid-rows-2 gap-0 mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Giá hằng tháng</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">
                                    <span class="money">
                                        <fmt:formatNumber value = "${requestScope.contract.rentalFeePerMonth}" type = "number" pattern="###,###,###VNĐ"/>
                                    </span>
                                </p>
                            </div>
                            <c:if test="${requestScope.contract.status == 0}">
                                <div class="col-span-4 grid grid-rows-2 gap-0 mb-[10px]">
                                    <p class="text-[#929ca5] font-normal text-[15px]">Ngày kết thúc hợp đồng: </p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">
                                        <fmt:formatDate pattern = "dd/MM/yyyy" value="${requestScope.contract.actualEndDate}" />
                                    </p>
                                </div>
                            </c:if>
                        </div>
                        <div class="mt-[10px]">
                            <button id="view-contract-desc" class="text-slate-600 border border-slate-400 hover:text-[#288D87] hover:border-[#288D87] font-normal px-[20px] py-[5px] rounded">
                                <i class="bi bi-arrows-angle-expand mr-[5px]"></i>Xem nội dung hợp đồng
                            </button>
                            <%@include file="../view/modalLandlordRoomDetail.jsp" %>
                        </div>
                        <c:if test="${requestScope.contract != null}" >
                            <div class="col-span-6 relative">
                                <div class="float-right text-[#2bc497] text-[18px] font-semibold text-center">
                                    <p><i class="bi bi-check2-all mr-[5px]"></i>Đã xác nhận</p>
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <!--RIGHT-->
                    <div class="card col-span-3 bg-[#fff] p-[20px] mt-[20px]">
                        <div class="w-full mb-[20px] flex items-center justify-between">
                            <p class="text-[20px] font-bold text-[#2A3C46">Thông tin phòng</p>
                            <div class="flex items-center">
                                <!-- Modal update room toggle -->
                                <button id="updateRoom-1" type="submit" name="action" value="Save" class="bg-[#fff] rounded border border-gray-300 hover:border-[#288D87] py-[5px] px-[10px] group">
                                    <p class="font-medium text-[15px] text-gray-600 group-hover:text-[#288D87]">Chỉnh sửa thông tin phòng</p>
                                </button>

                                <!-- Modal delete room toggle -->
                                <c:if test="${requestScope.contract == null}">
                                    <button id="deleteRoom-1" type="submit" name="action" value="Save" class="ml-[20px] bg-[#fff] rounded border border-gray-300 hover:border-[#288D87] py-[5px] px-[10px] group">
                                        <p class="font-medium text-[15px] text-gray-600 group-hover:text-[#288D87]">Xóa phòng</p>
                                    </button>
                                </c:if>
                            </div>
                        </div>
                        <div class="grid grid-cols-6 gap-[8px]">
                            <div class="col-span-2 grid grid-rows-2 gap-0 mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]" >Loại phòng</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.currentRoom.roomType.roomTypeName}</p>
                            </div>
                            <div class="col-span-4 grid grid-rows-2 gap-0 mb-[10px] mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Giá thuê</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">
                                    <span class="money">
                                        <c:if test="${requestScope.contract != null}">
                                            <fmt:formatNumber value = "${requestScope.contract.rentalFeePerMonth}" type = "number" pattern="###,###,### VNĐ"/>
                                        </c:if>
                                        <c:if test="${requestScope.contract == null}">
                                            <fmt:formatNumber value = "${requestScope.currentRoom.roomType.advertisedPrice}" type = "number" pattern="###,###,### VNĐ"/> (Giá giới thiệu)
                                        </c:if>
                                    </span>
                                </p>
                            </div>

                            <div class="col-span-2 grid grid-rows-2 gap-0 mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Diện tích</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.currentRoom.roomType.area}m<sup>2</sup></p>
                            </div>
                            <div class="col-span-2 grid grid-rows-2 gap-0 mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Số người tối đa</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">
                                    ${requestScope.currentRoom.roomType.maxNumberOfResidents} người
                                </p>
                            </div>

                            <div class="col-span-2 grid grid-rows-2 gap-[3px] mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Số người hiện tại</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="residentQuantity">${requestScope.residentList.size()}</span></p>
                            </div>

                        </div>
                        <div class="mt-[10px] pb-[30px] border-b border-gray-200">
                            <p class="text-[#929ca5] font-normal"><i class="bi bi-info-circle mr-[5px]"></i>Mô tả</p>
                            <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.currentRoom.roomType.description}</p>
                        </div>
                        <div class="mt-[30px]">
                            <div class="addMemberElement mb-[20px]">
                                <c:if test="${requestScope.residentList.size() < requestScope.currentRoom.roomType.maxNumberOfResidents && requestScope.contract != null && request.contract.status == 1}">
                                    <!-- Modal toggle -->
                                    <button id="addMember-1" type="submit" name="action" value="Save" class="actBtn mb-[20px] bg-[#17535B] text-[#f6fafc] rounded px-[10px] py-[5px] float-right">
                                        Thêm thành viên
                                    </button>
                                    <span class="disBtn hidden text-[17px] text-emerald-500 h-[30px] leading-[45px]">Số người của phòng này đã đạt tối đa</span>
                                </c:if>
                                <c:if test="${requestScope.residentList.size() >= requestScope.currentRoom.roomType.maxNumberOfResidents}">
                                    <span class="disBtn text-[17px] text-emerald-500 h-[30px] leading-[45px]">Số người của phòng này đã đạt tối đa</span>
                                    <button id="addMember-1" type="submit" name="action" value="Save" class="actBtn hidden mb-[20px] bg-[#17535B] text-[#f6fafc] rounded px-[10px] py-[5px] float-right">
                                        Thêm thành viên
                                    </button>
                                </c:if>
                            </div>
                            <c:if test="${not empty requestScope.residentList}">
                                <div class="member-list-element mt-[20px]">
                                </c:if>
                                <c:if test="${empty requestScope.residentList}">
                                    <div class="hidden member-list-element mt-[20px]">
                                    </c:if>
                                    <table class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                                        <thead>
                                            <tr class="text-[13px] text-center py-[10px] text-gray-700 uppercase bg-gray-100 grid grid-cols-12 gap-[10px]">
                                                <th scope="col" class="col-span-1">Mã số</th>
                                                <th scope="col" class="col-span-3 text-left">Họ & tên</th>
                                                <th scope="col" class="col-span-2">Điện thoại</th>
                                                <th scope="col" class="col-span-2">Ngày sinh</th>
                                                <th scope="col" class="col-span-4"><span class="sr-only">Update/Remove</span></th>
                                            </tr>
                                        </thead>
                                        <tbody class="member-list">
                                        <input type="hidden" name="residentQuantity" value="${requestScope.residentList.size()}"/>
                                        <c:if test="${not empty requestScope.residentList}">
                                            <c:forEach items="${requestScope.residentList}" var="resident">
                                                <tr class="py-[10px] text-[16px] bg-white border-b hover:bg-gray-50 grid grid-cols-12 gap-[10px]">
                                                    <td class="col-span-1 text-center">
                                                        <p class="p-2">${resident.roomResidentID}</p>
                                                    </td>
                                                    <td class="col-span-3">
                                                        <input name="updateFullName" type="text" class="w-full p-2" value="${resident.fullname}"/>
                                                    </td>
                                                    <td class="col-span-2">
                                                        <input name="updatePhone" type="text" class="w-full p-2" value="${resident.phone}"/>
                                                    </td>
                                                    <td class="col-span-2">
                                                        <input name="updateDob" type="date" class="w-full p-2"  value="${resident.dob}"/>
                                                    </td>
                                                    <td class="col-span-4 flex justify-around items-center">
                                                        <button onclick="updateMember(this)" type="submit" value="${resident.roomResidentID}" class="mx-auto font-[15px] text-[#288D87] hover:underline">Lưu thay đổi</button>
                                                        <div class="backup">
                                                            <button onclick="resetMember(this, '${resident.fullname}', '${resident.phone}', '${resident.dob}')" class="mx-auto font-[15px] text-[#288D87] hover:underline">Hoàn tác</button>
                                                        </div>
                                                        <button onclick="deleteMember(this)" type="submit" value="${resident.roomResidentID}" class="mx-auto font-[15px] text-[#288D87] hover:underline">Xóa</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>


                <%@include file="../view/footerDashboard.jsp" %>

            </div>

            <script src="../assets/javascript/checkvalid.js"></script>
            <script src="../assets/toastr/toastr.min.js" type="text/javascript"></script>
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
                                                            var checkRoom = true;
                                                            function checkValidRoom(element) {
                                                                const hostelId = document.querySelector("input[name='hostelId']");
                                                                const validRoomMessage = document.querySelector(".validRoomMessage");
                                                                const updateRoomBtn = document.querySelector(".updateRoom");
                                                                const roomNumber = document.querySelector("input[name='roomNumber']");
                                                                if (!element.value.trim()) {
                                                                    validRoomMessage.innerHTML = 'Tên phòng không được trống';
                                                                    checkRoom = false;
                                                                } else
                                                                if (roomNumber.value.trim() !== element.value.trim()) {
                                                                    let valid = isValid(element.value.trim(), 'name');
                                                                    if (!valid) {
                                                                        validRoomMessage.innerHTML = 'Tên phòng chỉ được chứa chữ cái, chữ số và khoảng trắng';
                                                                        checkRoom = false;
                                                                    } else
                                                                        jQuery.ajax({
                                                                            type: 'POST',
                                                                            data: {
                                                                                'roomNumber': element.value.trim(),
                                                                                'hostelId': hostelId.value.trim()
                                                                            },
                                                                            url: '/sakura/room/check-room-valid',
                                                                            success: function (response) {
                                                                                if (response) {
                                                                                    validRoomMessage.innerHTML = response;
                                                                                    checkRoom = false;
                                                                                } else {
                                                                                    validRoomMessage.innerHTML = "";
                                                                                    checkRoom = true;
                                                                                }
                                                                            },

                                                                            error: function () {
                                                                            },
                                                                            complete: function (result) {
                                                                            }
                                                                        });
                                                                } else {
                                                                    validRoomMessage.innerHTML = "";
                                                                    checkRoom = true;
                                                                }
                                                            }



                                                            function updateRoom() {
                                                                console.log("----- da vao update room ------------");
                                                                const roomId = document.querySelector("input[name='roomId']");
                                                                const updateRoomNumber = document.querySelector("input[name='updateRoomNumber']");
                                                                const updateRoomType = document.querySelector("select[name='updateRoomType']");
                                                                const messageElement = document.querySelector(".updateRoomMessage");
                                                                if (checkRoom) {
                                                                    jQuery.ajax({
                                                                        type: 'GET',
                                                                        data: {'roomId': roomId.value.trim(),
                                                                            'updateRoomNumber': updateRoomNumber.value.trim(),
                                                                            'updateRoomType': updateRoomType.value.trim()
                                                                        },
                                                                        url: '/sakura/room/update-room',
                                                                        success: function (response) {
                                                                            toggleModal('.updateRoommodal1');
                                                                            showToast('success', response);
                                                                            setTimeout(function () {
                                                                                window.location.reload();
                                                                            }, 1000);
                                                                        },
                                                                        error: function () {
                                                                        },
                                                                        complete: function (result) {
                                                                        }
                                                                    });
                                                                } else {
                                                                    showToast('error', 'Vui lòng kiểm tra lại thông tin');
                                                                }
                                                            }
            </script>
            <script>
                function deleteRoom(element) {
                    const deleteRoomId = document.querySelector("input[name='roomId']");
                    const deleteRoomBtn = document.querySelector(".deleteRoomBtn");
                    const hostelId = document.querySelector("input[name='hostelId']");

                    jQuery.ajax({
                        type: 'POST',
                        data: {'deleteRoomId': deleteRoomId.value.trim(),
                            'hostelId': hostelId.value.trim()
                        },
                        url: '/sakura/room/delete-room',
                        success: function (response) {
                            toggleModal('.deleteRoommodal1');
                            showToast('success', 'Xóa thành công! Đang cập nhật trang.');
                            function Redirect() {
                                let urll = "/sakura/landlord/room-type";
                                console.log(urll);
                                window.location = urll;
                            }
                            setTimeout(Redirect(), 1000);
                        },
                        error: function () {
                        },
                        complete: function (result) {
                        }
                    });
                }
            </script>

            <script>
                function updateMember(element) {
                    console.log("da vao update member");
                    const memberElement = element.parentElement.parentElement;
                    const residentId = element;
                    const updateFullName = memberElement.querySelector("input[name='updateFullName']");
                    const updatePhone = memberElement.querySelector("input[name='updatePhone']");
                    const updateDob = memberElement.querySelector("input[name='updateDob']");
                    const updateMemberMessage = document.querySelector(".updateMemberMessage");
                    if (!updateFullName.value.trim() || !updatePhone.value.trim() || !updateDob.value.trim()) {
                        let message = "";
                        if (!updateFullName.value.trim()) {
                            message += "Tên người ở - ";
                        }
                        if (!updatePhone.value.trim()) {
                            message += "SÐT - ";
                        }
                        if (!updateDob.value.trim()) {
                            message += "Ngày sinh ";
                        }
                        message += "không được trống!";
                        showToast('error', message);
                    } else {
                        let checkName = checkPhone = false;
                        checkName = isValid(updateFullName.value.trim(), 'human');
                        checkPhone = isValid(updatePhone.value.trim(), 'phone');
                        if (checkName && checkPhone) {
                            jQuery.ajax({
                                type: 'POST',
                                data: {'residentId': residentId.value.trim(),
                                    'updateFullName': updateFullName.value.trim(),
                                    'updatePhone': updatePhone.value.trim(),
                                    'updateDob': updateDob.value.trim()
                                },
                                url: '/sakura/room/update-member',
                                success: function (response) {
                                    const backup = memberElement.querySelector(".backup");
                                    const htmlString = "<button onclick=\"resetMember(this, '" + updateFullName.value.trim() + "', '" + updatePhone.value.trim() + "', '" + updateDob.value.trim() + "')\" class=\"mx-auto font-[15px] text-[#288D87] hover:underline\">Hoàn tác</button>";
                                    backup.innerHTML = htmlString;
                                    showToast('info', response.toString());
                                },
                                error: function () {
                                },
                                complete: function (result) {
                                }
                            });
                        } else {
                            if (!checkName) {
                                showToast('error', 'Tên chỉ bao gồm chỉ cái và khoảng trắng');
                            } else if (!checkPhone) {
                                showToast('error', 'Số điện thoại bao gồm 10 chữ số');
                            }
                        }
                    }
                }

                function resetMember(element, fullname, phone, dob) {
                    const memberElement = element.parentElement.parentElement.parentElement;
                    const updateFullName = memberElement.querySelector("input[name='updateFullName']");
                    const updatePhone = memberElement.querySelector("input[name='updatePhone']");
                    const updateDob = memberElement.querySelector("input[name='updateDob']");
                    const updateMemberMessage = document.querySelector(".updateMemberMessage");
                    updateFullName.value = fullname;
                    updatePhone.value = phone;
                    updateDob.value = dob;
                }
            </script>

            <script>
                function deleteMember(element) {
                    const memberElement = element.parentElement.parentElement;
                    const residentQuantityElement = document.querySelector(".residentQuantity");
                    const residentQuantity = Number(residentQuantityElement.innerHTML);
                    const residentId = element;
                    jQuery.ajax({
                        type: 'POST',
                        data: {'residentId': residentId.value.trim()
                        },
                        url: '/sakura/room/delete-member',
                        success: function (response) {
                            showToast('info', response.toString());
                            memberElement.remove();
                            residentQuantityElement.innerHTML = residentQuantity - 1;
                            updateCurrentResident(residentQuantity - 1);
                            if (${requestScope.currentRoom.roomType.maxNumberOfResidents} > residentQuantity - 1) {
                                const actBtn = document.querySelector(".actBtn");
                                const disBtn = document.querySelector(".disBtn");
                                actBtn.style.display = "inline-block";
                                disBtn.style.display = "none";
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
                let checkAddName = checkAddPhone = checkAddDob = true;
                function checkValidAddName(element) {
                    const validAddNameMessage = document.querySelector(".validAddNameMessage");
                    if (!element.value.trim()) {
                        validAddNameMessage.innerHTML = 'Tên không được trống';
                        checkAddName = false;
                    } else {
                        let valid = isValid(element.value.trim(), 'human');
                        if (!valid) {
                            validAddNameMessage.innerHTML = 'Tên chỉ được chứa chữ cái và khoảng trắng';
                            checkAddName = false;
                        } else {
                            validAddNameMessage.innerHTML = '';
                            checkAddName = true;
                        }
                    }
                }

                function checkValidAddPhone(element) {
                    const validAddPhoneMessage = document.querySelector(".validAddPhoneMessage");
                    if (!element.value.trim()) {
                        validAddPhoneMessage.innerHTML = 'SÐT không được trống';
                        checkDesc = false;
                    } else {
                        let valid = isValid(element.value.trim(), 'phone');
                        if (!valid) {
                            validAddPhoneMessage.innerHTML = 'SĐT gồm 10 chữ số';
                            checkAddPhone = false;
                        } else {
                            validAddPhoneMessage.innerHTML = '';
                            checkAddPhone = true;
                        }
                    }
                }

                function addMember() {
                    console.log("da vao add member");
                    const roomId = document.querySelector("input[name='roomId']");
                    const memberName = document.querySelector("input[name='memberName']");
                    const memberPhone = document.querySelector("input[name='memberPhone']");
                    const memberDob = document.querySelector("input[name='memberDob']");
                    const memberList = document.querySelector(".member-list");
                    const residentQuantityElement = document.querySelector(".residentQuantity");
                    const residentQuantity = Number(residentQuantityElement.innerHTML);
                    const validAddNameMessage = document.querySelector(".validAddNameMessage");
                    const validAddPhoneMessage = document.querySelector(".validAddPhoneMessage");
                    const validAddDobMessage = document.querySelector(".validAddDobMessage");
                    if (!memberName.value.trim() || !memberPhone.value.trim() || !memberDob.value.trim()) {
                        if (!memberName.value.trim()) {
                            validAddNameMessage.innerHTML = "Tên không được trống";
                            checkAddName = false;
                        }
                        if (!memberPhone.value.trim()) {
                            validAddPhoneMessage.innerHTML = "SÐT không được trống";
                            checkAddPhone = false;
                        }
                        if (!memberDob.value.trim()) {
                            validAddDobMessage.innerHTML = "Ngày sinh không được trống";
                            checkAddDob = false;
                        }
                        showToast('error', 'Vui lòng kiểm tra lại thông tin');
                    } else {
                        if (checkAddName && checkAddPhone) {
                            jQuery.ajax({
                                type: 'POST',
                                data: {'memberName': memberName.value.trim(),
                                    'memberPhone': memberPhone.value.trim(),
                                    'memberDob': memberDob.value.trim(),
                                    'roomId': roomId.value.trim()
                                },
                                url: '/sakura/room/add-member',
                                success: function (response) {
                                    memberName.value = "";
                                    memberPhone.value = "";
                                    memberDob.value = "";
                                    const res = response.toString();
                                    if (res.includes("py-[10px] text-[16px]")) {
                                        const memberListElement = document.querySelector('.member-list-element');
                                        memberListElement.style.display = 'block';
                                        memberList.innerHTML += response;
                                        residentQuantityElement.innerHTML = residentQuantity + 1;
                                        if (${requestScope.currentRoom.roomType.maxNumberOfResidents} <= residentQuantity + 1) {
                                            const actBtn = document.querySelector(".actBtn");
                                            const disBtn = document.querySelector(".disBtn");
                                            actBtn.style.display = "none";
                                            disBtn.style.display = "block";
                                        }
                                        showToast('success', 'Thêm thành công!');
                                        toggleModal('.addMembermodal1');
                                        updateCurrentResident(residentQuantity + 1);
                                    } else {
                                        showToast('error', response);
                                    }

                                },
                                error: function () {
                                },
                                complete: function (result) {
                                }
                            });
                        } else {
                            showToast('error', 'Vui lòng kiểm tra lại thông tin');
                        }
                    }
                }
            </script>

            <script>
                function updateCurrentResident(quantity) {
                    const updateResidentRoomId = document.querySelector("input[name='roomId']");
                    jQuery.ajax({
                        type: 'POST',
                        data: {'roomId': updateResidentRoomId.value,
                            'currentResidentQuantity': quantity
                        },
                        url: '/sakura/room/update-current-resident-number',
                        success: function (response) {
                        },
                        error: function () {
                        },
                        complete: function (result) {
                        }
                    });
                }
            </script>

            <script>
                var open_modal_1 = document.querySelector('#updateRoom-1');
                open_modal_1.addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal('.updateRoommodal1');
                });

                //            var open_modal_2 = document.querySelector('#updateRoom-2');
                //            open_modal_2.addEventListener('click', function (event) {
                //                event.preventDefault();
                //                toggleModal('.updateRoommodal2');
                //            });

                var close_modal_1 = document.querySelectorAll('.updateRoommodal1 .updateRoommodal1-close');
                for (let i = 0; i < close_modal_1.length; ++i) {
                    close_modal_1[i].addEventListener('click', () => {
                        toggleModal('.updateRoommodal1');
                        console.log('close 1');
                    });
                }

                var close_modal_2 = document.querySelectorAll('.updateRoommodal2 .updateRoommodal2-close');
                for (let i = 0; i < close_modal_1.length; ++i) {
                    close_modal_2[i].addEventListener('click', () => {
                        toggleModal('.updateRoommodal2');
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
                    const modal_1 = document.querySelector('.updateRoommodal1');
                    const modal_2 = document.querySelector('.updateRoommodal2');
                    if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                        toggleModal('.updateRoommodal1');
                    }
                    if (isEscape && modal_2.classList.contains('active-modal')) {
                        toggleModal('.updateRoommodal2');
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
                var open_modal_1 = document.querySelector('#deleteRoom-1');
                open_modal_1.addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal('.deleteRoommodal1');
                });

                var close_modal_1 = document.querySelectorAll('.deleteRoommodal1 .deleteRoommodal1-close');
                for (let i = 0; i < close_modal_1.length; ++i) {
                    close_modal_1[i].addEventListener('click', () => {
                        toggleModal('.deleteRoommodal1');
                        console.log('close 1');
                    });
                }
                function toggleModal(modal_item) {
                    const modal = document.querySelector(modal_item);
                    modal.classList.toggle('active-modal')
                    modal.classList.toggle('opacity-0');
                    modal.classList.toggle('pointer-events-none');
                }
            </script>

            <script>
                var open_modal_1 = document.querySelector('#addMember-1');
                console.log(open_modal_1);
                open_modal_1.addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal('.addMembermodal1');
                });

                //            var open_modal_2 = document.querySelector('#addMember-2');
                //            open_modal_2.addEventListener('click', function (event) {
                //                event.preventDefault();
                //                toggleModal('.addMembermodal2');
                //            });

                var close_modal_1 = document.querySelectorAll('.addMembermodal1 .addMembermodal1-close');
                for (let i = 0; i < close_modal_1.length; ++i) {
                    close_modal_1[i].addEventListener('click', () => {
                        toggleModal('.addMembermodal1');
                        console.log('close 1');
                    });
                }

                var close_modal_2 = document.querySelectorAll('.addMembermodal2 .addMembermodal2-close');
                for (let i = 0; i < close_modal_1.length; ++i) {
                    close_modal_2[i].addEventListener('click', () => {
                        toggleModal('.addMembermodal2');
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
                    const modal_1 = document.querySelector('.addMembermodal1');
                    const modal_2 = document.querySelector('.addMembermodal2');
                    if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                        toggleModal('.addMembermodal1');
                    }
                    if (isEscape && modal_2.classList.contains('active-modal')) {
                        toggleModal('.addMembermodal2');
                    }
                };

            </script>
            <script>
                var open_modal_view_ct = document.querySelector('#view-contract-desc');
                open_modal_view_ct.addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal('.viewContractDesc');
                });

                var close_modal_view_ct = document.querySelectorAll('.viewContractDesc .viewContractDesc-close');
                for (let i = 0; i < close_modal_view_ct.length; ++i) {
                    close_modal_view_ct[i].addEventListener('click', () => {
                        toggleModal('.viewContractDesc');
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
                    const modal_view = document.querySelector('.viewContractDesc');
                    if (isEscape && modal_view.classList.contains('active-modal')) {
                        toggleModal('.viewContractDesc');
                    }
                };
            </script>

    </body>

</html>