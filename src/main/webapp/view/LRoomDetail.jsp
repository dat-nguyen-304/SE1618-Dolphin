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

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/LRoomDetail.css">
        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

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
                        <form action="/sakura/landlord/invoice-list" class="ml-[20px] inline-block bg-[#fff] rounded border border-gray-300 hover:border-[#288D87] py-[5px] px-[10px] group">
                            <button type="submit" name="roomId" value="${requestScope.currentRoom.roomID}" class="font-medium text-[15px] text-gray-600 group-hover:text-[#288D87]">Xem hóa đơn</button>
                        </form>
                    </div>
                </div>

                <div class="grid grid-cols-2 gap-[20px]">
                    <!--LEFT--> 
                    <div class="card bg-[#fff] mt-[20px] p-[20px]">
                        <div class="w-full mb-[20px] flex items-center justify-between">
                            <p class="text-[20px] font-bold text-[#2A3C46">Hợp đồng gần nhất</p>
                            <div>
                                <c:if test="${requestScope.contract != null}">
                                    <form action="/sakura/landlord/contract-detail" class="inline-block bg-[#fff] rounded border border-gray-300 hover:border-[#288D87] py-[5px] px-[10px] group">
                                        <button type="submit" name="contractId" value="${requestScope.contract.contractID}" class="font-medium text-[15px] text-gray-600 group-hover:text-[#288D87]">
                                            Xem hóa đơn
                                        </button>
                                    </form>
                                    <form action="/sakura/landlord/contract-list" class="ml-[10px] inline-block bg-[#fff] rounded border border-gray-300 hover:border-[#288D87] py-[5px] px-[10px] group">
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
                                <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.createdDate}</p>
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
                                <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.tenant.fullname}</p>
                            </div>
                            <div class="col-span-4 grid grid-rows-2 gap-0 mb-[10px]">
                                <p class="text-[#929ca5] font-normal text-[15px]">Người thuê</p>
                                <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.landlord.fullname}</p>
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
                        </div>
                        <div class="mt-[10px]">
                            <p class="text-[#929ca5] font-normal"><i class="bi bi-info-circle mr-[5px]"></i>Nội dung</p>
                            <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.description}</p>
                        </div>
                        <c:if test="${requestScope.contract != null}" >
                            <div class="col-span-6 relative">
                                <div class="float-right bg-[#2bc497] px-[10px] py-[5px] text-[18px] font-semibold text-center text-[#fff]">
                                    <p><i class="bi bi-check2-all mr-[5px]"></i>Đã xác nhận</p>
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <!--RIGHT-->
                    <div class="card bg-[#fff] p-[20px] mt-[20px]">
                        <div class="w-full mb-[20px] flex items-center justify-between">
                            <p class="text-[20px] font-bold text-[#2A3C46">Thông tin phòng</p>
                            <div class="flex items-center">
                                <!-- Modal update room toggle -->
                                <button id="updateRoom-1" type="submit" name="action" value="Save" class="bg-[#fff] rounded border border-gray-300 hover:border-[#288D87] py-[5px] px-[10px] group">
                                    <p class="font-medium text-[15px] text-gray-600 group-hover:text-[#288D87]">Chỉnh sửa thông tin phòng</p>
                                </button>

                                <!-- Modal delete room toggle -->
                                <button id="deleteRoom-1" type="submit" name="action" value="Save" class="ml-[20px] bg-[#fff] rounded border border-gray-300 hover:border-[#288D87] py-[5px] px-[10px] group">
                                    <p class="font-medium text-[15px] text-gray-600 group-hover:text-[#288D87]">Xóa phòng</p>
                                </button>
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
                                <c:if test="${requestScope.residentList.size() < requestScope.currentRoom.roomType.maxNumberOfResidents && requestScope.contract != null}">
                                    <!-- Modal toggle -->
                                    <button id="addMember-1" type="submit" name="action" value="Save" class="actBtn mb-[20px] bg-[#17535B] text-[#f6fafc] rounded px-[10px] py-[5px] float-right">
                                        Thêm thành viên
                                    </button>
                                    <span class="disBtn hidden text-xs h-[45px] leading-[45px]">Số người của phòng này đã đạt tối đa</span>
                                </c:if>
                                <c:if test="${requestScope.residentList.size() >= requestScope.currentRoom.roomType.maxNumberOfResidents}">
                                    <span class="disBtn text-xs h-[45px] leading-[45px]">Số người của phòng này đã đạt tối đa</span>
                                    <button id="addMember-1" type="submit" name="action" value="Save" class="actBtn hidden mb-[20px] bg-[#17535B] text-[#f6fafc] rounded px-[10px] py-[5px] float-right">
                                        Thêm thành viên
                                    </button>
                                </c:if>
                            </div>
                            <c:if test="${not empty requestScope.residentList}">
                                <div class="mt-[20px]">
                                    <table class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                                        <thead>
                                            <tr class="text-[13px] text-center py-[10px] text-gray-700 uppercase bg-gray-100 grid grid-cols-12 gap-[10px]">
                                                <th scope="col" class="col-span-2">Mã số</th>
                                                <th scope="col" class="col-span-3 text-left">Họ & tên</th>
                                                <th scope="col" class="col-span-2">Điện thoại</th>
                                                <th scope="col" class="col-span-2">Ngày sinh</th>
                                                <th scope="col" class="col-span-3"><span class="sr-only">Update/Remove</span></th>
                                            </tr>
                                        </thead>
                                        <tbody class="member-list">
                                        <input type="hidden" name="residentQuantity" value="${requestScope.residentList.size()}"/>

                                        <c:forEach items="${requestScope.residentList}" var="resident">
                                            <tr class="py-[10px] text-[16px] bg-white border-b hover:bg-gray-50 grid grid-cols-12 gap-[10px]">
                                                <td class="col-span-2 text-center">
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
                                                <td class="col-span-3 flex justify-around items-center">
                                                    <button onclick="updateMember(this)" type="submit" value="${resident.roomResidentID}" class="mx-auto font-[15px] text-[#288D87] hover:underline">Lưu thay đổi</button>
                                                    <button onclick="deleteMember(this)" type="submit" value="${resident.roomResidentID}" class="mx-auto font-[15px] text-[#288D87] hover:underline">Xóa</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tbody>
                                    </table>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

            </div>


            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                                                        function checkValidRoom(element) {
                                                            const hostelId = document.querySelector("input[name='hostelId']");
                                                            const validRoomMessage = document.querySelector(".validRoomMessage");
                                                            const updateRoomBtn = document.querySelector(".updateRoom");
                                                            const roomNumber = document.querySelector("input[name='roomNumber']");
                                                            console.log("current: ", roomNumber.value.trim());
                                                            console.log("new: ", element.value.trim());
                                                            if (roomNumber.value.trim() !== element.value.trim()) {
                                                                jQuery.ajax({
                                                                    type: 'POST',
                                                                    data: {
                                                                        'roomNumber': element.value,
                                                                        'hostelId': hostelId.value
                                                                    },
                                                                    url: '/sakura/room/check-room-valid',
                                                                    success: function (response) {
                                                                        validRoomMessage.innerHTML = response;
                                                                        if (response) {
                                                                            updateRoomBtn.onclick = (e) => {
                                                                                e.preventDefault();
                                                                            }
                                                                        } else {
                                                                            updateRoomBtn.onclick = () => updateRoom();
                                                                        }
                                                                    },

                                                                    error: function () {
                                                                    },
                                                                    complete: function (result) {
                                                                    }
                                                                });
                                                            } else {
                                                                validRoomMessage.innerHTML = "";
                                                            }
                                                        }



                                                        function updateRoom() {
                                                            console.log("----- da vao update room ------------");
                                                            const roomId = document.querySelector("input[name='roomId']");
                                                            const updateRoomNumber = document.querySelector("input[name='updateRoomNumber']");
                                                            const updateRoomType = document.querySelector("select[name='updateRoomType']");
                                                            const messageElement = document.querySelector(".updateRoomMessage");
                                                            console.log("roomId ", roomId.value);
                                                            console.log("updateRoomNumber ", updateRoomNumber.value);
                                                            console.log("updateRoomType ", updateRoomType.value);
                                                            jQuery.ajax({
                                                                type: 'GET',
                                                                data: {'roomId': roomId.value,
                                                                    'updateRoomNumber': updateRoomNumber.value,
                                                                    'updateRoomType': updateRoomType.value
                                                                },
                                                                url: '/sakura/room/update-room',
                                                                success: function (response) {
                                                                    messageElement.innerHTML = response;
                                                                },
                                                                error: function () {
                                                                },
                                                                complete: function (result) {
                                                                }
                                                            });
                                                        }
        </script>
        <script>
            function deleteRoom(element) {

                const deleteRoomContent = document.querySelector(".deleteRoomContent");
                const deleteRoomId = document.querySelector("input[name='roomId']");
                const deleteRoomBtn = document.querySelector(".deleteRoomBtn");

                jQuery.ajax({
                    type: 'POST',
                    data: {'deleteRoomId': deleteRoomId.value
                    },
                    url: '/sakura/room/delete-room',
                    success: function (response) {
                        deleteRoomContent.innerHTML = response;
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
                console.log("updateFullName: ", updateFullName.value);
                console.log("updatePhone: ", updatePhone.value);
                if (!updateFullName.value || !updatePhone.value || !updateDob.value) {
                    let message = "";
                    if (!updateFullName.value) {
                        message += "Tên người ở - ";
                    }
                    if (!updatePhone.value) {
                        message += "SÐT - ";
                    }
                    if (!updateDob.value) {
                        message += "Ngày sinh ";
                    }
                    message += "không được trống!";
                    showToast('error', message);
                } else {
                    let goAjax = true;
                    let message = "";
                    if (updatePhone.value.length !== 10) {
                        message += "Số điện thoại phải có 10 chữ số";
                        goAjax = false;
                        showToast('error', message);
                    } else
                        for (let i = 0; i < updatePhone.value.length; i++) {
                            if (updatePhone.value.charAt(i) < '0' || updatePhone.value.charAt(i) > '9') {
                                message += "Số điện thoại gồm 10 chữ số!";
                                goAjax = false;
                                showToast('error', message);
                                break;
                            }
                        }

                    if (goAjax === true) {
                        jQuery.ajax({
                            type: 'POST',
                            data: {'residentId': residentId.value,
                                'updateFullName': updateFullName.value,
                                'updatePhone': updatePhone.value,
                                'updateDob': updateDob.value
                            },
                            url: '/sakura/room/update-member',
                            success: function (response) {
                                showToast('info', response.toString());
                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
                    }
                }
            }
        </script>

        <script>
            function deleteMember(element) {
                const memberElement = element.parentElement.parentElement;
                const residentQuantityElement = document.querySelector(".residentQuantity");
                const residentQuantity = Number(residentQuantityElement.innerHTML);
                const residentId = element;
                console.log("Da vao delete member")
                jQuery.ajax({
                    type: 'POST',
                    data: {'residentId': residentId.value
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
            function addMember() {
                console.log("da vao add member");
                const roomId = document.querySelector("input[name='roomId']");
                const memberName = document.querySelector("input[name='memberName']");
                const memberPhone = document.querySelector("input[name='memberPhone']");
                const memberDob = document.querySelector("input[name='memberDob']");
                const addMemberMessage = document.querySelector(".addMemberMessage");
                const memberList = document.querySelector(".member-list");
                const residentQuantityElement = document.querySelector(".residentQuantity");
                const residentQuantity = Number(residentQuantityElement.innerHTML);

                if (!memberName.value || !memberPhone.value || !memberDob.value) {
                    let message = "";
                    if (!memberName.value) {
                        message += "Tên người ở - ";
                    }
                    if (!memberPhone.value) {
                        message += "SÐT - ";
                    }
                    if (!memberDob.value) {
                        message += "Ngày sinh ";
                    }
                    message += "không được trống!";
                    addMemberMessage.innerHTML = message;
                } else {
                    let goAjax = true;
                    let message = "";
                    if (memberPhone.value.length !== 10) {
                        message += "Số điện thoại phải có 10 chữ số";
                        goAjax = false;
                        addMemberMessage.innerHTML = message;
                    } else
                        for (let i = 0; i < memberPhone.value.length; i++) {
                            if (memberPhone.value.charAt(i) < '0' || memberPhone.value.charAt(i) > '9') {
                                message += "Số điện thoại gồm 10 chữ số!";
                                goAjax = false;
                                addMemberMessage.innerHTML = message;
                                break;
                            }
                        }
                    if (goAjax === true) {
                        jQuery.ajax({
                            type: 'POST',
                            data: {'memberName': memberName.value,
                                'memberPhone': memberPhone.value,
                                'memberDob': memberDob.value,
                                'roomId': roomId.value
                            },
                            url: '/sakura/room/add-member',
                            success: function (response) {
                                memberName.value = "";
                                memberPhone.value = "";
                                memberDob.value = "";
                                const res = response.toString();
                                if (res.includes("py-[10px] text-[16px]")) {
                                    memberList.innerHTML += response;
                                    residentQuantityElement.innerHTML = residentQuantity + 1;
                                    addMemberMessage.innerHTML = "Thêm thành công";
                                    if (${requestScope.currentRoom.roomType.maxNumberOfResidents} <= residentQuantity + 1) {
                                        const actBtn = document.querySelector(".actBtn");
                                        const disBtn = document.querySelector(".disBtn");
                                        actBtn.style.display = "none";
                                        disBtn.style.display = "block";
                                    }
                                    updateCurrentResident(residentQuantity + 1);
                                } else {
                                    addMemberMessage.innerHTML = response;
                                }

                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
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

            var open_modal_2 = document.querySelector('#updateRoom-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.updateRoommodal2');
            });

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
                modal.classList.toggle('active-modal')
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

            var open_modal_2 = document.querySelector('#deleteRoom-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.deleteRoommodal2');
            });

            var close_modal_1 = document.querySelectorAll('.deleteRoommodal1 .deleteRoommodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.deleteRoommodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.deleteRoommodal2 .deleteRoommodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.deleteRoommodal2');
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
                const modal_1 = document.querySelector('.deleteRoommodal1');
                const modal_2 = document.querySelector('.deleteRoommodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.deleteRoommodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.deleteRoommodal2');
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
            var open_modal_1 = document.querySelector('#addMember-1');
            console.log(open_modal_1);
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.addMembermodal1');
            });

            var open_modal_2 = document.querySelector('#addMember-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.addMembermodal2');
            });

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


    </body>

</html>