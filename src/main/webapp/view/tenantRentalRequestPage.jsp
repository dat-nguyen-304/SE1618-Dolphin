<%-- 
    Document   : tenantBookingRequestPage
    Created on : Jun 26, 2022, 8:48:08 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <td>Tên khách sạn</td>
                <td>Số phòng</td>
                <td>Thời gian gửi</td>
                <td></td>
            </tr>
            <c:forEach items = "${requestScope.bookingList}" var="booking">
                <tr>
                    <td>${booking.room.roomType.hostel.hostelName}</td>
                    <td>${booking.room.roomNumber}</td>
                    <td>${booking.createdDate}</td>
                    <td>
                        <form method = "post" action="/sakura/hostel/roomDetail">
                            <input type ="hidden" name ="roomID" value ="${booking.room.roomID}">
                            <button type = "submit">
                                Xem thông tin phòng
                            </button>
                    </form>    
                    </td>
                    
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
