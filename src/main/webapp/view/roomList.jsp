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
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <td></td>
                <td>Số phòng</td>
                <td>Diện tích</td>
                <td>Trạng thái</td>
                <td>Giá</td>
            </tr>
            <c:forEach items = "${roomList}" var = "roomType">
                <tr>
                    <td>Dạng phòng</td>
                    <c:forEach items = "${roomType}" var = "room">
                    <tr>
                        <td></td>
                        <td>${room.roomNumber}</td>
                        <td>${room.area}</td>
                        <c:choose>
                            <c:when test="${room.status == 1}">
                                <td>Trống</td></c:when> 
                            <c:when test="${room.status == 2}">
                                <td>Sắp</td></c:when>
                            <c:otherwise>
                                <td>Đủ</td></c:otherwise> 
                        </c:choose>
                        <td>${room.advertisedPrice}</td>
                        <td>
                            <form action = "/sakura/hostel/roomDetail" method = "post">
                                <input type = "hidden" name = "roomID" value = "${room.roomID}">
                                <button type ="submit">See detail
                            </form></td>
                    </tr>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</body>
</html>