<%-- 
    Document   : tenantPageInvoiceList
    Created on : Jun 21, 2022, 8:35:09 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý phòng thuê - Danh sách hoá đơn</title>

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

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
                                <a class="text-[13px] font-normal text-[#40576C] rounded px-3 py-2 hover:bg-[#F3F8FA]"
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
                           class="menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
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
                        <a type="button"
                           class="parent-active flex items-center p-2 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 group hover:bg-[#F3F3F3] hover:text-[#17535B]"
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
                        </a>
                        <ul id="dropdown-example" class="py-2 space-y-2">
                            <li>
                                <a href="tenantPageInvoiceList.jsp"
                                   class="active menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Danh
                                    sách hoá đơn</a>
                            </li>
                            <li>
                                <a href="tenantPageInvoiceDetail.jsp"
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
                    <form class="w-full flex justify-between items-center" action="/sakura/invoice/list" method="post">

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
                                       placeholder="Tìm theo mã hoá đơn...">
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
                            <select name="sortByStatus">
                                <option value="0">Trạng thái</option>
                                <option value="1">Chưa thanh toán</option>
                                <option value="2">Đã thanh toán</option>
                                <option value="3">Qúa hạn</option>
                            </select>
                            <!--<div class="dropdown-status mr-[20px]">-->
                            <!--                                <button id="dropdownDefault" data-dropdown-toggle="dropdown-status"
                                                                    class="text-[#17535B] bg-[#fff] hover:bg-[#F6F8FA] font-[14px] rounded text-sm px-4 py-2.5 text-center inline-flex items-center border border-[#17535B]"
                                                                    type="button">Trạng thái <svg class="w-4 h-4 ml-2" fill="none" stroke="currentColor"
                                                                                          viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                      d="M19 9l-7 7-7-7">
                                                                </path>
                                                                </svg>
                                                            </button>-->

                            <!--                                <div id="dropdown-status" class="z-10 hidden bg-white rounded shadow"
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
                            
                                                            </div>-->
                        </div>


                        <!-- Submit button -->
                        <button type="submit"
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
                                    Ngày đầu
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Ngày cuối
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
                            <c:forEach var="invoice" items="${requestScope.invoiceList}">
                                <tr class="bg-white border-b hover:bg-gray-50">
                                    <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                        <a href="#" class="hover:text-[#288D87] hover:underline">${invoice.invoiceID}</a>
                                    </td>
                                    <td class="px-6 py-4 date">
                                        ${invoice.startDate}
                                    </td>
                                    <td class="px-6 py-4 date">
                                        ${invoice.endDate}
                                    </td>
                                    <td class="px-6 py-4 date">
                                        ${invoice.dueDate}
                                    </td>
                                    <td class="px-6 py-4 money">
                                        ${invoice.totalPrice} đ
                                    </td>
                                    <td class="px-6 py-4">
                                        <span
                                            class="bg-blue-100 text-blue-800 text-[14px] font-normal px-2.5 py-0.5 rounded">
                                            ${(invoice.status == 1) ? "Chưa thanh toán" : (invoice.status == 2) ? "Đã thanh toán" : "Quá hạn"}
                                        </span>

                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <form action="/sakura/invoice/detail" method="post">
                                            <input type="hidden" name="invoiceID" value="${invoice.invoiceID}">
                                            <button type="submit"><i class="bi bi-eye-fill"></i></button>
                                        </form>
                                        <!--                                            <a href="#" class="font-medium text-[#17535B]">
                                                                                        <i class="bi bi-eye-fill"></i>
                                                                                    </a>-->
                                        <a href="#" class="font-medium text-[#17535B]">
                                            <i class="bi bi-file-earmark-spreadsheet"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Pagination + Export excel -->
                    <div class="table-extend flex justify-between">

                        <!-- Pagination -->
                        <c:if test="${requestScope.invoiceList.size() > 0}">
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
                        </c:if>
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

    <!-- chartJS -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="../assets/javascript/chart-tenant-page.js"></script>
    <script src="../assets/javascript/jquery.js"></script>
    <script src="../assets/javascript/moment.js"></script>
    <script>
        $(document).ready(function () {
            var allDateCells = $(".date");
            var allMoneyCells = $(".money");

            for (var i = 0; i < allDateCells.length; i++) {
                var node = allDateCells[i];
                var isoDate = node.childNodes[0].nodeValue;
//                    var date = moment().toString();
//                    console.log(date);
//                    console.log(date.format("dd/MM/YYYY"));
//                var vnDate = new Moment(isoDate);
                node.childNodes[0].nodeValue = isoDate.split('-').reverse().join(' / ');
            }

            for (var i = 0; i < allMoneyCells.length; i++) {
                var node = allMoneyCells[i];
                var money = node.childNodes[0].nodeValue;
                node.childNodes[0].nodeValue = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
        });
    </script>
</body>
</html>
