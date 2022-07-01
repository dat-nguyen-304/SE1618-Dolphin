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
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Thêm hợp đồng thuê nhà với người thuê là 
            ${requestScope.bookingRequest.tenant.fullname}</h2>
        <form action = "/sakura/contract/add-contract" method = "post">
            <label for="rooms">Choose a room:</label>
            <select name="roomID">
                <c:forEach items="${requestScope.roomList}" var="room">
                    <c:if test="${room.status != 2}">
                        <option value="${room.roomID}">${room.roomNumber}</option>
                    </c:if>
                </c:forEach>
            </select><br>
            <input type ="number" name="rentalFeePerMonth" placeholder="Giá thuê theo tháng"/><br>
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
            <button type ="submit">Thêm hợp đồng</button>
        </form>
    </body>
</html>
