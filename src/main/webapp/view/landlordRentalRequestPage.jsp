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
            <h1>Yêu cầu xem phòng</h1>
            <tr>
                <td>Tên khách thuê</td>
                <td>Số điện thoại</td>
                <td>Email</td>
                <td>Loại phòng</td>
                <td>Thời gian gửi</td>
                <td></td>
            </tr>
            <c:forEach items = "${requestScope.bookingList}" var="booking">
                <tr>
                    <td>${booking.tenant.fullname}</td>
                    <td>${booking.tenant.phone}</td>
                    <td>${booking.tenant.account.email}</td>
                    <td>${booking.roomType.roomTypeName}</td>
                    <td>${booking.createdDate}</td>
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
        <table>
            <h1>Lời mời thuê nhà đã gửi</h1>
            <tr>
                <td>Tên người nhận</td>
                <td>Số điện thoại</td>
                <td>Email</td>
                <td>Thời gian gửi</td>
                <td></td>
            </tr>
            <c:forEach items = "${requestScope.invitationList}" var="invitation">
                <tr>
                    <td>${invitation.tenant.fullname}</td>
                    <td>${invitation.tenant.phone}</td>
                    <td>${invitation.tenant.account.email}</td>
                    <td>${invitation.createdDate}</td>
                    <td>
                        <form method = "post" action="/sakura/landlord/contract-detail">
                            <input type ="hidden" name ="contractId" value ="${invitation.bookingRequestID}">
                            <button type = "submit">
                                Xem thông tin hợp đồng
                            </button>
                        </form>    
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
