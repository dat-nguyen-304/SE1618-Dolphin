<%-- 
    Document   : userProfile
    Created on : May 31, 2022, 10:09:59 PM
    Author     : Vu Thien An - SE160296
--%>

<%@page import="com.dolphin.hostelmanagement.DTO.Tenant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
    </head>
    <body>

        <c:choose>
            <c:when test="${sessionScope.currentUser != null}">
                <a href ="MainController?action=ChangePasswordPage">Change password</a>
                <section>
                    <h2>${sessionScope.currentUser.fullname}</h2>
                    <form>
                        <table>
                            <tr>
                                <td>Name</br><input type="text" placeholder="${sessionScope.currentUser.fullname}" value="${sessionScope.currentUser.fullname}" name="fullname"></td>
                            </tr>
                            <tr>
                                <td>Username</br><input type="text" placeholder="${sessionScope.currentUser.account.username}" value="${sessionScope.currentUser.account.username}" readonly=""></td>
                            </tr>
                            <tr>
                                <td>Email</br><input type="text" placeholder="${sessionScope.currentUser.account.email}" value="${sessionScope.currentUser.account.email}" readonly=""></td>
                                <td>Phone</br><input type="text" placeholder="${sessionScope.currentUser.phone}" value="${sessionScope.currentUser.phone}" name="phone"></td>
                            </tr>
                            <tr><td><input type="submit" name="action" value="Save"></td></tr>
                        </table>
                    </form>
                </section>
                <a href="MainController?action=Logout">Logout</a>
            </c:when>
            <c:otherwise>
                <h2>Login to see this page</h2>
                <a href="login.jsp">Go to login page</a>
            </c:otherwise>
        </c:choose>
    </body>
</html>
