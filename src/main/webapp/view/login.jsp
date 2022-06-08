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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakura - Login</title>

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

        <!-- Icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!--Favicon-->
        <link rel="shortcut icon" href="assets/icons/logo.png" type="image/x-icon">

        <!--CSS-->
        <link rel="stylesheet" href="../assets/css/style.css">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/app.css">
        
        <link rel="stylesheet" href="../assets/css/homepage-base.css">
        <link rel="stylesheet" href="../assets/css/homepage-vendor.css">
        <link rel="stylesheet" href="../assets/css/homepage-main.css">
    </head>
    <body>
        <!-- logo -->
        <nav class="container header">
            <a class="logo" href="#">
                <img id="logo-header" src="../assets/icons/logo_white.png" alt="">
                <h3 id="name-header">Sakura</h3>
            </a>
            <!-- left header section -->
            <div class="item-list">
                <a class="item active" href="#">Trang chủ</a>
                <a class="item" href="#">Thuê phòng</a>
            </div>
            <!-- right header section -->
            <div class="access-login">
                <a href="#">
                    <i class="bi bi-bell-fill"></i>
                </a>
                <a href="#">
                    <i class="bi bi-person-fill"></i>
                </a>
                <a href="#">
                    <i class="bi bi-box-arrow-right"></i>
                </a>
            </div>
        </nav>

        <div class="logo absolute z-10">
            <div class="container px-6 py-5">
                <div class="flex justify-center items-center">
                    <img class="w-9 h-9" src="assets/icons/logo_white.png" alt="">
                </div>
            </div>
        </div>

        <!-- main section -->
        <div class="bg-slate-50 h-screen w-screen flex">
            <!-- banner -->
            <div class="w-2/5 relativee">
                <div class="w-2/5 h-screen absolute z-[5] bg-black black opacity-80 flex flex-col justify-center items-center">
                    <h2 class="z-10 pt-9 text-white opacity-100 text-[50px] font-semibold">Welcome Back!</h2>
                    <p class="z-10 pt-9 text-white opacity-100 text-[20px] font-extralight">To keep connected with us please login with your personal info</p>
                </div>
                <img class="w-2/5 h-screen absolute" src="assets/images/bg3.jpg" alt="">
            </div>

            <!-- login form -->
            <div class="w-3/5 h-full pt-[5%] pb-[8%] px-[6%]">
                <form class="login-form flex flex-col justify-center items-center w-full h-full" action="/sakura/access/login" method="post" id="form" name="login-form">
                    <div class="form-header w-full h-20 text-center m-0 p-0 relative">
                        <h2 class="text-3xl text-[#FF6532] font-medium">Đăng nhập</h2>
                        <p id="error" class="warning text-base font-light mt-4 absolute top-1/2 left-1/2 -translate-x-1/2" style="color:red">${requestScope.error}</p>
                    </div>
                    <ul class="item-list list-none p-0 w-3/5">

                        <!--Username-->
                        <li class="item relative mt-[20px] mb-[40px]">
                            <input type="text" class="input-field text-[16px] w-full border-b-2 border-[#c5c5c5] text-[#252525] outline-none bg-transparent peer py-2 pr-[36px] placeholder-transparent" id="username" name="username" placeholder="Username" value="" />
                            <label class="absolute left-0 -top-[15px] peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px] transition-all font-light text-sm" for="email">Tên đăng nhập</label>
                        </li>
                        <!--Password-->
                        <li id="password-input" class="item relative mt-[20px]">
                            <input type="password" class="input-field text-[16px] w-full border-b-2 border-[#c5c5c5] text-[#252525] outline-none focus:outline-none bg-transparent peer py-2 pr-[36px] placeholder-transparent" id="password" name="password" placeholder="Password" />
                            <label class="absolute left-0 -top-[15px] peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px] transition-all font-light text-sm" for="password">Mật khẩu</label>
                            <i class="bi bi-eye-slash absolute right-[10px] bottom-[13px] cursor-pointer" id="toggle-password"></i>
                        </li>

                        <div id="more" class="mt-3 mb-9 flex justify-between">
                            <a class="hover:text-[#252525] hover:font-medium transition-all" id="signup" href="/sakura/access/registerPage">Đăng ký</a>
                            <a class="hover:text-[#252525] hover:font-medium transition-all" id="forgot" href="/sakura/access/forgotPasswordPage">Quên mật khẩu?</a>
                        </div>
                        <li>
                            <button type="submit" id="login-btn" class="w-full h-1/5 mx-auto rounded px-5 py-3 min-w-max overflow-hidden shadow relative bg-[#17535B] text-white hover:bg-opacity-[95%]">Đăng nhập</button>

                        </li>
                        <li class="mt-8">
                            <p class="text-center text-base font-light">hoặc tiếp tục với</p>
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
        <script type="text/javascript">
            window.addEventListener("scroll", function () {
                var header = document.querySelector(".header");
                header.classList.toggle("sticky", window.scrollY > 0);

                // var img = document.querySelector("#logo-header");
                // img.src = "./icon/logo.png"; 
            });

            var initialSrc = "../aseets/icon/logo_white.png";
            var scrollSrc = "../aseets/icon/logo.png";

            $(window).scroll(function () {
                var value = $(this).scrollTop();
                if (value > 0) {
                    $("#logo-header").attr("src", scrollSrc);
                } else {
                    $("#logo-header").attr("src", initialSrc);
                }
            });
        </script>
        <script>
            // Toggle password 
            const togglePassword = document.querySelector("#toggle-password");
            const password = document.querySelector("#password");
            togglePassword.addEventListener("click", function () {
                // toggle the type attribute
                const type = password.getAttribute("type") === "password" ? "text" : "password";
                password.setAttribute("type", type);
                // toggle the icon
                this.classList.toggle('bi-eye');
            });

            // Ripple effect
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
            
            function validate() {
                var username = $('#username').val().trim();
                var password = $('#password').val().trim();
                if (!username || !password) {
                    $('#error').html("Vui lòng điền đủ password và email!");
                    return false;
                }
                return true;
            }
        </script>

    </body>
</html>
