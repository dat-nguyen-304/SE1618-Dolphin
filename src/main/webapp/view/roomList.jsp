<%-- 
    Document   : roomList
    Created on : Jun 9, 2022, 1:18:11 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sakura - Các loại phòng</title>
        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

        <!--Favicon-->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- Icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!--CSS-->
        <c:choose>
            <c:when test="${sessionScope.currentUser != null}">
                <link rel="stylesheet" href="../assets/css/header-user-search-address.css">
            </c:when>
            <c:otherwise>
                <link rel="stylesheet" href="../assets/css/header-guest-search-address.css">
            </c:otherwise>
        </c:choose>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.currentUser != null}">
                <header id="header-section" class="stick z-[100]">
                    <%@include file="headerUserSearchAddress.jsp" %>
                </header>
            </c:when>
            <c:otherwise>
                <header id="header-section" class="stick z-[100]">
                    <%@include file="headerGuestSearchAddress.jsp" %>
                </header>
            </c:otherwise>
        </c:choose>
        <div class="w-[60%] mx-auto my-[90px]">
            <div class="flex flex-col rounded w-full h-full">
                <div class="head border-b flex justify-between px-8 py-3">
                    <h2 class="text-[25px] font-bold text-[#17535B] ">Danh sách phòng</h2>
                </div>
                <div class="room-list px-8 py-3 overflow-y-auto">
                    <c:forEach items = "${roomTypeList}" varStatus = "ptr">
                        <h3 class="text-[20px] font-semibold text-[#ee7b35]">Loại ${roomTypeList[ptr.index].roomTypeName}</h3>
                        <c:set var = "hasRoom" scope = "page" value = "0"></c:set>
                            <div class="mx-auto grid grid-cols-3 pt-6 gap-6 pb-8 mb-8 border-b-2 border-dashed">
                            <c:forEach items = "${roomList[ptr.index]}" var = "room" varStatus = "ptr2"> <!-- 2 vong for -->
                                <c:choose>
                                    <c:when test = "${(roomList[ptr.index][ptr2.index].status == 0) and (roomList[ptr.index][ptr2.index].currentNumberOfResidents < roomTypeList[ptr.index].maxNumberOfResidents)}">
                                        <form action = "/sakura/hostel/roomDetail" method = "post">
                                            <input type = "hidden" name = "roomID" value = "${roomList[ptr.index][ptr2.index].roomID}">
                                            <button type="submit" class="block m-0 room-item w-[280px] h-[120px] flex rounded bg-white shadow overflow-hidden cursor-pointer transition hover:-translate-y-[1px] hover:bg-[#fff2ea]">
                                                <div class="w-[40%] h-full relative">
                                                    <img class="w-full h-full object-cover" src="${roomTypeList[ptr.index].imgList.get(iterator)}" alt="" />
                                                </div>
                                                <div class="p-3 pr-0 relative">
                                                    <h2 class="text-left text-gray-900 text-xl font-bold mb-1">${roomList[ptr.index][ptr2.index].roomNumber}</h2>
                                                    <p class="text-left text-gray-400 font-medium text-sm mb-5">${roomTypeList[ptr.index].area}m<sup>2</sup></p>
                                                    <h3 class="text-[#ee7b35] text-base font-bold align-text-bottom">${roomTypeList[ptr.index].advertisedPrice / 1000000} triệu / tháng</h3>
                                                    <c:choose> 
                                                        <c:when test="${roomList[ptr.index][ptr2.index].status == 0}">
                                                            <p class="absolute right-0 top-3 text-gray-400 font-medium text-sm">Trống</p>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </button>
                                        </form>
                                        <c:set var = "hasRoom" scope = "page" value = "1"></c:set>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                            <c:if test = "${pageScope.hasRoom == 0}">
                                <p>Hết phòng</p>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>      
    </body>
</html>