<%-- 
    Document   : landlordContractList
    Created on : Jun 23, 2022, 2:29:13 AM
    Author     : Vu Thien An - SE160296
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Landlord Contract List</title>
    </head>
    <body>
        <table>
            <thead>
                <th>Contract ID</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Hostel Name</th>
                <th>Room Number</th>
                <!--<th></th>-->
            </thead>
            <tbody>
                <c:forEach var="contract" items="${requestScope.contractList}">
                    <tr>
                        <td>${contract.contractID}</td>
                        <td>${contract.startDate}</td>
                        <td>${contract.endDate}</td>
                        <td>${contract.room.roomType.hostel.hostelName}</td>
                        <td>${contract.room.roomNumber}</td>
                        <td>
                            <form action="/sakura/invoice/new" method="post">
                                <input type="hidden" value="${contract.contractID}" name="contractID">
                                <button type="submit">New Invoice</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
