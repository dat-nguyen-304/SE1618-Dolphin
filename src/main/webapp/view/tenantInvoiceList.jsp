<%-- 
    Document   : tenantInvoiceList
    Created on : Jun 17, 2022, 9:59:48 PM
    Author     : Vu Thien An - SE160296
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice List</title>
    </head>
    <body>
        <h1>Invoice list</h1>
        <div>
            <h2>Invoices in current contract</h2>
            <c:forEach var="invoice" items="${requestScope.invoiceList}">
                <h3>ID ${invoice.invoiceID} Price ${invoice.totalPrice}</h3>
            </c:forEach>
        </div>
    </body>
</html>
