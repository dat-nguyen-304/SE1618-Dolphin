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
                <td>Loại phòng</td>
                <td>Diện tích</td>
                <td>Giá</td>
                <td>Trạng thái</td>
                <td>picture</td>
            </tr>
            <c:forEach items = "${roomTypeList}" varStatus = "ptr">
                <tr>
                    <c:forEach items = "${roomList[ptr.index]}" var = "room" varStatus = "ptr2"> <!-- 2 vong for -->
                        <c:if test = "${(roomList[ptr.index][ptr2.index].status != 2)}">
                            <c:if test = "${(roomList[ptr.index][ptr2.index].currentNumberOfResidents < roomTypeList[ptr.index].maxNumberOfResidents)}">
                        <tr>
                            <td></td>
                            <td>${roomList[ptr.index][ptr2.index].roomNumber}</td>
                            <td><c:out value = "${roomTypeList[ptr.index].roomTypeName}"/></td>
                            <td><c:out value = "${roomTypeList[ptr.index].area}"/></td>
                            <td><c:out value = "${roomTypeList[ptr.index].advertisedPrice}"/></td>
                            <c:choose>
                                <c:when test="${roomList[ptr.index][ptr2.index].status == 0}">
                                    <td>Trống</td></c:when> 
                                <c:when test="${roomList[ptr.index][ptr2.index].status == 1}">
                                    <td>Sắp</td></c:when>
                            </c:choose>
                            <td>
                                <div class="hostel-images">
                                    <div class="carousel-inner">
                                        <c:if test="${roomTypeList[ptr.index].imgList.size() > 0}">
                                            <c:forEach begin="0" end="0" var="iterator">
                                                <c:if test="${iterator == 0}">
                                                    <div class="carousel-item active">
                                                    </c:if>
                                                    <img class="d-block w-100" height = "30" width = "30" src="${roomTypeList[ptr.index].imgList.get(iterator)}">
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <form action = "/sakura/hostel/roomDetail" method = "post">
                                    <input type = "hidden" name = "roomID" value = "${roomList[ptr.index][ptr2.index].roomID}">
                                    <button type ="submit">See detail</button>
                                </form>
                            </td>
                        </tr>
                        </c:if>
                    </c:if>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</body>
</html>