<%-- 
    Document   : success
    Created on : Jul 1, 2022, 10:46:39 AM
    Author     : Vu Thien An - SE160296
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv = "refresh" content = "99999999999999999999; url = http://localhost:8080/sakura/invoice/new" />
        <title>Trang chủ nhà - Thêm hoá đơn</title>
        <%@include file="../view/assets.jsp" %>
        <link rel="stylesheet" href="../assets/css/LAddInvoice.css">

        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
    </head>
    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px] h-[calc(100vh-80px)]">
                <div class="w-full h-full flex flex-col justify-center items-center">
                    <h1 class="text-[35px] font-bold text-emerald-400 mb-[50px]">Lưu hóa đơn thành công!${requestScope['javax.servlet.forward.request_uri']}</h1>
                    <h2 class="text-[25px] font-semibold text-slate-400 ">Bạn sẽ được chuyển đến trang thêm hóa đơn sau 3 giây.</h2>
                    <h2 class="text-[18px] font-medium text-slate-500 mt-[20px] mb-[40px]">Nếu trang không tự động chuyển, có thể nhấn vào nút dưới</h2>
                    <a href="/sakura/invoice/new" class="bg-[#288D87] hover:bg-[#1D837D] text-[#fff] px-[20px] py-[10px] rounded">Quay lại trang thêm hóa đơn</a>
                </div>
            </div>
            <%@include file="../view/footerDashboard.jsp" %>
        </div>

    </body>
</html>
