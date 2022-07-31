<%-- 
    Document   : LContractDetail
    Created on : Jun 23, 2022, 5:06:25 PM
    Author     : Admin
--%>

<%@page import="com.dolphin.hostelmanagement.DTO.Contract"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Chi tiết hợp đồng</title>

        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <link href="../assets/toastr/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/toastr.css"/>
        <link rel="stylesheet" href="../assets/css/datatables.css"/>
        <link rel="stylesheet" href="../assets/css/LContractDetail.css">

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
                                <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
                                </svg>
                                Danh sách hợp đồng nhà trọ ${sessionScope.currentHostel.hostelName}
                            </p>
                        </li>
                        <li aria-current="page">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"> 
                                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                </svg>
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Chi tiết hợp đồng ${requestScope.contract.contractID} - phòng ${requestScope.contract.room.roomNumber}</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->


                <div class="mt-[20px] grid grid-cols-2 gap-[20px]">
                    <div class="card bg-[#fff] p-[20px]">
                        <div class="pb-[20px] flex justify-between items-center">
                            <div class="text-[20px] font-bold text-[#288D87]">
                                Mã hợp đồng: <fmt:formatNumber value = "${requestScope.contract.contractID}" groupingUsed="false" type = "number" minIntegerDigits="5"/>
                            </div>
                            <c:if test = "${requestScope.contract.status == 1}">
                                <form action = "/sakura/contract/replace-contract" method = "post">
                                    <input type ="hidden" name ="contractID" value ="${requestScope.contract.contractID}"/>
                                    <button type = "submit" class="text-[15px] font-semibold text-[#fff] bg-[#17535B] hover:bg-[#13484F] px-[10px] py-[5px] rounded">Thay hợp đồng mới</button>
                                </form>
                            </c:if>
                        </div>
                        <div class="w-full h-fit mx-auto">
                            <div class="grid grid-cols-6 gap-[8px]">
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Ngày tạo</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">
                                        <fmt:formatDate pattern = "dd/MM/yyyy" value="${requestScope.contract.createdDate}" />
                                    </p>
                                </div>
                                <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Thời gian</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">
                                        <fmt:formatDate pattern = "dd/MM/yyyy" value="${requestScope.contract.startDate}" /> - <fmt:formatDate pattern = "dd/MM/yyyy" value="${requestScope.contract.endDate}" />
                                    </p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Người cho thuê</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.landlord.fullname}</p>
                                </div>
                                <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Người thuê</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.tenant.fullname}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Phòng thuê</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.room.roomNumber}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tiền đặt cọc</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.contract.deposit}</span></p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Giá hằng tháng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.contract.rentalFeePerMonth}</span></p>
                                </div>
                                <div class="col-span-4 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Trạng thái</p>
                                    <div class="text-[18px] text-[#2A3C46] font-semibold contractStatus flex items-center">
                                        <c:if test="${requestScope.contract.status == 0}">
                                            Đã kết thúc
                                        </c:if>
                                        <c:if test="${requestScope.contract.status == 1}">
                                            <p class="text-blue-600"> Còn hiệu lực</p>
                                            <button class="inline-block ml-[30px] px-[10px] text-gray-400 hover:text-[#17535B] border border-gray-300 hover:border-[#17535B]" id="endContract-1" type="submit" name="action" value="Save" class="">
                                                Kết thúc hợp đồng này
                                            </button>
                                        </c:if>
                                        <c:if test="${requestScope.contract.status == 2}">
                                            <p class="text-gray-700">Chờ xác nhận</p>
                                        </c:if>
                                        <c:if test="${requestScope.contract.status == 3}">
                                            <p class="text-slate-500">Đã hủy</p>
                                        </c:if>
                                    </div>
                                </div>
                                <c:if test="${requestScope.contract.status == 0}">
                                    <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                        <p class="text-[#929ca5] font-normal">Ngày kết thúc hợp đồng </p>
                                        <p class="text-[18px] text-[#2A3C46] font-semibold">
                                            <fmt:formatDate pattern = "dd/MM/yyyy" value="${requestScope.contract.actualEndDate}" />
                                        </p>
                                    </div>
                                </c:if>
                            </div>
                            <c:if test="${requestScope.contract.description != null}">
                                <div class="mt-[20px]">
                                    <p class="text-[#929ca5] font-normal"><i class="bi bi-info-circle mr-[5px]"></i>Nội dung</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.contract.description}</p>
                                </div>
                            </c:if>

                            <!--<p class="col-span-4 text-right">Đã thỏa thuận</p>-->
                        </div>
                    </div>
                    <div class="card bg-[#fff] p-[20px]">
                        <div class="text-[20px] font-bold text-[#288D87] pb-[20px]">
                            Thống kê chi phí
                        </div>
                        <div class="w-full h-fit mx-auto">
                            <div class="grid grid-cols-6 gap-[8px]">
                                <div class="col-span-6 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tổng tiền nhà</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.contract.rentalFeePerMonth * requestScope.invoiceList.size()}</span><span> (${requestScope.invoiceList.size()} tháng &times; <span class="money">${requestScope.contract.rentalFeePerMonth}</span>)</span></p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Số điện (kWh)</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.startElectrict} - ${requestScope.endElectrict}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Số lượng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.endElectrict - requestScope.startElectrict}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tổng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.totalElectric}</span></p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Số nước (m<sup>3</sup>)</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.startWater} - ${requestScope.endWater}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Số lượng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold">${requestScope.endWater - requestScope.startWater}</p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tổng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.totalWater}</span></p>
                                </div>
                                <div class="col-span-2 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Các dịch vụ khác</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.totalAll - requestScope.totalElectric - requestScope.totalWater - requestScope.contract.rentalFeePerMonth * requestScope.invoiceList.size()}</span></p>
                                </div>
                                <div class="col-span-6 grid grid-rows-2 gap-[1px] mb-[5px]">
                                    <p class="text-[#929ca5] font-normal">Tổng cộng</p>
                                    <p class="text-[18px] text-[#2A3C46] font-semibold"><span class="money">${requestScope.totalAll}</span></p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px] h-[780px]">
                    <div class="text-[20px] font-bold text-[#288D87] pb-[20px]">
                        Danh sách hóa đơn
                    </div>
                    <table id="invoice-table" class="w-full text-[16px] text-left text-gray-600 border-[1px] border-gray-100 relative">
                        <thead class="text-center text-[15px] text-slate-700 uppercase bg-slate-50">
                            <tr>
                                <th scope="col" class="text-center px-6 py-3">Mã hoá đơn</th>
                                <th scope="col" class="text-center px-6 py-3">Tên Phòng</th>
                                <th scope="col" class="text-center px-6 py-3">Kỳ thanh toán</th>
                                <th scope="col" class="text-center px-6 py-3">Tổng tiền (VNĐ)</th>
                                <th scope="col" class="text-center px-6 py-3">Trạng thái</th>
                                <th scope="col" class="text-center px-6 py-3">
                                    <span class="sr-only">Xem chi tiết</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.invoiceList}" var="invoice">
                                <tr class="bg-white border-b hover:bg-gray-50 text-[16px] ">
                                    <th scope="row" class="text-center px-6 py-4 font-medium text-gray-900">${invoice.invoiceID}</th>
                                    <td class="text-center px-6 py-4">${requestScope.contract.room.roomNumber}</td>
                                    <td class="text-center px-6 py-4">${invoice.month}</td>
                                    <td class="text-center px-6 py-4 money">${invoice.totalPrice}</td>
                                    <td class="text-center px-6 py-4">
                                        <c:if test="${invoice.status == 0}">
                                            <p class="bg-red-100 text-red-800 text-[15px] font-medium w-[150px] mx-auto py-[3px] rounded">
                                                Chưa thanh toán
                                            </p>
                                        </c:if>
                                        <c:if test="${invoice.status == 1}">
                                            <p class="bg-green-100 text-emerald-800 text-[15px] font-medium w-[150px] mx-auto py-[3px] rounded">
                                                Đã thanh toán
                                            </p>
                                        </c:if>
                                    </td>
                                    <td class="text-center px-6 py-4 text-center">
                                        <form action="/sakura/invoice/detail" method="post">
                                            <button type="submit" name="invoiceID" value="${invoice.invoiceID}" 
                                                    class="rounded py-[3px] px-[10px] text-[15px] text-[#fff] flex items-center bg-[#278d87] hover:bg-[#1e7570]">
                                                <i class="bi bi-box-arrow-up-right mr-[5px]"></i>Xem chi tiết
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <%@include file="../view/modalLandlordContractDetail.jsp" %>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <script src="../assets/javascript/render-district.js"></script>
        <script src="../assets/toastr/toastr.min.js"></script>
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
        <script>
            $(document).ready(function () {
                $('#invoice-table').DataTable({
                    dom: 'fprtiB',
                    language: {
                        "emptyTable": "Không có dữ liệu!",
                        "zeroRecords": "Không có kết quả phù hợp!",
                        "infoEmpty": "Hiển thị 0 kết quả",
                        "info": "Hiển thị <b>_START_ - _END_</b> của <b>_TOTAL_</b> kết quả",
                        "infoFiltered": "",
                        search: "Tìm kiếm",
                        paginate: {
                            previous: '<i class="bi bi-caret-left-fill"></i>',
                            next: '<i class="bi bi-caret-right-fill"></i>'
                        },
                        aria: {
                            paginate: {
                                previous: 'Trước',
                                next: 'Sau'
                            }
                        }
                    },
                    buttons: [
                        {
                            extend: 'excelHtml5',
                            text: 'Xuất file excel <i class="bi bi-filetype-xlsx text-[20px]"></i>',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            text: 'Xuất file PDF <i class="bi bi-filetype-pdf text-[20px]"></i>',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4]
                            }
                        },
                        {
                            extend: 'print',
                            text: 'In <i class="bi bi-printer text-[20px]"></i>',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4]
                            }
                        }
                    ],

                    "pageLength": 10, // items per page
                    info: true
                });
            });
        </script>
        <script>
            var formatMoney = function (n) {
                var s = '' + (Math.floor(n)), i = s.length, r = '';
                while ((i -= 3) > 0) {
                    r = '.' + s.substr(i, 3) + r;
                }
                return s.substr(0, i + 3) + r + "";
            };
            const moneyElements = document.querySelectorAll('.money');
            moneyElements.forEach(money => {
                const originMoney = money.innerHTML;
                console.log(originMoney);
                money.innerHTML = formatMoney(originMoney);
            });
        </script>

        <script>
            function endContract() {

                const endContractContent = document.querySelector(".endContractContent");
                const endContractId = document.querySelector("input[name='endContractId']");
                const endContractBtn = document.querySelector(".endContractBtn");
                const contractStatus = document.querySelector(".contractStatus");
                console.log(endContractContent);
                console.log(endContractId);
                console.log(endContractBtn);
                console.log(contractStatus);
                jQuery.ajax({
                    type: 'POST',
                    data: {'endContractId': endContractId.value
                    },
                    url: '/sakura/contract/end-contract',
                    success: function (response) {
//                        endContractContent.innerHTML = response;
                        if (response === "Cập nhật thành công")
                            contractStatus.innerHTML = "Trạng thái: Đã kết thúc";
                        showToast("success", "Kết thúc hợp đồng thành công! Đang tải lại trang");
                        toggleModal('.endContractmodal1');
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }
        </script>

        <script>
            var open_modal_1 = document.querySelector('#endContract-1');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('.endContractmodal1');
            });

//            var open_modal_2 = document.querySelector('#endContract-2');
//            open_modal_2.addEventListener('click', function (event) {
//                event.preventDefault();
//                toggleModal('.endContractmodal2');
//            });

            // Bấm ngoài modal thì đóng modal
            // const overlay = document.querySelector('.modal .modal-overlay');
            // overlay.addEventListener('click', toggleModal('.modal'));

            var close_modal_1 = document.querySelectorAll('.endContractmodal1 .endContractmodal1-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
                    toggleModal('.endContractmodal1');
                    console.log('close 1');
                });
            }

            var close_modal_2 = document.querySelectorAll('.endContractmodal2 .endContractmodal2-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_2[i].addEventListener('click', () => {
                    toggleModal('.endContractmodal2');
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
                const modal_1 = document.querySelector('.endContractmodal1');
                const modal_2 = document.querySelector('.endContractmodal2');
                if (isEscape && modal_1.classList.contains('active-modal') && !modal_2.classList.contains('active-modal')) {
                    toggleModal('.endContractmodal1');
                }
                if (isEscape && modal_2.classList.contains('active-modal')) {
                    toggleModal('.endContractmodal2');
                }
            };

            function toggleModal(modal_item) {
                const modal = document.querySelector(modal_item);
                modal.classList.toggle('active-modal');
                modal.classList.toggle('opacity-0');
                modal.classList.toggle('pointer-events-none');
            }

        </script>
    </body>

</html>