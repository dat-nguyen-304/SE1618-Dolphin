<%-- 
    Document   : roomDetail
    Created on : Jun 9, 2022, 3:55:46 PM
    Author     : Admin
--%>

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
                <td>Số phòng</td>
                <td>Diện tích</td>
                <td>Giá phòng</td>
                <td>Loại phòng</td>
                <td>Mô tả</td>
                <td>Số người hiện tại</td>
                <td>Hình ảnh</td>
            </tr>
            <tr>
                <td>${requestScope.room.roomNumber}</td>
                <td>${requestScope.room.roomType.area}</td>
                <td>${requestScope.room.roomType.advertisedPrice}</td>
                <td>${requestScope.room.roomType.roomTypeName}</td>
                <td>${requestScope.room.roomType.description}</td>
                <td>${requestScope.room.currentNumberOfResidents}</td>
                <td>
                    <div class="hostel-images">
                        <div class="carousel-inner">
                            <c:if test="${requestScope.room.roomType.imgList.size() > 0}">
                                <c:forEach begin="0" end="0" var="iterator">
                                    <c:if test="${iterator == 0}">
                                        <div class="carousel-item active">
                                    </c:if>
                                    <img class="d-block w-100" height = "30" width = "30" src="${requestScope.room.roomType.imgList.get(iterator)}">
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </td>
                <td>
                    <form action = "/sakura/hostel/sendRentalRequest" method = "post">
                        <input type ="hidden" name ="hostelID" value ="${requestScope.room.roomType.hostel.hostelID}">
                        <input type ="hidden" name ="roomID" value ="${requestScope.room.roomID}">
                        <button type ="submit" name ="action">Đặt lịch xem phòng</button>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>