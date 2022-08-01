<%--
    Document   : LAddInvoiceDetail
    Created on : Jun 26, 2022, 4:53:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Chi tiết hoá đơn</title>

        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/LInvoiceDetail.css">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
        
        <script src="../assets/pacejs/pace.min.js" type="text/javascript"></script>
        <link href="../assets/pacejs/pace-theme-default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/pacejs/flash.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] ${requestScope.detailList.size() < 6 ? 'h-[calc(100vh-80px)]' : ''}">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z"/>
                                <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd"/>
                                </svg>
                                Hoá đơn
                            </p>
                        </li>
                        <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Chi tiết hoá đơn</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->
                <form action="/sakura/invoice/edit" id="invoice-form" method="post">
                    <input type="hidden" value="${invoice.invoiceID}" name="invoiceID">
                    <div id="pdfPrint">
                        <div class="card bg-[#fff] p-5 mt-[20px]">
                            <div class="grid grid-cols-5 grid-rows-2 ">
                                <div>Mã hoá đơn: ${invoice.invoiceID}</div>
                                <div>Người thuê: ${invoice.contract.tenant.fullname}</div>
                                <div>Mã hợp đồng: ${invoice.contract.contractID}</div>
                                <div>Kỳ thanh toán: ${invoice.month}</div>
                                <div>Ngày xuất hoá đơn: <span class="date">${invoice.createdDate}</span></div>

                                <div>Trạng thái:
                                    <c:choose>
                                        <c:when test="${invoice.status == 0}">
                                            <select name="newStatus" id="status" class="w-[50%]">
                                                <option value="0" ${invoice.status == 0 ? 'selected' : ''}>
                                                    Chưa thanh toán
                                                </option>
                                                <option value="1" id="paid" ${invoice.status == 1 ? 'selected' : ''}>
                                                    Đã thanh toán
                                                </option>
                                            </select>
                                        </c:when>
                                        <c:otherwise>
                                            <span id="status">${(invoice.status == 1) ? "Đã thanh toán" : "Quá hạn"}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div>Phòng: ${invoice.contract.room.roomNumber}</div>
                                <c:choose>
                                    <c:when test="${invoice.status == 0}">
                                        <div date-rangepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom"
                                             class="invoice-time-range col-span-2 grid grid-cols-2">
                                            <div class="start-date flex items-center grid grid-cols-6">
                                                <label for="start"
                                                       class="col-span-2 text-[15px] text-gray-900 font-normal flex items-center">Ngày
                                                    bắt đầu</label>
                                                <input type="text" id="start" name="startDate" value="${invoice.startDate}"
                                                       class="col-span-3 bg-[#fff] border border-gray-300 text-gray-900 rounded p-[5px] text-[15px]"
                                                       placeholder="Chọn ngày...">
                                            </div>

                                            <div class="end-date flex items-center grid grid-cols-6">
                                                <label for="end"
                                                       class="col-span-2 text-[15px] text-gray-900 font-normal flex items-center">Ngày
                                                    kết thúc</label>
                                                <input type="text" id="end" name="endDate" value="${invoice.endDate}"
                                                       class="col-span-3 bg-[#fff] border border-gray-300 text-gray-900 rounded p-[5px] text-[15px]"
                                                       placeholder="Chọn ngày...">
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div>Từ: <span class="date">${invoice.startDate}</span></div>
                                        <div>Đến: <span class="date">${invoice.endDate}</span></div>
                                        </c:otherwise>
                                    </c:choose>
                            </div>
                        </div>
                        <div class="statistic flex justify-between mt-[20px] w-full">
                            <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                                <table id = "invoice-detail-table" class="w-full text-[16px] text-left text-gray-500 mb-[20px]">
                                    <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                        <tr>
                                            <th scope="col" class="text-center px-6 py-3">Mô tả</th>
                                            <th scope="col" class="text-center px-6 py-3">Đơn vị tính</th>
                                            <th scope="col" class="text-center px-6 py-3">Giá trị đầu</th>
                                            <th scope="col" class="text-center px-6 py-3">Giá trị cuối</th>
                                            <th scope="col" class="text-center px-6 py-3">Số lượng</th>
                                            <th scope="col" class="text-center px-6 py-3">Đơn giá (VNĐ)</th>
                                            <th scope="col" class="text-center px-6 py-3">Thành tiền (VNĐ)</th>
                                            <th scope="col" class="text-center px-6 py-3">
                                                <span class="sr-only">Edit</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.detailList}" var="detail">
                                            <tr class="bg-white border-b hover:bg-gray-50">
                                                <th scope="row" class="px-6 py-3 font-medium text-gray-900 whitespace-nowrap">${detail.service.serviceName}</th>
                                                <td class="px-6 py-3 text-center">${detail.service.unit}</td>

                                                <!--start value-->
                                                <td class="px-6 py-3 text-right">
                                                    <c:if test="${detail.service.type == 1 || detail.service.type == 2}">
                                                        <c:choose>
                                                            <c:when test="${invoice.status == 0}">
                                                                <input type="number" name="startInput${detail.service.serviceID}"
                                                                       oninput="validity.valid||(value='');" min="0" class="text-right"
                                                                       placeholder="${detail.startValue}" value="${detail.startValue}"
                                                                       id="startInput${detail.service.serviceID}"
                                                                       onchange="updateSum(${detail.service.serviceID}, ${detail.service.type}, this)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>${detail.startValue}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </td>

                                                <!--end value-->
                                                <td scope="col" class="px-6 py-3 text-right">
                                                    <c:if test="${detail.service.type == 1 || detail.service.type == 2}">
                                                        <c:choose>
                                                            <c:when test="${invoice.status == 0}">
                                                                <input type="number" name="endInput${detail.service.serviceID}"
                                                                       oninput="validity.valid||(value='');" min="0" class="text-right"
                                                                       placeholder="${detail.endValue}"
                                                                       value="${detail.endValue}" id="endInput${detail.service.serviceID}"
                                                                       onchange="updateSum(${detail.service.serviceID}, ${detail.service.type}, this)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>${detail.endValue}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </td>

                                                <!--quantity-->
                                                <td scope="col" class="px-6 py-3 text-right">
                                                    <c:choose>
                                                        <c:when test="${detail.service.type == 1 || detail.service.type == 2}">
                                                            <span id="quantity${detail.service.serviceID}">${detail.quantity}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${invoice.status == 0}">
                                                                    <input type="number" name="quantity${detail.service.serviceID}"
                                                                           oninput="validity.valid||(value='');" min="0" class="text-right"
                                                                           id="quantity${detail.service.serviceID}" placeholder="${detail.quantity}"
                                                                           value="${detail.quantity}"
                                                                           onchange="updateSum(${detail.service.serviceID}, ${detail.service.type}, this)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span>${detail.endValue}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>

                                                <td scope="col" class="px-6 py-3 text-right">
                                                    <span id="serviceFee${detail.service.serviceID}" class="money">${detail.service.serviceFee}</span>
                                                </td>
                                                <td scope="col" class="px-6 py-3 text-right">
                                                    <span class="rowSum money" id="rowSum${detail.service.serviceID}">${detail.quantity * detail.service.serviceFee}</span>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="px-6 py-3 font-medium text-gray-900 whitespace-nowrap">
                                                <span>Tiền phòng</span>
                                            </th>
                                            <td class="px-6 py-3"></td>
                                            <td class="px-6 py-3"></td>
                                            <td class="px-6 py-3"></td>
                                            <td class="px-6 py-3"></td>
                                            <td class="px-6 py-3 text-right money" id="rentalRate">
                                                ${invoice.contract.rentalFeePerMonth}
                                            </td>
                                            <td class="px-6 py-3 text-right">
                                                <span id="rentalFee" class="money rowSum">${invoice.contract.rentalFeePerMonth}</span>
                                            </td>
                                        </tr>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="px-6 py-3 font-medium text-gray-900 whitespace-nowrap"></th>
                                            <td class="px-6 py-3"></td>
                                            <td class="px-6 py-3"></td>
                                            <td class="px-6 py-3"></td>
                                            <td class="px-6 py-3"></td>
                                            <td class="px-6 py-3 text-right text-[18px] text-[#17535B] font-medium">
                                                Tổng tiền
                                            </td>
                                            <td class="px-6 py-3 text-right text-[18px] text-[#17535B] font-bold">
                                                <span id="invoiceSum" class="money"></span>
                                                <input id="invoiceSumHidden" type="hidden" name="invoiceSum">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <div class="table-extend w-full flex justify-between items-center">
                                    <div class="summary grid grid-cols-5 w-[50%]">
                                        <div class="col-span-1 text-[20px] text-slate-700">Thành tiền</div>
                                        <div class="col-span-4 text-[20px] text-slate-600 font-bold">
                                            <span id="bottomSum" class="money"></span>
                                        </div>
                                    </div>
                                    <div class="flex items-center ">
                                        <c:if test="${invoice.status == 0}">
                                            <button type="button" id="saveButton" class="py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-[#fff] flex items-center justify-center focus:outline-none bg-[#288D87] rounded hover:bg-[#1D837D]">
                                                Lưu thay đổi
                                            </button>
                                        </c:if>
                                        <button id="pdf-btn" type="button" class="py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-gray-900 flex items-center justify-center focus:outline-none bg-white rounded border border-gray-200 hover:bg-gray-100 hover:text-[#288D87] focus:z-10 group">
                                            Xuất file pdf
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- End table invoice list -->
                </form>

            </div>

            <div>
                <div id="changeStatus" tabindex="-1"
                     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center z-[1000]">
                    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
                        <div class="relative bg-white rounded shadow">
                            <button type="button" data-modal-toggle="changeStatus" id="toggleButton"
                                    class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center">
                                <svg class="w-5 3h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                </svg>
                            </button>
                            <div class="p-6 text-center">
                                <svg class="mx-auto mb-4 w-14 h-14 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> 
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                                <h3 class="mb-5 text-lg font-normal text-gray-500">
                                    <p>Bạn đang thay đổi trạng thái hóa đơn thành "ĐÃ THANH TOÁN".<br><br>
                                        Nếu lưu trạng thái này bạn sẽ không thể thay đổi hóa đơn nữa.<br>
                                        Bạn có chắc chắn về thay đổi này?</p>
                                </h3>
                                <button id="confirmStatus" data-modal-toggle="changeStatus" type="button"
                                        class="text-white bg-emerald-600 hover:bg-emerald-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                                    Tôi chắc chắn
                                </button>
                                <button id="cancelStatus" data-modal-toggle="changeStatus" type="button"
                                        class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">
                                    Hủy bỏ
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="saveInvoice" tabindex="-1"
                     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center z-[1000]">
                    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
                        <div class="relative bg-white rounded shadow">
                            <button type="button" data-modal-toggle="saveInvoice" id="toggleButtonSave"
                                    class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center">
                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                </svg>
                            </button>
                            <div class="p-6 text-center">
                                <svg class="mx-auto mb-4 w-14 h-14 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                                <h3 class="mb-5 text-lg font-normal text-gray-500">
                                    <p>Bạn có chắc chắn lưu lại hóa đơn?</p>
                                </h3>
                                <button id="confirmSave" data-modal-toggle="saveInvoice" type="button"
                                        class="text-white bg-emerald-600 hover:bg-emerald-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                                    Tôi chắc chắn
                                </button>
                                <button data-modal-toggle="saveInvoice" type="button"
                                        class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">
                                    Hủy bỏ
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>

        <script>x = 1;</script>
        <script>
            let status = $("#status");
            const invoiceStatus = status.val();

            $(document).ready(function () {
                let allDateCells = $(".date");
                let allMoneyCells = $(".money");
                let allRowSum = $(".rowSum");
                let start = $("#start");
                let end = $("#end");
                if ($("#status").prop("tagName") === "SELECT") {
                    start.val(start.val().split('-').reverse().join('/'));
                    end.val(end.val().split('-').reverse().join('/'));
                }
                let sum = 0;

                for (let i = 0; i < allRowSum.length; i++) {
                    let node = allRowSum[i];
                    sum += parseInt(node.childNodes[0].nodeValue);
                }
                $("#invoiceSumHidden").val(sum);
                $("#invoiceSum").html(sum);
                $("#bottomSum").html(sum + " đồng");

                for (let i = 0; i < allDateCells.length; i++) {
                    let node = allDateCells[i];
                    let isoDate = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = isoDate.split('-').reverse().join('/');
                }

                for (let i = 0; i < allMoneyCells.length; i++) {
                    let node = allMoneyCells[i];
                    let money = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                }
            });

            function toggleRental() {
                console.log($("#rentalFee").html());
                if ($("#checkRental").is(":checked")) {
                    $("#rentalFee").html($("#rentalRate").html());
                    updateSum(0, 0, null);
                } else {
                    $("#rentalFee").html("0");
                    updateSum(0, 0, null);
                }
            }

            function updateSum(serviceID, type, element) {
                let rowSum = $("#rowSum" + serviceID);
                rowSum.html("");
                let sum;
                if (type === 1 || type === 2) {
                    if ($(element).val() === "") {
                        $(element).val(0);
                    }

                    let startInput = $("#startInput" + serviceID);
                    let endInput = $("#endInput" + serviceID);
                    if ($(element).attr('id').indexOf('startInput') >= 0) {
                        if (parseInt(startInput.val()) > parseInt(endInput.val())) {
                            endInput.val(startInput.val());
                        }
                    }
                    if ($(element).attr('id').indexOf('endInput') >= 0) {
                        if (parseInt(startInput.val()) > parseInt(endInput.val())) {
                            startInput.val(endInput.val());
                        }
                    }
                    sum = parseInt(endInput.val()) - parseInt(startInput.val());
                    $("#quantity" + serviceID).html(sum);
                } else {
                    if ($(element).val() === "") {
                        $(element).val(0);
                        sum = 0;
                    } else
                        sum = $("#quantity" + serviceID).val()
                }
                if (serviceID !== 0) {
                    sum = parseInt($("#serviceFee" + serviceID).html().replace(/,/g, '')) * parseInt(sum);
                    rowSum.html(parseInt(sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                }

                let allRowSum = $(".rowSum");
                let sumService = 0;
                for (let i = 0; i < allRowSum.length; i++) {
                    let node = allRowSum[i];
                    sumService += parseInt($(node).html().replace(/,/g, ''));
                }

                $("#invoiceSum").html(sumService.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#invoiceSumHidden").val(sumService);

                $("#bottomSum").html(sumService.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            }

            status.change(function () {
                if (parseInt(status.val()) === 1) {
                    console.log("Đã thanh toán");
                    $("#toggleButton").click();
                }
            });

            $("#cancelStatus").click(function () {
                status.val(invoiceStatus);
            });

            $("#saveButton").click(function () {
                $("#toggleButtonSave").click();
            });

            $("#confirmSave").click(function () {
                console.log("SUBMIT");
                $("#invoice-form").submit();
            });
        </script>

        <script>
            $("#pdf-btn").on("click", function () {
//                console.log("Hellos");
                var divContents = $("#pdfPrint").html();
                var printWindow = window.open('', '', 'height=400,width=800');
                printWindow.document.write('<html><head><title>Html to PDF</title>');
                printWindow.document.write('</head><body >');
                printWindow.document.write(divContents);
                printWindow.document.write('</body></html>');
                printWindow.document.close();
                printWindow.print();
            });
        </script>
    </script>

</body>
</html>

