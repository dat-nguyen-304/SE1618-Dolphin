<%-- 
    Document   : adminTenantProfile
    Created on : Jul 6, 2022, 8:53:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <img src="${requestScope.tenant.account.avatar == null ? "Noimg" : requestScope.tenant.account.avatar}">
            <p>Tên đầy đủ: ${requestScope.tenant.fullname}</p>
            <p>Tên tài khoản: ${requestScope.tenant.account.username}</p>
            <p>Ngày tạo: ${requestScope.tenant.account.registrationDate}</p>
            <p>Email: ${requestScope.tenant.account.email}</p>
            <p>Số điện thoại: ${requestScope.tenant.phone}</p>
        </div>
    </body>
</html>
