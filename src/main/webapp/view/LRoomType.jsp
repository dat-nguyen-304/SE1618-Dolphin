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

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
              rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/LRoomType.css">

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

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
                <c:if test="${sessionScope.hostelList != null}">
                    <%@include file="../view/modalLandlordRoomType.jsp" %>
                    <div class="mt-[20px]">
                        <div class="mb-[20px] flex items-center ">
                            <span>Chọn nhà trọ: </span>
                            <button class="ml-[10px] inline-block rounded w-fit h-fit py-[5px] px-[20px] bg-[#17535B] hover:bg-[#13484F] flex flex justify-between items-center" type="button" data-modal-toggle="hostelModal">
                                <p class="font-medium text-[16px] text-[#fff]">${sessionScope.currentHostel.hostelName}</p>
                            </button>
                        </div>

                        <c:if test="${requestScope.currentRoomType !=null}">
                            <div class="flex items-center">
                                <div class="mr-[20px] flex items-center">    
                                    <span>Chọn loại phòng: </span>
                                    <button class="ml-[10px] inline-block rounded w-fit h-fit py-[5px] px-[20px] bg-[#288D87] hover:bg-[#248781] flex flex justify-between items-center" type="button" data-modal-toggle="roomModal">
                                        <p class="font-medium text-[16px] text-[#fff]">${requestScope.currentRoomType.roomTypeName}</p>
                                    </button>
                                </div>
                                <button id="deleteRoomType-1" type="submit" name="action" value="Save" class="mr-[20px] rounded w-fit h-fit px-[10px] py-[5px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                                    <p class="font-normal text-[16px] text-gray-400 group-hover:text-[#288D87]"><i class="bi bi-trash-fill mr-[5px]"></i>Xóa</p>
                                </button>
                                <button id="updateRoomType-1" type="submit" name="action" value="Save" class="mr-[20px] rounded w-fit h-fit px-[10px] py-[5px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                                    <p class="font-normal text-[16px] text-gray-400 group-hover:text-[#288D87]"><i class="bi bi-pencil-fill mr-[5px]"></i>Chỉnh sửa</p>
                                </button>
                                <button id="addRoomType-1" type="submit" name="action" value="Save" class="mr-[20px] rounded w-fit h-fit px-[10px] py-[5px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                                    <p class="font-normal text-[16px] text-gray-400 group-hover:text-[#288D87]"><i class="bi bi-plus-lg mr-[5px]"></i>Thêm</p>
                                </button>
                            </div>
                        </c:if>
                    </div>
                </c:if>
                <!-- General information -->
                <div class="flex justify-between mt-[20px] grid grid-cols-5 gap-5">

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
                            <c:if test="${requestScope.currentRoomType !=null}">
                                <div class="grid grid-cols-8 gap-[10px]">
                                    <c:forEach items="${requestScope.roomList}" var="room">
                                        <form action="/sakura/landlord/room-detail" class="border-2 rounded text-center p-1 hover:border-[#17535B] hover:text-[#17535B] duration-150">
                                            <button name="roomId" value="${room.roomID}" class="w-full">${room.roomNumber}</button>
                                        </form>
                                    </c:forEach>
                                </div>
                            </c:if>
                            <c:if test="${requestScope.currentRoomType == null}">
                                <p class="text-gray-400 text-center text-[20px] py-[10px]">Trống</p>
                            </c:if>
                        </div>        
                    </div>

                    <!--Right-->
                    <div class="card bg-[#fff] p-5 flex flex-col col-span-3">
                    </div>
                </div>
                <!-- General information -->





            </div>

            <%@include file="footerDashboard.jsp" %>
        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>

        <script>
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
        </script>
        <script>
            function deleteRoomType(element) {

                const deleteRoomTypeContent = document.querySelector(".deleteRoomTypeContent");
                const deleteRoomTypeId = document.querySelector("input[name='roomTypeId']");
                const deleteRoomTypeBtn = document.querySelector(".deleteRoomTypeBtn");

                jQuery.ajax({
                    type: 'POST',
                    data: {'deleteRoomTypeId': deleteRoomTypeId.value
                    },
                    url: '/sakura/landlord/delete-roomtype',
                    success: function (response) {
                        deleteRoomTypeContent.innerHTML = response;
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }
        </script>
        <script>
            function addRoomType(element) {
                console.log("da vao add roomtype");
                console.log(element);
                const name = document.querySelector("input[name='name']");
                const price = document.querySelector("input[name='price']");
                const area = document.querySelector("input[name='area']");
                const maxNumberOfResidents = document.querySelector("input[name='maxNumberOfResidents']");
                const description = document.querySelector("textarea[name='description']");
                const hostelId = document.querySelector("input[name='hostelId']");
                const messageElement = document.querySelector(".addRoomMessage");
                jQuery.ajax({
                    type: 'POST',
                    data: {'name': name.value,
                        'price': price.value,
                        'area': area.value,
                        'maxNumberOfResidents': maxNumberOfResidents.value,
                        'description': description.value,
                        'hostelId': hostelId.value
                    },
                    url: '/sakura/landlord/add-roomtype',
                    success: function (response) {
                        name.value = "";
                        price.value = "";
                        area.value = "";
                        maxNumberOfResidents.value = "";
                        description.value = "";
                        messageElement.innerHTML = response;
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
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
                console.log("Name: ", name.value);
                console.log("Price: ", price.value);
                console.log("area: ", area.value);
                console.log("maxNumberOfResidents: ", maxNumberOfResidents.value);
                console.log("description ", description.value);
                console.log("roomTypeId", roomTypeId.value);
                jQuery.ajax({
                    type: 'POST',
                    data: {'name': name.value,
                        'price': price.value,
                        'area': area.value,
                        'maxNumberOfResidents': maxNumberOfResidents.value,
                        'description': description.value,
                        'roomTypeId': roomTypeId.value
                    },
                    url: '/sakura/landlord/update-roomtype',
                    success: function (response) {
                        messageElement.innerHTML = response;
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }

            function checkValidRoom(element) {
                const hostelId = document.querySelector("input[name='hostelId']").value;
                const validRoomMessage = document.querySelector(".validRoomMessage");
                const addRoomElement = document.querySelector(".addRoom");
                jQuery.ajax({
                    type: 'POST',
                    data: {'roomNumber': element.value,
                        'hostelId': hostelId
                    },
                    url: '/sakura/landlord/check-room-valid',
                    success: function (response) {
                        validRoomMessage.innerHTML = response;
                        if (response) {
                            addRoomElement.onclick = (e) => {
                                e.preventDefault();
                            }
                        } else {
                            addRoomElement.onclick = (e) => {
                                e.returnValue = true;
                            }
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
            function checkValidRoomType(element) {
                const validRoomTypeMessage = document.querySelector(".validRoomTypeMessage");
                const hostelId = document.querySelector("input[name='hostelId']");
                const addRoomTypeBtn = document.querySelector(".addRoomTypeBtn");
                jQuery.ajax({
                    type: 'POST',
                    data: {'roomTypeName': element.value,
                        'hostelId': hostelId.value
                    },
                    url: '/sakura/landlord/check-roomtype-valid',
                    success: function (response) {
                        validRoomTypeMessage.innerHTML = response;
                        if (response) {
                            addRoomTypeBtn.onclick = (e) => {
                                e.preventDefault();
                            };
                        } else {
                            addRoomTypeBtn.onclick = () => addRoomType();
                        }
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }

            function checkValidUpdateRoomType(element) {
                const validUpdateRoomTypeMessage = document.querySelector(".validUpdateRoomTypeMessage");
                const hostelId = document.querySelector("input[name='hostelId']");
                const updateRoomTypeBtn = document.querySelector(".updateRoomTypeBtn");
                const currentName = document.querySelector("input[name='currentName']");
                jQuery.ajax({
                    type: 'POST',
                    data: {'roomTypeName': element.value,
                        'hostelId': hostelId.value,
                        'currentName': currentName.value
                    },
                    url: '/sakura/landlord/check-update-roomtype-valid',
                    success: function (response) {
                        validUpdateRoomTypeMessage.innerHTML = response;
                        if (response) {
                            updateRoomTypeBtn.onclick = (e) => {
                                e.preventDefault();
                            };
                        } else {
                            updateRoomTypeBtn.onclick = () => updateRoomType();
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
            var open_modal_1 = document.querySelector('#addRoomType-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.addRoomTypemodal1');
            });

            var open_modal_2 = document.querySelector('#addRoomType-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.addRoomTypemodal2');
            });

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

            var open_modal_2 = document.querySelector('#updateRoomType-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.updateRoomTypemodal2');
            });

            // Bấm ngoài modal thì đóng modal
            // const overlay = document.querySelector('.modal .modal-overlay');
            // overlay.addEventListener('click', toggleModal('.modal'));

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

            var open_modal_2 = document.querySelector('#deleteRoomType-2');
            open_modal_2.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.deleteRoomTypemodal2');
            });

            // Bấm ngoài modal thì đóng modal
            // const overlay = document.querySelector('.modal .modal-overlay');
            // overlay.addEventListener('click', toggleModal('.modal'));

            var close_modal_1 = document.querySelectorAll('.deleteRoomTypemodal1 .deleteRoomTypemodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.deleteRoomTypemodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.deleteRoomTypemodal2 .deleteRoomTypemodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.deleteRoomTypemodal2');
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
                const modal_1 = document.querySelector('.deleteRoomTypemodal1');
                const modal_2 = document.querySelector('.deleteRoomTypemodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.deleteRoomTypemodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.deleteRoomTypemodal2');
                }
            };
        </script>
    </body>

</html>