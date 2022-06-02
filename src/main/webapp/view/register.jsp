<%-- 
    Document   : register
    Created on : May 31, 2022, 10:11:38 AM
    Author     : Vu Thien An - SE160296
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Account</title>
    </head>
    <body>
        <h2>Sign up</h2>
        <form action="../MainController" method="post">
            <table>
                <tr><td><input type="text" placeholder="Fullname" name="fullname" required></td></tr>
                <tr><td><input type="text" placeholder="Username" name="username" required></td></tr>
                <tr><td><input type="text" placeholder="Email" name="email" required></td></tr>
                <tr><td><input type="text" placeholder="Phone number" name="phone" required></td></tr>
                <tr><td><input type="password" placeholder="Password" name="password" required></td></tr>
                <tr><td><input type="password" placeholder="Confirm password" required></td></tr>
                <tr><td>Choose dob</td><td><input type="date" name="dob" value="" required></td></tr>
                <tr>
                    <td>
                        <input type="radio" id="tenant" name="role" value="1"><label for="tenant">Tenant</label>
                        <input type="radio" id="landlord" name="role" value="2"><label for="landlord">Landlord</label>
                    </td>
                </tr>
                <tr><td><input type="submit" name="action" value="Register"></td></tr>
            </table>
        </form>
        <p>${requestScope.warning}</p>
    </body>
</html>
