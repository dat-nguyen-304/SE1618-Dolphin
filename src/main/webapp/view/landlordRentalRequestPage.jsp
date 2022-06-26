<%-- 
    Document   : landlordRequestPage
    Created on : Jun 26, 2022, 2:21:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <td>Tên khách thuê</td>
                <td>Số điện thoại</td>
                <td>Email</td>
                <td>Tên phòng</td>
                <td>Thời gian gửi</td>
                <td></td>
            </tr>
            <c:forEach items = "${requestScope.bookingList}" var="booking">
                <tr>
                    <td>${booking.tenant.fullname}</td>
                    <td>${booking.tenant.phone}</td>
                    <td>${booking.tenant.account.email}</td>
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
                    <td>
                        <form method = "post" action="/sakura/landlord/rentalRequestList">
                            <input type ="hidden" name ="queryType" value ="accept"/>
                            <input type ="hidden" name ="bookingRequestID" value="${booking.bookingRequestID}"/>
                            <input type ="hidden" name ="hostelID" value="${requestScope.hostelID}">
                            <button type = "submit">
                                Đồng ý
                            </button>
                        </form>    
                    </td>
                    <td>
                        <form method = "post" action="/sakura/landlord/rentalRequestList">
                            <input type ="hidden" name ="queryType" value ="reject"/>
                            <input type ="hidden" name ="hostelID" value="${requestScope.hostelID}">
                            <input type ="hidden" name ="bookingRequestID" value="${booking.bookingRequestID}"/>
                            <button type = "submit">
                                Từ chối
                            </button>
                        </form>    
                    </td>

                </tr>
            </c:forEach>
        </table>
    </body>
</html>
