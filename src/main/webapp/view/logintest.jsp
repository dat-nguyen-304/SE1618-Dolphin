<%-- 
    Document   : logintest
    Created on : Jun 5, 2022, 6:47:12 PM
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
        <section>
            <form action="../MainController" method="post">
                <table>
                    <tr>
                        <td>Username</br><input type="text" name="username" required></td>
                    </tr>
                    <tr>
                        <td>New password</br><input type="password" name = "password" required></td>
                    </tr>
                    <tr><td>
                            <input type="submit" name ="action" value = "Login"></td>
                    </tr>
                </table>
            </form>
        </section>
    </body>
</html>
