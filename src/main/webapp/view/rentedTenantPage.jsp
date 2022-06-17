<%-- 
    Document   : tenantPage
    Created on : Jun 16, 2022, 4:28:31 PM
    Author     : Vu Thien An - SE160296
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tenant Page</title>
    </head>
    <body>
        <h1>Rented tenant page</h1>
        <div>
            <h2>Hostel</h2>
            <h3>${requestScope.hostel.hostelName}</h3>
            <p>${hostel.streetAddress} ${hostel.district.districtName} ${hostel.district.province.provinceName}</p>
        </div>
        <div>
            <h2>Landlord</h2>
            <h3>Landlord: ${requestScope.landlord.fullname}</h3>
        </div>
        <div>
            <h2>Residents</h2>
            <c:forEach var="resident" items="${requestScope.residentList}">
                <h3>${resident.fullname}</h3>
            </c:forEach>
        </div>
        <div>
            <h2>Invoices in current contract</h2>
            <c:forEach var="invoice" items="${requestScope.invoiceList}">
                <h3>ID ${invoice.invoiceID} Price ${invoice.totalPrice}</h3>
            </c:forEach>
        </div>
    </body>
</html>
