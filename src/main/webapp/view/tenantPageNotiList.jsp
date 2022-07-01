<%-- 
    Document   : tenantPageNotiList
    Created on : Jun 21, 2022, 8:40:37 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý phòng thuê - Thông báo</title>

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
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>

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
                                <path fill-rule="evenodd"
                                      d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                                      clip-rule="evenodd" />
                                </svg>
                                Thông báo
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

                <div class="content mt-[20px] flex justify-between grid grid-cols-2 gap-[20px]">
                    <!-- Notification list -->
                    <div class="noti-list flex flex-col justify-between">
                        <div class="card noti-item w-full h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
                            <div class="noti-item-header flex justify-between items-center mb-[20px]">
                                <div class="text-[18px] font-bold text-[#2A3C46]">
                                    <h3>Chủ nhà</h3>
                                </div>
                                <div class="text-[14px] font-normal text-[#597187] flex items-center">
                                    <h3 class="rating mr-[3px]">14:02 - 25/04/2022</h3>
                                </div>
                            </div>
                            <div class="noti-content text-[14px] font-normal text-[#597187] text-justify">
                                <p class="">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat elit odio
                                    scelerisque duis quam enim pellentesque. Lorem pellentesque adipiscing pulvinar dolor.
                                    Quis
                                    cursus arcu condimentum vel. Eleifend eu sit tristique eros.</p>
                            </div>
                        </div>
                        <div class="card noti-item w-full h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
                            <div class="noti-item-header flex justify-between items-center mb-[20px]">
                                <div class="text-[18px] font-bold text-[#2A3C46]">
                                    <h3>Hệ thống</h3>
                                </div>
                                <div class="text-[14px] font-normal text-[#597187] flex items-center">
                                    <h3 class="rating mr-[3px]">21:17 - 05/03/2022</h3>
                                </div>
                            </div>
                            <div class="noti-content text-[14px] font-normal text-[#597187] text-justify">
                                <p class="">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat elit odio
                                    scelerisque duis quam enim pellentesque.</p>
                            </div>
                        </div>
                        <div class="card noti-item w-full h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
                            <div class="noti-item-header flex justify-between items-center mb-[20px]">
                                <div class="text-[18px] font-bold text-[#2A3C46]">
                                    <h3>Chủ nhà</h3>
                                </div>
                                <div class="text-[14px] font-normal text-[#597187] flex items-center">
                                    <h3 class="rating mr-[3px]">08:49 - 01/03/2022</h3>
                                </div>
                            </div>
                            <div class="noti-content text-[14px] font-normal text-[#597187] text-justify">
                                <p class="">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat elit odio
                                    scelerisque duis quam enim pellentesque. Lorem pellentesque adipiscing pulvinar dolor.
                                    Quis
                                    cursus arcu condimentum vel. Eleifend eu sit tristique eros.</p>
                            </div>
                        </div>
                        <div class="card noti-item w-full h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
                            <div class="noti-item-header flex justify-between items-center mb-[20px]">
                                <div class="text-[18px] font-bold text-[#2A3C46]">
                                    <h3>Chủ nhà</h3>
                                </div>
                                <div class="text-[14px] font-normal text-[#597187] flex items-center">
                                    <h3 class="rating mr-[3px]">14:02 - 25/04/2022</h3>
                                </div>
                            </div>
                            <div class="noti-content text-[14px] font-normal text-[#597187] text-justify">
                                <p class="">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat elit odio
                                    scelerisque duis quam enim pellentesque. Lorem pellentesque adipiscing pulvinar dolor.
                                    Quis
                                    cursus arcu condimentum vel. Eleifend eu sit tristique eros.</p>
                            </div>
                        </div>
                        <div class="card noti-item w-full h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
                            <div class="noti-item-header flex justify-between items-center mb-[20px]">
                                <div class="text-[18px] font-bold text-[#2A3C46]">
                                    <h3>Chủ nhà</h3>
                                </div>
                                <div class="text-[14px] font-normal text-[#597187] flex items-center">
                                    <h3 class="rating mr-[3px]">14:02 - 25/04/2022</h3>
                                </div>
                            </div>
                            <div class="noti-content text-[14px] font-normal text-[#597187] text-justify">
                                <p class="">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat elit odio
                                    scelerisque duis quam enim pellentesque. Lorem pellentesque adipiscing pulvinar dolor.
                                    Quis
                                    cursus arcu condimentum vel. Eleifend eu sit tristique eros.</p>
                            </div>
                        </div>

                    </div>
                    <!-- End Notification list -->
                    <form class="card send-request h-[300px] bg-[#fff] p-5 overflow-hidden">
                        <input hidden type=text" name=tenantID" value="101" />
                        <input hidden type="text" name=roomID" value="101" />

                        <label for="message" class="block mb-[20px] text-[17px] font-medium text-gray-900">Gửi yêu cầu đến chủ nhà</label>
                        <textarea id="message" rows="4"
                                  class="block mb-[20px] p-3 w-full text-[15px] text-gray-900 bg-gray-50 rounded border border-gray-300 focus:ring-0 focus:border focus:border-[#17535B]"
                                  placeholder="Nhập nội dung của bạn..."></textarea>

                        <button type="button"
                                class="float-right px-8 py-2 bg-[#17535B] rounded flex justify-center items-center text-[#fff] font-medium text-[15px] hover:bg-[#13484F]">Gửi <i class="bi bi-send-fill ml-[5px]"></i></button>
                    </form>

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
        <script src="../assets/javascript/chart-tenant-page.js"></script>
    </body>
</html>
