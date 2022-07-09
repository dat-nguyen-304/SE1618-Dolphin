<%-- 
    Document   : adminTenantProfile
    Created on : Jul 6, 2022, 8:53:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Quản lý người thuê</title>

        <!--Favicon-->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">

        <!--CSS-->
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/admin-page.css">

        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>
    </head>
    <body>
        <div>
            <img src="${requestScope.landlord.account.avatar == null ? "Noimg" : requestScope.landlord.account.avatar}">
            <p>Tên đầy đủ: ${requestScope.landlord.fullname}</p>
            <p>Tên tài khoản: ${requestScope.landlord.account.username}</p>
            <p>Ngày tạo: ${requestScope.landlord.account.registrationDate}</p>
            <p>Email: ${requestScope.landlord.account.email}</p>
            <p>Số điện thoại: ${requestScope.landlord.phone}</p>
        </div>
        <div>
            <h2>Danh sách nhà trọ</h2>
            <table id = "landlord-detail-hostel-table">
                <thead>
                    <tr>
                        <th>ID Nhà trọ</th>
                        <th>Tên nhà trọ</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.hostelList}" var = "hostel">
                    <tr>
                        <td>${hostel.hostelID}</td>
                        <td>${hostel.hostelName}</td>
                        <td>
                            <form action = "/sakura/admin/hostel-detail" method = "post">
                                <button name = "hostelID" value = "${hostel.hostelID}" type = "submit">Xem chi tiết</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach> 
                </tbody>
            </table>
        </div>
    </body>
    <script>
        $(document).ready(function () {

            $('#landlord-detail-hostel-table').DataTable({
                "pageLength": 4, //so luong item per page
                "info": false, //false thi` khong show so luong entry hien tai
                "lengthChange": false // false thi khong cho thay doi so luong entry per page
            });
        });
    </script>
</html>