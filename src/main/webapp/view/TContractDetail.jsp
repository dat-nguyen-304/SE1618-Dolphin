<%-- 
    Document   : TContractDetail
    Created on : Jul 9, 2022, 10:15:05 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.dolphin.hostelmanagement.DTO.Contract"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        Contract contract = (Contract) request.getAttribute("contract");
        Date createdTime = contract.getCreatedDate();
        Date startTime = contract.getStartDate();
        Date endTime = contract.getEndDate();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String createdDate = formatter.format(createdTime);
        String startDate = formatter.format(startTime);
        String endDate = formatter.format(endTime);
    %>
    <body>
        <h1>Contract detail:</h1>
        <p>Tên nhà trọ: ${requestScope.contract.hostel.hostelName}</p>
        <p>Số phòng: ${requestScope.contract.room.roomNumber}</p>
        <p>Tên chủ nhà: ${requestScope.contract.landlord.fullname}</p>
        <p>Thời hạn: <%=startDate%> - <%=endDate%></p>
        <p>Tiền thuê hàng tháng: ${requestScope.contract.rentalFeePerMonth}</p>
        <p>Tiền đặt cọc: ${requestScope.contract.deposit}</p>
        <p>Mô tả thêm: ${requestScope.contract.description}</p>
        <c:choose>
            <c:when test = "${requestScope.contract.status == 0}"><p>Trạng thái: Hết hiệu lực</p></c:when>
            <c:when test = "${requestScope.contract.status == 1}"><p>Trạng thái: Còn hiệu lực</p></c:when>
            <c:when test = "${requestScope.contract.status == 2}"><p>Trạng thái: Chờ xác nhận</p></c:when>
        </c:choose>
</body>
</html>
