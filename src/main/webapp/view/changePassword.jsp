<%-- 
    Document   : changePassword
    Created on : Jun 5, 2022, 10:53:37 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page import="com.dolphin.hostelmanagement.DTO.Tenant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sakura - Đổi mật khẩu</title>

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

        <!-- Icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!--Favicon-->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!--CSS-->
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/register.css">
        <link rel="stylesheet" href="../assets/css/app.css">

        <!--Javascript-->
        <script src="../assets/javascript/jquery.js"></script>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.currentUser != null}">
                <!-- logo -->
                <div class="logo absolute z-10">
                    <div class="container px-6 py-5">
                        <div class="flex justify-center items-center">
                            <a href="/sakura"><img class="w-9 h-9" src="../assets/icons/logo_white.png" alt=""></a>
                        </div>
                    </div>
                </div>
                <!-- main section -->
                <div class="bg-slate-50 h-screen w-screen flex">
                    <!-- banner -->
                    <div class="w-2/5 relativee">
                        <div class="w-2/5 h-screen absolute z-[5] bg-black black opacity-80 flex flex-col justify-center items-center">
                            <h2 class="z-10 pt-9 text-white opacity-100 text-[50px] font-semibold">Be careful!</h2>
                            <p  class="z-10 pt-9 text-white opacity-100 text-[20px] font-extralight">Make sure that your password is secure enough</p>
                        </div>
                        <img class="w-2/5 h-screen absolute " src="../assets/images/bg8.jpg" alt="">
                    </div>

                    <!-- change password form -->
                    <div class="w-3/5 h-full pt-[4%] pb-[6%] px-[6%]">
                        <form class="login-form flex flex-col justify-center items-center w-full h-full" action="/sakura/account/changePassword" method="post" novalidate="">
                            <div class="form-header w-full h-14 text-center m-0 p-0 relative">
                                <h2 class="text-3xl text-[#FF6532] font-medium ">Thay đổi mật khẩu</h2>
                                <p>${requestScope.errorMessage}</p>
                            </div>
                            <ul class="item-list list-none w-[52%]">
                                <!--Current Password-->
                                <li class="item block relative z-0 w-full mb-7">
                                    <input type="password" id="current-password" name="currentPwd" placeholder=" " required
                                           class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200 pr-[36px]" />
                                    <p id="cur-password-error" class="warning font-light absolute right-0">${requestScope.warning}</p>
                                    <label for="current-password" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Mật khẩu hiện tại</label>
                                    <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-cur-password"></i>
                                </li>

                                <!--New Password-->
                                <li class="item block relative z-0 w-full mb-7">
                                    <input type="password" id="new-password" name="newPwd" placeholder=" " required onchange="checkNewPassword()"
                                           class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200 pr-[36px]" />
                                    <p id="new-password-error" class="warning font-light absolute right-0">${requestScope.warning}</p>
                                    <label for="new-password" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Mật khẩu mới<span class="font-extralight"> (ít nhất 8 kí tự)</span></label>
                                    <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-new-password"></i>
                                </li>

                                <!--Confirm password-->
                                <li class="item block relative z-0 w-full mb-8">
                                    <input type="password" id="cf-new-password" name="newPwdConfirm" placeholder=" " required onchange="checkConfirmPassword()"
                                           class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200 pr-[36px]" />
                                    <p id="cf-new-password-error" class="warning font-light absolute right-0">${requestScope.warning}</p>
                                    <label for="cf-new-password" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Xác nhận mật khẩu mới</label>
                                    <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-cf-password"></i>
                                </li>
                                <li class="mb-9">
                                    <button type="submit" name = "action" value="Change password" class="w-full h-1/5 mx-auto rounded px-5 py-3 min-w-max overflow-hidden shadow relative bg-[#17535B] text-white hover:bg-opacity-[95%]" onclick ="return validate()">
                                        Thay đổi mật khẩu
                                    </button>  
                                </li>
                            </ul>
                        </form>
                        <div class="backlink absolute bottom-10 right-10">
                            <a class="w-[40px] h-[40px] flex justify-center items-center border-2 border-[#17535B] rounded-full animate-pulse" href="#" onclick="history.back()">
                                <i class="bi bi-arrow-left text-[#17535B] text-2xl"></i>
                            </a>
                        </div>
                    </div>


                </div>
            </c:when>
            <c:otherwise>
                <h2>Login to see this page</h2>
                <a href="/sakura/access/login">Go to login page</a>
            </c:otherwise>
        </c:choose>
        <script src="../assets/javascript/jquery.js"></script>
        <script>
            // Toggle Password
            const toggleCurPassword = document.querySelector("#toggle-cur-password");
            const toggleNewPassword = document.querySelector("#toggle-new-password");
            const toggleCfPassword = document.querySelector("#toggle-cf-password");
            const curPassword = document.querySelector("#current-password");
            const newPassword = document.querySelector("#new-password");
            const cfPassword = document.querySelector("#cf-new-password");
            toggleCurPassword.addEventListener("click", function () {
                // toggle the type attribute
                const curType = curPassword.getAttribute("type") === "password" ? "text" : "password";
                curPassword.setAttribute("type", curType);
                // toggle the icon
                this.classList.toggle('bi-eye');
            });
            toggleNewPassword.addEventListener("click", function () {
                // toggle the type attribute
                const type = newPassword.getAttribute("type") === "password" ? "text" : "password";
                newPassword.setAttribute("type", type);
                // toggle the icon
                this.classList.toggle('bi-eye');
            });
            toggleCfPassword.addEventListener("click", function () {
                // toggle the type attribute
                const cfType = cfPassword.getAttribute("type") === "password" ? "text" : "password";
                cfPassword.setAttribute("type", cfType);
                // toggle the icon
                this.classList.toggle('bi-eye');
            });

            // Check Password
            function checkCurentPassword() {
                $("#cur-password-error").html("");
                console.log("Checking current password");
                if ($("#current-password").val().trim().length < 8) {
                    $("#cur-password-error").html("Mật khẩu phải có ít nhất 8 kí tự!");
                    $("#cur-password-error").css("color", "red");
                }
            }
            function checkNewPassword() {
                $("#new-password-error").html("");
                if ($("#new-password").val().trim().length < 8) {
                    $("#new-password-error").html("Mật khẩu phải có ít nhất 8 kí tự!");
                    $("#new-password-error").css("color", "red");
                }
                else $("#new-password-error").html("");
            }
            function checkConfirmPassword() {
                $("#cf-new-password-error").html("");
                console.log("checking confirm password");
                if ($("#new-password").val().trim() !== $("#cf-new-password").val().trim()) {
                    $("#cf-new-password-error").html("Không khớp!");
                    $("#cf-new-password-error").css("color", "red");
                }
                else $("#cf-new-password-error").html("");
            }
            function validate() {
                var newPwd = $("#new-password").val().trim();
                var cfNewPwd = $("#cf-new-password").val().trim();
                if (!newPwd || $("#new-password-error").html() !== "") {
                    $("#new-password").css("border-bottom", "1.5px solid red");
                    $("#new-password").focus();
                    //alert("wrong in pwd");
                    return false;
                } else if (!cfNewPwd || $("#cf-new-password-error").html() !== "") {
                    $("#cf-new-password").css("border-bottom", "1.5 solid red");
                    $("#cf-new-password").focus();
                    //alert($("#cf-new-password-error").html);
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
