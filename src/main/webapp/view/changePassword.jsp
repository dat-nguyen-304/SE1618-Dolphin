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
                    <a href="/sakura/hostel/list">Go back</a>
                    <h2>${sessionScope.currentUser.fullname}</h2>
                    <form action="#" method="post">
                        <table>
                            <tr>
                                <td>Current password</br><input type="password" name="currentPwd" required></td>
                            </tr>
                            <tr>
                                <td>New password</br>
                                    <input type="password" name = "newPwd" required id="newPwd" onchange="checkNewPwd()">
                                    <p id="newPwdError"></p>
                                </td>
                            </tr>
                            <tr>
                                <td>Confirm new password</br>
                                    <input type="password" name = "newPwdConfirm" required id="cf-newPwd" onchange="checkConfirmPwd()">
                                    <p id="cf-newPwdError"></p>
                                </td>
                            </tr>
                            <tr><td><input type="submit"value="Change password" onclick="return validate()"></td></tr>
                        </table>
                    </form>
                </section>
            </c:when>
            <c:otherwise>
                <h2>Login to see this page</h2>
                <a href="/sakura/access/login">Go to login page</a>
            </c:otherwise>
        </c:choose>
        <script src="../assets/javascript/jquery.js"></script>
        <script>
            function checkNewPwd() {
                $("#newPwdError").html("");
                $("#newPwdError").css("border-bottom", "");
                if ($("#newPwd").val().trim().length < 8) {
                    $("#newPwdError").html("Mật khẩu phải có ít nhất 8 kí tự!");
                    $("#newPwdError").css("color", "red");
                }
            }
            function checkConfirmPwd() {
                $("#cf-newPwdError").html("");
                $("#cf-newPwdError").css("border-bottom", "");
                console.log("checking confirm password");
                if ($("#newPwd").val().trim() !== $("#cf-newPwd").val().trim()) {
                    $("#cf-newPwdError").html("Xác nhận lại mật khẩu!");
                    $("#cf-newPwdError").css("color", "red");
                }
            }
            function validate() {
                var newPwd = $("#newPwd").val().trim();
                var cfNewPwd = $("#cf-newPwd").val().trim();
                if (!newPwd || $("#newPwdError").html() !== "") {
                    $("#newPwd").css("border-bottom", "1.5px solid red");
                    $("#newPwd").focus();
                    return false;
                } else if (!cfNewPwd || $("#cf-newPwdError").html !== "") {
                    $("#cf-newPwd").css("border-bottom", "1.5 solid red");
                    $("#cf-newPwd").focus();
                    return false;
                }
            }
        </script>
    </body>
</html>
