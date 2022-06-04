<%-- 
    Document   : homepage
    Created on : Jun 3, 2022, 1:22:27 PM
    Author     : Vu Thien An - SE160296
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
        <h2>Hostel List</h2>

        <section>
            No. hostels per page
            <form action="MainController" method="post">
                <input type="hidden" value="${param.txtsearch}" name="txtsearch">
                <input type="hidden" value="${param.searchby}" name="searchby">
                <select name="displayOption">
                    <option value="all" <% if (request.getParameter("displayOption") != null && request.getParameter("displayOption").equals("all")) { %> selected <% } %>>All</option>
                    <option value="5" <% if (request.getParameter("displayOption") != null && request.getParameter("displayOption").equals("5")) { %> selected <% }%>>5</option>
                </select>
                <input type="submit" name="action" value="Change Display">
            </form>
        </section>

        <section>
            <c:forEach var="hostel" items="${requestScope.hostelList}">
                <table>
                    <tr><td colspan="2"><strong>${hostel.hostelName}</strong></td></tr>
                    <tr><td>Address</td><td>${hostel.streetAddress} ${hostel.ward.wardName} ${hostel.ward.district.districtName}</td></tr>
                    <tr><td>Price</td><td>${hostel.minPrice}VND - ${hostel.maxPrice}VND</td></tr>
                    <tr><td>${hostel.minArea}m2,${hostel.maxArea}m2</td></tr>
                    <tr><td>Rating: ${hostel.rating}</td></tr>
                </table>
            </c:forEach>     
        </section>

        <section>
            <div class="pageNumber">
                <table>
                    <th>
                        <c:forEach var="page" items="${requestScope.pages}">
                            <td><a href="MainController?action=Change%20Display&displayOption=${param.displayOption}&pageNumber=${page + 1}&searchby=${param.searchby}&txtsearch=${param.txtsearch}">${page + 1}</a></td>
                        </c:forEach>
                    </th>
                </table>
            </div>
        </section>
    </body>
</html>
