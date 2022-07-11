<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Doanh thu toàn bộ nhà trọ ${sessionScope.currentHostel.hostelName}</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css"/>

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/datetime/1.1.2/js/dataTables.dateTime.min.js"></script>
    </head>
    <body>
        <table id="revenue-list-table" class="display nowrap" style="width:100%">
            <thead>
            <th>Thời gian</th>
            <th>Tổng doanh thu</th>
            <th></th>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.revenueDate}" var = "revDate" varStatus="ptr">
                <tr>
                    <td>${revDate}</td>
                    <td>${requestScope.revenueValue[ptr.index]}</td>
                    <td>
                        <form action = "/sakura/landlord/revenue-detail" method = "post">
                            <button type = "submit" name = "revenueDate" value = "${revDate}">
                                Xem chi tiết
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>

    </table>
</body>
<script>
    $(document).ready(function () {
        $('#revenue-list-table').DataTable({
                dom: 'Bfrtip',
                language: {
                    "emptyTable": "Không có dữ liệu!",
                    "zeroRecords": "Không có kết quả phù hợp!",
                    "infoEmpty": "Hiển thị 0 kết quả",
                    "info": "Hiển thị _START_ - _END_ của _TOTAL_ kết quả",
                    "infoFiltered": "",
                    search: "Tìm kiếm",
                    paginate: {
                        previous: '<i class="bi bi-caret-left-fill"></i>',
                        next: '<i class="bi bi-caret-right-fill"></i>'
                    },
                    aria: {
                        paginate: {
                            previous: 'Trước',
                            next: 'Sau'
                        }
                    }
                },
                buttons: [
                    {
                        extend: 'excelHtml5',
                        text: 'Xuất file excel <i class="bi bi-filetype-xlsx text-[20px]"></i>',
                        exportOptions: {
                            columns: [0, 1]
                        }
                    }
                ],

                "pageLength": 10, // items per page
                info: true
            });    });
</script>
</html>
