<%-- 
    Document   : tenantPageInvoiceDetail
    Created on : Jun 21, 2022, 8:39:08 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang người thuê - Chi tiết hoá đơn</title>

        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/tenant-page-invoice-detail.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">

    </head>
    <body>
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] ${requestScope.detailList.size() lt 8 ? 'h-[calc(100vh-80px)]' : ''} ">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <a href="/sakura/invoice/list" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                                <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd" />
                                </svg>
                                Hoá đơn
                            </a>
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

                <!-- table invoice list -->
                <div class="mt-[20px] w-full grid grid-cols-12 gap-[20px]">
                    <!--Right-->
                    <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full col-span-9">
                        <div class="text-[20px] font-bold text-[#288D87] mb-[20px] flex justify-between items-center">
                            <p>Chi tiết hoá đơn</p>
                        </div>
                        <form class="w-full flex justify-between items-center">
                            <input hidden type=text" name=tenantID" value="101" />
                            <input hidden type="text" name=roomID" value="101" />
                        </form>
                        <table id="invoice-detail" class="w-full text-[16px] text-left text-gray-500 mb-[20px]">
                            <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-center">Mô tả</th>
                                    <th scope="col" class="px-6 py-3 text-center">Đơn vị tính</th>
                                    <th scope="col" class="px-6 py-3 text-center">Giá trị đầu</th>
                                    <th scope="col" class="px-6 py-3 text-center">Giá trị cuối</th>
                                    <th scope="col" class="px-6 py-3 text-center">Số lượng</th>
                                    <th scope="col" class="px-6 py-3 text-center">Đơn giá (VNĐ)</th>
                                    <th scope="col" class="px-6 py-3 text-center">Thành tiền (VNĐ)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="detail" items="${requestScope.detailList}">
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">${detail.service.serviceName}</th>
                                        <td class="px-6 py-4 text-center">${detail.service.unit}</td>
                                        <td class="px-6 py-4 text-right">${(detail.service.type != 0) ? detail.startValue : ""}</td>
                                        <td class="px-6 py-4 text-right">${(detail.service.type != 0) ? detail.endValue : ""}</td>
                                        <td class="px-6 py-4 text-right">${detail.quantity}</td>
                                        <td class="px-6 py-4 money text-right">${detail.service.serviceFee}</td>
                                        <td class="px-6 py-4 money rowSum text-right">${(detail.quantity) * detail.service.serviceFee}</td>
                                    </tr>
                                </c:forEach>
                                <tr class="border-b hover:bg-gray-50">
                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">Phí thuê phòng</th>
                                    <td class="px-6 py-4 text-center">phòng</td>
                                    <td class="px-6 py-4"></td>
                                    <td class="px-6 py-4"></td>
                                    <td class="px-6 py-4"></td>
                                    <td class="px-6 py-4 money text-right">${invoice.contract.rentalFeePerMonth}</td>
                                    <td class="px-6 py-4 money rowSum text-right">${invoice.contract.rentalFeePerMonth}</td>
                                </tr>
                                <tr class="bg-white border-b">
                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap"></th>
                                    <td class="px-6 py-4"></td>
                                    <td class="px-6 py-4"></td>
                                    <td class="px-6 py-4"></td>
                                    <td class="px-6 py-4"></td>
                                    <td class="px-6 py-4 text-[18px] text-[#17535B] font-medium text-right">
                                        Tổng tiền
                                    </td>
                                    <td class="px-6 py-4 text-[17px] text-[#17535B] font-bold text-right">
                                        <span id="invoiceSum" class="money"></span>
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                        <!-- Pagination + Export excel -->
                        <div class="table-extend flex justify-between">

                            <!-- Summation -->
                            <div class="summary grid grid-cols-5 grid-rows-2 w-[50%]">
                                <p class="col-span-1 text-[20px] text-slate-700">Thành tiền</p>
                                <p class="col-span-4 text-[20px] text-slate-600 font-bold"><span id="bottomSum" class="money"></span></p>
                                <p class="col-span-1 text-[15px] text-slate-600">Bằng chữ</p>
                                <p class="col-span-4 text-slate-400" id="total-price"><em>${totalPrice}</em></p>
                            </div>
                            <!-- End Summation -->

                            <!-- Export excel button -->
                            <a class="cursor-pointer text-[16px] py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-gray-900 flex items-center justify-center focus:outline-none bg-white rounded border border-gray-200 hover:bg-gray-100 hover:text-[#288D87] focus:z-10 group">
                                Xuất file pdf <i class="bi bi-filetype-pdf ml-[5px]"></i>
                            </a>
                        </div>
                        <!-- End Pagination + Export excel -->

                    </div>

                    <div class="card bg-[#fff] p-5 col-span-3">
                        <div class="text-[20px] font-bold text-[#288D87] mb-[20px] flex justify-between items-center">
                            <p>Thông tin hoá đơn</p>
                        </div>
                        <div class="grid grid-cols-6 gap-[8px]">
                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Mã hoá đơn</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    <fmt:formatNumber value="${invoice.invoiceID}" groupingUsed="false" minIntegerDigits="5"/>
                                </p>
                            </div>
                            <div class="col-span-4 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Người thuê</p>
                                <p class="text-[18px] text-slate-700 font-bold">${invoice.contract.tenant.fullname}</p>
                            </div>

                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Mã hợp đồng</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    <fmt:formatNumber value="${invoice.contract.contractID}" groupingUsed="false" minIntegerDigits="5"/>
                                </p>
                            </div>
                            <div class="col-span-4 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Chủ nhà</p>
                                <p class="text-[18px] text-slate-700 font-bold">${invoice.contract.landlord.fullname}</p>
                            </div>

                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Từ</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    <span class="date">${invoice.startDate}</span>
                                </p>
                            </div>
                            <div class="col-span-4 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Đến</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    <span class="date">${invoice.endDate}</span>
                                </p>
                            </div>

                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Kỳ thanh toán</p>
                                <p class="text-[18px] text-slate-700 font-bold">${invoice.month}</p>
                            </div>
                            <div class="col-span-4 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Ngày xuất hoá đơn</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    <span class="date">${invoice.createdDate}</span>
                                </p>
                            </div>

                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Phòng</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    ${invoice.contract.room.roomNumber}
                                </p>
                            </div>
                            <div class="col-span-4 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Trạng thái</p>
                                <c:if test="${invoice.status == 0}">
                                    <p class="text-[18px] bg-rose-100 text-rose-700 w-[150px] text-center font-semibold rounded">
                                        Chưa thanh toán
                                    </p>
                                </c:if>
                                <c:if test="${invoice.status != 0}">
                                    <p class="text-[18px] bg-emerald-100 text-emerald-700 w-[150px] text-center font-semibold rounded">
                                        Đã thanh toán
                                    </p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End table invoice list -->
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>

        <script>
            $(document).ready(function () {
                let allDateCells = $(".date");
                let allMoneyCells = $(".money");
                let allRowSum = $(".rowSum");
                let sum = 0;
                for (let i = 0; i < allRowSum.length; i++) {
                    let node = allRowSum[i];
                    sum += parseInt(node.childNodes[0].nodeValue);
                }
                $("#invoiceSum").html(sum);
                $("#bottomSum").html(sum + " đồng");


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
    </body>
</html>
