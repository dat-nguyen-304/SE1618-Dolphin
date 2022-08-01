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
        <title>Trang người thuê - Danh sách hợp đồng</title>

        <%@include file="../view/assets.jsp" %>

        <link href="../assets/css/LContractList.css" rel="stylesheet">
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
        <script src="../assets/pacejs/pace.min.js" type="text/javascript"></script>
        <link href="../assets/pacejs/pace-theme-default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/pacejs/flash.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>

        <c:if test="${sessionScope.currentUser == null}">
            <p>Bạn phải đăng nhập để xem trang này</p>
        </c:if>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] h-[calc(100vh-80px)]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
                                </svg>
                                Danh sách hợp đồng trọ của ${sessionScope.currentUser.fullname}
                            </p>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->
                <c:if test="${empty sessionScope.currentContract}">
                    <p class="text-gray-300 text-[25px] font-bold absolute top-1/2 left-1/2 translate-x-[-30%] translate-y-[-50%]">Hiện tại bạn không có hợp đồng thuê nhà trọ.</p>
                </c:if>
                <c:if test="${not empty sessionScope.currentContract}">
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
                                    <th scope="col" class="text-center px-6 py-3">
                                        <span class="sr-only">Xem chi tiết</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.contractList}" var="contract">
                                    <tr class="text-[16px] bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="text-center px-6 py-[5px] font-medium text-gray-900">
                                            <fmt:formatNumber type = "number" groupingUsed="false" minIntegerDigits = "5" value = "${contract.contractID}" />
                                        </th>
                                        <td class="text-left px-6 py-[5px]">${contract.tenant.fullname}</td>
                                        <td class="text-center px-6 py-[5px]">${contract.room.roomNumber}</td>
                                        <td class="text-center px-6 py-[5px]"><span class="date">${contract.startDate}</span></td>
                                        <td class="text-center px-6 py-[5px]"><span class="date">${contract.endDate}</span></td>
                                        <td class="text-center px-6 py-[5px]">
                                            <c:if test="${contract.status == 0}">
                                                <p class="bg-slate-100 text-slate-800 font-semibold w-[120px] mx-auto py-[3px] rounded">
                                                    Đã kết thúc
                                                </p>
                                            </c:if>
                                            <c:if test="${contract.status == 1}">
                                                <p class="bg-emerald-100 text-emerald-600 font-semibold w-[120px] mx-auto py-[3px] rounded">
                                                    Còn hiệu lực
                                                </p>
                                            </c:if>
                                            <c:if test="${contract.status == 2}">
                                                <span class="bg-green-100 text-green-900 text-[14px] font-medium px-2.5 py-0.5 rounded">
                                                    Đang chờ
                                                </span>
                                            </c:if>
                                            <c:if test="${contract.status == 3}">
                                                <span class="bg-gray-100 text-green-900 text-[14px] font-medium px-2.5 py-0.5 rounded">
                                                    Đã hủy
                                                </span>
                                            </c:if>
                                        </td>
                                        <td class="text-center px-6 py-4 text-center">
                                            <form action="/sakura/tenant/contract-detail">
                                                <button name="contractID" value="${contract.contractID}" class="rounded py-[3px] px-[10px] text-[15px] text-[#fff] flex items-center bg-[#278d87] hover:bg-[#1e7570]">
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
                for (let i = 0; i < allDateCells.length; i++) {
                    let node = allDateCells[i];
                    let isoDate = node.childNodes[0].nodeValue;
                    node.childNodes[0].nodeValue = isoDate.split('-').reverse().join('/');
                }
                $('#contract-table').DataTable({
                    order: [[0, 'desc']],
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