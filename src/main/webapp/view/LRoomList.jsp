<%-- 
    Document   : LRoomList
    Created on : Jun 23, 2022, 12:30:58 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ nhà - Danh sách phòng</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <script src="https://cdn.tailwindcss.com"></script>

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <link rel="stylesheet" href="../assets/css/LRoomList.css">
        <link href="../assets/css/navbar-dashboard.css" rel="stylesheet" />
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/toastr.css">
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
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Danh sách phòng</span>
                            </div>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <c:if test="${sessionScope.hostelList == null}">
                    Bạn chưa có nhà trọ nào.
                    <a href="/sakura/landlord/overview">Quay về trang thêm thông tin nhà trọ</a>
                </c:if>
                <!-- General information -->
                <c:if test="${sessionScope.hostelList != null}">
                    <%@include file="../view/modalLandlordRoomList.jsp" %>
                    <div class="flex justify-between mt-[20px]">
                        <div>
                            <span>Chọn nhà trọ: </span>
                            <button class="ml-[10px] inline-block text-white bg-[#17535B] hover:bg-[#13484F] font-medium rounded text-[16px] py-[5px] px-[10px] text-center"
                                    type="button" data-modal-toggle="hostelModal">
                                ${sessionScope.currentHostel.hostelName}
                            </button>
                        </div>
                        <button class="rounded w-fit h-fit px-[10px] py-[5px] bg-[#fff] border border-gray-400 hover:border-[#288D87] flex justify-center items-center group"
                                type="button" data-modal-toggle="addRoom">
                            <p class="addRoom font-normal text-[16px] text-gray-400 group-hover:text-[#288D87]"><i class="bi bi-plus-lg mr-[5px]"></i>Thêm phòng</p>
                        </button>
                    </div>
                    <div class="card bg-[#fff] general-info p-[20px] mt-[20px] h-[calc(100vh-225px)]">
                        <div class="">
                            <table id="room-list-table" class="w-full text-[15px] text-left text-gray-500 border-[1px] border-gray-100">
                                <thead class="text-center text-[16px] text-gray-700 uppercase bg-gray-100">
                                    <tr>
                                        <th scope="col" class="text-center px-6 py-3">Mã phòng</th>
                                        <th scope="col" class="text-center px-6 py-3">Tên phòng</th>
                                        <th scope="col" class="text-center px-6 py-3">Loại phòng</th>
                                        <th scope="col" class="text-center px-6 py-3">Trạng thái</th>
                                        <th scope="col" class="text-center px-6 py-3">Số người hiện tại</th>
                                        <!--<th scope="col" class="text-center px-6 py-3">Hóa đơn gần nhất</th>-->
                                        <th scope="col" class="text-center px-6 py-3"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.roomList}" var="room">
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="text-center px-6 py-4 font-medium text-gray-900">${room.roomID}</th>
                                            <td class="text-center px-6 py-[5px]">${room.roomNumber}</td>
                                            <td class="text-center px-6 py-[5px]">${room.roomType.roomTypeName}</td>
                                            <td class="text-center px-6 py-[5px]">
                                                <c:if test="${room.status == 0}">Còn trống</c:if>
                                                <c:if test="${room.status == 1}">Đã có người ở</c:if>
                                                </td>
                                                <td class="text-center px-6 py-[5px]">
                                                <c:if test="${room.status == 0}">0</c:if>
                                                <c:if test="${room.status == 1 && room.currentNumberOfResidents == 0}">Chưa cập nhật</c:if>
                                                <c:if test="${room.status == 1 && room.currentNumberOfResidents != 0}">${room.currentNumberOfResidents}</c:if>
                                                </td>
                                                <!--                                                <td class="text-center px-6 py-[5px]">
                                                                                                    <span class="bg-green-100 text-green-800 text-[14px] font-medium px-2.5 py-0.5 rounded">Đã thanh toán</span>
                                                                                                    <span class="bg-red-100 text-red-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Quá hạn</span>
                                                                                                    <span class="bg-blue-100 text-blue-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Chưa thanh toán</span>
                                                                                                </td>-->
                                                <td class="text-center px-6 py-[5px] text-right">
                                                    <form action="/sakura/landlord/room-detail">
                                                        <button class="rounded py-[5px] px-[10px] text-[#fff] flex items-center bg-[#278d87] hover:bg-[#1e7570]">
                                                            <input type="hidden" name="roomId" value="${room.roomID}"/>
                                                        <i class="bi bi-box-arrow-up-right mr-[5px]"></i>Xem chi tiết
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>
            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script>
            function showToast(type, msg) {
                toastr.options.positionClass = 'toast-bottom-right';
                toastr.options.extendedTimeOut = 0; //1000;
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
        <c:if test="${requestScope.addSuccess != null}">
            <script>
                showToast('success', '${requestScope.addSuccess}');
            </script>
        </c:if>
        <c:if test="${requestScope.addFail != null}">
            <script>
                showToast('error', '${requestScope.addFail}');
            </script>
        </c:if>
        <script>
            function checkValidRoom(element) {
                const hostelId = document.querySelector("input[name='hostelId']");
                const validRoomMessage = document.querySelector(".validRoomMessage");
                const addRoomElement = document.querySelector(".addRoom");
                console.log("hostelID: ", hostelId.value);
                console.log("number: ", element.value);
                console.log("addRoomElement: ", addRoomElement);
                let fault = false;
                for (let i = 0; i < element.value.length; i++) {
                    let c = element.value.charAt(i);
                    if (!((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || c == '-' || c == ' ' || c == '.')) {
                        fault = true;
                        validRoomMessage.innerHTML = 'Tên loại phòng chỉ được chứa chữ cái, chữ số, khoảng trắng "." và "-"';
                        addRoomElement.onclick = (e) => {
                            e.preventDefault();
                        };
                        break;
                    }
                }
                if (!fault)
                    jQuery.ajax({
                        type: 'POST',
                        data: {'roomNumber': element.value,
                            'hostelId': hostelId.value
                        },
                        url: '/sakura/room/check-room-valid',
                        success: function (response) {
                            console.log("response: ", response);
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

            $(document).ready(function () {
                $('#room-list-table').DataTable({
                    dom: 'Bfrtip',
                    
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
                        }
                    ],

                    "pageLength": 10, // items per page
                    info: true
                });
            });
        </script>
    </body>

</html>
