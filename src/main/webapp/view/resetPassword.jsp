<%-- 
    Document   : resetPassword
    Created on : Jun 3, 2022, 8:16:05 AM
    Author     : Admin
--%>

<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action ="..\MainController" method ="post">
            <!--SE1618-Dolphin\src\main\java\com\dolphin\hostelmanagement\controller\MainController.java-->
            <table>
                <tr>
                    <td>Your account's email</td>
                    <td><input type = "text" name = "txtemail"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type = "submit" value = "Send verification to mail" name = "action"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
