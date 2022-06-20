<%-- 
    Document   : createInvoice
    Created on : Jun 17, 2022, 5:10:24 PM
    Author     : Vu Thien An - SE160296
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Invoice</title>
    </head>
    <body>
        <h2>Invoice for Room ${requestScope.room.roomID}</h2>
        <form>
            <table>
                <tr>Rental Fee</tr>
                <tr>Utilities</tr>
                <c:forEach>
                    
                </c:forEach>
            </table>
        </form>
    </body>
</html>
