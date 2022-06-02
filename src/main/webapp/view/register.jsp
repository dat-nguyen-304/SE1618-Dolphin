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
        <script src="../assets/javascript/jquery.js"></script>
        <title>Register Account</title>
    </head>
    <body>
        <h2>Sign up</h2>
        <form action="../MainController" method="post">
            <table>
                <tr><td><input type="text" placeholder="Fullname" name="fullname" required></td></tr>
                <tr><td><input type="text" placeholder="Username" name="username" required id="username" onchange="checkUsername()"><span id="usernameResult"></span></td></tr>
                <tr><td><input type="text" placeholder="Email" name="email" required id="email" onchange="checkEmail()"><span id="emailResult"></span></td></tr>
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
        <script>
            function checkUsername() {
                console.log("line 29");
                jQuery.ajax({
                    type: 'POST',
                    data: 'username=' + $("#username").val(),
                    url: '../CheckUsernameServlet',
                    success: function (result) {
                        $("#usernameResult").html(result);
                        console.log('Success 36');
                    },
                    error: function () {
                        console.log('Error 39');
                    },
                    complete: function (result) {
                        console.log('Complete 41');
                    }
                });
                console.log("line 42");
            }
            
            function checkEmail() {
                console.log("line 58");
                jQuery.ajax({
                    type: 'POST',
                    data: 'email=' + $("#email").val(),
                    url: '../CheckEmailServlet',
                    success: function (result) {
                        $("#emailResult").html(result);
                        console.log('Success 65');
                    },
                    error: function () {
                        console.log('Error 68');
                    },
                    complete: function (result) {
                        console.log('Complete 71');
                    }
                });
                console.log("line 74");
            }
        </script>
    </body>
</html>
