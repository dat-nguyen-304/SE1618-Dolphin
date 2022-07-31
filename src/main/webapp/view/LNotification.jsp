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
        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/LNotification.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
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

                <div class="content mt-[20px] w-full">
                    <!-- Notification list -->
                    <div class="noti-list flex flex-col justify-between space-y-[20px] h-[740px] overflow-y-auto">
                        <c:forEach items="${requestScope.notificationList}" var="notification">
                            <div class="card noti-item w-[60%] mx-auto h-fit bg-[#fff] p-5 flex flex-col justify-between">
                                <h3 class="rating text-[14px] font-bold text-slate-400 mb-[10px]"><span class="date">${notification.createdDate}</span></h3>
                                <div class="noti-content text-[17px] font-semibold text-slate-700 text-justify">
                                    <p class="">${notification.content}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <%@include file="../view/footerDashboard.jsp" %>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            let allDateCells = $(".date");
            for (let i = 0; i < allDateCells.length; i++) {
                let node = allDateCells[i];
                let isoDate = node.childNodes[0].nodeValue;
                node.childNodes[0].nodeValue = isoDate.split('-').reverse().join('/');
            }
        });
    </script>
</html>