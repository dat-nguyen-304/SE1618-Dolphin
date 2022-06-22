<%-- 
    Document   : LRoomType
    Created on : Jun 23, 2022, 12:33:26 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang người thuê</title>

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
    <link rel="stylesheet" href="LRoomType.css">

    <!-- icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

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
                    <button type="button"
                        class="h-10 w-10 flex  justify-center items-center rounded-full text-[#17535B] mr-[20px]"
                        id="user-noti-button" aria-expanded="false" data-dropdown-toggle="dropdown-noti">
                        <span class="sr-only">Open notification</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                        </svg>
                    </button>
                    <div class="hidden absolute z-50 my-5 text-base list-none rounded divide-y shadow bg-[#1B4146] divide-[#9DADB2]"
                        id="dropdown-noti" data-popper-reference-hidden="" data-popper-escaped=""
                        data-popper-placement="top">
                        <div class="py-3 px-4">
                            <span class="block text-sm text-white">Notifications</span>
                        </div>
                        <ul class="py-1" aria-labelledby="dropdown">
                            <li>
                                <a href="#"
                                    class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 hover:bg-gray-600 text-gray-200 hover:text-white">Dashboard</a>
                            </li>
                            <li>
                                <a href="#"
                                    class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 hover:bg-gray-600 text-gray-200 hover:text-white">Settings</a>
                            </li>

                        </ul>
                    </div>
                </div>

                <div class="relative">
                    <button type="button" class="flex text-sm rounded-full" id="user-menu-button" aria-expanded="false"
                        data-dropdown-toggle="dropdown">
                        <span class="sr-only">Open user menu</span>
                        <img class="w-10 h-10 rounded-full object-cover"
                            src="https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=689&q=80"
                            alt="user photo">
                    </button>
                    <div class="hidden absolute z-50 my-4 text-base list-none rounded divide-y shadow bg-[#1B4146] divide-[#9DADB2]"
                        id="dropdown" data-popper-reference-hidden="" data-popper-escaped=""
                        data-popper-placement="top">
                        <div class="py-3 px-4">
                            <span class="block text-sm text-[#929CA5]">Bonnie Green</span>
                            <span
                                class="block text-sm font-medium text-gray-500 truncate text-gray-400">name@flowbite.com</span>
                        </div>
                        <ul class="py-1" aria-labelledby="dropdown">
                            <li>
                                <a href="#"
                                    class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 hover:bg-gray-600 text-gray-200 hover:text-white">Dashboard</a>
                            </li>
                            <li>
                                <a href="#"
                                    class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 hover:bg-gray-600 text-gray-200 hover:text-white">Settings</a>
                            </li>
                            <li>
                                <a href="#"
                                    class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 hover:bg-gray-600 text-gray-200 hover:text-white">Earnings</a>
                            </li>
                            <li>
                                <a href="#"
                                    class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 hover:bg-gray-600 text-gray-200 hover:text-white">Sign
                                    out</a>
                            </li>
                        </ul>
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
        <div class="overflow-y-auto h-full py-4 px-3 bg-[#ffffff]">
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
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Danh
                                sách hoá đơn</a>
                        </li>
                        <li>
                            <a href="#"
                                class="menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Chi
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

            <!-- Breadcrumb -->
            <nav class="flex" aria-label="Breadcrumb">
                <ol class="inline-flex items-center space-x-1 md:space-x-3">
                    <li class="inline-flex items-center">
                        <a href="#"
                            class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                            <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                            </svg>
                            Phòng
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
                            <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Danh sách hoá đơn</span>
                        </div>
                    </li> -->
                </ol>
            </nav>
            <!-- End breadcrumb -->

            <!-- General information -->
            <div class="general-info flex justify-between mt-[20px]">
                <div class="">
                    <span>Chọn nhà trọ: </span>
                    <button
                        class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                        type="button" data-modal-toggle="hostelModal">
                        Sakura
                    </button>

                    <div id="hostelModal" tabindex="-1" aria-hidden="true"
                        class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Chọn Phòng
                                    </h3>
                                    <button type="button"
                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                        data-modal-toggle="hostelModal">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </div>

                                <div class="p-6 space-y-6">
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Huyền Thiết</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Châu Tấn</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Á Bằng</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Doanh Doanh</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="mt-[20px]">
                <div class="">
                    <span>Chọn loại phòng: </span>
                    <button
                        class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                        type="button" data-modal-toggle="roomModal">
                        Bình Dân
                    </button>
                    <div id="roomModal" tabindex="-1" aria-hidden="true"
                        class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Chọn loại Phòng
                                    </h3>
                                    <button type="button"
                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                        data-modal-toggle="roomModal">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </div>

                                <div class="p-6 space-y-6">
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Bình Dân</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Trung Bình</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Cao Cấp</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <button
                        class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                        type="button" data-modal-toggle="addModal">
                        Thêm loại phòng mới
                    </button>
                    <div id="addModal" tabindex="-1" aria-hidden="true"
                        class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Thêm loại Phòng mới
                                    </h3>
                                    <button type="button"
                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                        data-modal-toggle="addModal">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </div>

                                <div class="p-4">
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Tên</label>
                                        <input type="text" class="text-sm p-1">
                                        <span class="ml-2 text-xs">VD: bình dân, cao cấp, ...</span>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Giá</label>
                                        <input type="text" class="text-sm p-1">
                                        <span class="ml-2 text-xs">VD: bình dân, cao cấp, ...</span>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Diện tích</label>
                                        <input type="text" class="text-sm p-1">
                                        <span class="ml-2 text-xs">VD: bình dân, cao cấp, ...</span>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Số người tối đa</label>
                                        <input type="text" class="text-sm p-1">
                                        <span class="ml-2 text-xs">VD: bình dân, cao cấp, ...</span>
                                    </div>
                                    <div class="my-2">
                                        <label class="relative top-[-24px] w-[160px] inline-block" for="">Mô tả</label>
                                        <textarea class="text-sm p-1" name="" id="" cols="48" rows="2">abcxyz</textarea>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Thêm Hình ảnh</label>
                                        <input type="file" multiple rounded />
                                    </div>
                                </div>
                                <div class="grid justify-items-end">
                                    <button class=" px-8 py-2 mx-4 my-2 border-2 rounded">Thêm</button>
                                </div>

                            </div>
                        </div>
                    </div>



                    <div class="mt-[24px] grid grid-cols-12">
                        <div class="col-span-5 mx-8">
                            <input type="file" multiple />
                            <div class="mt-[24px] grid grid-cols-3 gap-4">
                                <div class="w-full border-2">Hinh anh</div>
                                <div class="w-full border-2">Hinh anh</div>
                                <div class="w-full border-2">Hinh anh</div>
                                <div class="w-full border-2">Hinh anh</div>
                                <div class="w-full border-2">Hinh anh</div>
                            </div>
                        </div>
                        <div class="col-span-7 mx-8">
                            <div class="text-lg">Thông số chung: </div>
                            <div class="mt-[24px] grid grid-cols-3 gap-4">
                                <div class="">
                                    <span>Giá: </span>
                                    <input type="text" name="" disabled
                                        class="border-none text-sm text-right p-1 bg-transparent inline-block w-24"
                                        value="6.000.000">
                                    <span>VNĐ</span>
                                </div>
                                <div class="">
                                    <span>Diện tích: </span>
                                    <input type="text" name="" disabled
                                        class="border-none text-sm text-right p-1 bg-transparent inline-block w-8"
                                        value="32">
                                    <span>m2</span>
                                </div>
                                <div class="">
                                    <span>Số người tối đa: </span>
                                    <input type="text" name="" disabled
                                        class="border-none text-sm text-right p-1 bg-transparent inline-block w-6"
                                        value="5">
                                    <span>người</span>
                                </div>
                                <div class="col-span-3">
                                    <p class="">Mô tả: </p>
                                    <textarea class="mt-[8px] p-2 border-none text-sm bg-transparent" disabled name=""
                                        id="" cols="72" rows="2">abcxyz</textarea>
                                </div>
                                <div class="col-span-2"></div>
                                <button class="border-2 rounded p-1 hidden">Lưu</button>
                                <button class="border-2 rounded p-1 ">Chỉnh sửa</button>

                            </div>
                        </div>
                    </div>
                    <div class="mt-[24px]">
                        <div class="grid grid-cols-6 gap-x-4">
                            <div class="text-center p-2 text-sm">Danh sách phòng hiện tại: </div>
                            <!-- <div class="border-2 rounded text-center p-2 text-sm">Thêm Phòng</div> -->
                            <button
                                class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                type="button" data-modal-toggle="addRoom">
                                Thêm Phòng
                            </button>
                            <div id="addRoom" tabindex="-1" aria-hidden="true"
                                class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                    <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                        <div
                                            class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                            <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                Thêm loại Phòng mới
                                            </h3>
                                            <button type="button"
                                                class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                                data-modal-toggle="addRoom">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                        d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                        clip-rule="evenodd"></path>
                                                </svg>
                                            </button>
                                        </div>

                                        <div class="p-4">
                                            <div class="my-2">
                                                <label class="w-[160px] inline-block" for="">Tên phòng</label>
                                                <input type="text" class="text-sm p-1">
                                                <span class="ml-2 text-xs">VD: 101, 102, 510 ...</span>
                                            </div>
                                            <div class="my-2">
                                                <label class="relative top-[-24px] w-[160px] inline-block" for="">Mô
                                                    tả</label>
                                                <textarea class="text-sm p-1" name="" id="" cols="48"
                                                    rows="2">abcxyz</textarea>
                                            </div>
                                            <div class="my-2">
                                                <label class="w-[160px] inline-block" for="">Trạng thái</label>
                                                <div class="inline-block">
                                                    <div class="inline-block mr-4">
                                                        <label for="">Còn trống</label>
                                                        <input type="radio" name="status" value="1" id="">
                                                    </div>
                                                    <div class="inline-block mr-4">
                                                        <label for="">Đã có người ở</label>
                                                        <input type="radio" name="status" value="2" id="">
                                                    </div>
                                                    <div class="inline-block mr-4">
                                                        <label for="">Sắp trống</label>
                                                        <input type="radio" name="status" value="3" id="">
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="my-2 inputResident hidden">
                                                <div class="my-4">
                                                    <label class="w-[160px] inline-block" for="">Số
                                                        người hiện tại</label>
                                                    <input type="text" class="text-sm p-1">
                                                </div>
                                                <div class="">
                                                    <label class="w-[160px] inline-block" for="">Cư dân trong
                                                        phòng</label>
                                                    <div class="inline-block">
                                                        <div class="inline-block mr-4">
                                                            <label for="">Để sau</label>
                                                            <input type="radio" name="inputnow" value="false" id="">
                                                        </div>
                                                        <div class="inline-block mr-4">
                                                            <label for="">Đến trang chi tiết phòng để nhập</label>
                                                            <input type="radio" name="inputnow" value="true" id="">
                                                        </div>

                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                        <div class="grid justify-items-end">
                                            <button class=" px-8 py-2 mx-4 my-2 border-2 rounded">Tiếp tục</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="my-[24px] grid grid-cols-10 gap-x-8">
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>

                        </div>
                    </div>
                </div>

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
        <script>
            const hasResident = document.querySelectorAll('input[name="status"]');
            const inputResident = document.querySelector('.inputResident');
            hasResident.forEach(element => {
                element.onclick = () => {
                    if (element.value == "2" || element.value == "3") {
                        inputResident.style.display = "block";
                    } else inputResident.style.display = "none";
                }
            });
        </script>
</body>

</html>