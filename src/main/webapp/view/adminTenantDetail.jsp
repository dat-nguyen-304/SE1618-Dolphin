<%-- 
    Document   : adminTenantProfile
    Created on : Jul 6, 2022, 8:53:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Thông tin người thuê ${requestScope.tenant.fullname}</title>
        <%@include file="../view/assets.jsp" %>
        <link rel="stylesheet" href="../assets/css/admin-page.css">
        <link rel="stylesheet" href="../assets/css/admin-tenant-magement.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
    </head>
    <body>
        <%@include file="../view/headerAdminDashboard.jsp" %>
        <%@include file="../view/navbarAdminDashboard.jsp" %>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] ">

                <div class="head-control flex justify-between">
                    <!-- Breadcrumb -->
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center">
                                <a href="#" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                    </path>
                                    </svg>  
                                    Người thuê ${requestScope.tenant.fullname}
                                </a>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px] h-[calc(100vh-225px)]">
                    <div class="flex space-x-[40px]">
                        <div class="w-[300px] h-[300px] overflow-hidden bg-slate-50 shadow p-4 rounded">
                            <img class="w-full h-full object-cover" src="${not empty requestScope.tenant.account.avatar ? requestScope.tenant.account.avatar : "../assets/images/user-avatars/no_ava.jpg"}">
                        </div>
                        <div class="grid grid-cols-6 gap-[8px] w-1/3">
                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Tên đầy đủ</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    ${requestScope.tenant.fullname}
                                </p>
                            </div>
                            <div class="col-span-4 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Tên tài khoản</p>
                                <p class="text-[18px] text-slate-700 font-bold">${requestScope.tenant.account.username}</p>
                            </div>

                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Ngày tạo</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    ${requestScope.tenant.account.registrationDate}
                                </p>
                            </div>
                            <div class="col-span-4 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Email</p>
                                <p class="text-[18px] text-slate-700 font-bold">${requestScope.tenant.account.email}</p>
                            </div>

                            <div class="col-span-2 mb-[10px]">
                                <p class="text-[14px] text-slate-400 font-normal">Số điện thoại</p>
                                <p class="text-[18px] text-slate-700 font-bold">
                                    ${requestScope.tenant.phone}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="../view/footerDashboard.jsp" %>
        </div>
    </body>
</html>
