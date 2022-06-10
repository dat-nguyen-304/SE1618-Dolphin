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
                <td></td>
                <td>Số phòng</td>
                <td>Diện tích</td>
                <td>Mô tả</td>
                <td>Số người tối đa</td>
                <td>Số người hiện tại</td>
            </tr>
            <tr>
                <td>${requestScope.room.roomID}</td>
                <td>${requestScope.room.area}</td>
                <td>${requestScope.room.description}</td>
                <td>${requestScope.room.maxNumberOfResident}</td>
                <td>${requestScope.room.currentNumberOfResident}</td>
            </tr>
        </table>
    </body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> f58930d3640dc0e20dc8de9837396ec6f4604c4c
