<%-- 
    Document   : LOverView
    Created on : Jun 26, 2022, 9:25:17 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý phòng thuê</title>

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
    <link rel="stylesheet" href="../assets/css/LOverView.css">

    <!-- icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

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
                    <a href="#"
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
                            class="w-6 h-5 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                            viewBox="0 0 20 20" fill="currentColor">
                            <path
                                d="M18.991 2H9.01C7.899 2 7 2.899 7 4.01v5.637l-4.702 4.642A1 1 0 0 0 3 16v5a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V4.009C21 2.899 20.102 2 18.991 2zm-8.069 13.111V20H5v-5.568l2.987-2.949 2.935 3.003v.625zM13 9h-2V7h2v2zm4 8h-2v-2h2v2zm0-4h-2v-2h2v2zm0-4h-2V7h2v2z">
                            </path>
                            <path d="M7 15h2v2H7z"></path>
                        </svg>
                        <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item="">Nhà trọ</span>
                        <svg sidebar-toggle-item="" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                clip-rule="evenodd"></path>
                        </svg>
                    </button>
                    <ul id="dropdown-example" class="hidden py-2 space-y-2">
                        <li>
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Danh
                                sách nhà trọ</a>
                        </li>
                        <li>
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Thông
                                tin nhà trọ</a>
                        </li>
                        <li>
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]"
                                id="list-item">Thêm nhà trọ</a>
                        </li>
                        <li>
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Danh
                                sách phòng trọ</a>
                        </li>
                        <li>
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Thông
                                tin phòng trọ</a>
                        </li>
                        <li>
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]"
                                id="list-item">Thêm loai phòng</a>
                        </li>
                        <li>
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]"
                                id="list-item">Thêm phòng trọ</a>
                        </li>
                    </ul>
                </li>
                <li class="menu-item">
                    <a href="#"
                        class="menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                        <svg xmlns="http://www.w3.org/2000/svg"
                            class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                            viewBox="0 0 20 20" fill="currentColor">
                            <path
                                d="M8.433 7.418c.155-.103.346-.196.567-.267v1.698a2.305 2.305 0 01-.567-.267C8.07 8.34 8 8.114 8 8c0-.114.07-.34.433-.582zM11 12.849v-1.698c.22.071.412.164.567.267.364.243.433.468.433.582 0 .114-.07.34-.433.582a2.305 2.305 0 01-.567.267z" />
                            <path fill-rule="evenodd"
                                d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-13a1 1 0 10-2 0v.092a4.535 4.535 0 00-1.676.662C6.602 6.234 6 7.009 6 8c0 .99.602 1.765 1.324 2.246.48.32 1.054.545 1.676.662v1.941c-.391-.127-.68-.317-.843-.504a1 1 0 10-1.51 1.31c.562.649 1.413 1.076 2.353 1.253V15a1 1 0 102 0v-.092a4.535 4.535 0 001.676-.662C13.398 13.766 14 12.991 14 12c0-.99-.602-1.765-1.324-2.246A4.535 4.535 0 0011 9.092V7.151c.391.127.68.317.843.504a1 1 0 101.511-1.31c-.563-.649-1.413-1.076-2.354-1.253V5z"
                                clip-rule="evenodd" />
                        </svg>
                        <span class="flex-1 ml-3 whitespace-nowrap">Doanh thu</span>
                        <!-- <span
                            class="inline-flex justify-center items-center px-2 ml-3 text-sm font-medium text-gray-800 bg-gray-200 rounded-full bg-gray-700 text-gray-300">Pro</span> -->
                    </a>
                </li>
                <li class="menu-item">
                    <button type="button"
                        class="flex items-center justify-between p-2 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 group hover:bg-[#F3F3F3] hover:text-[#17535B]"
                        aria-controls="dropdown-example" data-collapse-toggle="dropdown-contract">
                        <svg xmlns="http://www.w3.org/2000/svg"
                            class="w-6 h-5 text-[#929CA5] transition duration-75 group-hover:text-[#17535B] m-0 p-0"
                            viewBox="0 0 20 20" fill="currentColor">
                            <path d="M2 3h20v4H2zm17 5H3v11a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V8h-2zm-3 6H8v-2h8v2z"></path>
                        </svg>
                        <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item="">Hợp đồng</span>
                        <svg sidebar-toggle-item="" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                clip-rule="evenodd"></path>
                        </svg>
                    </button>
                    <ul id="dropdown-contract" class="hidden py-2 space-y-2">
                        <li>
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Danh
                                sách hợp đồng</a>
                        </li>
                        <li>
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]"
                                id="list-item">Chi
                                tiết hợp đồng</a>
                        </li>

                    </ul>
                </li>
                <li class="menu-item">
                    <button type="button"
                        class="flex items-center p-2 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 group hover:bg-[#F3F3F3] hover:text-[#17535B]"
                        aria-controls="dropdown-example" data-collapse-toggle="dropdown-invoice">
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
                    <ul id="dropdown-invoice" class="hidden py-2 space-y-2">
                        <li>
                            <a href="tenant-page-invoice-list.html"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Danh
                                sách hoá đơn</a>
                        </li>
                        <li>
                            <a href="tenant-page-invoice-detail.html"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]"
                                id="list-item">Chi
                                tiết hoá đơn</a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="#"
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


            <div class="head-control flex justify-between">
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

                <form action="" class="flex items-center">
                    <div class="flex items-center mr-[20px]">
                        <h3 class="text-sm font-medium text-gray-400 mr-[10px]">Chọn nhà trọ: </h3>
                        <button type="button"
                            class="rounded w-fit h-[30px] px-[20px] bg-[#288D87] hover:bg-[#248781] flex flex justify-between items-center">
                            <h3 class="font-medium text-[15px] text-[#fff]">An Khang</h3>
                        </button>
                    </div>
                    <button type="button"
                        class="rounded w-[150px] h-[30px] bg-[#fff] border order-gray-400 hover:border-[#288D87] flex justify-center items-center group">
                        <p class="font-normal text-[15px] text-gray-400 group-hover:text-[#288D87]">Thêm nhà trọ <i
                                class="bi bi-plus-lg"></i></p>

                    </button>
                </form>

                <!-- End breadcrumb -->
            </div>


            <!-- General information -->
            <div class="general-info flex justify-between mt-[20px] grid grid-16 gap-[20px]">
                <a href="#"
                    class="card col-span-2 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                    <div class="overall-info-head">
                        <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Số
                            phòng trọ</h3>
                    </div>
                    <div class="overall-info-content ">
                        <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">34</p>
                    </div>
                </a>
                <a href="#"
                    class="card col-span-2 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                    <div class="overall-info-head">
                        <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Số
                            người thuê</h3>
                    </div>
                    <div class="overall-info-content ">
                        <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">25</p>
                    </div>
                </a>
                <a href="#"
                    class="card col-span-2  overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                    <div class="overall-info-head">
                        <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Số cư
                            dân</h3>
                    </div>
                    <div class="overall-info-content ">
                        <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">46</p>
                    </div>
                </a>
                <a href="#"
                    class="card col-span-3 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                    <div class="overall-info-head">
                        <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Doanh
                            thu năm</h3>
                    </div>
                    <div class="overall-info-content ">
                        <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">650.000.000</p>
                    </div>
                </a>
                <a href="#"
                    class="card col-span-3 overall-info h-[120px] bg-[#fff] p-5 flex flex-col items-center justify-between cursor-pointer hover:bg-[#FAFDFD] group">
                    <div class="overall-info-head">
                        <h3 class="text-[20px] text-center font-medium text-[#929CA5] group-hover:text-[#17535B]">Tổng
                            doanh thu</h3>
                    </div>
                    <div class="overall-info-content ">
                        <p class="text-[28px] font-bold text-[#17535B] bottom-0 self-center">1.870.460.000</p>
                    </div>
                </a>
                <div href="#"
                    class="card rounded col-span-4 overall-info h-[120px] bg-[#fff] group relative">
                    <div
                        class="overall-info-head h-[30%] bg-[#F5FDFA] flex flex-col justify-center items-end pr-[10px]">
                        <p class="text-[14px] font-medium text-[#17535B]">Trang quản lý dành cho chủ nhà</p>
                    </div>
                    <div class="desc h-[70%] px-[20px] flex items-center">
                        <div class="user-ava mr-[20px] inline-block border border-[3px] border-[#fff] rounded-full ">
                            <img class="w-14 h-14 rounded-full" src="images/users/avatar-2.jpg" alt="Jese Leos image" />
                        </div>
                        <div class="user-info text-[14px] font-normal text-[#7B8692]">
                            <p><span class="text-[#40576C] font-bold">Nguyễn Văn An</span> - annv101</p>
                            <p>annguyenvan101@gmail.com</p>
                            <p>0357 543 655</p>
                        </div>

                    </div>
                </div>

            </div>
            <!-- End general information -->

            <!-- Statistics -->
            <div class="statistic flex justify-between mt-[20px] grid grid-cols-4 grid-rows-2 gap-5">
                <div class="card chart bg-[#fff] p-5 flex flex-col col-span-3 row-span-2">
                    <div class="text-[20px] font-bold text-[#2A3C46] self-center pb-[20px]">Thống kê doanh thu
                    </div>
                    <div class="w-[90%] h-[90%] mx-auto">
                        <canvas id="myChart"></canvas>
                    </div>
                </div>

                <div class="grid grid-rows-2 row-span-2">
                    <div class="card room-member bg-[#fff] p-5 flex flex-col">
                        <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                            <p>Doanh thu</p>
                            <!-- Hiển thị doanh thu 5 tháng gần đây nhất -->
                            <a href="#" class="text-[15px] font-light flex items-baseline">
                                <p><i class="bi bi-box-arrow-up-right text-[12px]"></i> </p>
                                <p class="translate-y-[3px] ml-[5px]">Xem chi tiết</p>
                            </a>
                        </div>
                        <div class="relative overflow-y-auto">
                            <table class="w-full text-sm text-left text-gray-500">
                                <tbody>
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            06 / 2022
                                        </th>
                                        <td class="px-6 py-4">
                                            đ60.500.000
                                        </td>
                                        <td class="px-6 py-4 text-right">
                                            <a href="#" class="font-medium text-[#288D87] hover:underline"><i
                                                    class="bi bi-eye-fill"></i></a>
                                        </td>
                                    </tr>
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            05 / 2022
                                        </th>
                                        <td class="px-6 py-4">
                                            đ85.900.000
                                        </td>
                                        <td class="px-6 py-4 text-right">
                                            <a href="#" class="font-medium text-[#288D87] hover:underline"><i
                                                    class="bi bi-eye-fill"></i></a>
                                        </td>
                                    </tr>
                                    <tr class="bg-white hover:bg-gray-50">
                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            04 / 2020
                                        </th>
                                        <td class="px-6 py-4">
                                            đ89.700.00
                                        </td>
                                        <td class="px-6 py-4 text-right">
                                            <a href="#" class="font-medium text-[#288D87] hover:underline"><i
                                                    class="bi bi-eye-fill"></i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card room-member bg-[#fff] p-5 flex flex-col mt-[20px]">
                        <div class="text-[20px] font-bold text-[#2A3C46] pb-[20px] flex justify-between items-center">
                            <p>Tháng 6 / 2022</p>
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
                                            Doanh thu
                                        </th>
                                        <td class="px-6 py-4">
                                            0020354
                                        </td>
                                    </tr>
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            Thay đổi so với tháng trước
                                        </th>
                                        <td class="px-6 py-4 text-[#1CBA8B]">
                                            12% <i class="bi bi-arrow-up"></i>
                                        </td>
                                    </tr>
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <th scope="row" class="pr-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                            Thay đổi so với tháng trước
                                        </th>
                                        <td class="px-6 py-4 text-[#FF5757]">
                                            4% <i class="bi bi-arrow-down"></i>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="mt-[20px] text-[15px] font-light text-[#929CA5]">
                            <em>(tóm tắt tính hình tháng mới nhất)</em>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Requests -->
            <div class="statistic flex justify-between mt-[20px] grid grid-cols-2 gap-[20px]">
                <div class="card w-full bg-[#fff] p-5 flex flex-col">
                    <div class="text-[20px] font-bold text-[#2A3C46] self-start pb-[20px]">Yêu cầu thuê phòng
                    </div>
                    <div class="w-full h-full mx-auto">
                        <div class="relative overflow-x-auto">
                            <table class="w-full text-sm text-left text-gray-500">
                                <thead class="text-xs text-gray-700 uppercase bg-gray-50 ">
                                    <tr>
                                        <th scope="col" class="px-6 py-3">
                                            Thời gian
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Nội dung
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Đã xử lý
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Chưa xử lý -->
                                    <tr class="bg-white border-b hover:bg-gray-50 text-[#17535B] font-medium">
                                        <td class="px-6 py-4">
                                            16:04 - 05/05/2022
                                        </td>
                                        <td class="px-6 py-4">
                                            Nguyễn Văn An yêu cầu thuê phòng A1, nhà trọ An Khang
                                        </td>
                                        <td class="px-6 py-4 flex justify-center">
                                            <input checked id="teal-checkbox" type="checkbox" value=""
                                                class="w-4 h-4 text-teal-600 bg-gray-100 rounded border-[#17535B] focus:ring-[#17535B] focus:ring-2 duration-200">

                                        </td>
                                    </tr>
                                    <!-- Đã xử lý -->
                                    <tr class="bg-white border-b hover:bg-gray-50 text-[#929CA5]">
                                        <td class="px-6 py-4">
                                            16:04 - 05/05/2022
                                        </td>
                                        <td class="px-6 py-4">
                                            Nguyễn Văn An yêu cầu thuê phòng A1, nhà trọ An Khang
                                        </td>
                                        <td class="px-6 py-4 flex justify-center">
                                            <input checked id="teal-checkbox" type="checkbox" value=""
                                                class="w-4 h-4 text-teal-600 bg-gray-100 rounded border-[#17535B] focus:ring-[#17535B] focus:ring-2 duration-200">

                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Rating -->
                <div class="card w-full bg-[#fff] p-5 flex flex-col">
                    <div class="text-[20px] font-bold text-[#2A3C46] self-start pb-[20px]">Đánh giá
                    </div>
                    <div class="w-full h-full mx-auto">
                        <div class="relative overflow-x-auto">
                            <table class="w-full text-sm text-left text-gray-500">
                                <thead class="text-xs text-gray-700 uppercase bg-gray-50 ">
                                    <tr>
                                        <th scope="col" class="px-6 py-3">
                                            Nhà trọ
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Trung bình
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Số đánh giá
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="bg-white border-b hover:bg-gray-50">
                                        <td class="px-6 py-4">
                                            An Khang
                                        </td>
                                        <td class="px-6 py-4 text-[#FFB03A]">
                                            4.8 / 5 <i class="bi bi-star-fill"></i>
                                        </td>
                                        <td class="px-6 py-4">
                                            53 lượt
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
    <script src="js/chart.js"></script>

    <!-- Breadcrumb -->
    <script src="js/breadcrumb.js"></script>
</body>

</html>
