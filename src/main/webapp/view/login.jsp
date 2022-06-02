<%-- 
    Document   : login
    Created on : May 31, 2022, 9:58:12 PM
    Author     : Vu Thien An - SE160296
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h2>${requestScope.successNotification}</h2>
        <h2>Sign In</h2>
        <section>
            <form action="../MainController" method="post">
                <table>
                    <tr><td><input type="text" name="username" placeholder="Username" required=""></td></tr>
                    <tr><td><input type="password" name="password" placeholder="Password" required=""></td></tr>
                    <tr><td><a href>Forgot Password?</a></td></tr>
                    <tr><td><input type="submit" value="Login" name="action"></td></tr>
                </table>
            </form>
        </section>
        <p>${requestScope.error}</p>
    </body>
</html>
