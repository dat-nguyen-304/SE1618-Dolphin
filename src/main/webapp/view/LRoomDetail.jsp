<%-- 
    Document   : LRoomDetail
    Created on : Jun 20, 2022, 8:56:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <link rel="stylesheet" href="LRoomDetail.css">

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
                    <span>Chọn phòng: </span>
                    <button
                        class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                        type="button" data-modal-toggle="roomModal">
                        101
                    </button>

                    <div id="roomModal" tabindex="-1" aria-hidden="true"
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
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">101</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">102</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">103</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">104</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="" class="inline-block bg-gray-100 py-2 px-4 ml-[24px]">Xem hóa đơn</a>
                </div>
                <div class="grid grid-cols-12 gap-x-8">
                    <div class="col-span-5 border-4 p-4 border-2 rounded mt-[24px]">
                        <div id="default-carousel" class="relative" data-carousel="static">
                            <!-- Carousel wrapper -->
                            <div class="overflow-hidden relative h-56 rounded-lg sm:h-64 xl:h-80 2xl:h-96">
                                <!-- Item 1 -->
                                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                                    <span
                                        class="absolute top-1/2 left-1/2 text-2xl font-semibold text-white -translate-x-1/2 -translate-y-1/2 sm:text-3xl dark:text-gray-800">First
                                        Slide</span>
                                    <img class="h-full w-full object-cover"
                                        src="https://news.mogi.vn/wp-content/uploads/2020/03/tim-phong-tro.jpg"
                                        class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2"
                                        alt="...">
                                </div>
                                <!-- Item 2 -->
                                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                                    <img class="h-full w-full object-cover"
                                        src="https://timtro.vn/images/2021/08/tim-tro.jpg"
                                        class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2"
                                        alt="...">
                                </div>
                                <!-- Item 3 -->
                                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                                    <img class="h-full w-full object-cover"
                                        src="https://pt123.cdn.static123.com/images/2021/02/22/cho-thue-phong-tro_1613975723.jpg"
                                        class="block absolute top-1/2 left-1/2 w-full -translate-x-1/2 -translate-y-1/2"
                                        alt="...">
                                </div>
                            </div>
                            <!-- Slider indicators -->
                            <div class="flex absolute bottom-5 left-1/2 z-30 space-x-3 -translate-x-1/2">
                                <button type="button" class="w-3 h-3 rounded-full" aria-current="false"
                                    aria-label="Slide 1" data-carousel-slide-to="0"></button>
                                <button type="button" class="w-3 h-3 rounded-full" aria-current="false"
                                    aria-label="Slide 2" data-carousel-slide-to="1"></button>
                                <button type="button" class="w-3 h-3 rounded-full" aria-current="false"
                                    aria-label="Slide 3" data-carousel-slide-to="2"></button>
                            </div>
                            <!-- Slider controls -->
                            <button type="button"
                                class="flex absolute top-0 left-0 z-30 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none"
                                data-carousel-prev>
                                <span
                                    class="inline-flex justify-center items-center w-8 h-8 rounded-full sm:w-10 sm:h-10 bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
                                    <svg class="w-5 h-5 text-white sm:w-6 sm:h-6 dark:text-gray-800" fill="none"
                                        stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M15 19l-7-7 7-7"></path>
                                    </svg>
                                    <span class="hidden">Previous</span>
                                </span>
                            </button>
                            <button type="button"
                                class="flex absolute top-0 right-0 z-30 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none"
                                data-carousel-next>
                                <span
                                    class="inline-flex justify-center items-center w-8 h-8 rounded-full sm:w-10 sm:h-10 bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
                                    <svg class="w-5 h-5 text-white sm:w-6 sm:h-6 dark:text-gray-800" fill="none"
                                        stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M9 5l7 7-7 7"></path>
                                    </svg>
                                    <span class="hidden">Next</span>
                                </span>
                            </button>
                        </div>
                        <p class="mt-[24px]">Hợp đồng hiện tại: </p>
                        <div class="images border-2 p-2 rounded mt-[12px] grid grid-cols-4 gap-4">
                            <div class="col-span-2">Hợp đồng ID: 012984</div>
                            <div class="col-span-1 text-xs italic text-right">Ngày tạo: 1/1/2022</div>
                            <a href=""
                                class="inline-block col-span-1 text-xs text-center italic border-2 rounded italic decoration-rose-900">Danh
                                sách hóa đơn</a>

                            <div class="col-span-2 text-xs">Thời hạn: 1/1/2022 - 1/7/2022</div>
                            <div class="col-span-2 text-xs italic text-right">Trạng thái: Đã kết thúc</div>
                            <div class="col-span-4 text-xs">Người cho thuê: Nguyễn Văn An</div>
                            <div class="col-span-4 text-xs">Người thuê: Trần Văn Bình</div>
                            <div class="col-span-2 text-xs">Tiền đặt cọc: 14.000.000 VNĐ</div>
                            <div class="col-span-2 text-xs">Giá hằng tháng: 7.000.000 VNĐ</div>
                            <div class="col-span-4 text-xs">Nội dung: Chẳng cần lo ngại đường xa vì xung quanh đã có rất
                                nhiều
                                tiện ích bao gồm : Siêu thị Bách hóa xanh, điện máy Nguyễn Kim, chợ Ông Địa Đại học Bách
                                Khoa HCM Nhà thi đấu Phú Thọ, trường đua Phú Thọ, công viên Văn hóa Đầm Sen
                            </div>
                            <button class="col-span-4 text-right">Đã ký tên</button>
                        </div>
                        <a href="" class="mt-2 inline-block px-4 py-2 border-2 rounded">Xem tất cả hợp đồng</a>
                    </div>

                    <div class="col-span-7 border-4 p-4 border-2 rounded mt-[24px]">
                        <div class="grid grid-cols-2 gap-8">
                            <div class="shadow-lg rounded text-center p-2 bg-red-300">Loại Phòng: Bình Dân
                            </div>
                            <button class="shadow-lg rounded text-center p-2 bg-red-300">Chỉnh sửa thông tin cho loại
                                phòng này</button>
                        </div>
                        <div class="grid grid-cols-3 py-4">
                            <div class="shadow-lg rounded text-center py-2 px-4 bg-red-300 w-fit">Giá: 2.000.000</div>
                            <div class="shadow-lg rounded text-center py-2 px-4 bg-red-300 w-fit">Diện tích: 20m</div>
                            <div class="shadow-lg rounded text-center py-2 px-4 bg-red-300 w-fit">Số người tối đa: 5
                            </div>
                        </div>
                        <div class="border-2 rounded p-4 text-sm">Chẳng cần lo ngại đường xa vì xung quanh đã có rất
                            nhiều tiện
                            ích bao gồm
                            :

                            Siêu thị Bách hóa xanh, điện máy Nguyễn Kim, chợ Ông Địa
                            Đại học Bách Khoa HCM
                            Nhà thi đấu Phú Thọ, trường đua Phú Thọ, công viên Văn hóa Đầm Sen
                        </div>
                        <div class="mt-5 w-96 shadow-lg rounded text-center p-2 bg-red-300">Số
                            người hiện
                            tại: 4
                        </div>
                        <div class="mt-[20px]">
                            <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                    <thead
                                        class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                        <tr>
                                            <th scope="col" class="px-6 py-3 text-center">
                                                Tên
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-center">
                                                Ngày sinh
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-center">
                                                SĐT
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-center">
                                                Chủ phòng
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                                <span class="sr-only">Chỉnh sửa</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="text-center bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="Nguyễn Văn An" />
                                            </td>
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="1/1/2000" />
                                            </td>
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="0987654321" />
                                            </td>
                                            <td class="p-4">
                                                <select class="border-none text-xs text-center w-full px-2">
                                                    <option value="">YES</option>
                                                    <option value="">NO</option>
                                                </select>
                                            </td>
                                            <td class="p-4 text-right">
                                                <a href="#"
                                                    class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Cập
                                                    nhật</a>
                                            </td>
                                        </tr>
                                        <tr class="text-center bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="Nguyễn Văn An" />
                                            </td>
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="1/1/2000" />
                                            </td>
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="0987654321" />
                                            </td>
                                            <td class="p-4">
                                                <select class="border-none text-xs text-center w-full px-2">
                                                    <option value="">YES</option>
                                                    <option value="">NO</option>
                                                </select>
                                            </td>
                                            <td class="p-4 text-right">
                                                <a href="#"
                                                    class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Cập
                                                    nhật</a>
                                            </td>
                                        </tr>
                                        <tr class="text-center bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="Nguyễn Văn An" />
                                            </td>
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="1/1/2000" />
                                            </td>
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="0987654321" />
                                            </td>
                                            <td class="p-4">
                                                <select class="border-none text-xs text-center w-full px-2">
                                                    <option value="">YES</option>
                                                    <option value="">NO</option>
                                                </select>
                                            </td>
                                            <td class="p-4 text-right">
                                                <a href="#"
                                                    class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Cập
                                                    nhật</a>
                                            </td>
                                        </tr>
                                        <tr class="text-center bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="Nguyễn Văn An" />
                                            </td>
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="1/1/2000" />
                                            </td>
                                            <td class="p-4">
                                                <input type="text" class="border-none w-full text-center text-xs p-1"
                                                    value="0987654321" />
                                            </td>
                                            <td class="p-4">
                                                <select class="border-none text-xs text-center w-full px-2">
                                                    <option value="">YES</option>
                                                    <option value="">NO</option>
                                                </select>
                                            </td>
                                            <td class="p-4 text-right">
                                                <a href="#"
                                                    class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Cập
                                                    nhật</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
    <script src="js/chart.js"></script>

</body>

</html>
