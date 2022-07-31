<%-- 
    Document   : LRoomType
    Created on : Jun 23, 2022, 12:33:26 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Loại phòng</title>
        <%@include file="../view/assets.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/js/splide.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/css/splide.min.css">

        <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/LRoomType.css">
        <link rel="stylesheet" href="../assets/css/toastr.css">

        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />
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
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Loại phòng</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <c:if test="${sessionScope.hostelList == null}">
                    Bạn chưa có nhà trọ nào.
                    <a href="/sakura/landlord/overview">Quay về trang thêm thông tin nhà trọ</a>
                </c:if>
                <%@include file="../view/modalLandlordRoomType.jsp" %>
                <div class="mt-[20px] flex">
                    <div class="flex items-center mr-[20px] pr-[20px] border-r border-gray-300">
                        <span>Chọn nhà trọ: </span>
                        <button class="ml-[10px] inline-block rounded w-fit h-fit py-[5px] px-[20px] bg-[#17535B] hover:bg-[#13484F] flex flex justify-between items-center" type="button" data-modal-toggle="hostelModal">
                            <p class="font-medium text-[16px] text-[#fff]">${sessionScope.currentHostel.hostelName}</p>
                        </button>
                    </div>

                    <c:if test="${requestScope.currentRoomType !=null}">
                        <div class="mr-[20px] flex items-center">    
                            <span>Chọn loại phòng: </span>
                            <button class="ml-[10px] inline-block rounded w-fit h-fit py-[5px] px-[20px] bg-[#288D87] hover:bg-[#248781] flex flex justify-between items-center" type="button" data-modal-toggle="roomModal">
                                <p class="font-medium text-[16px] text-[#fff]">${requestScope.currentRoomType.roomTypeName}</p>
                            </button>
                        </div>
                        <c:if test="${requestScope.currentRoomType.totalRoom == 0}">
                            <button id="deleteRoomType-1" type="submit" name="action" value="Save" class="mr-[20px] rounded w-fit h-fit px-[10px] py-[5px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                                <p class="font-normal text-[16px] text-gray-400 group-hover:text-[#288D87]"><i class="bi bi-trash-fill mr-[5px]"></i>Xóa</p>
                            </button>
                        </c:if>
                        <button id="updateRoomType-1" type="submit" name="action" value="Save" class="mr-[20px] rounded w-fit h-fit px-[10px] py-[5px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                            <p class="font-normal text-[16px] text-gray-400 group-hover:text-[#288D87]"><i class="bi bi-pencil-fill mr-[5px]"></i>Chỉnh sửa</p>
                        </button>
                    </c:if>
                    <button id="addRoomType-1" type="submit" name="action" value="Save" class="mr-[20px] rounded w-fit h-fit px-[10px] py-[5px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                        <p class="font-normal text-[16px] text-gray-400 group-hover:text-[#288D87]"><i class="bi bi-plus-lg mr-[5px]"></i>Thêm loại phòng</p>
                    </button>
                </div>
                <c:if test="${requestScope.currentRoomType == null}">
                    <span class="inline-block mt-[24px]">Nhà trọ ${sessionScope.currentHostel.hostelName} chưa có loại phòng.</span>
                </c:if>
                <c:if test="${requestScope.currentRoomType != null}">
                    <!-- General information -->
                    <div class="flex justify-between mt-[20px] grid grid-cols-5 gap-[20px]">

                        <!--Left-->
                        <div class="flex flex-col col-span-2">
                            <div class="card bg-[#fff] p-[20px]">
                                <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px]">Thông số chung</div>
                                <div class="w-full h-fit mx-auto">
                                    <div class="grid grid-cols-6 gap-[8px]">
                                        <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                            <p class="text-[#929ca5] font-normal">Tên loại phòng</p>
                                            <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.currentRoomType.roomTypeName}</p>
                                        </div>
                                        <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                            <p class="text-[#929ca5] font-normal">Giá</p>
                                            <p class="text-[18px] text-[#2A3C46] font-semibold">
                                                <fmt:setLocale value = "vi_VN"/>
                                                <fmt:formatNumber value = "${requestScope.currentRoomType.advertisedPrice}" type = "number" pattern="###,###,###VNĐ"/>
                                            </p>
                                        </div>
                                        <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                            <p class="text-[#929ca5] font-normal">Diện tích</p>
                                            <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.currentRoomType.area}m<sup>2</sup></p>
                                        </div>
                                        <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                            <p class="text-[#929ca5] font-normal">Số người tối đa</p>
                                            <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.currentRoomType.maxNumberOfResidents} người</p>
                                        </div>
                                        <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                            <p class="text-[#929ca5] font-normal">Số phòng trống</p>
                                            <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="available-room">${requestScope.currentRoomType.availableRoom}</span> phòng</p>
                                        </div>
                                        <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                            <p class="text-[#929ca5] font-normal">Tổng phòng</p>
                                            <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="total-room">${requestScope.currentRoomType.totalRoom}</span> phòng</p>
                                        </div>
                                    </div>
                                    <div class="mt-[20px]">
                                        <p class="text-[#929ca5] font-normal"><i class="bi bi-info-circle mr-[5px]"></i>Mô tả</p>
                                        <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.currentRoomType.description}</p>
                                    </div>
                                </div>
                            </div>

                            <div class="card bg-[#fff] p-[20px] mt-[20px]">
                                <div class="flex items-center justify-between mb-[20px]">
                                    <div class="text-[20px] font-bold text-[#2A3C46]">Danh sách phòng loại <span class="text-[#278d87]">${requestScope.currentRoomType.roomTypeName}</span></div>
                                    <button class="rounded w-fit h-fit px-[10px] py-[5px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center group"
                                            type="button" data-modal-toggle="addRoom">
                                        <p class="font-normal text-[16px] text-gray-400 group-hover:text-[#288D87]"><i class="bi bi-plus-lg mr-[5px]"></i>Thêm phòng</p>
                                    </button>
                                </div>
                                <div class="w-1/2 grid grid-cols-2 gap-[10px]">
                                    <p class="">Đã có người thuê</p>
                                    <p class="w-[40px] h-[20px] bg-[#17535B] rounded"><p>
                                </div>
                                <div class="w-1/2 grid grid-cols-2 gap-[10px]">
                                    <p class="">Phòng trống</p>
                                    <p class="w-[40px] h-[20px] bg-white border-2 border-gray-200 rounded"><p>
                                </div>
                                <c:if test="${requestScope.roomList.size() == 0}">
                                    <p class="no-room-message">Chưa có phòng nào</p>
                                </c:if>
                                <c:if test="${requestScope.currentRoomType !=null}">
                                    <div class="room-list grid grid-cols-8 gap-[10px] mt-[20px]">
                                        <c:if test="${requestScope.roomList.size() > 0}">
                                            <c:forEach items="${requestScope.roomList}" var="room">
                                                <c:if test="${room.status == 0}"> <!--<!-- empty -->
                                                    <form action="/sakura/landlord/room-detail" method="post" class="border-2 rounded text-center p-1 hover:border-[#17535B] hover:text-[#17535B] duration-150">
                                                        <button name="roomId" value="${room.roomID}" class="w-full">${room.roomNumber}</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${room.status == 1}">
                                                    <form action="/sakura/landlord/room-detail" method="post" class="rounded text-center p-1 bg-[#17535B] text-white hover:bg-[#13484F] duration-150">
                                                        <button name="roomId" value="${room.roomID}" class="w-full">${room.roomNumber}</button>
                                                    </form>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>

                                    </c:if>
                                    <c:if test="${requestScope.currentRoomType == null}">
                                        <p class="text-gray-400 text-center text-[20px] py-[10px]">Trống</p>
                                    </c:if>
                                </div>        
                            </div>
                        </div>

                        <!--Right-->
                        <div class="card bg-[#fff] p-5 flex flex-col col-span-3">
                            <!--Hostel image-->
                            <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                                <p>Hình ảnh </p>
                                <div class="flex ">
                                    <span id="cnt-images" class="font-light text-[18px] mr-[10px]"></span>
                                    <button onclick="unselectAllImages()" class="text-[15px] rounded w-[150px] h-[30px] font-light flex justify-center items-center mr-[10px] bg-[#17535B] hover:bg-[#13484F] text-[#fff]" id="unselect-all-images" >
                                        <p><i class="bi bi-slash-circle mr-[5px]"></i>Bỏ chọn tất cả</p>
                                    </button>
                                    <!-- Modal remove image toggle -->
                                    <button class="text-[15px] rounded w-[150px] h-[30px] font-light flex justify-center items-center mr-[10px] bg-[#17535B] hover:bg-[#13484F] text-[#fff]" id="delete-images" >
                                        <p><i class="bi bi-trash3-fill mr-[5px]"></i>Xoá hình đã chọn</p>
                                    </button>
                                    <!-- Modal add image toggle -->
                                    <button class="text-[15px] rounded w-[150px] h-[30px] font-light flex justify-center items-center border border-gray-400" id="add-images" >
                                        <p><i class="bi bi-plus-lg mr-[5px]"></i>Thêm hình ảnh</p>
                                    </button>    
                                </div>
                            </div>
                            <div class="w-full h-fit mx-auto z-0 " id="display-image">
                                <c:choose>
                                    <c:when test="${empty requestScope.currentRoomType.imgList}">
                                        <div class="h-[600px] flex flex-col items-center justify-around" id="empty-image-list">
                                            <h4 class="w-[60%] mx-auto text-center text-[47px] font-bold tracking-wide text-[#c9c9c9]">Loại phòng này chưa có hình ảnh!</h4>
                                            <p class="text-gray-700 font-semibold text-[18px]">Cập nhật hình ảnh để thông tin nhà trọ đáng tin cậy hơn.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <section id="main-carousel" class="splide w-full" aria-label="">
                                            <div class="splide__track w-full">
                                                <ul class="splide__list">
                                                    <c:forEach items="${requestScope.currentRoomType.imgList}" var="imgRoomType">
                                                        <li class="splide__slide image-item-container overflow-hidden relative group cursor-pointer" > 
                                                            <img class="z-[1] mx-auto" alt="" src="${imgRoomType}" size="" id="${imgRoomType}">
                                                            <div class="image-control flex justify-between items-center z-[3] h-[20px] w-full text-[#fff] text-[20px] absolute top-[5px] px-[5px]">
                                                                <a class="remove-image m-0 p-0 h-full flex items-center" onclick="removeFile('${imgRoomType}', event);"> 
                                                                    <i class="bi bi-x"></i>
                                                                </a>
                                                                <input type="checkbox" name="select-image" value="${imgRoomType}" class="checkbox-input hidden" id="ip_${imgRoomType}" onchange="toggleSelectImage(event)">
                                                                <label for="ip_${imgRoomType}">
                                                                    <span class="checkbox transparent border border-[#fff] rounded w-[16px] h-[16px] inline-block relative cursor-pointer"></span>
                                                                </label>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </section>
                                        <ul id="thumbnails" class="thumbnails w-full min-w-0 flex mt-[10px] p-0">
                                            <c:forEach items="${requestScope.currentRoomType.imgList}" var="imgRoomType">
                                                <li class="thumbnail image-item-container mr-[2px] overflow-hidden relative group cursor-pointer" id="tb_${imgRoomType}"> 
                                                    <div class="image-overlay w-full h-full bg-[#000] opacity-0 absolute top-0 left-0 z-[2] duration-150"></div>
                                                    <img class="z-[1] w-full h-full object-cover group-hover:blur-sm duration-150" alt="" src="${imgRoomType}" size="">
                                                    <div class="image-control flex justify-between items-center z-[3] h-[20px] w-full text-[#fff] text-[20px] absolute top-[5px] px-[5px]">
                                                        <a class="remove-image m-0 p-0 h-full flex items-center" onclick="removeFile('${imgRoomType}', event);"> 
                                                            <i class="bi bi-x"></i>
                                                        </a>
                                                        <input type="checkbox" name="select-image" value="${imgRoomType}" class="checkbox-input hidden" id="tb_ip_${imgRoomType}" onchange="toggleSelectThumbnail(event)">
                                                        <label for="tb_ip_${imgRoomType}">
                                                            <span class="checkbox transparent border border-[#fff] rounded w-[16px] h-[16px] inline-block relative cursor-pointer"></span>
                                                        </label>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!--End hostel image-->
                        </div>
                    </div>
                    <!-- General information -->
                </c:if>
            </div>
            <%@include file="footerDashboard.jsp" %>
        </div>

        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script src="../assets/javascript/checkvalid.js"></script>
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
        <c:if test="${requestScope.addSuccess != null}">
            <script>
                showToast('success', '${requestScope.addSuccess}');
            </script>
        </c:if>
        <c:if test="${requestScope.addFail != null}">
            <script>
                showToast('error', '${requestScope.addFail}');
            </script>
        </c:if>
        <script>

            if (${not empty requestScope.currentRoomType.imgList}) {
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

            // MODAL 
            var open_modal_1 = document.querySelector('#add-images');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.modal.add-image');
            });
            var close_modal_1 = document.querySelectorAll('.modal.add-image .modal-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.modal.add-image');
                });
            }
            var open_modal_2 = document.querySelector('#delete-images');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                if (checkSelectImage() === false)
                    return;
                toggleModal('.modal.remove-image');
            });

            var close_modal_2 = document.querySelectorAll('.modal.remove-image .modal-close');
            for (let i = 0; i < close_modal_2.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.modal.remove-image');
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
                const modal_1 = document.querySelector('.modal.add-image');
                if (isEscape && modal_1.classList.contains('active-modal')) {
                    toggleModal('.modal.add-image');
                }
                const modal_2 = document.querySelector('.modal.remove-image');
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.modal.remove-image');
                }
            };
            function toggleModal(modal_item) {
                const modal = document.querySelector(modal_item);
                modal.classList.toggle('active-modal');
                modal.classList.toggle('opacity-0');
                modal.classList.toggle('pointer-events-none');
            }

            function checkSelectImage() {
                if (document.querySelectorAll('input[type="checkbox"]:checked').length === 0) {
                    if (${empty requestScope.currentRoomType.imgList})
                        showToast('error', 'Loại phòng chưa có ảnh!');
                    else
                        showToast('error', 'Chưa chọn ảnh nào!');
                    return false;
                }
                return true;
            }

            function confirmRemoveMultipleFile() {
                removeMultipleFile();
                toggleModal('.modal.remove-image');
                showToast('info', 'Đang xoá, vui lòng đợi...');
                setTimeout(function () {
                    window.location.reload();
                }, 3000);
            }

            function removeMultipleFile() {
                let checkboxes = document.querySelectorAll('.thumbnails .checkbox-input');
                let selected = new Array();
                for (let i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        selected.push(checkboxes[i].value);
                    }
                }
                console.log(selected);
                jQuery.ajax({
                    type: "POST",
                    dataType: 'json',
                    data: {toDelete: selected, roomTypeId: ${sessionScope.currentHostel.hostelID}},
                    url: "/sakura/landlord/remove-multiple-rt-images",
                    success: function () {
                    },
                    complete: function () {
                        countSelectedImage();
                        //window.location.reload();
                        //updateImageList();
                        /*for (let i = 0; i < selected.length; i++) {
                         console.log(selected[i]);
                         document.getElementById(selected[i]).parentElement.style.display = 'none';
                         let thumbnailID = "tb_" + selected[i];
                         document.getElementById(thumbnailID).style.display = 'none';
                         }*/
                    }
                });
            }
            function removeFile(filePath, event) {
                toggleModal('.modal.remove-an-image');
                let cfBtn = document.getElementById('remove-an-image-btn');
                cfBtn.addEventListener('click', () => {
                    console.log(filePath);
                    jQuery.ajax({
                        type: 'POST',
                        data: {path: filePath, roomTypeId: ${sessionScope.currentHostel.hostelID}},
                        url: '/sakura/landlord/remove-rt-image',
                        complete: function () {
                            toggleModal('.modal.remove-an-image');
                            showToast('info', 'Đang xoá, vui lòng đợi...');
                            setTimeout(function () {
                                window.location.reload();
                            }, 3000);
                            //showToast('success', 'Xoá ảnh thành công!');
                            //setTimeout(function () {
                            //    window.location.reload();
                            //}, 3000);
                        }
                    });
                });
                //document.getElementById(filename).style.display = 'none';
            }

            // DROPZONE JS
            Dropzone.options.myDropzone = {// camelized version of the 'id'\\
                autoProcessQueue: false,
                uploadMultiple: true,
                parallelUploads: 10,
                //paramName: "file", // The name that will be used to transfer the file
                addRemoveLinks: true,
                maxFiles: 10, // Số ảnh tối đa
                dictMaxFilesExceeded: "Tối đa 10 ảnh!",
                dictRemoveFile: "<i class='bi bi-x-circle-fill'></i>",
                dictCancelUpload: "",
                dictCancelUploadConfirmation: null, // "Xác nhận dừng tải ảnh lên?",
                // dictResponseError: "",
                maxFilesize: 5,
                dictFileTooBig: "File quá lớn ({{filesize}}MB). Kích thước tối đa: {{maxFilesize}}MB.",

                init: function () {
                    let submitButton = document.querySelector("#upload-file");
                    upload = this;
                    submitButton.addEventListener("click", function () {
                        let formUpload = document.querySelector("#my-dropzone");
                        console.log('submit');
                        upload.processQueue();
                    });
                    this.on("sending", function (file, xhr, formData) {
                        formData.append("roomTypeId", ${requestScope.currentRoomType.roomTypeID});
                    });
                    this.on("successmultiple", function () {
                        let msg = document.querySelector("#success-upload-message");
                        msg.classList.toggle("hidden");
                        setTimeout(function () {
                            window.location.reload();
                        }, 2000);
                    });
                    this.on("maxfilesexceeded", function (file, message) {
                        let form = document.querySelector("#my-dropzone");
                        form.classList.remove('dz-max-files-reached');
                        let msg = document.querySelector("#error-file-qty-message");
                        msg.classList.remove("hidden");
                        msg.classList.add("block");
                        this.removeFile(file);
                    });
                    this.on("error", function (file, message) {
                        if (message.startsWith('File quá lớn')) {
                            console.log(message);
                            let msg = document.querySelector("#error-file-size-message");
                            msg.classList.remove("hidden");
                            msg.classList.add("block");
                            this.removeFile(file);
                        }
                    });
                    this.on("removedfile", function (file) {
                        console.log(file.name);
                        //                                                                jQuery.ajax({
                        //                                                                    type: 'POST',
                        //                                                                    data: 'name=' + file.name,
                        //                                                                    url: 'RemoveFileServlet'
                        //                                                                });
                    });
                }
            };

            function toggleSelectImage(event) {
                let par = event.currentTarget.parentElement;
                let imgEl = par.parentElement;
                par.classList.toggle('checked-box');
                //imgEl.classList.toggle('selected');

                let id = event.currentTarget.value;
                id1 = "tb_" + id;
                let thumbnail = document.getElementById(id1);
                thumbnail.classList.toggle('selected');
                thumbnail.children[2].classList.toggle('checked-box');

                id2 = "tb_ip_" + id;
                let inputEl = document.getElementById(id2);
                inputEl.checked = !inputEl.checked;

                countSelectedImage();
            }

            function toggleSelectThumbnail(event) {
                let par = event.currentTarget.parentElement;
                let imgEl = par.parentElement;
                par.classList.toggle('checked-box');
                imgEl.classList.toggle('selected');

                let id = event.currentTarget.value;
                id1 = "ip_" + id;
                let inputEl = document.getElementById(id1);
                //console.log(inputEl);
                inputEl.checked = !inputEl.checked;
                inputEl.parentElement.classList.toggle('checked-box');
                countSelectedImage();
            }

            function countSelectedImage() {
                let images = document.querySelectorAll('.thumbnail.selected');
                //console.log(images.length);
                let msg = document.querySelector('#cnt-images');
                console.log(images);
                if (images === null)
                    msg.innerHTML = "";
                if (images.length !== 0)
                    msg.innerHTML = "(Đã chọn: " + images.length + ")";
                else
                    msg.innerHTML = "";
            }

            function unselectAllImages() {
                let images = document.querySelectorAll('.checkbox-input');
                console.log(images);
                images.forEach(e => {
                    console.log(e.checked);
                    let par = e.parentElement;
                    let imgEl = par.parentElement;
                    if (e.checked === true) {
                        par.classList.toggle('checked-box');
                        imgEl.classList.toggle('selected');
                        e.checked = false;
                    }
                });
                images.forEach(e => {
                    console.log(e.checked);
                });
                countSelectedImage();
            }
        </script>
        <!--        <script>
                    const hasResident = document.querySelectorAll('input[name="status"]');
                    const inputResident = document.querySelector('.inputResident');
                    hasResident.forEach(element => {
                        element.onclick = () => {
                            if (element.value === "2" || element.value === "3") {
                                inputResident.style.display = "block";
                            } else
                                inputResident.style.display = "none";
                        };
                    });
                </script>-->
        <script>
            function deleteRoomType(element) {

                const deleteRoomTypeContent = document.querySelector(".deleteRoomTypeContent");
                const deleteRoomTypeId = document.querySelector("input[name='roomTypeId']");
                const deleteRoomTypeBtn = document.querySelector(".deleteRoomTypeBtn");

                jQuery.ajax({
                    type: 'POST',
                    data: {'deleteRoomTypeId': deleteRoomTypeId.value,
                        'hostelId': ${sessionScope.currentHostel.hostelID}
                    },
                    url: '/sakura/room/delete-roomtype',
                    success: function (response) {
                        toggleModal('.deleteRoomTypemodal1');
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
            var checkRoomType = checkPrice = checkArea = checkMaxResident = checkDesc = true;
            var checkUpdateRoomType = checkUpdatePrice = checkUpdateArea = checkUpdateMaxResident = checkUpdateDesc = true;
            function addRoomType(element) {
                console.log("da vao add roomtype");
                const name = document.querySelector("input[name='name']");
                const price = document.querySelector("input[name='price']");
                const area = document.querySelector("input[name='area']");
                const maxNumberOfResidents = document.querySelector("input[name='maxNumberOfResidents']");
                const description = document.querySelector("textarea[name='description']");
                const hostelId = document.querySelector("input[name='hostelId']");
                const messageElement = document.querySelector(".addRoomMessage");
                const validRoomTypeMessage = document.querySelector(".validRoomTypeMessage");
                const validPriceMessage = document.querySelector(".validPriceMessage");
                const validAreaMessage = document.querySelector(".validAreaMessage");
                const validMaxResidentMessage = document.querySelector(".validMaxResidentMessage");
                const validDescMessage = document.querySelector(".validDescMessage");
                if (!name.value || !price.value || !area.value || !maxNumberOfResidents.value || !description.value) {
                    let message = "";
                    if (!name.value) {
                        validRoomTypeMessage.innerHTML = "Tên loại phòng không được trống";
                        checkRoomType = false;
                    }
                    if (!price.value) {
                        checkPrice = false;
                        validPriceMessage.innerHTML = "Giá tiền không được trống";
                    }
                    if (!area.value) {
                        checkArea = false;
                        validAreaMessage.innerHTML = "Diện tích không được trống";
                    }
                    if (!maxNumberOfResidents.value) {
                        checkMaxResident = false;
                        validMaxResidentMessage.innerHTML = "Số người tối đa không được trống";
                    }
                    if (!description.value) {
                        checkDesc = false;
                        validDescMessage.innerHTML = "Mô tả không được trống";
                    }
                    //messageElement.innerHTML = message;
                    showToast("error", 'Vui lòng kiểm tra lại thông tin!');
                } else {
                    if (checkRoomType && checkPrice && checkArea && checkMaxResident && checkDesc) {
                        jQuery.ajax({
                            type: 'POST',
                            data: {'name': name.value,
                                'price': price.value,
                                'area': area.value,
                                'maxNumberOfResidents': maxNumberOfResidents.value,
                                'description': description.value,
                                'hostelId': hostelId.value
                            },
                            url: '/sakura/room/add-roomtype',
                            success: function (response) {
                                console.log(response);
                                name.value = "";
                                price.value = "";
                                area.value = "";
                                maxNumberOfResidents.value = "";
                                description.value = "";
                                messageElement.innerHTML = response;
                                if (${requestScope.currentRoomType ==null}) {
                                    toggleModal('.addRoomTypemodal1');
                                    showToast('success', 'Thêm thành công, đang tải lại trang');
                                    setTimeout(function () {
                                        window.location.reload();
                                    }, 2000);
                                } else {
                                    toggleModal('.addRoomTypemodal2');
                                    toggleModal('.addRoomTypemodal1');
                                    listRoomType = document.querySelector('.roomtype-list');
                                    const newRoomTypeId = document.querySelector("input[name='newRoomTypeId']").value;
                                    const newRoomTypeName = document.querySelector("input[name='newRoomTypeName']").value;
                                    listRoomType.innerHTML += "<form action='/sakura/landlord/room-type' method='post' class='inline-block'><button type='submit' name='roomTypeId' value='" + newRoomTypeId + "' class='px-4 py-2 mx-2 rounded border-2 border-gray-300 hover:border-[#288D87] hover:text-[#288D87] duration-150'>" + newRoomTypeName + "</button></form>";
                                }
                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
                    } else
                        showToast("error", 'Vui lòng kiểm tra lại thông tin!');
                }
            }

            function updateRoomType() {
                console.log("----- da vao update roomtype ------------");

                const name = document.querySelector("input[name='updateName']");
                const price = document.querySelector("input[name='updatePrice']");
                const area = document.querySelector("input[name='updateArea']");
                const maxNumberOfResidents = document.querySelector("input[name='updateMaxNumberOfResidents']");
                const description = document.querySelector("textarea[name='updateDescription']");
                const messageElement = document.querySelector(".updateMessage");
                const roomTypeId = document.querySelector("input[name='roomTypeId']");
                const validUpdateRoomTypeMessage = document.querySelector(".validUpdateRoomTypeMessage");
                const validUpdatePriceMessage = document.querySelector(".validUpdatePriceMessage");
                const validUpdateAreaMessage = document.querySelector(".validUpdateAreaMessage");
                const validUpdateMaxResidentMessage = document.querySelector(".validUpdateMaxResidentMessage");
                const validUpdateDescMessage = document.querySelector(".validUpdateDescMessage");
                if (!name.value || !price.value || !area.value || !maxNumberOfResidents.value || !description.value) {
                    let message = "";
                    if (!name.value) {
                        validUpdateRoomTypeMessage.innerHTML = "Tên loại phòng không được trống";
                        checkRoomType = false;
                    }
                    if (!price.value) {
                        checkPrice = false;
                        validUpdatePriceMessage.innerHTML = "Giá tiền không được trống";
                    }
                    if (!area.value) {
                        checkArea = false;
                        validUpdateAreaMessage.innerHTML = "Diện tích không được trống";
                    }
                    if (!maxNumberOfResidents.value) {
                        checkMaxResident = false;
                        validUpdateMaxResidentMessage.innerHTML = "Số người tối đa không được trống";
                    }
                    if (!description.value) {
                        checkDesc = false;
                        validUpdateDescMessage.innerHTML = "Mô tả không được trống";
                    }
                    //messageElement.innerHTML = message;
                    showToast("error", 'Vui lòng kiểm tra lại thông tin!');
                } else {
                    if (checkUpdateRoomType && checkUpdatePrice && checkUpdateArea && checkUpdateMaxResident && checkUpdateDesc)
                        jQuery.ajax({
                            type: 'POST',
                            data: {'name': name.value,
                                'price': price.value,
                                'area': area.value,
                                'maxNumberOfResidents': maxNumberOfResidents.value,
                                'description': description.value,
                                'roomTypeId': roomTypeId.value
                            },
                            url: '/sakura/room/update-roomtype',
                            success: function (response) {
                                messageElement.innerHTML = response;
                                toggleModal('.updateRoomTypemodal1');
                                showToast('success', 'Cập nhật thành công! Đang cập nhật trang.');
                                function Redirect() {
                                    let urll = "/sakura/landlord/room-type?roomTypeId=" + roomTypeId.value;
                                    console.log(urll);
                                    window.location = urll;
                                }
                                setTimeout(Redirect(), 2000);
                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
                    else
                        showToast("error", 'Vui lòng kiểm tra lại thông tin!');
                }
            }

            function checkValidPrice(element) {
                const validPriceMessage = document.querySelector(".validPriceMessage");
                if (!element.value.trim()) {
                    validPriceMessage.innerHTML = 'Giá không được trống';
                    checkPrice = false;
                } else {
                    while (element.value.trim().charAt(0) === "0" && element.value.trim().length > 1) {
                        element.value = element.value.slice(1);
                    }
                    if (element.value.trim() === "0") {
                        validPriceMessage.innerHTML = 'Giá tiền phải là số dương chia hết cho 1000 và nhỏ hơn 1 tỷ';
                        checkPrice = false;
                    } else {
                        let valid = isValid(element.value.trim(), 'money');
                        if (valid) {
                            validPriceMessage.innerHTML = '';
                            checkPrice = true;
                        } else {
                            validPriceMessage.innerHTML = 'Giá tiền phải là số dương chia hết cho 1000 và nhỏ hơn 1 tỷ';
                            checkPrice = false;
                        }
                    }
                }
            }

            function checkValidArea(element) {
                const validAreaMessage = document.querySelector(".validAreaMessage");
                console.log("Da vao check desc: ", element.value);
                if (!element.value.trim()) {
                    validAreaMessage.innerHTML = 'Diện tích không được trống';
                    checkArea = false;
                } else {
                    while (element.value.trim().charAt(0) === "0" && element.value.trim().length > 1) {
                        element.value = element.value.slice(1);
                    }
                    if (element.value.trim() === "0") {
                        validAreaMessage.innerHTML = 'Diện tích phải là số dương và nhỏ hơn 1000';
                        checkArea = false;
                    } else {
                        checkArea = isValid(element.value.trim(), 'positiveNumber');
                        if (checkArea) {
                            validAreaMessage.innerHTML = '';
                        } else {
                            validAreaMessage.innerHTML = 'Diện tích phải là số dương và nhỏ hơn 1000';
                        }
                    }
                }
            }

            function checkValidMaxResident(element) {
                const validMaxResidentMessage = document.querySelector(".validMaxResidentMessage");
                console.log("Da vao check desc: ", element.value);
                if (!element.value.trim()) {
                    validMaxResidentMessage.innerHTML = 'Số cư dân tối đa không được trống';
                    checkMaxResident = false;
                } else {
                    while (element.value.trim().charAt(0) === "0" && element.value.trim().length > 1) {
                        element.value = element.value.slice(1);
                    }
                    if (element.value.trim() === "0") {
                        validMaxResidentMessage.innerHTML = 'Số cư dân tối đa phải là số dương và nhỏ hơn 1000';
                        checkMaxResident = false;
                    } else {
                        checkMaxResident = isValid(element.value.trim(), 'positiveNumber');
                        if (checkMaxResident) {
                            validMaxResidentMessage.innerHTML = '';
                        } else {
                            validMaxResidentMessage.innerHTML = 'Số cư dân tối đa phải là số dương và nhỏ hơn 1000';
                        }
                    }
                }
            }

            function checkValidDesc(element) {
                const validDescMessage = document.querySelector(".validDescMessage");
                if (!element.value.trim()) {
                    validDescMessage.innerHTML = 'Mô tả không được trống';
                    checkDesc = false;
                } else {
                    validDescMessage.innerHTML = '';
                    checkDesc = true;
                }
            }

            function checkUpdateValidDesc(element) {
                const validUpdateDescMessage = document.querySelector(".validUpdateDescMessage");
                if (!element.value.trim()) {
                    validUpdateDescMessage.innerHTML = 'Mô tả không được trống';
                    checkUpdateDesc = false;
                } else {
                    validUpdateDescMessage.innerHTML = '';
                    checkUpdateDesc = true;
                }
            }

            function checkUpdateValidPrice(element) {
                const validUpdatePriceMessage = document.querySelector(".validUpdatePriceMessage");
                if (!element.value.trim()) {
                    validUpdatePriceMessage.innerHTML = 'Giá không được trống';
                    checkUpdatePrice = false;
                } else {
                    while (element.value.trim().charAt(0) === "0" && element.value.trim().length > 1) {
                        element.value = element.value.slice(1);
                    }
                    if (element.value.trim() === "0") {
                        validUpdatePriceMessage.innerHTML = 'Giá tiền phải là số dương chia hết cho 1000 và nhỏ hơn 1 tỷ';
                        checkUpdatePrice = false;
                    } else {
                        let valid = isValid(element.value.trim(), 'money');
                        if (valid) {
                            validUpdatePriceMessage.innerHTML = '';
                            checkUpdatePrice = true;
                        } else {
                            validUpdatePriceMessage.innerHTML = 'Giá tiền phải là số dương chia hết cho 1000 và nhỏ hơn 1 tỷ';
                            checkUpdatePrice = false;
                        }
                    }
                }
            }

            function checkUpdateValidArea(element) {
                const validUpdateAreaMessage = document.querySelector(".validUpdateAreaMessage");
                if (!element.value.trim()) {
                    validUpdateAreaMessage.innerHTML = 'Diện tích không được trống và nhỏ hơn 1000';
                    checkUpdateArea = false;
                } else {
                    while (element.value.trim().charAt(0) === "0" && element.value.trim().length > 1) {
                        element.value = element.value.slice(1);
                    }
                    if (element.value.trim() === "0") {
                        validUpdateAreaMessage.innerHTML = 'Diện tích phải là số dương và nhỏ hơn 1000';
                        checkUpdateArea = false;
                    } else {
                        checkUpdateArea = isValid(element.value.trim(), 'positiveNumber');
                        if (checkUpdateArea) {
                            validUpdateAreaMessage.innerHTML = '';
                        } else {
                            validUpdateAreaMessage.innerHTML = 'Diện tích phải là số dương và nhỏ hơn 1000';
                        }
                    }
                }
            }

            function checkUpdateValidMaxResident(element) {
                const validUpdateMaxResidentMessage = document.querySelector(".validUpdateMaxResidentMessage");
                if (!element.value.trim()) {
                    validUpdateMaxResidentMessage.innerHTML = 'Số cư dân tối đa không được trống';
                    checkUpdateMaxResident = false;
                } else {
                    while (element.value.trim().charAt(0) === "0" && element.value.trim().length > 1) {
                        element.value = element.value.slice(1);
                    }
                    if (element.value.trim() === "0") {
                        validUpdateMaxResidentMessage.innerHTML = 'Số cư dân tối đa phải là số dương và nhỏ hơn 1000';
                        checkUpdateMaxResident = false;
                    } else {
                        checkUpdateMaxResident = isValid(element.value.trim(), 'positiveNumber');
                        if (checkUpdateMaxResident) {
                            validUpdateMaxResidentMessage.innerHTML = '';
                        } else {
                            validUpdateMaxResidentMessage.innerHTML = 'Số cư dân tối đa phải là số dương và nhỏ hơn 1000';
                        }
                    }
                }
            }

            var checkRoom = false;
            function checkValidRoom(element) {
                const hostelId = document.querySelector("input[name='hostelId']").value;
                const validRoomMessage = document.querySelector(".validRoomMessage");
                if (!element.value.trim()) {
                    validRoomMessage.innerHTML = 'Tên phòng không được trống';
                    checkRoom = false;
                } else {
                    let valid = isValid(element.value, 'name');
                    if (!valid) {
                        validRoomMessage.innerHTML = 'Tên phòng chỉ được chứa chữ cái, chữ số và khoảng trắng';
                        checkRoom = false;
                    } else
                        jQuery.ajax({
                            type: 'POST',
                            data: {'roomNumber': element.value,
                                'hostelId': hostelId
                            },
                            url: '/sakura/room/check-room-valid',
                            success: function (response) {
                                if (response) {
                                    validRoomMessage.innerHTML = response;
                                    checkRoom = false;
                                } else {
                                    checkRoom = true;
                                    validRoomMessage.innerHTML = "";
                                }
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
            function checkValidRoomType(element) {
                const validRoomTypeMessage = document.querySelector(".validRoomTypeMessage");
                const hostelId = document.querySelector("input[name='hostelId']");
                const addRoomTypeBtn = document.querySelector(".addRoomTypeBtn");
                if (!element.value.trim()) {
                    validRoomTypeMessage.innerHTML = 'Tên loại phòng không được trống';
                    checkHostel = false;
                } else {
                    let valid = isValid(element.value.trim(), 'name');
                    if (!valid) {
                        checkRoomType = false;
                        validRoomTypeMessage.innerHTML = 'Tên loại phòng chỉ được chứa chữ cái, chữ số và khoảng trắng';
                    } else
                        jQuery.ajax({
                            type: 'POST',
                            data: {'roomTypeName': element.value,
                                'hostelId': hostelId.value
                            },
                            url: '/sakura/room/check-roomtype-valid',
                            success: function (response) {
                                if (response) {
                                    validRoomTypeMessage.innerHTML = response;
                                    checkRoomType = false;
                                    // showToast('error', response);
                                } else {
                                    checkRoomType = true;
                                    validRoomTypeMessage.innerHTML = "";
                                }
                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
                }
            }

            function checkValidUpdateRoomType(element) {
                const validUpdateRoomTypeMessage = document.querySelector(".validUpdateRoomTypeMessage");
                const hostelId = document.querySelector("input[name='hostelId']");
                const updateRoomTypeBtn = document.querySelector(".updateRoomTypeBtn");
                const currentName = document.querySelector("input[name='currentName']");
                let valid = isValid(element.value, 'name');
                if (!valid) {
                    validUpdateRoomTypeMessage.innerHTML = 'Tên loại phòng chỉ được chứa chữ cái, chữ số và khoảng trắng';
                    checkUpdateRoomType = false;
                } else
                    jQuery.ajax({
                        type: 'POST',
                        data: {'roomTypeName': element.value,
                            'hostelId': hostelId.value,
                            'currentName': currentName.value
                        },
                        url: '/sakura/room/check-update-roomtype-valid',
                        success: function (response) {
                            if (response) {
                                validUpdateRoomTypeMessage.innerHTML = response;
                                checkUpdateRoomType = false;
                            } else {
                                validUpdateRoomTypeMessage.innerHTML = "";
                                checkUpdateRoomType = true;
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
            function addRoom(element) {
                console.log("da vao add room");
                const addRoomNumber = document.querySelector("input[name='addRoomNumber']");
                const roomTypeId = document.querySelector("input[name='roomTypeId']");
                const roomList = document.querySelector(".room-list");
                const modal = document.querySelector("#addRoom");
                const validRoomMessage = document.querySelector(".validRoomMessage");
                if (!addRoomNumber.value.trim()) {
                    validRoomMessage.innerHTML = 'Tên phòng không được trống';
                    checkRoom = false;
                    showToast('error', 'Vui lòng kiểm tra lại thông tin!');
                } else {
                    if (checkRoom) {
                        jQuery.ajax({
                            type: 'POST',
                            data: {'addRoomNumber': addRoomNumber.value,
                                'roomTypeId': roomTypeId.value
                            },
                            url: '/sakura/room/add-room',
                            success: function (response) {
                                const res = response.toString();
                                if (res.includes("border-2 rounded text-center")) {
                                    roomList.innerHTML += response;
                                    showToast('success', "Thêm phòng " + addRoomNumber.value + " thành công");
                                    addRoomNumber.value = "";
                                    const noRoomMess = document.querySelector('.no-room-message');
                                    if (noRoomMess)
                                        noRoomMess.style.display = 'none';
                                    const deleteRoomtypeBtn = document.querySelector("#deleteRoomType-1");
                                    if (deleteRoomtypeBtn)
                                        deleteRoomtypeBtn.style.display = "none";
                                    const availableRoomElement = document.querySelector('.available-room');
                                    const totalRoomElement = document.querySelector('.total-room');
                                    console.log("available: ", availableRoomElement);
                                    console.log(totalRoomElement);
                                    availableRoomElement.innerHTML = Number(availableRoomElement.innerHTML) + 1;
                                    totalRoomElement.innerHTML = Number(totalRoomElement.innerHTML) + 1;
                                } else
                                    showToast('error', response);
                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
                    } else {
                        showToast('error', 'Vui lòng kiểm tra lại thông tin!');
                    }
                }
            }
        </script>
        <script>
            var open_modal_1 = document.querySelector('#addRoomType-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.addRoomTypemodal1');
            });

            //            var open_modal_2 = document.querySelector('#addRoomType-2');
            //            open_modal_2.addEventListener('click', function (event) {
            //                event.preventDefault();
            //                toggleModal('.addRoomTypemodal2');
            //            });

            // Bấm ngoài modal thì đóng modal
            // const overlay = document.querySelector('.modal .modal-overlay');
            // overlay.addEventListener('click', toggleModal('.modal'));

            var close_modal_1 = document.querySelectorAll('.addRoomTypemodal1 .addRoomTypemodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.addRoomTypemodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.addRoomTypemodal2 .addRoomTypemodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.addRoomTypemodal2');
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
                const modal_1 = document.querySelector('.addRoomTypemodal1');
                const modal_2 = document.querySelector('.addRoomTypemodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.addRoomTypemodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.addRoomTypemodal2');
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
            var open_modal_1 = document.querySelector('#updateRoomType-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.updateRoomTypemodal1');
            });

            //            var open_modal_2 = document.querySelector('#updateRoomType-2');
            //            open_modal_2.addEventListener('click', function (event) {
            //                event.preventDefault();
            //                toggleModal('.updateRoomTypemodal2');
            //            });

            var close_modal_1 = document.querySelectorAll('.updateRoomTypemodal1 .updateRoomTypemodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.updateRoomTypemodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.updateRoomTypemodal2 .updateRoomTypemodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.updateRoomTypemodal2');
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
                const modal_1 = document.querySelector('.updateRoomTypemodal1');
                const modal_2 = document.querySelector('.updateRoomTypemodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.updateRoomTypemodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.updateRoomTypemodal2');
                }
            };
        </script>

        <script>
            var open_modal_1 = document.querySelector('#deleteRoomType-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.deleteRoomTypemodal1');
            });

            var close_modal_1 = document.querySelectorAll('.deleteRoomTypemodal1 .deleteRoomTypemodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.deleteRoomTypemodal1');
                    console.log('close 1');
                });
            }
        </script>
        <script>
            $("input[data-type='currency']").on({
                keyup: function () {
                    formatCurrency($(this));
                },
                blur: function () {
                    formatCurrency($(this), "blur");
                }
            });


            function formatNumber(n) {
                // format number 1000000 to 1.000.000
                return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, "\.")
            }


            function formatCurrency(input, blur) {
                var input_val = input.val();

                if (input_val === "")
                    return;

                input_val = formatNumber(input_val);
                input.val(input_val);
            }
        </script>
    </body>

</html>