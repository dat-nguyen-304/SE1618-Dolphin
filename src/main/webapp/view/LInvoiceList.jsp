<%-- 
    Document   : LInvoiceList
    Created on : Jun 26, 2022, 4:51:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý phòng thuê - Danh sách hoá đơn</title>

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
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../assets/css/LContractList.css">

    <!-- icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</head>

<body>
    <%@include file="../view/LControllBar.jsp" %>

    <!-- MAIN CONTENT CONTAINER-->
    <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

        <!-- CONTENT -->
        <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

            <!-- Breadcrumb -->
            <!-- <div class="bc-container">
                <div class="bc"><a href="#">Quản lý phòng thuê </a></div>
            </div> -->
            <nav class="flex" aria-label="Breadcrumb">
                <ol class="inline-flex items-center space-x-1 md:space-x-3">
                    <li class="inline-flex items-center">
                        <a href="#"
                            class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                            <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20"
                                fill="currentColor">
                                <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                                <path fill-rule="evenodd"
                                    d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z"
                                    clip-rule="evenodd" />
                            </svg>
                            Hoá đơn
                        </a>
                    </li>
                    <li aria-current="page">
                        <div class="flex items-center">
                            <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                    clip-rule="evenodd"></path>
                            </svg>
                            <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Danh sách
                                hoá đơn</span>
                        </div>
                    </li>
                </ol>
            </nav>
            <!-- End breadcrumb -->

            <!-- Search and filter -->
            <div class="general-info flex justify-between mt-[20px]">
                <form class="w-full flex justify-between items-center">
                    <input hidden type=text" name=tenantID" value="101" />
                    <input hidden type="text" name=roomID" value="101" />

                    <!-- View current room only -->
                    <!-- <div class="flex items-center mb-4">
                        <input id="default-checkbox" type="checkbox" value=""
                            class="w-5 h-5 text-[#17535B] bg-gray-100 rounded focus:ring-0 outline-offset-0 focus:ring-opacity-0 border-gray-300">
                        <label for="default-checkbox" class="ml-2 text-sm font-medium text-gray-900">Phòng hiện
                            tại</label>
                    </div> -->


                    <div class="left-part">
                        <!-- Search invoice by id -->
                        <label for="default-search"
                            class="mb-2 text-[14px] font-[14px] text-gray-900 sr-only">Search</label>
                        <div class="relative h-full">
                            <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                <svg class="w-5 h-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                </svg>
                            </div>
                            <input type="search" id="search-invoice-id"
                                class="block pl-10 w-full text-[14px] text-gray-900 bg-gray-50 rounded-[4px] border border-gray-300 focus:ring-0 focus:border-[#17535B]"
                                placeholder="Tìm theo mã hoá đơn..." required="">
                        </div>
                    </div>

                    <div class="right-part flex justify-between items-center">
                        <!-- Filter by date -->
                        <div class="date-picker mr-[20px]">
                            <div date-rangepicker="" class="flex items-center">
                                <div class="relative">
                                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                        <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z"
                                                clip-rule="evenodd"></path>
                                        </svg>
                                    </div>
                                    <input name="start" type="text" id="start-date"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 rounded block w-full pl-10  datepicker-input"
                                        placeholder="Ngày đầu">
                                </div>
                                <span class="mx-4 text-gray-500">đến</span>
                                <div class="relative">
                                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                        <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z"
                                                clip-rule="evenodd"></path>
                                        </svg>
                                    </div>
                                    <input name="end" type="text" id="end-date"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 rounded block w-full pl-10 datepicker-input"
                                        placeholder="Ngày cuối">
                                </div>
                            </div>
                        </div>

                        <!-- Filter by status -->
                        <div class="dropdown-status mr-[20px]">
                            <button id="dropdownDefault" data-dropdown-toggle="dropdown-status"
                                class="text-[#17535B] bg-[#fff] hover:bg-[#F6F8FA] font-[14px] rounded text-sm px-4 py-2.5 text-center inline-flex items-center border border-[#17535B]"
                                type="button">Trạng thái <svg class="w-4 h-4 ml-2" fill="none" stroke="currentColor"
                                    viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M19 9l-7 7-7-7">
                                    </path>
                                </svg>
                            </button>
                            <div id="dropdown-status" class="z-10 hidden bg-white rounded shadow"
                                data-popper-placement="bottom-start"
                                style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(592px, 681px);">
                                <ul class="py-1 text-sm text-gray-700" aria-labelledby="dropdownDefault">
                                    <li>
                                        <a href="#" class="block px-4 py-2 hover:bg-gray-100">Chưa thanh toán</a>
                                    </li>
                                    <li>
                                        <a href="#" class="block px-4 py-2 hover:bg-gray-100">Đã thanh toán</a>
                                    </li>
                                    <li>
                                        <a href="#" class="block px-4 py-2 hover:bg-gray-100">Quá hạn</a>
                                    </li>
                                </ul>
                            </div>
                        </div>


                        <!-- Submit button -->
                        <button type="button"
                            class="py-2.5 px-5 text-[14px] font-[14px] text-[#fff] focus:outline-none bg-[#17535B] rounded hover:bg-[#13484F] focus:z-10">Lọc</button>
                    </div>

                </form>
            </div>
            <!-- End Search and filter -->

            <!-- table invoice list -->
            <div class="statistic flex justify-between mt-[20px] w-full">
                <div class="card relative overflow-x-auto bg-[#fff] p-5 w-full">
                    <table class="w-full text-[14px] text-left text-gray-500 mb-[20px]">
                        <thead class="text-[15px] text-gray-700 uppercase bg-gray-50">
                            <tr>
                                <th scope="col" class="px-6 py-3">
                                    Mã hoá đơn
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Phòng
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Hóa đơn tháng
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Hạn
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Giá tiền
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Trạng thái
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    <span class="sr-only">Edit</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="bg-white border-b hover:bg-gray-50">
                                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                    <a href="#" class="hover:text-[#288D87] hover:underline">0020354</a>
                                </th>
                                <td class="px-6 py-4">
                                    A101
                                </td>
                                <td class="px-6 py-4">
                                    06/2022
                                </td>
                                <td class="px-6 py-4">
                                    10/06/2022
                                </td>
                                <td class="px-6 py-4">
                                    đ4.560.000
                                </td>
                                <td class="px-6 py-4">
                                    <span
                                        class="bg-blue-100 text-blue-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Chưa
                                        thanh toán</span>

                                </td>
                                <td class="px-6 py-4 text-right">
                                    <a href="#" class="font-medium text-[#17535B]">Xem chi tiết</a>
                                </td>
                            </tr>
                            <tr class="bg-white border-b hover:bg-gray-50">
                                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                    <a href="#" class="hover:text-[#288D87] hover:underline">0020353</a>
                                </th>
                                <td class="px-6 py-4">
                                    A101
                                </td>
                                <td class="px-6 py-4">
                                    06/2022
                                </td>
                                <td class="px-6 py-4">
                                    10/05/2022
                                </td>
                                <td class="px-6 py-4">
                                    đ4.200.000
                                </td>
                                <td class="px-6 py-4">
                                    <span
                                        class="bg-red-100 text-red-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Quá
                                        hạn</span>

                                </td>
                                <td class="px-6 py-4 text-right">
                                    <a href="#" class="font-medium text-[#17535B]">Xem chi tiết</a>
                                </td>
                            </tr>
                            <tr class="bg-white border-b hover:bg-gray-50">
                                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                    <a href="#" class="hover:text-[#288D87] hover:underline">0020352</a>
                                </th>
                                <td class="px-6 py-4">
                                    A101
                                </td>
                                <td class="px-6 py-4">
                                    06/2022
                                </td>
                                <td class="px-6 py-4">
                                    10/04/2022
                                </td>
                                <td class="px-6 py-4">
                                    đ4.610.000
                                </td>
                                <td class="px-6 py-4">
                                    <span
                                        class="bg-green-100 text-green-800 text-[14px] font-normal px-2.5 py-0.5 rounded">Đã
                                        thanh toán</span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <a href="#" class="font-medium text-[#17535B]">Xem chi tiết</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Pagination + Export excel -->
                    <div class="table-extend flex justify-between">

                        <!-- Pagination -->
                        <nav aria-label="Page navigation example">
                            <ul class="table-paging inline-flex items-center -space-x-px">
                                <li>
                                    <a href="#"
                                        class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
                                        <span class="sr-only">Previous</span>
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                                                clip-rule="evenodd"></path>
                                        </svg>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" aria-current="page"
                                        class="current py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">1</a>
                                </li>
                                <li>
                                    <a href="#"
                                        class="py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">2</a>
                                </li>
                                <li>
                                    <a href="#"
                                        class="z-10 py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">3</a>
                                </li>
                                <li>
                                    <a href="#"
                                        class="block py-2 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
                                        <span class="sr-only">Next</span>
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                                clip-rule="evenodd"></path>
                                        </svg>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <!-- End Pagination -->

                        <!-- Export excel button -->
                        <button type="button"
                            class="py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-gray-900 flex items-center justify-center focus:outline-none bg-white rounded border border-gray-200 hover:bg-gray-100 hover:text-[#288D87] focus:z-10 group">Xuất
                            file excel
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                class="w-4 h-4 ml-[5px] text-[#288D87] group-hover:text-[#288D87]">
                                <path fill="none" d="M0 0h24v24H0z" />
                                <path
                                    d="M2.859 2.877l12.57-1.795a.5.5 0 0 1 .571.495v20.846a.5.5 0 0 1-.57.495L2.858 21.123a1 1 0 0 1-.859-.99V3.867a1 1 0 0 1 .859-.99zM17 3h4a1 1 0 0 1 1 1v16a1 1 0 0 1-1 1h-4V3zm-6.8 9L13 8h-2.4L9 10.286 7.4 8H5l2.8 4L5 16h2.4L9 13.714 10.6 16H13l-2.8-4z" />
                            </svg>

                        </button>
                    </div>
                    <!-- End Pagination + Export excel -->


                </div>

            </div>


            <!-- End table invoice list -->
        </div>

        <!-- Footer -->

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

        <!-- End footer -->

    </div>

    <!-- flowbite -->
    <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
    <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
    <script src="js/monthpicker.js"></script>

    <!-- chartJS -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="js/chart.js"></script>

    <!-- Breadcrumb -->
    <script src="js/breadcrumb.js"></script>

</body>

</html>
