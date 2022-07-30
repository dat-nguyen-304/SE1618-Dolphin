<%-- 
    Document   : LContractList
    Created on : Jun 23, 2022, 5:05:38 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Danh sách hợp đồng</title>

        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/LContractList.css">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />

        <link rel="stylesheet" type="text/css" href="../assets/datatables/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="../assets/datatables/buttons.dataTables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <link rel="stylesheet" href="../assets/css/datatables.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">

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
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] ${requestScope.contractList.size() <= 8 ? 'h-[calc(100vh-80px)]' : ''}">
                <div class="head-control flex justify-between">
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
                        </ol>
                    </nav>
                    <%@include file="../view/modalLandlordContractList.jsp" %>
                    <div class="general-info flex items-center">
                        <div class="">
                            <span>Nhà trọ: </span>
                            <button class="ml-[10px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-[15px] px-[10px] py-[5px] text-center" type="button" data-modal-toggle="hostelModal">
                                ${sessionScope.currentHostel.hostelName}
                            </button>
                        </div>
                    </div>
                </div>
                <!-- End breadcrumb -->
                <c:if test="${sessionScope.hostelList == null}">
                    Bạn chưa có nhà trọ nào.
                    <a href="/sakura/landlord/overview">Quay về trang thêm thông tin nhà trọ</a>
                </c:if>
                <!-- General information -->
                <c:if test="${sessionScope.hostelList != null}">

                    <div class="card bg-[#fff] p-[20px] mt-[20px] h-[calc(100vh-225px)]">
                        <table id="contract-table" class="w-full text-[15px] text-left text-gray-600 border-[1px] border-gray-100 relative">
                            <thead class="text-center text-[16px] text-slate-700 uppercase bg-slate-50">
                                <tr>
                                    <th scope="col" class="text-center px-6 py-3">Mã hợp đồng</th>
                                    <th scope="col" class="text-center px-6 py-3">Người thuê</th>
                                    <th scope="col" class="text-center px-6 py-3">Phòng</th>
                                    <th scope="col" class="text-center px-6 py-3">Từ ngày</th>
                                    <th scope="col" class="text-center px-6 py-3">Đến ngày</th>
                                    <th scope="col" class="text-center px-6 py-3">Trạng thái</th>
                                    <th scope="col" class="text-center px-6 py-3 text-[#288D87]">
                                        <span class="sr-only">Xem chi tiết</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.contractList}" var="contract">
                                    <tr class="text-[15px] bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="text-center px-6 py-4 font-medium text-gray-900">
                                            <fmt:formatNumber type = "number" groupingUsed="false" minIntegerDigits = "5" value = "${contract.contractID}" />
                                        </th>
                                        <td class="text-left px-6 py-[5px]">${contract.tenant.fullname}</td>
                                        <td class="text-center px-6 py-[5px]">${contract.room.roomNumber}</td>
                                        <td class="text-center px-6 py-[5px]"><span class="date">${contract.startDate}</span></td>
                                        <td class="text-center px-6 py-[5px]"><span class="date">${contract.endDate}</span></td>
                                        <td class="text-center px-6 py-[5px]">
                                            <c:if test="${contract.status == 0}">
                                                <p class="bg-slate-100 text-slate-500 font-semibold w-[150px] mx-auto py-[5px] text-center rounded">
                                                    Đã kết thúc
                                                </p>
                                            </c:if>
                                            <c:if test="${contract.status == 1}">
                                                <p class="bg-sky-100 text-sky-700 font-semibold w-[150px] mx-auto py-[5px] text-center rounded">
                                                    Còn hiệu lực
                                                </p>
                                            </c:if>
                                            <c:if test="${contract.status == 2}">
                                                <p class="bg-emerald-100 text-emerald-600 font-semibold w-[150px] mx-auto py-[5px] text-center rounded">
                                                    Đang chờ
                                                </p>
                                            </c:if>
                                            <c:if test="${contract.status == 3}">
                                                <p class="bg-rose-100 text-rose-500 font-semibold w-[150px] mx-auto py-[5px] text-center rounded">
                                                    Đã hủy
                                                </p>
                                            </c:if>
                                        </td>
                                        <td class="text-center px-6 py-[5px]">
                                            <form action="/sakura/landlord/contract-detail" method="post">
                                                <button name="contractID" value="${contract.contractID}"
                                                        class="rounded py-[3px] px-[10px] text-[#fff] flex items-center bg-[#278d87] hover:bg-[#1e7570]">
                                                    <i class="bi bi-box-arrow-up-right mr-[5px]"></i>Xem chi tiết
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>
        <script>
            $(document).ready(function () {
                let allDateCells = $(".date");
                let allMoneyCells = $(".money");

                for (let i = 0; i < allDateCells.length; i++) {
                    let node = allDateCells[i];
                    let isoDate = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = isoDate.split('-').reverse().join(' / ');
                }

                for (let i = 0; i < allMoneyCells.length; i++) {
                    let node = allMoneyCells[i];
                    let money = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                }
            });
        </script>
        <script>
            function searchRoomOnModal() {
                const hostelId = ${sessionScope.currentHostel.hostelID};
                const keyword = document.querySelector('input[name="searchRoom"]').value;
                jQuery.ajax({
                    type: 'POST',
                    data: {'hostelId': hostelId,
                        'keyword': keyword
                    },
                    url: '/sakura/room/search-room-on-modal',
                    success: function (response) {
                        const roomListModal = document.querySelector(".room-list-modal");
                        roomListModal.innerHTML = response;
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }
        </script>
        <script>
            $(document).ready(function () {
                $('#contract-table').DataTable({
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
    </body>

</html>