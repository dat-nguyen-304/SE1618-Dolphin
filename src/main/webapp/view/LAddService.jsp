<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dịch vụ</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="images/logo.png">

        <!-- <link rel="stylesheet" href="app.css"> -->
        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
                            <a href="#"
                               class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Phòng
                            </a>
                        </li>
                        <!-- <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                        clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Danh sách hoá đơn</span>
                            </div>
                        </li> -->
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <!-- General information -->
                <c:if test="${sessionScope.currentHostel == null}">
                    <h1>Bạn chưa có phòng trọ nào</h1>
                </c:if>
                <c:if test="${sessionScope.currentHostel != null}">
                    <div class="general-info flex justify-between mt-[20px]">
                        <div class="">
                            <span>Chọn nhà trọ: </span>
                            <button
                                class="ml-[20px] inline-block text-white bg-[#17535B] hover:bg-[13484F] font-medium rounded-lg text-sm px-5 py-2.5 text-center "
                                type="button" data-modal-toggle="hostelModal">
                                ${sessionScope.currentHostel.hostelName}
                            </button>

                            <div id="hostelModal" tabindex="-1" aria-hidden="true"
                                 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                    <div class="relative bg-white rounded-lg shadow">

                                        <div
                                            class="flex justify-between items-start p-4 rounded-t border-b">
                                            <h3 class="text-xl font-semibold text-gray-900">
                                                Chọn nhà trọ
                                            </h3>
                                            <button type="button"
                                                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center"
                                                    data-modal-toggle="hostelModal">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd"
                                                      d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                      clip-rule="evenodd"></path>
                                                </svg>
                                            </button>
                                        </div>

                                        <div class="p-6 space-y-6">
                                            <c:forEach items="${sessionScope.hostelList}" var="hostel">
                                                <form action="/sakura/landlord/room-detail" class="inline-block">
                                                    <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-4 py-2 mx-2 rounded border-2">${hostel.hostelName}</button>
                                                </form>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>

            <div class="grid grid-cols-12 gap-x-8">
                <div class="col-span-7 border-4 p-4 border-2 rounded mt-[24px]">
                    <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                        <h1 class="updateMessage"></h1>
                        <table class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                            <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-3 py-3 text-center">
                                        Tên dịch vụ
                                    </th>
                                    <th scope="col" class="px-3 py-3 text-center">
                                        Đơn giá
                                    </th>
                                    <th scope="col" class="px-3 py-3 text-center">
                                        Đơn vị
                                    </th>
                                    <th scope="col" class="px-3 py-3 text-center">
                                        Ngày áp dụng
                                    </th>
                                    <th scope="col" class="px-3 py-3 text-center">
                                        <span class="sr-only">Update</span>
                                    </th>
                                    <th scope="col" class="px-3 py-3 text-center">
                                        <span class="sr-only">Remove</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="service-list">
                                <tr class="bg-white border-b hover:bg-gray-50">
                                    <td class="px-3 py-4 text-center">
                                        <input disabled name="updateName" type="text" class="text-xs" value="Điện"/>
                                    </td>
                                    <td class="px-3 py-4 text-center">
                                        <input name="updateFee" type="text" class="text-xs" value="${requestScope.eletricService.serviceFee}"/>
                                    </td>
                                    <td class="px-3 py-4 text-center">
                                        <input name="updateUnit" type="text" class="text-xs" value="kWh"/>
                                    </td>
                                    <td class="px-3 py-4 text-center">
                                        ${requestScope.eletricService.monthApplied}
                                    </td>
                                    <td class="px-3 py-4 text-right text-center">
                                        <button onclick="updateMember(this)" type="submit" value="${eletricService.serviceID}" class="font-medium text-[#17535B]">Lưu thay đổi</button>
                                    </td>
                                </tr>
                                <tr class="bg-white border-b hover:bg-gray-50">
                                    <td class="px-3 py-4 text-center">
                                        <input disabled name="updateName" type="text" class="text-xs" value="Nước"/>
                                    </td>
                                    <td class="px-3 py-4 text-center">
                                        <input name="updateFee" type="text" class="text-xs" value="${requestScope.waterService.serviceFee}"/>
                                    </td>
                                    <td class="px-3 py-4 text-center">
                                        <input name="updateUnit" type="text" class="text-xs" value="m3"/>
                                    </td>
                                    <td class="px-3 py-4 text-center">
                                        ${requestScope.waterService.monthApplied}
                                    </td>
                                    <td class="px-3 py-4 text-right text-center">
                                        <button onclick="updateMember(this)" type="submit" value="${waterService.serviceID}" class="font-medium text-[#17535B]">Lưu thay đổi</button>
                                    </td>
                                </tr>
                                <c:forEach items="${requestScope.serviceList}" var="service">
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <td class="px-3 py-4 text-center">
                                            <input name="updateName" type="text" class="text-xs" value="${service.serviceName}"/>
                                        </td>
                                        <td class="px-3 py-4 text-center">
                                            <input name="updateFee" type="text" class="text-xs" value="${service.serviceFee}"/>
                                        </td>
                                        <td class="px-3 py-4 text-center">
                                            <input name="updateUnit" type="text" class="text-xs" value="${service.unit}"/>
                                        </td>
                                        <td class="px-3 py-4 text-center">
                                            ${service.monthApplied}
                                        </td>
                                        <td class="px-3 py-4 text-right text-center">
                                            <button onclick="updateService(this)" type="submit" value="${service.serviceID}" class="font-medium text-[#17535B]">Lưu thay đổi</button>
                                        </td>
                                        <td class="px-3 py-4 text-right text-center">
                                            <button onclick="deleteService(this)" type="submit" value="${service.serviceID}" class="font-medium text-[#17535B]">Xóa</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-span-5 border-4 p-4 border-2 rounded mt-[24px]">
                    <h1 class="addServiceMessage text-md"></h1>
                    <h1 class="text-md">Thêm dịch vụ mới </h1>
                    <div class="my-8">
                        <label class="w-[160px] inline-block" for="">Tên dịch vụ</label>
                        <input type="text" required name="addServiceName" class="text-sm p-1"/>
                        <p class="ml-[200px] text-xs">VD: Đỗ xe, đổ rác, ...</p>
                        <label class="w-[160px] inline-block" for="">Đơn giá</label>
                        <input type="text" required name="addServiceFee" class="text-sm p-1"/>
                        <p class="ml-[200px] text-xs">VD: 3000,4000 ...</p>
                        <label class="w-[160px] inline-block" for="">Đơn vị</label>
                        <input type="text" required name="addServiceUnit" class="text-sm p-1"/>
                    </div>
                    <!--Footer-->
                    <div class="flex justify-end p-[20px]">
                        <button onclick="addService()" class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">
                            Lưu
                        </button>
                    </div>
                </div>
            </div>

            <footer class="w-full px-[20px] pb-[20px]">
                <div class="card w-full h-fit bg-[#fff] rounded flex items-center justify-between p-[20px]">
                    <span class="text-sm text-gray-500 sm:text-center">© 2022 <a href="https://flowbite.com"
                                                                                 class="hover:text-[#17535B]">Sakura™</a>. All Rights Reserved.
                    </span>
                    <ul class="flex flex-wrap items-center mt-3 text-sm text-gray-400 sm:mt-0">
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6 ">Về Sakura</a>
                        </li>
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6">Chính sách bảo mật</a>
                        </li>
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6">FAQ</a>
                        </li>
                        <li>
                            <a href="#" class="hover:text-[#17535B]">Liên hệ</a>
                        </li>
                    </ul>
                </div>
            </footer>
        </div>
        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="js/chart.js"></script>
        <!-- Breadcrumb -->
        <script src="js/breadcrumb.js"></script>
        <script src="../assets/javascript/jquery/jquery.min.js"></script>
        <script>
                            function addService() {
                                console.log("da vao add service");
                                const serviceName = document.querySelector("input[name='addServiceName']");
                                const serviceFee = document.querySelector("input[name='addServiceFee']");
                                const serviceUnit = document.querySelector("input[name='addServiceUnit']");
                                const addServiceMessage = document.querySelector(".addServiceMessage");
                                const serviceList = document.querySelector(".service-list");

                                if (!serviceName.value || !serviceFee.value || !serviceUnit.value) {
                                    let message = "";
                                    if (!serviceName.value) {
                                        message += "Tên dịch vụ - ";
                                    }
                                    if (!serviceFee.value) {
                                        message += "Phí dịch vụ - ";
                                    }
                                    if (!serviceUnit.value) {
                                        message += "Đơn vị ";
                                    }
                                    message += "không được trống!";
                                    addServiceMessage.innerHTML = message;
                                } else {
                                    let message = "";
                                    if (!Number.isInteger(Number(serviceFee.value))) {
                                        message += "Phí dịch vụ phải là một số";
                                        addServiceMessage.innerHTML = message;
                                    } else
                                        jQuery.ajax({
                                            type: 'POST',
                                            data: {'serviceName': serviceName.value,
                                                'serviceFee': serviceFee.value,
                                                'serviceUnit': serviceUnit.value,
                                                'hostelId': ${sessionScope.currentHostel.hostelID}
                                            },
                                            url: '/sakura/landlord/add-service-ajax',
                                            success: function (response) {
                                                serviceName.value = "";
                                                serviceFee.value = "";
                                                serviceUnit.value = "";
                                                const res = response.toString();
                                                console.log(res);
                                                if (res.includes("px-3 py-4 text-center")) {
                                                    serviceList.innerHTML += response;
                                                    addServiceMessage.innerHTML = "Thêm thành công";
                                                } else {
                                                    addServiceMessage.innerHTML = response;
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
            function updateService(element) {
                console.log("da vao update member");
                const serviceElement = element.parentElement.parentElement;
                const serviceId = element;
                const serviceName = serviceElement.querySelector("input[name='updateName']");
                const serviceFee = serviceElement.querySelector("input[name='updateFee']");
                const serviceUnit = serviceElement.querySelector("input[name='updateUnit']");
                const updateMessage = document.querySelector(".updateMessage");
                if (!serviceName.value || !serviceFee.value || !serviceUnit.value) {
                    let message = "";
                    if (!serviceName.value) {
                        message += "Tên dịch vụ - ";
                    }
                    if (!serviceFee.value) {
                        message += "Phí dịch vụ - ";
                    }
                    if (!serviceUnit.value) {
                        message += "Đơn vị ";
                    }
                    message += "không được trống!";
                    updateMessage.innerHTML = message;
                } else {
                    let message = "";
                    if (!Number.isInteger(Number(serviceFee.value))) {
                        message += "Phí dịch vụ phải là một số";
                        updateMessage.innerHTML = message;
                    } else
                        jQuery.ajax({
                            type: 'POST',
                            data: {'serviceName': serviceName.value,
                                'serviceFee': serviceFee.value,
                                'serviceUnit': serviceUnit.value,
                                'hostelId': ${sessionScope.currentHostel.hostelID},
                                'serviceId': serviceId.value
                            },
                            url: '/sakura/landlord/edit-service',
                            success: function (response) {
                                updateMessage.innerHTML = response;
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
            function deleteService(element) {
                const serviceElement = element.parentElement.parentElement;
                const serviceName = serviceElement.querySelector("input[name='updateName']");
                const updateMessage = document.querySelector(".updateMessage");
                const serviceId = element;
                jQuery.ajax({
                    type: 'POST',
                    data: {'serviceId': serviceId.value,
                        'serviceName': serviceName.value
                    },
                    url: '/sakura/landlord/delete-service',
                    success: function (response) {
                        serviceElement.remove();
                        updateMessage.innerHTML = response;
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });


            }
        </script>
    </body>
</html>