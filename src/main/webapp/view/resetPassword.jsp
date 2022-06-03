<%-- 
    Document   : resetPassword
    Created on : Jun 2, 2022, 10:00:27 AM
    Author     : Loc NgD <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakura - Reset password</title>

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

        <!-- Icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!--CSS-->
        <!--<link rel="stylesheet" href="../assets/css/style.css">-->
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/app.css">
        <link rel="stylesheet" href="../assets/css/register.css">
    </head>
    <body>
        <!-- logo -->
        <div class="logo absolute z-10">
            <div class="container px-6 py-5">
                <div class="flex justify-center items-center">
                    <img class="w-9 h-9" src="../assets/icon/logo_white.png" alt="">
                </div>
            </div>
        </div>

        <!-- main section -->
        <div class="bg-slate-50 h-screen w-screen flex">
            <!-- banner -->
            <div class="w-2/5 relativee">
                <div class="w-2/5 h-screen absolute z-[5] bg-black black opacity-80 flex flex-col justify-center items-center">
                    <h2 class="z-10 pt-9 text-white opacity-100 text-[50px] font-semibold">Last step!</h2>
                    <p  class="z-10 pt-9 text-white opacity-100 text-[20px] font-extralight">Enter your new password and continue with us</p>
                </div>
                <img class="w-2/5 h-screen absolute " src="../assets/images/bg7.jpg" alt="">
            </div>

            <!-- form -->
            <div class="w-3/5 h-full pt-[4%] pb-[6%] px-[6%]">
                <form class="login-form flex flex-col justify-center items-center w-full h-full" action="mainController" method="post"  id="form" name="login-form">

                    <!--form header--> 
                    <div class="form-header w-full h-14 text-center m-0 p-0 relative">
                        <h2 class="text-3xl text-[#FF6532] font-medium ">Mật khẩu mới</h2>
                    </div>

                    <ul class="item-list list-none w-3/5">
                        <!--password-->
                        <li class="item relative password-input">
                            <input type="password" class="input-field peer placeholder-transparent pr-9" id="password" name="password" placeholder="Password" />
                            <p class="warning font-light absolute right-0">Tối thiểu 8 kí tự</p>
                            <label class="input-label peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px]" for="password">Mật khẩu <span class="font-extralight">(Tối thiểu 8 kí tự)</span></label>
                            <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-password"></i>
                        </li>

                        <!--repeat password-->
                        <li class="item relative password-input mb-5">
                            <input type="password" class="input-field peer placeholder-transparent pr-[36px]" id="cf-password" name="cf-password" placeholder="Confirm password" />
                            <p class="warning font-light absolute right-0">Không khớp!</p>
                            <label class="input-label peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px]" for="cf-password">Nhập lại mật khẩu</label>
                            <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-cf-password"></i>
                        </li>

                        <!--submit-->
                        <li class="my-5">
                            <button type="button" id="login-btn" class="w-full h-1/5 mx-auto rounded px-5 py-3 min-w-max overflow-hidden shadow relative bg-[#17535B] text-white hover:bg-opacity-[95%]" name="action" value="Login">Xác nhận</button>  
                        </li>

                        <div id="more" class="mt-4 flex justify-center">
                            <span>Đã có tài khoản? </span> <a id="signin" href="login.html" class="ml-1 text-green-700 hover:text-green-600 transition-all">Đăng nhập</a>
                        </div>
                        <div id="more" class="mt-3 mb-9 flex justify-center">
                            <span>Chưa có tài khoản? </span> <a id="signin" href="login.html" class="ml-1 text-green-700 hover:text-green-600 transition-all">Đăng ký</a>
                        </div>
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
    </body>
</html>
