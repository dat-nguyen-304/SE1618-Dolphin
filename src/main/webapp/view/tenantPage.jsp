<%-- 
    Document   : tenantPage
    Created on : Jun 21, 2022, 7:52:22 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý phòng thuê</title>

        <!--Favicon-->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

        <!--CSS-->
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/tenant-page.css">

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="bg-[#ffffff] w-full h-[60px] flex items-center fixed z-50 border-b border-[#e6e9e9]">
            <div class="w-full flex flex-wrap justify-between items-center mx-[55px]">
                <a href="https://flowbite.com" class="flex items-center">
                    <img src="images/logo.png" class="mr-3 h-6" alt="">
                    <span class="self-center text-xl font-bold whitespace-nowrap text-[#17535B]">Sakura</span>
                </a>
                <div class="flex items-center">
                    <div class="relative">
                        <!-- Notification button -->
                        <button type="button"
                                class="h-10 w-10 flex justify-center items-center rounded-full text-[#17535B] mr-[20px] hover:bg-[#E6EEF1] active:bg-[#E6EEF1] focus:bg-[#E6EEF1] transition relative"
                                id="user-noti-button" aria-expanded="false" data-dropdown-toggle="dropdown-noti"
                                data-dropdown-placement="bottom-start">
                            <span class="sr-only">Open notification</span>
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                                 stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                            </svg>
                            <span
                                class="absolute top-2 right-2 inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-red-100 transform translate-x-1/2 -translate-y-1/2 bg-red-600 rounded-full">99</span>
                        </button>
                        <!-- Notification list (dropdown) -->
                        <div class="hidden dropdown-shadow w-[300px] right-[70px] absolute z-50 my-5 text-base list-none rounded divide-y bg-[#fff] divide-[#E0E2E4]"
                             id="dropdown-noti" data-popper-reference-hidden="" data-popper-escaped=""
                             data-popper-placement="top">
                            <div class="py-3 px-4 flex justify-between items-center">
                                <div class="text-[18px] font-semibold text-[#40576C]">Thông báo</div>
                                <a class="text-[13px] font-normal text-[#40576C] rounded-lg px-3 py-2 hover:bg-[#F3F8FA]"
                                   href="#">Xem tất cả</a>
                            </div>
                            <ul class="py-1 divide-y divide-[#EEF0F1]" aria-labelledby="dropdown">
                                <li>
                                    <div id="toast-notification"
                                         class="w-full max-w-xs p-4 text-gray-900 bg-white hover:bg-[#F6F8FA]" role="alert">
                                        <div class="flex items-center">
                                            <div class="relative inline-block shrink-0">
                                                <img class="w-12 h-12 rounded-full" src="images/users/avatar-1.jpg"
                                                     alt="Jese Leos image" />
                                            </div>
                                            <div class="ml-3 text-sm font-normal">
                                                <h4 class="text-sm font-semibold text-gray-900 ">Bonnie Green
                                                </h4>
                                                <div class="text-sm font-normal">commmented on your photo</div>
                                                <span class="text-xs font-medium text-[#288D87]">a few
                                                    seconds ago</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div id="toast-notification"
                                         class="w-full max-w-xs p-4 text-gray-900 bg-white hover:bg-[#F6F8FA]" role="alert">
                                        <div class="flex items-center">
                                            <div class="relative inline-block shrink-0">
                                                <img class="w-12 h-12 rounded-full" src="images/users/avatar-1.jpg"
                                                     alt="Jese Leos image" />
                                            </div>
                                            <div class="ml-3 text-sm font-normal">
                                                <h4 class="text-sm font-semibold text-gray-900 ">Bonnie Green
                                                </h4>
                                                <div class="text-sm font-normal">commmented on your photo</div>
                                                <span class="text-xs font-medium text-[#288D87]">a few
                                                    seconds ago</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                            </ul>
                        </div>
                    </div>

                    <div class="relative">
                        <button type="button" class="flex text-sm rounded-full" id="user-menu-button" aria-expanded="false"
                                data-dropdown-toggle="dropdown" data-dropdown-placement="bottom-start">
                            <span class="sr-only">Open user menu</span>
                            <img class="w-10 h-10 rounded-full object-cover"
                                 src="https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=689&q=80"
                                 alt="user photo">
                        </button>
                        <!-- Dropdown menu -->
                        <div id="dropdown"
                             class="dropdown-shadow z-10 hidden bg-white divide-y divide-gray-100 rounded shadow w-44">
                            <div class="px-4 py-3 text-sm text-gray-900">
                                <div>Bonnie Green</div>
                                <div class="font-medium truncate">name@flowbite.com</div>
                            </div>
                            <ul class="py-1 text-sm text-gray-700" aria-labelledby="dropdownInformationButton">
                                <li>
                                    <a href="#" class="block px-4 py-2 hover:bg-gray-100">Dashboard</a>
                                </li>
                                <li>
                                    <a href="#" class="block px-4 py-2 hover:bg-gray-100">Settings</a>
                                </li>
                                <li>
                                    <a href="#" class="block px-4 py-2 hover:bg-gray-100">Earnings</a>
                                </li>
                            </ul>
                            <div class="py-1">
                                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Sign
                                    out</a>
                            </div>
                        </div>
                    </div>

                    <button data-collapse-toggle="mobile-menu-2" type="button"
                            class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 text-gray-400 hover:bg-gray-700 focus:ring-gray-600"
                            aria-controls="mobile-menu-2" aria-expanded="false">
                        <span class="sr-only">Open main menu</span>
                        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                              clip-rule="evenodd"></path>
                        </svg>
                        <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                             xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                              clip-rule="evenodd"></path>
                        </svg>
                    </button>

                </div>
            </div>
        </nav>

        <aside class="w-[256px] top-[60px] h-[calc(100vh-60px)] fixed border-r border-[#e6e9e9]" aria-label="Sidebar">
            <div class="navigation-bar overflow-y-auto h-full py-4 px-3 bg-[#ffffff]">
                <ul class="space-y-2">
                    <li class="">
                        <a href="tenantPage.jsp"
                           class="menu-item active flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                 class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                                 viewBox="0 0 20 20" fill="currentColor">
                            <path
                                d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
                            </svg>
                            <span class="ml-3">Tổng quan</span>
                        </a>
                    </li>
                    <li class="menu-item">
                        <button type="button"
                                class="flex items-center p-2 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 group hover:bg-[#F3F3F3] hover:text-[#17535B]"
                                aria-controls="dropdown-example" data-collapse-toggle="dropdown-example">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                 class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                                 viewBox="0 0 20 20" fill="currentColor">
                            <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                            <path fill-rule="evenodd"
                                  d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z"
                                  clip-rule="evenodd" />
                            </svg>
                            <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item="">Hoá đơn</span>
                            <svg sidebar-toggle-item="" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                                 xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                  clip-rule="evenodd"></path>
                            </svg>
                        </button>
                        <ul id="dropdown-example" class="hidden py-2 space-y-2">
                            <li>
                                <a href="tenantPageInvoiceList.jsp"
                                   class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Danh
                                    sách hoá đơn</a>
                            </li>
                            <li>
                                <a href="tenantPageInvoiceDetail.jsp"
                                   class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]"
                                   id="list-item">Chi
                                    tiết hoá đơn</a>
                            </li>

                        </ul>
                    </li>
                    <li class="menu-item">
                        <a href="#"
                           class="menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                 class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                                 viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd"
                                  d="M2 5a2 2 0 012-2h8a2 2 0 012 2v10a2 2 0 002 2H4a2 2 0 01-2-2V5zm3 1h6v4H5V6zm6 6H5v2h6v-2z"
                                  clip-rule="evenodd" />
                            <path d="M15 7h1a2 2 0 012 2v5.5a1.5 1.5 0 01-3 0V7z" />
                            </svg>
                            <span class="flex-1 ml-3 whitespace-nowrap">Hợp đồng</span>
                            <!-- <span
                                class="inline-flex justify-center items-center px-2 ml-3 text-sm font-medium text-gray-800 bg-gray-200 rounded-full bg-gray-700 text-gray-300">Pro</span> -->
                        </a>
                    </li>
                    <li>
                        <a href="tenantPageNotiList.jsp"
                           class="menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                 class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                                 viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd"
                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                                  clip-rule="evenodd" />
                            </svg>
                            <span class="flex-1 ml-3 whitespace-nowrap">Thông báo</span>
                            <!-- <span
                                class="inline-flex justify-center items-center px-2 ml-3 text-sm font-medium text-gray-800 bg-gray-200 rounded-full bg-gray-700 text-gray-300">Pro</span> -->
                        </a>
                    </li>
                </ul>
            </div>
        </aside>

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
                                <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                                </svg>
                                Tổng quan
                            </a>
                        </li>
                        <!-- <li aria-current="page">
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
                        </li> -->
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <!-- General information -->
                <div class="general-info flex justify-between mt-[20px]">
                    <div class="card hostel-info w-[27%] h-[120px] bg-[#fff] p-5 flex flex-col justify-between">
                        <div class="hostel-info-head flex justify-between items-baseline">
                            <div class="hostel-name text-[20px] font-bold text-[#2A3C46]">
                                <h3>Nhà trọ An Khang</h3>
                            </div>
                            <div class="hostel-rating text-[18px] font-semibold text-[#FFB31F] flex items-center">
                                <h3 class="rating mr-[3px]">4.6/5</h3>
                                <i class="bi bi-star-fill"></i>
                            </div>
                        </div>
                        <div class="hostel-address text-[14px] font-normal text-[#597187] bottom-0 self-end">
                            <p class="">35 đường Nguyễn Xiển, phường Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh</p>
                        </div>
                    </div>

                    <div class="card landlord-info w-[27%] h-[120px] bg-[#fff] p-5 flex flex-col justify-between">
                        <div class="landlord-name text-[20px] font-bold text-[#2A3C46]">
                            <h3>Nguyễn Văn An</h3>
                        </div>

                        <div class="landlord-contact text-[14px] font-normal text-[#597187]">
                            <p class=""><i class="bi bi-telephone-fill mr-[10px]"></i> 0357545630</p>
                            <p class=""><i class="bi bi-envelope-fill mr-[10px]"></i> annguyenvan101@gmail.com</p>
                        </div>
                    </div>

                    <div class="card room-info w-[27%] h-[120px] bg-[#fff] p-5 flex flex-col justify-between">
                        <div class="room-code text-[20px] font-bold text-[#2A3C46]">
                            <h3>Phòng A102</h3>
                        </div>

                        <div class="room-type text-[14px] font-normal text-[#597187]">
                            <div class="grid grid-cols-3 w-[65%]">
                                <p class="">Diện tích</p>
                                <p class="col-span-2 font-medium">40m<sup>2</sup></p>
                            </div>
                            <div class="grid grid-cols-3 w-[65%]">
                                <p class="">Giá phòng</p>
                                <p class="col-span-2 font-medium">4.0 triệu / tháng</p>
                            </div>
                        </div>
                    </div>

                    <form class="card cancel-rent w-[15%] h-[120px]">
                        <input hidden type=text" name=tenantID" value="101" />
                        <input hidden type="text" name=roomID" value="101" />
                        <button type="button"
                                class="w-full h-full bg-[#F3F8FA] p-5 flex justify-center items-center text-[#17535B] font-medium text-[22px] hover:bg-[#DCE8E9]">Huỷ
                            thuê phòng</button>
                    </form>
                </div>
                <!-- End general information -->

                <!-- Statistics -->
                <div class="statistic flex justify-between mt-[20px] grid grid-cols-4 grid-rows-2 gap-5">
                    <div class="card chart bg-[#fff] p-5 flex flex-col col-span-3 row-span-2">
                        <div class="text-[20px] font-bold text-[#2A3C46] self-center pb-[20px]">Thống kê chi phí dịch vụ
                        </div>
                        <div class="w-[90%] h-[90%] mx-auto">
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>

                    <div class="grid grid-rows-2 row-span-2">
                        <div class="card room-member bg-[#fff] p-5 flex flex-col">
                            <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px]">Thành viên phòng
                            </div>
                            <div class="relative overflow-x-auto">
                                <table class="w-full text-sm text-left text-gray-500">
                                    <tbody>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                Nguyễn Văn An
                                            </th>
                                            <td class="px-6 py-4">
                                                0357563650
                                            </td>
                                            <td class="px-6 py-4 text-right">
                                                <a href="#" class="font-medium text-[#288D87] hover:underline"><i
                                                        class="bi bi-pencil-fill"></i></a>
                                            </td>
                                        </tr>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                Lê Văn Bình
                                            </th>
                                            <td class="px-6 py-4">
                                                0357856560
                                            </td>
                                            <td class="px-6 py-4 text-right">
                                                <a href="#" class="font-medium text-[#288D87] hover:underline"><i
                                                        class="bi bi-pencil-fill"></i></a>
                                            </td>
                                        </tr>
                                        <tr class="bg-white hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                Trần Văn Đức
                                            </th>
                                            <td class="px-6 py-4">
                                                0195789730
                                            </td>
                                            <td class="px-6 py-4 text-right">
                                                <a href="#" class="font-medium text-[#288D87] hover:underline"><i
                                                        class="bi bi-pencil-fill"></i></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="card room-member bg-[#fff] p-5 flex flex-col mt-[20px]">
                            <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                                <p>Hoá đơn mới nhất</p>
                                <a href="#" class="text-[15px] font-light flex items-baseline">
                                    <p><i class="bi bi-box-arrow-up-right text-[12px]"></i> </p>
                                    <p class="translate-y-[3px] ml-[5px]">Xem chi tiết</p>
                                </a>
                            </div>
                            <div class="relative overflow-x-auto">
                                <table class="w-full text-sm text-left text-gray-500">
                                    <tbody>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                Mã hoá đơn
                                            </th>
                                            <td class="px-6 py-4">
                                                0020354
                                            </td>
                                        </tr>
                                        <tr class="bg-white border-b hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                Kỳ thanh toán
                                            </th>
                                            <td class="px-6 py-4">
                                                05/2022
                                            </td>
                                        </tr>
                                        <tr class="bg-white  border-b hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                Giá tiền
                                            </th>
                                            <td class="px-6 py-4">
                                                4.875.000 VNĐ
                                            </td>
                                        </tr>
                                        <tr class="bg-white hover:bg-gray-50">
                                            <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                                Trạng thái
                                            </th>
                                            <td class="px-6 py-4">
                                                Chưa thanh toán
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- End Statistics -->
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

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="../assets/javascript/chart-tenant-page.js"></script>
    </body>
</html>
