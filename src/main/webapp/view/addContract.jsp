<%-- 
    Document   : addContract
    Created on : Jun 26, 2022, 7:56:48 PM
    Author     : Admin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm hợp đồng</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- <link rel="stylesheet" href="app.css"> -->
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
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">
            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">
                <div class="general-info flex justify-between mt-[20px]">
                    <div class="card w-fit h-fit bg-[#fff] p-5 flex flex-col justify-between">
                        <h2 class="text-[20px] font-medium text-[#17535B]">Thêm hợp đồng thuê nhà với người thuê là <span class="font-bold">${requestScope.bookingRequest.tenant.fullname}</span></h2>
                        <form action = "/sakura/contract/add-contract" method = "post" class="mt-[40px]">
                            <div class="flex items-center">
                                <label for="rooms" class="block mb-2 text-sm font-medium text-gray-900">Chọn phòng</label>
                                <select id="rooms" class="ml-[20px] w-[100px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded focus:ring-[#17535B] focus:border-[#17535B] block w-full p-2.5">
                                    <c:forEach items="${requestScope.roomList}" var="room">
                                        <c:if test="${room.status != 2}">
                                            <option value="${room.roomID}">${room.roomNumber}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mt-[40px] flex items-center">
                                <div class="mr-[20px]">
                                    <label for="rentalFeePerMonth" class="block mb-2 text-sm font-medium text-gray-900">Giá thuê theo tháng</label>
                                    <input type="number" name="rentalFeePerMonth" id="rentalFeePerMonth" class="w-[250px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded focus:ring-[#17535B] focus:border-[#17535B] block w-full p-2.5 " placeholder="" required>
                                </div>
                                <div class="">
                                    <label for="deposit" class="block mb-2 text-sm font-medium text-gray-900">Tiền đặt cọc</label>
                                    <input type="number" name="deposit" id="deposit" class="w-[250px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded focus:ring-[#17535B] focus:border-[#17535B] block w-full p-2.5" placeholder="" required>
                                </div>
                            </div>

                            <div class="mt-[20px]">
                                <label for="description" class="block mb-2 text-sm font-medium text-gray-900">Mô tả / Thông tin bổ sung</label>
                                <textarea type ="text" id="description" name="description" rows="4" width="250" class="w-[520px] block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded border border-gray-300 focus:ring-[#17535B] focus:border-[#17535B]" placeholder=""></textarea>
                            </div>

                            <div class="mt-[20px] flex items-center">
                                <div class="mr-[20px]">
                                    <p class="block mb-2 text-sm font-medium text-gray-900">Ngày bắt đầu</p>
                                    <input type ="date" name="startDate" class="w-[250px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded focus:ring-[#17535B] focus:border-[#17535B] block w-full p-2.5"/><br>
                                </div>
                                <div>
                                    <p class="block mb-2 text-sm font-medium text-gray-900">Ngày kết thúc</p>
                                    <input type ="date" name="endDate" class="w-[250px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded focus:ring-[#17535B] focus:border-[#17535B] block w-full p-2.5"/><br>
                                </div>
                            </div>
                            <div class="mt-[20px]">
                                <label for="deposit" class="block mb-2 text-sm font-medium text-gray-900">Số tháng ở (dự kiến)</label>
                                <input type="number" name="duration" id="deposit" class="w-[250px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded focus:ring-[#17535B] focus:border-[#17535B] block w-full p-2.5" placeholder="" required>
                            </div>

                            <button type ="submit" class="mt-[40px] w-full h-[50px] rounded bg-[#17535B] hover:bg-[#13484F] text-[#fff] flex items-center justify-center">Thêm hợp đồng</button>
                            
<!--                            <input type ="number" name="rentalFeePerMonth" placeholder="Giá thuê theo tháng"/><br>
                            <input type ="number" name="deposit" placeholder="Tiền đặt cọc"/><br>
                            <input type ="text" name="description" height="20" width ="20" placeholder="Miêu tả"/><br>
                            <p>Ngày bắt đầu</p>
                            <input type ="date" name="startDate"/><br>
                            <p>Ngày kết thúc</p>
                            <input type ="date" name="endDate"/><br>
                            <input type="number" name="duration" placeholder="Số tháng ở (dự kiến)"/><br>
                            <input type="hidden" name="queryType" value="add"/>
                            <input type="hidden" name="tenantID" value="${requestScope.bookingRequest.tenant.account.accountID}"/>
                            <input type="hidden" name="bookingRequestID" value="${requestScope.bookingRequest.bookingRequestID}"/>
                            <button type ="submit">Thêm hợp đồng</button>-->
                        </form>
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

    </body>
</html>
