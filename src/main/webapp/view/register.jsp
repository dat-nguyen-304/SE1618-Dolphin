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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakura - Register</title>

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

        <!-- Icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!--Favicon-->
        <link rel="shortcut icon" href="assets/icon/logo.png" type="image/x-icon">

        <!--CSS-->
        <!--<link rel="stylesheet" href="../assets/css/style.css">-->
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="stylesheet" href="assets/css/register.css">

        <!--Javascript-->
        <script src="assets/javascript/jquery.js"></script>

    </head>
    <body>
        <!-- logo -->
        <div class="logo absolute z-10">
            <div class="container px-6 py-5">
                <div class="flex justify-center items-center">
                    <img class="w-9 h-9" src="assets/icons/logo.png" alt="">
                </div>
            </div>
        </div>

        <!-- main section -->
        <div class="bg-slate-50 h-screen w-screen flex">
            <!-- banner -->
            <div class="w-2/5 relativee">
                <div class="w-2/5 h-screen absolute z-[5] bg-black black opacity-80 flex flex-col justify-center items-center">
                    <h2 class="z-10 pt-9 text-white opacity-100 text-[50px] font-semibold">Hello, Friend!</h2>
                    <p  class="z-10 pt-9 text-white opacity-100 text-[20px] font-extralight">Enter your personal details and start journey with us</p>
                </div>
                <img class="w-2/5 h-screen absolute " src="assets/images/bg2.jpg" alt="">
            </div>

            <!-- login form -->
            <div class="w-3/5 h-full pt-[4%] pb-[6%] px-[6%]">
                <form class="login-form flex flex-col justify-center items-center w-full h-full" action="/sakura/access/register" method="post"  id="form" name="login-form">
                    <div class="form-header w-full h-14 text-center m-0 p-0 relative">
                        <h2 class="text-3xl text-[#FF6532] font-medium ">Đăng ký</h2>
                    </div>
                    <ul class="item-list list-none w-3/5">

                        <!--Full name-->
                        <li class="item relative">
                            <input type="text" class="input-field peer placeholder-transparent" id="fullname" name="fullname" placeholder="Full name" onchange="checkFullname()"/>
                            <label class="input-label peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px]" for="full-name">Họ và tên</label>
                        </li>

                        <!--User name-->
                        <li class="item relative">
                            <input type="text" class="input-field peer placeholder-transparent" id="username" name="username" placeholder="User name" value="" onchange="checkUsername()"/>
                            <p id="usernameError" class="warning font-light absolute right-0"></p>
                            <label class="input-label peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px]" for="user-name">Tên đăng nhập <span class="font-extralight">(chỉ gồm chữ, số, kí tự '_')</span></label>
                        </li>

                        <!--Email-->
                        <li class="item relative">
                            <input type="email" class="input-field peer placeholder-transparent" id="email" name="email" placeholder="Email" value="" onchange="checkEmail()"/>
                            <p id="emailError" class="warning font-light absolute right-0"></p>
                            <label class="input-label peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px]" for="email">Email</label>
                        </li>

                        <!--Phone-->
                        <li class="item relative">
                            <input type="text" class="input-field peer placeholder-transparent" id="phone" name="phone" placeholder="Phone" value=""/>
                            <p class="warning font-light absolute right-0">${requestScope.warning}</p>
                            <label class="input-label peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px]" for="phone">Phone number</label>
                        </li>

                        <!--Password-->
                        <li class="item relative password-input">
                            <input type="password" class="input-field peer placeholder-transparent pr-9" id="password" name="password" placeholder="Password" onchange="checkPassword()"/>
                            <p id="passwordError" class="warning font-light absolute right-0">${requestScope.warning}</p>
                            <label class="input-label peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px]" for="password">Mật khẩu <span class="font-extralight">(tối thiểu 8 kí tự)</span></label>
                            <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-password"></i>
                        </li>

                        <!--Confirm password-->
                        <li class="item relative password-input mb-3">
                            <input type="password" class="input-field peer placeholder-transparent pr-[36px]" id="cf-password" name="cf-password" placeholder="Confirm password" onchange="checkConfirmPassword()"/>
                            <p id="cf-passwordError" class="warning font-light absolute right-0"></p>
                            <label class="input-label peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px]" for="cf-password">Xác nhận mật khẩu</label>
                            <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-cf-password"></i>
                        </li>
                        <li class="item relative" id="chooseRole">
                            <div class="flex flex-wrap justify-start text-lg mt-6">
                                <span class="">Chọn chức năng: </span>
                                <div class="flex items-center mx-4">
                                    <input type="radio" id="tenant" name="role" class="hidden" value="1" checked/>
                                    <label for="tenant" class="flex items-center cursor-pointer">
                                    <span class="w-4 h-4 inline-block mr-1 border border-gray-500 rounded-full"></span>Khách thuê
                                    </label>
                                </div>

                                <div class="flex items-center">
                                    <input type="radio" id="landlord" name="role" class="hidden" value="2"/>
                                    <label for="landlord" class="flex items-center cursor-pointer">
                                    <span class="w-4 h-4 inline-block mr-1 border border-gray-500 rounded-full"></span>Chủ nhà</label>
                                </div>

                            </div>
                        </li>
                        <div id="more" class="mt-3 mb-9 flex justify-center">
                            <span>Đã có tài khoản? </span> <a id="signin" href="/sakura/access/loginPage" class="ml-1 text-green-700 hover:text-green-600 transition-all"> Đăng nhập</a>
                        </div>
                        <li>
                            <button type="submit" id="login-btn" class="w-full h-1/5 mx-auto rounded px-5 py-3 min-w-max overflow-hidden shadow relative bg-[#17535B] text-white hover:bg-opacity-[95%]" >Đăng ký</button>  
                        </li>
                        <li class="mt-8">
                            <p class="text-center text-base font-light">hoặc bắt đầu với</p>
                            <div class="social flex justify-between my-5">
                                <a class="social-el inline-block relative cursor-pointer h-[50px] rounded border-[1px] border-[#d6dcdf] transition-all" href="#">
                                    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 flex justify-center items-center">
                                        <object class="inline" data="assets/icons/google.svg" width="20" height="20"></object>
                                        <span class="text-xl font-light">Google</span>
                                    </div>
                                </a>  
                                <a class="social-el inline-block relative cursor-pointer h-[50px] rounded border-[1px] border-[#d6dcdf] transition-all" href="#">
                                    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 flex justify-center items-center">
                                        <object class="inline" data="assets/icons/facebook.svg" width="20" height="20"></object>
                                        <span class="text-xl font-light">Facebook</span>
                                    </div>
                                </a> 

                            </div>
                        </li>


                    </ul>

                </form>
                <div class="backlink absolute bottom-10 right-10">
                    <a class="w-[40px] h-[40px] flex justify-center items-center border-2 border-[#17535B] rounded-full animate-pulse" href="#">
                        <i class="bi bi-arrow-left text-[#17535B] text-2xl"></i>
                    </a>
                </div>
            </div>


        </div>
        <script>
            const togglePassword = document.querySelector("#toggle-password");
            const toggleCfPassword = document.querySelector("#toggle-cf-password");
            const password = document.querySelector("#password");
            const cf_password = document.querySelector("#cf-password");
            togglePassword.addEventListener("click", function () {
                // toggle the type attribute
                const type = password.getAttribute("type") === "password" ? "text" : "password";
                password.setAttribute("type", type);
                // toggle the icon
                this.classList.toggle('bi-eye');
            });
            toggleCfPassword.addEventListener("click", function () {
                // toggle the type attribute
                const cf_type = cf_password.getAttribute("type") === "password" ? "text" : "password";
                cf_password.setAttribute("type", cf_type);
                // toggle the icon
                this.classList.toggle('bi-eye');
            });
        </script>

        <script>
            function rippleEffect(event) {
                const btn = event.currentTarget;

                const circle = document.createElement("span");
                const diameter = Math.max(btn.clientWidth, btn.clientHeight);
                const radius = diameter / 2;

                circle.style.width = circle.style.height = `${diameter}px`;
                circle.style.left = `${event.clientX - (btn.offsetLeft + radius)}px`;
                circle.style.top = `${event.clientY - (btn.offsetTop + radius)}px`;
                circle.classList.add("ripple");

                const ripple = btn.getElementsByClassName("ripple")[0];

                if (ripple) {
                    ripple.remove();
                }

                btn.appendChild(circle);
            }

            const btn = document.getElementById("login-btn");
            btn.addEventListener("click", rippleEffect);
        </script>

        <script>
            function checkFullname() {
                $("#fullname").css("border", "");
            }
            
            function checkUsername() {
                $("#usernameError").html("");
                $("#username").css("border", "");
                jQuery.ajax({
                    type: 'POST',
                    data: 'username=' + $("#username").val(),
                    url: 'CheckUsernameServlet',
                    success: function (result) {
                        if (result.length === 0) {
                            var re = /^\w+$/;
                            if (!re.test($("#username").val())) {
                                $("#usernameError").html("Tên đăng nhập không chứa các kí tự đặc biệt trù '_'!");
                                $("#usernameError").css("color", "red");
                            }
                        } else {
                            $("#usernameError").html(result);
                            $("#usernameError").css("color", "red");
                        }
                        console.log('Success 36');
                    },
                    error: function () {
                        console.log('Error 39');
                    },
                    complete: function (result) {
                        console.log('Complete 41');
                    }
                });
            }

            function checkEmail() {
                $("#emailError").html("");
                $("#email").css("border", "");
                jQuery.ajax({
                    type: 'POST',
                    data: 'email=' + $("#email").val(),
                    url: 'CheckEmailServlet',
                    success: function (result) {
                        if (result.length === 0) {
                            var re = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
                            if (!re.test($("#email").val())) {
                                $("#emailError").html("Sai định dạng email!");
                                $("#emailError").css("color", "red");
                            }
                        } else {
                            $("#emailError").html(result);
                            $("#emailError").css("color", "red");
                        }
                        console.log('Success 65');
                    },
                    error: function () {
                        console.log('Error 68');
                    },
                    complete: function (result) {
                        console.log('Complete 71');
                    }
                });
            }

            function checkPassword() {
                $("#passwordError").html("");
                $("#password").css("border", "");
                console.log("Checking password");
                if ($("#password").val().trim().length < 8) {
                    $("#passwordError").html("Mật khẩu phải có ít nhất 8 kí tự!");
                    $("#passwordError").css("color", "red");
                }
            }

            function checkConfirmPassword() {
                $("#cf-passwordError").html("");
                $("#cf-password").css("border", "");
                console.log("checking confirm password");
                if ($("#password").val().trim() !== $("#cf-password").val().trim()) {
                    $("#cf-passwordError").html("Xác nhận lại mật khẩu!");
                    $("#cf-passwordError").css("color", "red");
                }
            }

            function validate() {
                var registerForm = document.getElementById("registerForm");
                var fullname = $("#fullname").val().trim();
                ;
                var username = $("#username").val().trim();
                var email = $("#email").val().trim();
                var phone = $("#phone").val().trim();
                var password = $("#password").val().trim();
                var confirmPassword = $("#cf-password").val().trim();
////                var confirmPassword = registerForm.confirmPassword.value.trim();
                if (!fullname) {
                    $("#fullname").css("border", "2px solid red");
                    $("#fullname").focus();
//                    document.getElementById("fullname").style = "border:2px solid red";
//                    document.getElementById("fullname").focus();
                    return false;
                } else if (!username || $("#usernameError").html() !== "") {
                    $("#username").css("border", "2px solid red");
                    $("#username").focus();
                    return false;
                } else if (!email || $("#emailError").html() !== "") {
                    $("#email").css("border", "2px solid red");
                    $("#email").focus();
                    return false;
                } else if (!password || $("#passwordError").html() !== "") {
                    $("#password").css("border", "2px solid red");
                    $("#password").focus();
                    return false;
                } else if (!confirmPassword || $("#cf-passwordError").html() !== "") {
                    $("#cf-password").css("border", "2px solid red");
                    $("#cf-password").focus();
                    return false;
                }
//                if ($("#usernameError").html.length !== 0 || !$("#emailError").html().length !== 0)
//                    return false;
            }
        </script>
    </body>
</html>
