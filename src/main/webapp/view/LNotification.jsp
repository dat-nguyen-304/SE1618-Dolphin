<%-- 
    Document   : LNotification
    Created on : Jun 26, 2022, 5:10:29 PM
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
        <title>Trang chủ nhà - Thông báo</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/LNotification.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
        
        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    </head>

    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <p class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd" />
                                </svg>
                                Thông báo
                            </p>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <div class="content mt-[20px] flex justify-between grid grid-cols-1 gap-[20px] ">
                    <!-- Notification list -->
                    <div class="noti-list flex flex-col justify-between h-[740px] overflow-y-auto">
                        <div class="card noti-item w-[60%] mx-auto h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
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
                        <div class="card noti-item w-[60%] mx-auto h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
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
                        <div class="card noti-item w-[60%] mx-auto h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
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
                        <div class="card noti-item w-[60%] mx-auto h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
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
                        <div class="card noti-item w-[60%] mx-auto h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
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
                        <div class="card noti-item w-[60%] mx-auto h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
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
                        <div class="card noti-item w-[60%] mx-auto h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
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
                                    Quis cursus arcu condimentum vel. Eleifend eu sit tristique eros.</p>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

            <%@include file="../view/footerDashboard.jsp" %>

        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>


    </body>

</html>