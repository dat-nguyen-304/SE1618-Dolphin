<%-- 
    Document   : changePassword
    Created on : Jun 5, 2022, 10:53:37 AM
    Author     : Admin
--%>

<%@page import="com.dolphin.hostelmanagement.DTO.Tenant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.currentUser != null}">
                <c:out value = "${requestScope.errorMessage}"/>
                <section>
                    <a href="MainController?action=userProfile.jsp">Go back</a>
                    <h2>${sessionScope.currentUser.fullname}</h2>
                    <form action="MainController" method="post">
                        <table>
                            <tr>
                                <td>Current password</br><input type="password" name="currentPwd" required></td>
                            </tr>
                            <tr>
                                <td>New password</br><input type="password" name = "newPwd" required></td>
                            </tr>
                            <tr>
                                <td>Confirm new password</br><input type="password" name = "newPwdConfirm" required></td>
                            </tr>
                            <tr><td><input type="submit" name="action" value="Change password"></td></tr>
                        </table>
                    </form>
                </section>
            </c:when>
            <c:otherwise>
                <h2>Login to see this page</h2>
                <a href="login.jsp">Go to login page</a>
            </c:otherwise>
        </c:choose>
    </body>
</html>
