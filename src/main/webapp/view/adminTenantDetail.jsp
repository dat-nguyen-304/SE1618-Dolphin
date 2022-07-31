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
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

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
                                    Quản lí chủ nhà
                                </a>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="card bg-[#fff] p-[20px] mt-[20px]">
                    <div>
                        <img src="${not empty requestScope.tenant.account.avatar ? requestScope.tenant.account.avatar : "../assets/images/user-avatars/no_ava.jpg"}">
                        <p>Tên đầy đủ: ${requestScope.tenant.fullname}</p>
                        <p>Tên tài khoản: ${requestScope.tenant.account.username}</p>
                        <p>Ngày tạo: ${requestScope.tenant.account.registrationDate}</p>
                        <p>Email: ${requestScope.tenant.account.email}</p>
                        <p>Số điện thoại: ${requestScope.tenant.phone}</p>
                    </div>
                </div>
            </div>
            <%@include file="../view/footerDashboard.jsp" %>
        </div>
    </body>
</html>
