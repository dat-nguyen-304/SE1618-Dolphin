<%-- 
    Document   : LHostelInfo
    Created on : Jul 4, 2022, 3:27:37 PM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Thông tin nhà trọ</title>

        <%@include file="../view/assets.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/js/splide.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.0.7/dist/css/splide.min.css">

        <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />

        <script src="https://cdn.jsdelivr.net/npm/donutty@2.3.1/dist/donutty.min.js"></script>

        <link href="../assets/toastr/toastr.min.css" rel="stylesheet" />
        <link  href="../assets/css/LHostelInfo.css" rel="stylesheet">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />


    </head>
    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">
                <div class="head-control flex justify-between">
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
                                    Thông tin nhà trọ ${sessionScope.currentHostel.hostelName}
                                </a>
                            </li>
                        </ol>
                    </nav>
                    <c:if test="${sessionScope.currentHostel != null}">
                        <div class="flex items-center mr-[20px]">
                            <div class="flex items-center mr-[20px]">
                                <h3 class="text-sm font-medium text-gray-400 mr-[10px]">Chọn nhà trọ: </h3>
                                <button type="button" data-modal-toggle="hostelModal"
                                        class="rounded w-fit h-[30px] px-[20px] bg-[#288D87] hover:bg-[#248781] flex flex justify-between items-center">
                                    <p class="font-medium text-[15px] text-[#fff]">${sessionScope.currentHostel.hostelName}</p>
                                </button>
                            </div>
                        </div>
                    </c:if>
                    <!-- End breadcrumb -->
                </div>

                <!-- General information -->
                <c:if test="${sessionScope.currentHostel != null}">
                    <div class="flex justify-between mt-[20px] grid grid-cols-5 gap-5">
                        <%@include file="../view/modalLandlordHostelInfo.jsp" %>
                        <!--Hostel info-->
                        <div class="card bg-[#fff] p-5 flex flex-col col-span-2">
                            <div class="flex justify-between">
                                <div class="text-[20px] font-bold text-[#288D87] pb-[20px]">Thông tin cơ bản</div>
                                <button id="editHostel-1" type="submit" name="action" value="Save" onclick="buildEditor()"
                                        class="rounded text-[15px] text-gray-400 hover:text-[#288D87] w-[170px] h-[30px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center">
                                    <i class="bi bi-pencil-fill mr-[5px]"></i>Chỉnh sửa thông tin
                                </button>
                            </div>
                            <div class="w-full h-fit mx-auto">
                                <div class="grid grid-cols-6 gap-[8px]">
                                    <div class="col-span-2">
                                        <p class="text-slate-400 font-normal">Mã nhà trọ</p>
                                        <p class="text-[18px] text-slate-800 font-semibold">
                                            <fmt:formatNumber value="${sessionScope.currentHostel.hostelID}" groupingUsed="false" minIntegerDigits="5"/>
                                        </p>
                                    </div>
                                    <div class="col-span-2">
                                        <p class="text-slate-400 font-normal">Tên nhà trọ</p>
                                        <p class="text-[18px] text-slate-800 font-semibold">${sessionScope.currentHostel.hostelName}</p>
                                    </div>
                                    <div class="col-span-2">
                                        <p class="text-slate-400 font-normal">Ngày tạo</p>
                                        <p class="text-[18px] text-slate-800 font-semibold date">${sessionScope.currentHostel.registeredDate}</p>
                                    </div>
                                </div>

                                <div class="mt-[20px]">
                                    <p class="text-slate-400 font-normal"><i class="bi bi-geo-alt-fill mr-[5px]"></i>Địa chỉ</p>
                                    <p class="text-[18px] text-slate-800 font-semibold mt-[5px]">${sessionScope.currentHostel.streetAddress}, ${sessionScope.currentHostel.district.districtName}, ${sessionScope.currentHostel.district.province.provinceName}</p>
                                </div>

                                <div class="grid grid-rows-2 grid-cols-6 gap-[5px] mt-[20px]">
                                    <p class="text-slate-400 font-normal col-span-2"><i class="bi bi-house-fill mr-[5px]"></i>Số phòng</p>
                                    <p class="text-[18px] text-slate-800 font-semibold col-span-4">${sessionScope.currentHostel.totalRoom}</p>
                                    <p class="text-slate-400 font-normal col-span-2"><i class="bi bi-house mr-[5px]"></i>Phòng trống</p>
                                    <p class="text-[18px] text-slate-800 font-semibold col-span-4">${sessionScope.currentHostel.availableRoom}</p>
                                </div>
                                <div class="grid grid-rows-2 grid-cols-6 gap-[5px] mt-[20px]">
                                    <fmt:setLocale value = "vi_VN"/>
                                    <p class="text-slate-400 font-normal col-span-2"><i class="bi bi-tags-fill mr-[5px]"></i>Giá thuê</p>
                                    <p class="text-[18px] text-slate-800 font-semibold col-span-4"><fmt:formatNumber value = "${sessionScope.currentHostel.minPrice}" type = "number" pattern="###,###,###VNĐ"/> - <fmt:formatNumber value = "${sessionScope.currentHostel.maxPrice}" type = "number" pattern="###,###,###VNĐ"/></p>
                                    <p class="text-slate-400 font-normal col-span-2"><i class="bi bi-slash-square mr-[5px]"></i>Diện tích phòng</p>
                                    <p class="text-[18px] text-slate-800 font-semibold col-span-4">${sessionScope.currentHostel.minArea}m<sup>2</sup> - ${sessionScope.currentHostel.maxArea}m<sup>2</sup></p>
                                </div>

                                <div class="mt-[20px]">
                                    <p class="text-slate-400 font-normal"><i class="bi bi-info-circle mr-[5px]"></i>Mô tả</p>
                                    <p class="text-[18px] text-slate-800 font-semibold h-[370px] mt-[5px] overflow-y-auto">${sessionScope.currentHostel.description}</p>
                                </div>

                            </div>
                        </div>
                        <!--End hostel info-->

                        <!--Hostel image-->
                        <div class="col-span-3">
                            <div class="card bg-[#fff] p-5 flex flex-col">
                                <div class="text-[20px] font-bold text-slate-800 pb-[20px] flex justify-between items-center">
                                    <p>Hình ảnh </p>
                                    <div class="flex ">
                                        <span id="cnt-images" class="font-light text-[18px] mr-[10px]"></span>
                                        <button onclick="selectAllImages()" class="text-[15px] rounded w-[150px] h-[30px] font-light flex justify-center items-center mr-[10px] bg-[#288D87] hover:bg-[#1D837D] text-[#fff]" id="select-all-images" >
                                            <p><i class="bi bi-check-circle mr-[5px]"></i>Chọn tất cả</p>
                                        </button>
                                        <button onclick="unselectAllImages()" class="text-[15px] rounded w-[150px] h-[30px] font-light flex justify-center items-center mr-[10px] bg-[#288D87] hover:bg-[#1D837D] text-[#fff]" id="unselect-all-images" >
                                            <p><i class="bi bi-slash-circle mr-[5px]"></i>Bỏ chọn tất cả</p>
                                        </button>
                                        <!-- Modal remove image toggle -->
                                        <button class="text-[15px] rounded w-[150px] h-[30px] font-light flex justify-center items-center mr-[10px] bg-[#288D87] hover:bg-[#1D837D] text-[#fff]" id="delete-images" >
                                            <p><i class="bi bi-trash3-fill mr-[5px]"></i>Xoá hình đã chọn</p>
                                        </button>
                                        <!-- Modal add image toggle -->
                                        <button class="text-[15px] rounded w-[150px] h-[30px] font-light flex justify-center items-center border border-gray-400" id="add-images" >
                                            <p><i class="bi bi-plus-lg mr-[5px]"></i>Thêm hình ảnh</p>
                                        </button>    
                                    </div>

                                </div>
                                <div class="w-full h-fit mx-auto z-0 " id="display-image">
                                    <div class="hidden h-[700px] flex flex-col items-center justify-around" id="empty-image-list">
                                        <h4 class="w-[60%] mx-auto text-center text-[47px] font-bold tracking-wide text-[#c9c9c9]">Chưa có hình ảnh nào cho nhà trọ này!</h4>
                                        <p class="text-gray-700 font-semibold text-[18px]">Bạn cần cập nhật hình ảnh để thông tin nhà trọ của bạn đáng tin cậy hơn.</p>
                                    </div>
                                    <c:choose>
                                        <c:when test="${empty sessionScope.currentHostel.imgList}">
                                            <div class="h-[700px] flex flex-col items-center justify-around" id="empty-image-list">
                                                <h4 class="w-[60%] mx-auto text-center text-[47px] font-bold tracking-wide text-[#c9c9c9]">Chưa có hình ảnh nào cho nhà trọ này!</h4>
                                                <p class="text-gray-700 font-semibold text-[18px]">Bạn cần cập nhật hình ảnh để thông tin nhà trọ của bạn đáng tin cậy hơn.</p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <section id="main-carousel" class="splide w-full" aria-label="">
                                                <div class="splide__track w-full">
                                                    <ul class="splide__list">
                                                        <c:forEach items="${sessionScope.currentHostel.imgList}" var="imgHostel">
                                                            <li class="splide__slide image-item-container overflow-hidden relative group cursor-pointer" > 
                                                                <img class="z-[1] mx-auto" alt="" src="${imgHostel}" size="" id="${imgHostel}">
                                                                <div class="image-control flex justify-between items-center z-[3] h-[20px] w-full text-[#fff] text-[20px] absolute top-[5px] px-[5px]">
                                                                    <a class="remove-image m-0 p-0 h-full flex items-center" onclick="removeFile('${imgHostel}', event);"> 
                                                                        <i class="bi bi-x"></i>
                                                                    </a>
                                                                    <input type="checkbox" name="select-image" value="${imgHostel}" class="checkbox-input hidden" id="ip_${imgHostel}" onchange="toggleSelectImage(event)">
                                                                    <label for="ip_${imgHostel}">
                                                                        <span class="checkbox transparent border border-[#fff] rounded w-[16px] h-[16px] inline-block relative cursor-pointer"></span>
                                                                    </label>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </section>
                                            <ul id="thumbnails" class="thumbnails w-full min-w-0 flex mt-[10px] p-0">
                                                <c:forEach items="${sessionScope.currentHostel.imgList}" var="imgHostel">
                                                    <li class="thumbnail image-item-container mr-[2px] overflow-hidden relative group cursor-pointer" id="tb_${imgHostel}"> 
                                                        <div class="image-overlay w-full h-full bg-[#000] opacity-0 absolute top-0 left-0 z-[2] duration-150"></div>
                                                        <img class="z-[1] w-full h-full object-cover group-hover:blur-sm duration-150" alt="" src="${imgHostel}" size="">
                                                        <div class="image-control flex justify-between items-center z-[3] h-[20px] w-full text-[#fff] text-[20px] absolute top-[5px] px-[5px]">
                                                            <a class="remove-image m-0 p-0 h-full flex items-center" onclick="removeFile('${imgHostel}', event);"> 
                                                                <i class="bi bi-x"></i>
                                                            </a>
                                                            <input type="checkbox" name="select-image" value="${imgHostel}" class="checkbox-input hidden" id="tb_ip_${imgHostel}" onchange="toggleSelectThumbnail(event)">
                                                            <label for="tb_ip_${imgHostel}">
                                                                <span class="checkbox transparent border border-[#fff] rounded w-[16px] h-[16px] inline-block relative cursor-pointer"></span>
                                                            </label>
                                                        </div>
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
                    <!--End general information-->

                    <!-- Feedback, review -->
                    <div class="feedback mt-[20px] grid grid-cols-5 gap-[20px]">
                        <div class="card w-full h-fit bg-[#fff] p-[20px] flex flex-col">
                            <div class="text-[20px] font-bold text-[#288D87]">Đánh giá</div>
                            <div class="w-full h-fit mx-auto">
                                <div class="relative w-[80%] h-fit mx-auto mt-[20px]">
                                    <c:if test="${requestScope.feedbacks.size() <= 0}">
                                        <div class="h-[250px] flex justify-center items-center">
                                            <p class="text-center font-bold text-[18px] text-slate-300">Chưa có đánh giá nào!</p>
                                        </div>
                                    </c:if>
                                    <c:if test="${requestScope.feedbacks.size() > 0}">
                                        <div class="w-full text-center">Điểm trung bình</div>
                                        <div class="mt-[20px]" id="donut-chart" dir="ltr" dnt></div>
                                        <p class="text-center font-bold text-[18px] text-gray-500">${requestScope.feedbacks.size()} lượt đánh giá</p>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <!-- Rating -->
                        <div class="card col-span-4 w-full bg-[#fff] p-[20px]">
                            <div class="text-[20px] font-bold text-slate-800 self-start pb-[20px]">Chi tiết đánh giá
                            </div>
                            <c:if test="${requestScope.feedbacks.size() > 0}">
                                <div class="w-full mx-auto overflow-y-auto">
                                    <table class="w-full text-[15px] text-left text-gray-500 ">
                                        <thead class="text-[15px] text-gray-700 uppercase bg-gray-50 ">
                                            <tr class="grid grid-16 gap-[5px]">
                                                <th scope="col" class="px-2 py-3 col-span-2">Thời gian</th>
                                                <th scope="col" class="px-2 py-3 col-span-2">Người đánh giá</th>
                                                <th scope="col" class="text-center px-1 py-3 col-span-2">Số điểm</th>
                                                <th scope="col" class="px-1 py-3 col-span-10">Nội dung</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.feedbacks}" var="feedback">
                                                <tr class="bg-white border-b hover:bg-gray-50 grid grid-16 gap-[5px]">
                                                    <td class="px-2 py-4 col-span-2">${feedback.date}</td>
                                                    <td class="px-2 py-4 col-span-2">${feedback.tenant.fullname}</td>
                                                    <td class="text-center px-1 py-4 col-span-2">${feedback.rating}</td>
                                                    <td class="px-1 py-4 col-span-10">${feedback.content}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                        </div>

                    </div>
                    <!-- End Statistics -->
                </div>
            </c:if>
            <c:if test="${sessionScope.currentHostel == null}">
                Bạn chưa có nhà trọ. Quay về trang "Tổng quan" để thêm thông tin nhà trọ!
            </c:if>

            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <script src="../assets/toastr/toastr.min.js"></script>
        <script src="../assets/javascript/render-district.js"></script>
        <script src="../assets/javascript/checkvalid.js"></script>
        <script type="text/javascript">
                                                                function showToast(type, msg) {
                                                                    toastr.options.positionClass = 'toast-bottom-right';
                                                                    // toastr.options.extendedTimeOut = 0; //1000;
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
        <script src="https://cdn.tiny.cloud/1/qagffr3pkuv17a8on1afax661irst1hbr4e6tbv888sz91jc/tinymce/6/tinymce.min.js"></script>
        <script>
                                                                function buildEditor() {
                                                                    tinymce.init({
                                                                        selector: 'textarea#editor',
                                                                        language: "vi",
                                                                        menubar: false,
                                                                        statusbar: false,
                                                                        placeholder: "Viết đánh giá của bạn ở đây...",
                                                                        height: '400',
                                                                        readonly: ${requestScope.feedback != null ? 'true' : 'false'},
                                                                        plugins: [
                                                                            'a11ychecker', 'advlist', 'advcode', 'advtable', 'autolink', 'checklist', 'export',
                                                                            'lists', 'link', 'image', 'charmap', 'preview', 'anchor', 'searchreplace', 'visualblocks',
                                                                            'powerpaste', 'fullscreen', 'formatpainter', 'insertdatetime', 'media', 'table', 'help', 'wordcount'
                                                                        ],
                                                                        toolbar: 'undo redo | blocks | bold italic link backcolor | ' +
                                                                                'alignleft aligncenter alignright alignjustify | ' +
                                                                                'bullist numlist outdent indent | removeformat '
                                                                    });
                                                                }
        </script>
        <script>
            $(document).ready(function () {

                let allDateCells = $(".date");
                let allMoneyCells = $(".money");

                for (let i = 0; i < allDateCells.length; i++) {
                    let node = allDateCells[i];
                    let isoDate = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = isoDate.split('-').reverse().join('-');
                }

                for (let i = 0; i < allMoneyCells.length; i++) {
                    let node = allMoneyCells[i];
                    let money = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                }
            });
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
                    tinymce.remove();
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
                    tinymce.remove();
                }
            };
        </script>
        <script>
            function checkValidUpdateHostel(element) {
                const validUpdateHostelMessage = document.querySelector(".validUpdateHostelMessage");
                const landlordId = document.querySelector("input[name='landlordId']");
                const currentName = document.querySelector("input[name='currentName']");
                if (!element.value.trim()) {
                    validHostelMessage.innerHTML = 'Tên nhà trọ không được trống';
                    checkHostel = false;
                } else {
                    let valid = isValid(element.value.trim(), 'name');
                    if (!valid) {
                        validUpdateHostelMessage.innerHTML = 'Tên nhà trọ chỉ được chứa chữ cái, chữ số và khoảng trắng';
                        checkHostel = false;
                    } else
                        jQuery.ajax({
                            type: 'POST',
                            data: {'updateName': element.value.trim(),
                                'landlordId': landlordId.value.trim(),
                                'currentName': currentName.value.trim()
                            },
                            url: '/sakura/hostel/check-update-hostel-valid',
                            success: function (response) {
                                if (response) {
                                    validUpdateHostelMessage.innerHTML = response;
                                    checkHostel = false;
                                } else {
                                    checkHostel = true;
                                    validUpdateHostelMessage.innerHTML = "";
                                }
                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
                }
            }

            function checkValidUpdateAddress(element) {
                console.log("da vao check valid address");
                const validUpdateAddressMessage = document.querySelector(".validUpdateAddressMessage");
                if (!element.value.trim()) {
                    validUpdateAddressMessage.innerHTML = 'Tên địa chỉ không được trống';
                    checkDesc = false;
                } else {
                    let valid = isValid(element.value.trim(), 'address');
                    if (!valid) {
                        validUpdateAddressMessage.innerHTML = 'Địa chỉ chỉ được chứa chữ cái, chữ số khoảng trắng / , . và -';
                        checkAddress = false;
                    } else {
                        validUpdateAddressMessage.innerHTML = '';
                        checkAddress = true;
                    }
                }
            }

            function checkValidUpdateDesc(element) {
                const validUpdateDescMessage = document.querySelector(".validUpdateDescMessage");
                const adddHostelBtn = document.querySelector(".addHostelBtn");
                if (!element.value.trim()) {
                    validUpdateDescMessage.innerHTML = 'Tên mô tả không được trống';
                    checkDesc = false;
                } else {
                    validUpdateDescMessage.innerHTML = '';
                    checkDesc = true;
                }
            }
        </script>
        <script>
            var checkAddress = checkDesc = checkHostel = true;
            function updateHostel() {
                const name = document.querySelector("input[name='updateName']");
                const updateDistrictId = document.querySelector("select[name='updateDistrictId']");
                const updateStreetAddress = document.querySelector("input[name='updateStreetAddress']");
                const description = document.querySelector("textarea[name='updateDescription']");
                const messageElement = document.querySelector(".updateHostelMessage");
                const hostelId = document.querySelector("input[name='hostelId']");
                const validUpdateHostelMessage = document.querySelector(".validUpdateHostelMessage");
                const validUpdateAddressMessage = document.querySelector(".validUpdateAddressMessage");
                const validUpdateDescMessage = document.querySelector(".validUpdateDescMessage");
                if (!name.value.trim() || !updateStreetAddress.value.trim() || !description.value.trim()) {
                    let message = "";
                    if (!name.value.trim()) {
                        checkHostel = false;
                        validHostelMessage.innerHTML = 'Tên nhà trọ không được trống';
                    }
                    if (!updateStreetAddress.value.trim()) {
                        checkAddress = false;
                        validUpdateAddressMessage.innerHTML = 'Tên địa chỉ không được trống';
                    }
                    if (!description.value.trim()) {
                        checkDesc = false;
                        validUpdateDescMessage.innerHTML = 'Tên mô tả không được trống';
                    }

//                    messageElement.innerHTML = message;
                    showToast("error", 'Vui lòng kiểm tra lại thông tin!');
                } else {
                    if (checkHostel && checkAddress && checkDesc) {
                        jQuery.ajax({
                            type: 'POST',
                            data: {'name': name.value.trim(),
                                'updateDistrictId': updateDistrictId.value.trim(),
                                'updateStreetAddress': updateStreetAddress.value.trim(),
                                'description': description.value.trim(),
                                'hostelId': hostelId.value.trim()
                            },
                            url: '/sakura/hostel/update-hostel',
                            success: function (response) {
                                //messageElement.innerHTML = response;
                                toggleModal('.editHostelmodal1');
                                showToast("success", "Chỉnh sửa thành công! Đang cập nhật lại trang.");
                                setTimeout(function () {
                                    window.location.reload();
                                }, 3000);
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

//            var open_modal_3 = document.querySelector('#delete-an-image');
//            open_modal_3.addEventListener('click', function (event) {
//                event.preventDefault();
//                if (checkSelectImage() === false)
//                    return;
//                toggleModal('.modal.remove-an-image');
//            });

            var close_modal_3 = document.querySelectorAll('.modal.remove-an-image .modal-close');
            for (let i = 0; i < close_modal_3.length; ++i) {
                close_modal_3[i].addEventListener('click', () => {
                    toggleModal('.modal.remove-an-image');
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
                const modal_3 = document.querySelector('.modal.remove-an-image');
                if (isEscape && modal_3.classList.contains('active-modal')) {
                    toggleModal('.modal.remove-an-image');
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
                    showToast('error', 'Chưa chọn ảnh nào!');
                    return false;
                }
                return true;
            }

            function confirmRemoveMultipleFile() {
                removeMultipleFile();
                //toggleModal('.modal.remove-image');
                showToast('info', 'Đang xoá, vui lòng đợi!');
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
                    data: {toDelete: selected, hostelId: ${sessionScope.currentHostel.hostelID}},
                    url: "/sakura/landlord/remove-multiple-images",
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

            function updateImageList() {

                jQuery.ajax({
                    url: '/sakura/landlord/update-image',
                    type: 'GET',
                    data: {hostelId: ${sessionScope.currentHostel.hostelID}},
                    dataType: 'text',
                    complete: function (result) {
                        var data = JSON.parse(result.responseText);
                        console.log(data);
                        if (data.length === 0) {
                            // let container = document.getElementById('display-image');
                            $('#empty-image-list').toggleClass('hidden');
                        }
                        $(".splide__list").empty();
                        $("#thumbnails").empty();

                        for (let i = 0; i < data.length; ++i) {
                            $(".splide__list").append(`
                                                                        <li class="splide__slide image-item-container overflow-hidden relative group cursor-pointer">
                                                                            <img class="z-[1] mx-auto" alt="" src="` + data[i].imgLink + `" id="` + data[i].imgLink + `">
                                                                            <div class="image-control flex justify-between items-center z-[3] h-[20px] w-full text-[#fff] text-[20px] absolute top-[5px] px-[5px]">
                                                                                <a class="remove-image m-0 p-0 h-full flex items-center" onclick="removeFile('` + data[i].imgLink + `');">
                                                                                    <i class="bi bi-x"></i>
                                                                                </a>
                                                                                <input type="checkbox" name="select-image" value="` + data[i].imgLink + `" class="checkbox-input hidden" id="ip_` + data[i].imgLink + `" onchange="toggleSelectImage(event)">
                                                                                <label for="ip_` + data[i].imgLink + `">
                                                                                    <span class="checkbox transparent border border-[#fff] rounded w-[16px] h-[16px] inline-block relative cursor-pointer"></span>
                                                                                </label>
                                                                            </div>
                                                                        </li>`);
                            $("#thumbnails").append('<li class="thumbnail image-item-container mr-[2px] overflow-hidden relative group cursor-pointer" id="tb_' + data[i].imgLink + '"><div class="image-overlay w-full h-full bg-[#000] opacity-0 absolute top-0 left-0 z-[2] duration-150"></div><img class="z-[1] w-full h-full object-cover group-hover:blur-sm duration-150" alt="" src="' + data[i].imgLink + '" size=""><div class="image-control flex justify-between items-center z-[3] h-[20px] w-full text-[#fff] text-[20px] absolute top-[5px] px-[5px]"><a class="remove-image m-0 p-0 h-full flex items-center" onclick="removeFile(\'' + data[i].imgLink + '\');"><i class="bi bi-x"></i></a><input type="checkbox" name="select-image" value="' + data[i].imgLink + '" class="checkbox-input hidden" id="tb_ip_' + data[i].imgLink + '" onchange="toggleSelectThumbnail(event)"><label for="tb_ip_' + data[i].imgLink + '"><span class="checkbox transparent border border-[#fff] rounded w-[16px] h-[16px] inline-block relative cursor-pointer"></span></label></div></li>');
                        }
                        countSelectedImage();
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
                        data: {path: filePath, hostelId: ${sessionScope.currentHostel.hostelID}},
                        url: '/sakura/landlord/remove-image',
                        complete: function () {
                            toggleModal('.modal.remove-an-image');
                            showToast('info', 'Đang xoá, vui lòng đợi!');
                            setTimeout(function () {
                                window.location.reload();
                            }, 3000);
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
                        formData.append("hostelId", ${sessionScope.currentHostel.hostelID});
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

            function selectAllImages() {
                let images = document.querySelectorAll('.checkbox-input');
                console.log(images);
                images.forEach(e => {
                    console.log(e.checked);
                    let par = e.parentElement;
                    let imgEl = par.parentElement;
                    if (e.checked === false) {
                        par.classList.toggle('checked-box');
                        imgEl.classList.toggle('selected');
                        e.checked = true;
                    }
                });
                images.forEach(e => {
                    console.log(e.checked);
                });
                countSelectedImage();
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
        <c:if test="${requestScope.feedbacks.size() > 0}">
            <script>
                let chart = new Donutty(document.getElementById('donut-chart'), {
                    min: 0,
                    max: 5,
                    bg: '#e4ecf4',
                    value: ${requestScope.avgRating},
                    round: true,
                    color: '#17535B',
                    thickness: 4,
                    circle: false,
                    padding: 2,
                    text: function (state) {
                        let label = state.value + " / 5";
                        //return (state.value / (state.max - state.min) * 100) + "%";
                        return label;
                        // return the percentage of the donut
                    }

                });
            </script>
        </c:if>

    </body>
</html>
