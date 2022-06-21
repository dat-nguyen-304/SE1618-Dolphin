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
        <style>
            .hostel-row, .invoice-list {
                display: none;
            }
        </style>
    </head>
    <body>
        <h1>Rented tenant page</h1>
        <h2>Contract list</h2>
        <div>
            <c:forEach var="row" items="${requestScope.invoiceMap}">
                <p><strong>Contract ID: ${row.key.contractID}</strong></td><td>&emsp;FROM: ${row.key.startDate} TO: ${row.key.endDate}&emsp;<button onclick="toggleRow(${row.key.contractID})">Expand</button>&emsp;<a href="#">Contract Detail</a></p>
                    <div class="hostel-row" id="hostel-row-contract${row.key.contractID}">
                        <p><strong>&emsp;Hostel name:</strong> ${row.key.hostel.hostelName}</td><td>&emsp; Address: ${row.key.hostel.streetAddress}, ${row.key.hostel.district.districtName}, ${row.key.hostel.district.province.provinceName}&emsp;<a href="#">Hostel Detail</a></p>
                        <p><strong>&emsp;Invoice list</strong>&emsp;<button onclick="toggleInvoiceList(${row.key.contractID})">Expand</button></p>
                        <div class="invoice-list" id="invoice-list-contract${row.key.contractID}">
                            <c:forEach var="invoice" items="${row.value}">
                                <p>
                                    <strong>&emsp;&emsp;Invoice ID: ${invoice.invoiceID}</strong>&emsp;&emsp;from ${invoice.startDate} to ${invoice.endDate}&emsp;
                                    <span>
                                        <form style="display: inline-block" action="/sakura/invoice/invoiceDetail" method="post">
                                            <input type="hidden" name="invoiceID" value="${invoice.invoiceID}">
                                            <button type="submit">Invoice Detail</button>
                                        </form>
                                    </span>
                                </p>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
        </div>

        <!--        <div>
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
    </div>-->
        <!--<a href="/sakura/tenant/invoice">Invoice List</a>-->
    </body>

    <script src="../assets/javascript/jquery.js"></script>
    <script>
        function toggleRow(contractID) {
            if ($("#hostel-row-contract" + contractID).css("display") === 'none') $("#hostel-row-contract" + contractID).css("display", "block");
            else $("#hostel-row-contract" + contractID).css("display", "none");
        }
        
        function toggleInvoiceList(contractID) {
            if ($("#invoice-list-contract" + contractID).css("display") === 'none') $("#invoice-list-contract" + contractID).css("display", "block");
            else $("#invoice-list-contract" + contractID).css("display", "none");
        }
    </script>
</html>
