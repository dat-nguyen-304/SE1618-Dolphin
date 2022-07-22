<%-- 
    Document   : roomDetail
    Created on : Jun 9, 2022, 3:55:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sakura - Phòng ${requestScope.room.roomNumber}</title>
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
        <div class="w-[60%] mx-auto my-[100px]">
            <div class="room-detail-title mb-[30px]">
                <h2 class="text-[25px] font-medium text-[#17535B]">Chi tiết</h2>
            </div>
            <div class="flex w-full h-[500px]">
                <div class="w-3/5 h-full rounded">
                    <c:if test = "${requestScope.roomType.imgList.size() > 0}">
                        <img class="w-full h-full object-fill object-center"
                             src="${requestScope.roomType.imgList.get(0)}">
                    </c:if>
                    <c:if test = "${requestScope.roomType.imgList.size() == 0}">
                        <img class="w-full h-full object-fill object-center"
                             src="../assets/images/hostel-list-images/empty_img.jpg">
                    </c:if>
                </div>
                <div class="w-2/5 pl-[30px]">
                    <div class="mb-[20px]">
                        <span class="text-[#597187] text-[25px] font-light">  Nhà trọ ${requestScope.roomType.hostel.hostelName} </span>
                    </div>
                    <div class="room-info mb-[30px]">
                        <div class="grid grid-cols-4">
                            <div class="text-[#597187] font-light text-[15px]">Loại phòng</div>
                            <div class="col-span-3 text-[#40576C] font-semibold text-[15px]">${requestScope.roomType.roomTypeName}</div>
                        </div>
                        <div class="grid grid-cols-4">
                            <div class="text-[#597187] font-light text-[15px]">Diện tích</div>
                            <div class="col-span-3 text-[#40576C] font-semibold text-[15px]">${requestScope.roomType.area}m<sup>2</sup></div>
                        </div>
                    </div>
                    <div class="room-desc mb-[30px] pt-[10px] border-t">
                        <p class="leading-relaxed mb-[30px] text-[#597187] text-[15px] font-semibold">${requestScope.roomType.description}</p>
                    </div>
                    <div class="room-price mb-[30px] pt-[30px] border-t">
                        <p class="title-font text-center font-medium text-[18px] text-[#40576C]">${requestScope.roomType.advertisedPrice / 1000000 } triệu / tháng</p>
                    </div>
                    <c:if test="${sessionScope.currentUser == null}">
                        <h1>Bạn vui lòng đăng nhập để có thể thuê phòng</h1>
                        <form action="/sakura/access/login" method="post" class="mt-[20px] w-full m-0 p-0">
                            <button type="submit" name="action" class="w-full text-white text-[20px] font-semibold bg-[#17535B] border-0 py-2 px-6 focus:outline-none hover:bg-[#13484F] rounded">Đăng nhập ngay</button>
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.account.role == 2}">
                        <h1>Bạn không thể thuê phòng với tài khoản chủ nhà trọ</h1>
                        <form action="/sakura/access/login" method="post" class="mt-[20px] w-full m-0 p-0">
                            <input type="hidden" name ="roomTypeID" value ="${requestScope.roomType.roomTypeID}">
                            <button type="submit" name="logout" value="true" class="w-full text-white text-[20px] font-semibold bg-[#17535B] border-0 py-2 px-6 focus:outline-none hover:bg-[#13484F] rounded">Đăng nhập bằng tải khoản khác</button>
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.account.role == 1}">
                        <form action="/sakura/hostel/sendRentalRequest" method="post" class="w-full m-0 p-0">
                            <input type="hidden" name="roomTypeID" value ="${requestScope.roomType.roomTypeID}">
                            <button type="submit" name="action" class="w-full text-white text-[20px] font-semibold bg-[#17535B] border-0 py-2 px-6 focus:outline-none hover:bg-[#13484F] rounded">Đặt thuê</button>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>   
    </body>
</html>