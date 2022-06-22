<%-- 
    Document   : invoiceDetail.jsp
    Created on : Jun 18, 2022, 5:05:47 PM
    Author     : Vu Thien An - SE160296
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice Detail</title>
    </head>
    <body>
        <h2>Hóa đơn ID: ${requestScope.invoice.invoiceID}</h2>
        <h2>Nhà trọ: ${requestScope.invoice.contract.room.roomType.hostel.hostelName}</h2>
        <h2>Phòng: ${requestScope.invoice.contract.room.roomNumber}</h2>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Từ</th>
                        <th>Đến</th>
                        <th>Tổng hóa đơn</th>
                        <th>Trạng thái</th>
                    </tr> 
                </thead>
                <tbody>
                    <tr>
                        <td>${requestScope.invoice.startDate}</td>
                        <td>${requestScope.invoice.endDate}</td>
                        <td>${requestScope.invoice.totalPrice}</td>
                        <td>${(requestScope.invoice.status == 1) ? "Chưa thanh toán" : (requestScope.invoice.status == 2) ? "Đã thanh toán" : "Quá hạn"}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <h2>Chi tiết</h2>
            <table>
                <tr>
                    <th>Tên</th>
                    <th>Đơn giá</th>
                    <th>Đơn vị</th>
                    <th>Số đầu</th>
                    <th>Số cuối</th>
                    <th>Lượng dùng</th>
                    <th>Tổng tiền</th>
                </tr>
                <c:forEach var="row" items="${requestScope.serviceMap}">
                    <tr>
                        <td>${row.key.serviceName}</td>
                        <td>${row.key.serviceFee}</td>
                        <td>${row.key.unit}</td>
                        <td>${row.value.startValue}</td>
                        <td>${row.value.endValue}</td>
                        <td>${row.value.endValue - row.value.startValue}</td>
                        <td>${(row.value.endValue - row.value.startValue) * row.key.serviceFee}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body> 
</html>
