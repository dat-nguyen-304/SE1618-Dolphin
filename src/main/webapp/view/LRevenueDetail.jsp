<%-- 
    Document   : LRevenueDetail
    Created on : Jul 11, 2022, 3:26:04 PM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Doanh thu tháng ${requestScope.revenueDate}, nhà trọ ${sessionScope.currentHostel.hostelName}</title>

        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css"/>

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/datetime/1.1.2/js/dataTables.dateTime.min.js"></script>

        <link rel="stylesheet" href="../assets/css/LOverView.css">
        <link rel="stylesheet" href="../assets/css/datatables.css">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />
        
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
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">
                <div class="head-control flex justify-between">
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center">
                                <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                    <path d="M8.433 7.418c.155-.103.346-.196.567-.267v1.698a2.305 2.305 0 01-.567-.267C8.07 8.34 8 8.114 8 8c0-.114.07-.34.433-.582zM11 12.849v-1.698c.22.071.412.164.567.267.364.243.433.468.433.582 0 .114-.07.34-.433.582a2.305 2.305 0 01-.567.267z" />
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-13a1 1 0 10-2 0v.092a4.535 4.535 0 00-1.676.662C6.602 6.234 6 7.009 6 8c0 .99.602 1.765 1.324 2.246.48.32 1.054.545 1.676.662v1.941c-.391-.127-.68-.317-.843-.504a1 1 0 10-1.51 1.31c.562.649 1.413 1.076 2.353 1.253V15a1 1 0 102 0v-.092a4.535 4.535 0 001.676-.662C13.398 13.766 14 12.991 14 12c0-.99-.602-1.765-1.324-2.246A4.535 4.535 0 0011 9.092V7.151c.391.127.68.317.843.504a1 1 0 101.511-1.31c-.563-.649-1.413-1.076-2.354-1.253V5z" clip-rule="evenodd" />
                                    </svg>
                                    Doanh thu nhà trọ ${sessionScope.currentHostel.hostelName}
                                </p>
                            </li>
                            <li aria-current="page">
                                <div class="flex items-center">
                                    <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                    </svg>
                                    <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Tháng ${requestScope.revenueDate}</span>
                                </div>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px] h-[calc(100vh-225px)]">
                    <table id="revenue-list-table" class="w-full text-[16px] text-left text-gray-500 border-[1px] border-gray-100 relative">
                        <thead class="text-center text-[15px] text-gray-700 uppercase bg-gray-100">
                            <tr>
                                <th scope="col" class="text-center px-6 py-3">Phòng</th>
                                <th scope="col" class="text-center px-6 py-3">Tiền nước</th>
                                <th scope="col" class="text-center px-6 py-3">Tiền điện</th>
                                <th scope="col" class="text-center px-6 py-3">Dịch vụ khác</th>
                                <th scope="col" class="text-center px-6 py-3">Tổng doanh thu</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.invoiceList}" var = "invoice" varStatus="ptr">    
                                <c:if test = "${invoice.month eq requestScope.revenueDate}">
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="text-center px-6 py-[5px] font-medium text-gray-900">${invoice.contract.room.roomNumber}</th>
                                        <td class="text-center px-6 py-[5px]"><span class="money">${invoice.waterPrice}</span></td>
                                        <td class="text-center px-6 py-[5px]"><span class="money">${invoice.electricPrice}</span></td>
                                        <td class="text-center px-6 py-[5px]"><span class="money">${invoice.totalPrice - waterPrice - electricPrice}</span></td>
                                        <td class="text-center px-6 py-[5px]"><span class="money">${invoice.totalPrice}</span></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <%@include file="../view/footerDashboard.jsp" %>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            let allMoneyCells = $(".money");
            
            for (let i = 0; i < allMoneyCells.length; i++) {
                let node = allMoneyCells[i];
                let money = node.childNodes[0].nodeValue;
                node.childNodes[0].nodeValue = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }

            $('#revenue-list-table').DataTable({
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
</html>
