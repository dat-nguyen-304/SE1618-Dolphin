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
            <h1>Yêu cầu giữ chỗ</h1>
            <tr>
                <td>Tên nhà trọ</td>
                <td>Loại phòng</td>
                <td>Thời gian gửi</td>
                <td></td>
            </tr>
            <c:forEach items = "${requestScope.bookingList}" var="booking">
                <tr>
                    <td>${booking.roomType.hostel.hostelName}</td>
                    <td>${booking.roomType.roomTypeName}</td>
                    <td>${booking.createdDate}</td>
                    <td>
                        <form method = "post" action="/sakura/hostel/detail">
                            <input type ="hidden" name ="hostelId" value ="${booking.roomType.hostel.hostelID}">
                            <button type = "submit">
                                Xem thông tin nhà trọ
                            </button>
                        </form>    
                    </td>

                </tr>
            </c:forEach>
        </table>
        <table>
            <h1>Lời mời thuê nhà</h1>
            <tr>
                <td>Tên nhà trọ</td>
                <td>Loại phòng</td>
                <td>Thời gian gửi</td>
                <td></td>
            </tr>
            <c:forEach items = "${requestScope.invitationList}" var="invitation">
                <tr>
                    <td>${invitation.roomType.hostel.hostelName}</td>
                    <td>${invitation.roomType.roomTypeName}</td>
                    <td>${invitation.createdDate}</td>
                    <td>
                        <form method = "post" action="/sakura/hostel/detail">
                            <input type ="hidden" name ="hostelId" value ="${invitation.roomType.hostel.hostelID}">
                            <button type = "submit">
                                Xem thông tin nhà trọ
                            </button>
                        </form>    
                    </td>
                    <td>
                        <form method = "post" action = "/sakura/tenant/rentalRequestList">
                            <input type ="hidden" name ="contractID" value ="${invitation.roomType.roomTypeID}">
                            <button type = "submit">
                                Xem thông tin hợp đồng
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method = "post" action = "/sakura/tenant/rentalRequestList">
                            <input type ="hidden" name ="queryType" value ="accept">
                            <input type ="hidden" name ="contractID" value ="${invitation.bookingRequestID}">
                            <button type = "submit">
                                Đồng ý
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method = "post" action = "/sakura/contract/detail">
                            <input type ="hidden" name ="queryType" value ="refuse">
                            <input type ="hidden" name ="contractID" value ="${invitation.roomType.roomTypeID}">
                            <button type = "submit">
                                Từ chối
                            </button>
                        </form>
                    </td>

                </tr>
            </c:forEach>
        </table>
    </body
</html>
