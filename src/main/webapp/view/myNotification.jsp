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
                <td>Nội dung</td>
                <td>Ngày gửi</td>
                <td>Trạng thái</td>
                <td>Người gửi</td>
            </tr>
            <c:forEach items = "${notiList}" var = "noti">
                <tr>
                    <td>${noti.content}</td>
                    <td>${noti.createdDate}</td>
                    <c:choose>
                        <c:when test="${noti.status == 0}">
                            <td>Unread</td></c:when> 
                        <c:when test="${noti.status == 1}">
                            <td>Read</td></c:when> 
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>