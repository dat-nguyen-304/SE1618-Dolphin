<%-- 
    Document   : replace-contract
    Created on : Jul 9, 2022, 3:02:48 PM
    Author     : Admin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.dolphin.hostelmanagement.DTO.Contract"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
    </head>
    <body>
        <!-- UI giống y hệt add contract z, nhưng phải tách vì 2 cái không chung be được -->
        <h1>Thay hợp đồng mới cho phòng ${requestScope.oldContract.room.roomNumber}, nhà trọ ${requestScope.oldContract.hostel.hostelName}</h1>
        <form action = "/sakura/contract/replace-contract" method = "post">
            <p>Giá thuê theo tháng</p>
            <input type ="number" name="rentalFeePerMonth" placeholder="Giá thuê theo tháng" value = "${requestScope.oldContract.rentalFeePerMonth}"><br>
            <p>Tiền đặt cọc</p>
            <input type ="number" name="deposit" placeholder="Tiền đặt cọc" value = "${requestScope.oldContract.deposit}"/><br>
            <p>Mô tả</p>
            <textarea type ="text" id="description" name="description" maxlength="200" 
                      rows="4" width="250">${requestScope.oldContract.description}</textarea>
            <p>Ngày bắt đầu</p>
            <input date-rangepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom" type ="text" name="startDate" value = "${requestScope.startDate}"/><br>
            <p>Ngày kết thúc</p>
            <input date-rangepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom" type ="text" name="endDate" value = "${requestScope.endDate}"/><br>
            <p>Số tháng ở(dự kiến)</p>
            <input type="number" name="duration" placeholder="Số tháng ở (dự kiến)" value = "${requestScope.oldContract.duration}"/><br>
            <input type="hidden" name="queryType" value="replace"/>
            <input type="hidden" name="tenantID" value="${requestScope.oldContract.tenant.account.accountID}"/>
            <input type="hidden" name="contractID" value="${requestScope.oldContract.contractID}"/>
            <button type ="submit">Lưu hợp đồng</button>
        </form>
    </body>
</html>
