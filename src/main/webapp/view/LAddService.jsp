<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Dịch vụ</title>

        <%@include file="../view/assets.jsp" %>

        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link href="../assets/css/toastr.css" rel="stylesheet" />
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/LAddService.css">

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
                <div class="head-control flex justify-between">
                    <!-- Breadcrumb -->
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center">
                                <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                    <path d="M10 3.5a1.5 1.5 0 013 0V4a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-.5a1.5 1.5 0 000 3h.5a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-.5a1.5 1.5 0 00-3 0v.5a1 1 0 01-1 1H6a1 1 0 01-1-1v-3a1 1 0 00-1-1h-.5a1.5 1.5 0 010-3H4a1 1 0 001-1V6a1 1 0 011-1h3a1 1 0 001-1v-.5z" />
                                    </svg>
                                    Dịch vụ của nhà trọ ${sessionScope.currentHostel.hostelName}
                                </p>
                            </li>
                        </ol>
                    </nav>
                    <!-- End breadcrumb -->
                    <c:if test="${sessionScope.currentHostel != null}">
                        <div class="general-info flex justify-between">
                            <%@include file="../view/modalLandlordAddService.jsp" %>
                            <div class="">
                                <span>Chọn nhà trọ: </span>
                                <button class="ml-[10px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-[15px] px-[10px] py-[5px] text-center" type="button" data-modal-toggle="hostelModal">
                                    ${sessionScope.currentHostel.hostelName}
                                </button>
                            </div>
                        </div>
                    </c:if>
                </div>
                <!-- General information -->
                <c:if test="${sessionScope.currentHostel == null}">
                    <h1>Bạn chưa có phòng trọ nào</h1>
                </c:if>

                <div class="card-container mt-[20px] grid grid-cols-8 gap-[20px]">
                    <div class="card col-span-5 relative bg-[#fff] p-[20px] w-full h-[calc(100vh-235px)] ">
                        <div class="flex items-center justify-between">
                            <div class="text-[20px] font-bold text-[#288D87] mb-[10px]">Danh sách dịch vụ</div>
                            <h1 class="updateMessage text-[15px] text-emerald-500 font-bold"></h1>
                        </div>
                        <div class="max-h-[calc(100%-40px)] overflow-y-auto">
                            <table class="w-full text-[14px] text-left text-gray-500">
                                <thead class="text-[13px] text-gray-700 uppercase bg-gray-50">
                                    <tr>
                                        <th scope="col" class="py-3 w-[200px] pl-[10px]">Tên dịch vụ</th>
                                        <th scope="col" class="py-3 w-[180px]">Đơn giá (VNĐ)</th>
                                        <th scope="col" class="py-3 w-[150px]">Đơn vị</th>
                                        <th scope="col" class="py-3 w-[150px]">Tháng áp dụng</th>
                                        <th scope="col" class="py-3"><span class="sr-only">Update</span></th>
                                        <th scope="col" class="py-3"><span class="sr-only">Reset</span></th>
                                        <th scope="col" class="py-3"><span class="sr-only">Remove</span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="bg-white hover:bg-gray-50 border-b text-[15px] text-gray-800">
                                        <td class="hidden"><input name="updateName" type="hidden" class="text-[15px]" value="Điện"/></td>
                                        <td class="hidden"><input name="updateType" type="hidden" class="text-[15px]" value="1"/></td>
                                        <td class="py-4 w-[200px] pl-[10px]">Điện</td>
                                        <td class="py-4 w-[180px]">
                                            <c:if test="${requestScope.eletricService.serviceFee == 0}">
                                                <input name="updateFee" type="number" class="w-[90%] text-[15px] px-[3px]" value=""/>
                                            </c:if>
                                            <c:if test="${requestScope.eletricService.serviceFee != 0}">
                                                <input name="updateFee" type="number" class="w-[90%] text-[15px] px-[3px]" value="${requestScope.eletricService.serviceFee}"/>
                                            </c:if>
                                            <input name="updateUnit" type="hidden" class="text-[15px]" value="kWh"/>
                                        </td>
                                        <td class="py-4 w-[150px]">kWh</td>
                                        <td class="py-4 w-[150px] date">
                                            ${requestScope.eletricService.monthApplied}
                                        </td>
                                        <td class="py-4 text-center">
                                            <button onclick="updateService(this)" type="submit" value="${requestScope.eletricService.serviceID}" class="font-medium text-[#288D87] hover:underline">Lưu thay đổi</button>
                                        </td>
                                        <td class="py-4 text-center backup">
                                            <button onclick="resetService(this, 'Điện', '${requestScope.eletricService.serviceFee}', 'kWh')" type="submit" value="${requestScope.eletricService.serviceID}" class="font-medium text-[#288D87] hover:underline">Hoàn tác</button>
                                        </td>
                                        <td class="py-4 text-center cursor-not-allowed text-gray-300 pr-[5px]">Xoá</td>
                                    </tr>
                                    <tr class="bg-white hover:bg-gray-50 border-b text-[15px] text-gray-800">
                                        <td class="hidden"><input name="updateName" type="hidden" class="text-[15px]" value="Nước"/></td>
                                        <td class="hidden"><input name="updateType" type="hidden" class="text-[15px]" value="2"/></td>
                                        <td class="py-4 w-[200px] pl-[10px]">Nước</td>
                                        <td class="py-4 w-[180px]">
                                            <c:if test="${requestScope.waterService.serviceFee != 0}">
                                                <input name="updateFee" type="number" class="w-[90%] text-[15px] px-[3px]" value="${requestScope.waterService.serviceFee}"/>
                                            </c:if>
                                            <c:if test="${requestScope.waterService.serviceFee == 0}">
                                                <input name="updateFee" type="number" class="w-[90%] text-[15px] px-[3px]" value=""/>
                                            </c:if>
                                            <input name="updateUnit" type="hidden" class="text-[15px]" value="m3"/>
                                        </td>
                                        <td class="py-4 w-[150px]">
                                            m<sup>3</sup>
                                        </td>
                                        <td class="py-4 w-[150px] date">
                                            ${requestScope.waterService.monthApplied}
                                        </td>
                                        <td class="py-4 text-center">
                                            <button onclick="updateService(this)" type="submit" value="${requestScope.waterService.serviceID}" class="font-medium text-[#288D87] hover:underline">Lưu thay đổi</button>
                                        </td>
                                        <td class="py-4 text-center backup">
                                            <button onclick="resetService(this, 'Nước', '${requestScope.waterService.serviceFee}', 'm3')" type="submit" class="font-medium text-[#288D87] hover:underline">Hoàn tác</button>
                                        </td>
                                        <td class="py-4 text-center cursor-not-allowed text-gray-300 pr-[5px]">Xoá</td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="w-full text-[14px] text-left text-gray-500">
                                <tbody class="service-list">
                                    <c:forEach items="${requestScope.serviceList}" var="service">
                                        <tr class="bg-white hover:bg-gray-50 border-b text-[15px] text-gray-800">
                                            <td class="hidden"><input name="updateType" type="hidden" class="text-[15px] w-[90%] px-[3px]" value="${service.type}"/></td>
                                            <td class="py-4 w-[200px]">
                                                <input name="updateName" type="text" class="text-[15px] w-[90%] px-[3px]" value="${service.serviceName}"/>
                                            </td>
                                            <td class="py-4 w-[180px]">
                                                <input name="updateFee" type="number" class="text-[15px] w-[90%] px-[3px]" value="${service.serviceFee}"/>
                                            </td>
                                            <td class="py-4 w-[150px]">
                                                <input name="updateUnit" type="text" class="text-[15px] w-[90%] px-[3px]" value="${service.unit}"/>
                                            </td>
                                            <td class="py-4 w-[150px] date">
                                                ${service.monthApplied}
                                            </td>
                                            <td class="py-4 text-center">
                                                <button onclick="updateService(this)" type="submit" value="${service.serviceID}" class="font-medium text-[#288D87] hover:underline">Lưu thay đổi</button>
                                            </td>
                                            <td class="py-4 text-center backup">
                                                <button onclick="resetService(this, '${service.serviceName}', '${service.serviceFee}', '${service.unit}')" type="submit" value="${service.serviceID}" class="font-medium text-[#288D87] hover:underline">Hoàn tác</button>
                                            </td>
                                            <td class="py-4 text-center pr-[5px]">
                                                <button onclick="deleteService(this)" type="submit" value="${service.serviceID}" class="font-medium text-[#288D87] hover:underline">Xóa</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card bg-[#fff] col-span-3 p-[20px] rounded relative">
                        <div class="text-[20px] font-bold text-[#288D87] mb-[10px]">Thêm dịch vụ</div>
                        <div class="text-[15px] font-light text-gray-800 mb-[20px]">Chủ nhà có thể thêm các dịch vụ như gửi xe, internet, vệ sinh,.. kèm theo đơn giá sẽ được tính khi tính hoá đơn hằng tháng cho người thuê.</div>
                        <div class="mb-[20px]">
                            <p class="text-xs text-[red] validServiceMessage"></p>
                            <div class="flex items-center mb-[20px]">
                                <label class="w-[120px] inline-block" for="service-name">Tên dịch vụ</label>
                                <input type="text" required name="addServiceName" id="service-name" class="w-[200px] text-[15px] p-[5px]" onkeyup="checkValidService(this)"/>
                                <p class="ml-[10px] font-light text-[13px]">VD: Gửi xe, đổ rác, ...</p>
                            </div>
                            <p class="text-xs text-[red] validFeeMessage"></p>
                            <div class="flex items-center mb-[20px]">
                                <label class="w-[120px] inline-block" for="service-fee">Đơn giá (VNĐ)</label>
                                <input type="text" required name="addServiceFee" id="service-fee" class="w-[200px] text-[15px] p-[5px]" onkeyup="checkValidFee(this)"/>
                                <p class="ml-[10px] font-light text-[13px]">VD: 3000,4000 ...</p>
                            </div>
                            <div class="flex items-center mb-[20px]">
                                <label class="w-[120px] inline-block" for="service-unit">Đơn vị tính</label>
                                <input type="text" required name="addServiceUnit" id="service-unit" class="w-[200px] text-[15px] p-[5px]"/>
                            </div>
                        </div>
                        <!--Footer-->
                        <div class="float-right">
                            <button onclick="addService()" class="px-[10px] py-[5px] rounded text-white bg-[#17535B] hover:bg-[#13484F]">
                                Thêm dịch vụ
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>

        <script src="../assets/javascript/jquery/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script src="../assets/javascript/checkvalid.js"></script>
        <script>
                                function showToast(type, msg, duplicate) {
                                    toastr.options.positionClass = 'toast-bottom-right';
                                    toastr.options.extendedTimeOut = 0; //1000;
                                    toastr.options.timeOut = 3000;
                                    toastr.options.hideDuration = 250;
                                    toastr.options.showDuration = 250;
                                    toastr.options.hideMethod = 'slideUp';
                                    toastr.options.showMethod = 'slideDown';
                                    toastr.options.preventDuplicates = duplicate === 1 ? true : false;
                                    toastr.options.closeButton = true;
                                    toastr.options.progressBar = true;
                                    toastr[type](msg);
                                }
        </script>
        <script>
            var checkService = checkFee = false;
            function addService() {
                const serviceName = document.querySelector("input[name='addServiceName']");
                const serviceFee = document.querySelector("input[name='addServiceFee']");
                const serviceUnit = document.querySelector("input[name='addServiceUnit']");
                const serviceList = document.querySelector(".service-list");
                const validServiceMessage = document.querySelector(".validServiceMessage");
                const validFeeMessage = document.querySelector(".validFeeMessage");
                if (!serviceName.value.trim() || !serviceFee.value.trim()) {
                    if (!serviceName.value.trim()) {
                        validServiceMessage.innerHTML = "Tên dịch vụ không được trống!";
                        checkService = false;
                    }
                    if (!serviceFee.value.trim()) {
                        validFeeMessage.innerHTML = "Phí dịch vụ không được trống!";
                        checkFee = false;
                    }
                    showToast('error', 'Vui lòng kiểm tra lại thông tin!');
                } else {
                    if (checkService && checkFee) {
                        jQuery.ajax({
                            type: 'POST',
                            data: {'serviceName': serviceName.value.trim(),
                                'serviceFee': serviceFee.value.trim(),
                                'serviceUnit': serviceUnit.value.trim(),
                                'hostelId': ${sessionScope.currentHostel.hostelID}
                            },
                            url: '/sakura/service/add-service',
                            success: function (response) {
                                serviceName.value = "";
                                serviceFee.value = "";
                                serviceUnit.value = "";
                                const res = response.toString();
                                console.log("res: ", res);
                                if (res.includes("py-4 w-[200px]")) {
                                    serviceList.innerHTML = response;
                                    console.log(serviceList);
                                    showToast("success", "Thêm thành công", 0);
//                                    setTimeout(function () {
//                                        window.location.reload();
//                                    }, 3000);
                                    //addServiceMessage.innerHTML = "Thêm thành công";
                                } else {
                                    showToast('error', 'Thêm dịch vụ thất bại!');
                                }
                                console.log(serviceList.children.length);
                                if (serviceList.children.length < 10) {
                                    $('.card-container').addClass('h-[calc(100vh-275px)]');
                                } else {
                                    $('.card-container').removeClass('h-[calc(100vh-275px)]');
                                }

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

            function checkValidService(element) {
                const validServiceMessage = document.querySelector(".validServiceMessage");
                if (!element.value.trim()) {
                    validServiceMessage.innerHTML = 'Tên dịch vụ không được trống';
                    checkService = false;
                } else {
                    let valid = isValid(element.value.trim(), 'name');
                    if (!valid) {
                        validServiceMessage.innerHTML = 'Tên dịch vụ chỉ được chứa chữ cái, chữ số và khoảng trắng';
                        checkService = false;
                    } else {
                        validServiceMessage.innerHTML = '';
                        checkService = true;
                    }
                }
            }

            function checkValidFee(element) {
                const validFeeMessage = document.querySelector(".validFeeMessage");
                if (!element.value.trim()) {
                    validFeeMessage.innerHTML = 'Phí dịch vụ không được trống';
                    checkFee = false;
                } else {
                    while (element.value.trim().charAt(0) === "0" && element.value.trim().length > 1) {
                        element.value = element.value.trim().slice(1);
                    }
                    if (element.value.trim() === "0") {
                        validFeeMessage.innerHTML = '';
                        checkFee = true;
                    } else {
                        let valid = isValid(element.value.trim(), 'money');
                        if (!valid) {
                            validFeeMessage.innerHTML = 'Số tiền không được âm, chia hết cho 1000, nhỏ hơn 1 tỷ';
                            checkFee = false;
                        } else {
                            validFeeMessage.innerHTML = '';
                            checkFee = true;
                        }
                    }

                }
            }
        </script>

        <script>
            function checkValidUpdateService(element) {
                const validServiceMessage = document.querySelector(".validServiceMessage");
                if (!element.value.trim()) {
                    validServiceMessage.innerHTML = 'Tên dịch vụ không được trống';
                    checkService = false;
                } else {
                    let valid = isValid(element.value.trim(), 'name');
                    if (!valid) {
                        validServiceMessage.innerHTML = 'Tên dịch vụ chỉ được chứa chữ cái, chữ số và khoảng trắng';
                        checkService = false;
                    } else {
                        validServiceMessage.innerHTML = '';
                        checkService = true;
                    }
                }
            }

            function updateService(element) {
                console.log("da vao update service");
                const serviceElement = element.parentElement.parentElement;
                const serviceId = element;
                const serviceName = serviceElement.querySelector("input[name='updateName']");
                const serviceFee = serviceElement.querySelector("input[name='updateFee']");
                const serviceUnit = serviceElement.querySelector("input[name='updateUnit']");
                const serviceType = serviceElement.querySelector("input[name='updateType']");
                const updateMessage = document.querySelector(".updateMessage");
                if (!serviceName.value.trim() || !serviceFee.value.trim()) {
                    let message = "";
                    if (!serviceName.value.trim()) {
                        message += "Tên dịch vụ - ";
                    }
                    if (!serviceFee.value.trim()) {
                        message += "Phí dịch vụ - ";
                    }
                    message += "không được trống!";
                    //updateMessage.innerHTML = message;
                    showToast('error', message);
                } else {
                    const checkUpdateService = isValid(serviceName.value.trim(), 'name');
                    let checkUpdateFee = true;
                    while (serviceFee.value.trim().charAt(0) === "0" && serviceFee.value.trim().length > 1) {
                        serviceFee.value = serviceFee.value.trim().slice(1);
                    }
                    if (serviceFee.value.trim() === "0") {
                        checkUpdateFee = true;
                    } else
                        checkUpdateFee = isValid(serviceFee.value.trim(), 'money');
                    if (checkUpdateService && checkUpdateFee)
                        jQuery.ajax({
                            type: 'POST',
                            data: {'serviceName': serviceName.value.trim(),
                                'serviceFee': serviceFee.value.trim(),
                                'serviceUnit': serviceUnit.value.trim(),
                                'hostelId': ${sessionScope.currentHostel.hostelID},
                                'serviceType': serviceType.value.trim(),
                                'serviceId': serviceId.value.trim()
                            },
                            url: '/sakura/service/edit-service',
                            success: function (response) {
                                serviceFee.value = serviceFee.value.trim();
                                const backup = serviceElement.querySelector(".backup");
                                const htmlString = "<button onclick=\"resetService(this, '" + serviceName.value.trim() + "', '" + serviceFee.value.trim() + "', '" + serviceUnit.value.trim() + "')\" type='submit' value='" + serviceId.value + "' class='font-medium text-[#288D87] hover:underline'>Hoàn tác</button>";
                                backup.innerHTML = htmlString;
                                showToast("info", response, 1);
                                //updateMessage.innerHTML = response;
                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
                    else {
                        if (!checkUpdateService)
                            showToast("error", "Tên dịch vụ chỉ được chứa chữ cái, chữ số và khoảng trắng");
                        if (!checkUpdateFee)
                            showToast("error", "Số tiền không được âm và chia hết cho 1000");
                    }
                }
            }

            function resetService(element, service, fee, unit) {
                console.log("da vao update service");
                const serviceElement = element.parentElement.parentElement;
                const serviceName = serviceElement.querySelector("input[name='updateName']");
                const serviceFee = serviceElement.querySelector("input[name='updateFee']");
                const serviceUnit = serviceElement.querySelector("input[name='updateUnit']");
                serviceName.value = service;
                serviceFee.value = fee;
                serviceUnit.value = unit;
            }
        </script>

        <script>
            function deleteService(element) {
                const serviceElement = element.parentElement.parentElement;
                const serviceName = serviceElement.querySelector("input[name='updateName']");
                const serviceUnit = serviceElement.querySelector("input[name='updateUnit']");
                const serviceType = serviceElement.querySelector("input[name='updateType']");
                const updateMessage = document.querySelector(".updateMessage");
                const serviceId = element;
                jQuery.ajax({
                    type: 'POST',
                    data: {'serviceId': serviceId.value.trim(),
                        'hostelId': ${sessionScope.currentHostel.hostelID},
                        'serviceName': serviceName.value.trim(),
                        'serviceUnit': serviceUnit.value.trim(),
                        'serviceType': serviceType.value.trim()
                    },
                    url: '/sakura/service/delete-service',
                    success: function (response) {
                        serviceElement.remove();
                        //updateMessage.innerHTML = response;
                        showToast("success", response, 0);
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });


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
    </body>
</html>