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

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M10 3.5a1.5 1.5 0 013 0V4a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-.5a1.5 1.5 0 000 3h.5a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-.5a1.5 1.5 0 00-3 0v.5a1 1 0 01-1 1H6a1 1 0 01-1-1v-3a1 1 0 00-1-1h-.5a1.5 1.5 0 010-3H4a1 1 0 001-1V6a1 1 0 011-1h3a1 1 0 001-1v-.5z" />
                                </svg>
                                Dịch vụ nhà trọ
                            </p>
                        </li>
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
                            <div class="pr-[20px] mr-[20px]">
                                <span>Nhà trọ: </span>
                                <button class="ml-[10px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-[15px] px-[10px] py-[5px] text-center" type="button" data-modal-toggle="hostelModal">
                                    ${sessionScope.currentHostel.hostelName}
                                </button>
                            </div>

                            <!--Modal select hostel-->
                            <div id="hostelModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center z-[1000]">
                                <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
                                    <div class="relative bg-white rounded shadow">
                                        <div class="flex justify-between items-start p-4 rounded-t border-b">
                                            <h3 class="text-xl font-semibold text-gray-900">Chọn nhà trọ</h3>
                                            <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="hostelModal">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                                </svg>
                                            </button>
                                        </div>
                                        <div class="p-6 space-y-6">
                                            <c:forEach items="${sessionScope.hostelList}" var="hostel">
                                                <form action="/sakura/landlord/service" class="inline-block" method="post">
                                                    <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-4 py-2 mx-2 rounded border-2">${hostel.hostelName}</button>
                                                </form>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--End modal select hostel-->
                        </div>
                    </div>
                </c:if>

                <div class="card-container mt-[20px] grid grid-cols-8 gap-[20px]">
                    <div class="card col-span-5 relative bg-[#fff] p-[20px] w-full h-[calc(100vh-275px)] ">
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
                                            <input name="updateFee" type="number" class="w-[90%] text-[15px] px-[3px]" value="${requestScope.eletricService.serviceFee}"/>
                                            <input name="updateUnit" type="hidden" class="text-[15px]" value="kWh"/>
                                        </td>
                                        <td class="py-4 w-[150px]">kWh</td>
                                        <td class="py-4 w-[150px]">
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
                                            <input name="updateFee" type="number" class="w-[90%] text-[15px] px-[3px]" value="${requestScope.waterService.serviceFee}"/>
                                            <input name="updateUnit" type="hidden" class="text-[15px]" value="m3"/>
                                        </td>
                                        <td class="py-4 w-[150px]">
                                            m<sup>3</sup>
                                        </td>
                                        <td class="py-4 w-[150px]">
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
                                            <td class="py-4 w-[150px]">
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
                                <input type="number" required name="addServiceFee" id="service-fee" class="w-[200px] text-[15px] p-[5px]" onkeyup="checkValidFee(this)"/>
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
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
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
                if (!serviceName.value || !serviceFee.value) {
                    if (!serviceName.value) {
                        validServiceMessage.innerHTML = "Tên dịch vụ không được trống!";
                        checkService = false;
                    }
                    if (!serviceFee.value) {
                        validFeeMessage.innerHTML = "Phí dịch vụ không được trống!";
                        checkFee = false;
                    }
                    showToast('error', 'Vui lòng kiểm tra lại thông tin!');
                } else {
                    if (checkService && checkFee) {
                        jQuery.ajax({
                            type: 'POST',
                            data: {'serviceName': serviceName.value,
                                'serviceFee': serviceFee.value,
                                'serviceUnit': serviceUnit.value,
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
                    if (element.value.trim() === "0" || element.value.trim() === "00" || element.value.trim() === "000") {
                        validFeeMessage.innerHTML = '';
                        checkFee = true;
                    } else {
                        let valid = isValid(element.value.trim(), 'money');
                        if (!valid) {
                            validFeeMessage.innerHTML = 'Số tiền không được âm và chia hết cho 1000';
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
                    let valid = isValid(element.value, 'name');
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
                console.log("serviceId: ", serviceId.value);
                console.log("serviceName: ", serviceName.value);
                console.log("serviceFee ", serviceFee.value);
                console.log("serviceUnit ", serviceUnit.value);
                if (!serviceName.value || !serviceFee.value) {
                    let message = "";
                    if (!serviceName.value) {
                        message += "Tên dịch vụ - ";
                    }
                    if (!serviceFee.value) {
                        message += "Phí dịch vụ - ";
                    }
                    message += "không được trống!";
                    //updateMessage.innerHTML = message;
                    showToast('error', message);
                } else {
                    const checkUpdateService = isValid(serviceName.value.trim(), 'name');
                    let checkUpdateFee = true;
                    while (serviceFee.value.trim().charAt(0) === "0" && serviceFee.value.trim().length > 1) {
                        serviceFee.value = serviceFee.value.slice(1);
                    }
                    if (serviceFee.value.trim() === "0") {
                        checkUpdateFee = true;
                    } else
                        checkUpdateFee = isValid(serviceFee.value.trim(), 'money');
                    if (checkUpdateService && checkUpdateFee)
                        jQuery.ajax({
                            type: 'POST',
                            data: {'serviceName': serviceName.value,
                                'serviceFee': serviceFee.value,
                                'serviceUnit': serviceUnit.value,
                                'hostelId': ${sessionScope.currentHostel.hostelID},
                                'serviceType': serviceType.value,
                                'serviceId': serviceId.value
                            },
                            url: '/sakura/service/edit-service',
                            success: function (response) {
                                serviceFee.value = serviceFee.value;
                                const backup = serviceElement.querySelector(".backup");
                                const htmlString = "<button onclick=\"resetService(this, '" + serviceName.value + "', '" + serviceFee.value + "', '" + serviceUnit.value + "')\" type='submit' value='" + serviceId.value + "' class='font-medium text-[#288D87] hover:underline'>Hoàn tác</button>";
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
                    data: {'serviceId': serviceId.value,
                        'hostelId': ${sessionScope.currentHostel.hostelID},
                        'serviceName': serviceName.value,
                        'serviceUnit': serviceUnit.value,
                        'serviceType': serviceType.value
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
        </script>
    </body>
</html>