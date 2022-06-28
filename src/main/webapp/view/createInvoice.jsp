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
        <title>New Invoice</title>
    </head>
    <body>
        <h2>New Invoice</h2>
        <h3>Contract ID: ${requestScope.contract.contractID}&emsp;Hostel: ${requestScope.contract.room.roomType.hostel.hostelName}&emsp;Room number: ${requestScope.contract.room.roomNumber}&emsp;Tenant ID: ${requestScope.contract.tenant.account.accountID}</h3>
        <form>
            Từ: <input type="date" name="start">&emsp;Đến: <input type="date" name="end">
            <h4>Dịch vụ</h4>
            <table>
                <thead>
                    <th>Tên</th><th>Đơn giá</th><th>Đơn vị</th><th>Có dùng</th><th>Số đầu</th><th>Số cuối</th><th>Tổng</th>
                </thead>
                <c:forEach items="${requestScope.activeServices}" var="service">
                    <tr>
                        <td>${service.serviceName}</td>
                        <td><span id="serviceFee${service.serviceID}">${service.serviceFee}</span></td>
                        <td>${service.unit}</td>
                        <td><input type="checkbox" class="useCheckBox" checked="" onclick="enableInput(${service.serviceID})"></td>
                        <td><input type="text" name="" id="startInput${service.serviceID}" onchange="updateSum(${service.serviceID})"></td>
                        <td><input type="text" name="" id="endInput${service.serviceID}" onchange="updateSum(${service.serviceID})"></td>
                        <td><span class="rowSum" id="rowSum${service.serviceID}"></span></td>
                    </tr>
                </c:forEach>
                    <tr><td>Tổng dịch vụ: <span id="serviceSum"></span></td></tr>
                    <tr><td>Tiền phòng: <span id="rentalFee">${contract.rentalFeePerMonth}</span></td></tr>
                    <tr><td>Tổng hóa đơn: <span id="invoiceSum" style="color:red"></span></td></tr>
            </table>
            <button type="submit">Lưu</button>
            <button type="submit">Đăng</button>
        </form>
    </body>
    <script src="../assets/javascript/jquery.js"></script>
    <script>
        function enableInput(serviceID) {
            $("#startInput" + serviceID).val("");
            $("#endInput" + serviceID).val("");
            $("#rowSum" + serviceID).html("");
            if ($("#startInput" + serviceID).prop("disabled") === true) {
                $("#startInput" + serviceID).prop("disabled", false);
                $("#endInput" + serviceID).prop("disabled", false)
            } else {
                $("#startInput" + serviceID).prop("disabled", true);
                $("#endInput" + serviceID).prop("disabled", true);
            }
        }
        
        function updateSum(serviceID) {
            var sum = parseInt($("#endInput" + serviceID).val()) - parseInt($("#startInput" + serviceID).val());
//            console.log($("#serviceFee" + serviceID).html());
            sum = parseInt($("#serviceFee" + serviceID).html()) * parseInt(sum);
//            console.log(sum);
            $("#rowSum" + serviceID).html(sum);
            
            
            var allRowSum = $(".rowSum");
            var sumService = 0;
            for (var i = 0; i < allRowSum.length; i++) {
                var node = allRowSum[i];
                console.log($(node).html());
                sumService += parseInt($(node).html());
            }
            console.log("Sum service" + sumService);
            $("#serviceSum").html(sumService);
            $("#invoiceSum").html(sumService + parseInt($("#rentalFee").html()));
        }
    </script>
</html>
 