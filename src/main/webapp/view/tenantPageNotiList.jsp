<%-- 
    Document   : tenantPageNotiList
    Created on : Jun 21, 2022, 8:40:37 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang người thuê - Thông báo</title>

        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/tenant-page.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">

    </head>
    <body>
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] h-[calc(100vh-80px)]">

                <!-- Breadcrumb -->
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
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <div class="content mt-[20px] flex justify-between grid grid-cols-2 gap-[20px]">
                    <!-- Notification list -->
                    <div class="noti-list flex flex-col justify-between h-[calc(100vh-225px)] overflow-y-auto">
                        <c:forEach var="notification" items="${requestScope.notificationList}">
                            <div class="card noti-item w-full h-fit bg-[#fff] p-5 flex flex-col justify-between mb-[20px]">
                                <div class="noti-item-header flex justify-between items-center mb-[20px]">
                                    <div class="text-[18px] font-bold text-[#2A3C46]">
                                        <h3>${notification.createdDate}</h3>
                                    </div>
                                </div>
                                <div class="noti-content text-[14px] font-normal text-[#597187] text-justify">
                                    <p class="">${notification.content}</p>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <!-- End Notification list -->
                    <c:if test = "${requestScope.contract ne null}">
                        <form method = "post" action="/sakura/tenant/notifications" class="card send-request h-[400px] bg-[#fff] p-5 overflow-hidden">
                            <input type="hidden" name="query" value="sendRequest"/>
                            <label for="message" class="block mb-[20px] text-[17px] font-medium text-gray-900">Gửi yêu cầu đến chủ nhà</label>
                            <textarea id="message" rows="4"
                                      class="block mb-[20px] p-3 w-full h-[250px] text-[15px] text-gray-900 bg-gray-50 rounded border border-gray-300 focus:ring-0 focus:border focus:border-[#17535B]"
                                      placeholder="Nhập nội dung của bạn..." name = "description"></textarea>

                            <button type="submit"
                                    class="float-right px-8 py-2 bg-[#17535B] rounded flex justify-center items-center text-[#fff] font-medium text-[15px] hover:bg-[#13484F]">Gửi <i class="bi bi-send-fill ml-[5px]"></i></button>
                        </form>
                    </c:if>
                </div>

            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>
    </body>
</html>
