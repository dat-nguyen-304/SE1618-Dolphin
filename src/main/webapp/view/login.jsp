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
        <title>Sakura - Đăng nhập</title>


        <%@include file="../view/assets.jsp" %>

        <!--CSS-->
        <link rel="stylesheet" href="../assets/css/register.css">
        <link rel="stylesheet" href="../assets/css/app.css">

        <script src="../assets/pacejs/pace.min.js" type="text/javascript"></script>
        <link href="../assets/pacejs/pace-theme-default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/pacejs/flash.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

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
                    <h2 class="z-10 pt-9 text-white opacity-100 text-[50px] font-semibold">Xin chào!</h2>
                    <p class="z-10 pt-9 text-white opacity-100 text-[20px] font-extralight">Đăng nhập để đặt thuê phòng hoặc quản lý nhà trọ với Sakura</p>
                </div>
                <img class="w-2/5 h-screen absolute" src="../assets/images/bg3.jpg" alt="">
            </div>

            <!-- login form -->
            <div class="w-3/5 h-full pt-[5%] pb-[8%] px-[6%]">
                <form class="login-form flex flex-col justify-center items-center w-full h-full" action="/sakura/access/login" method="post" id="form" name="login-form" novalidate="true">

                    <div class="form-header w-full h-auto text-center m-0 py-2 relative">
                        <h2 class="text-3xl text-[#288D87] font-medium mb-5">Đăng nhập</h2>
                        <p id="error" class="warning text-[15px] font-light mt-4 absolute top-1/2 left-1/2 -translate-x-1/2" style="color:red">${requestScope.error}</p>
                    </div>
                    <ul class="item-list list-none p-0 w-[52%]">
                        <!--User name-->
                        <li class="item block relative z-0 w-full mt-5">
                            <input type="text" id="username" name="username" placeholder=" " value="${requestScope.username}" required autocomplete="off"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none  focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                            <label for="username" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Tên đăng nhập <span class="font-extralight"></span></label>
                        </li>

                        <!--Password-->
                        <li class="item block relative z-0 w-full mt-7 mb-0">
                            <input type="password" id="password" name="password" placeholder=" " required autocomplete="off"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200 pr-[36px]" />
                            <label for="password" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Mật khẩu <span class="font-extralight"></span></label>
                            <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-password"></i>
                        </li>

                        <div id="more" class="mt-2 mb-12 text-sm font-light">
                            <a class="hover:text-[#FF6532]" id="forgot" href="/sakura/access/forgotPassword">Quên mật khẩu?</a>
                        </div>
                        <li class="mb-9">
                            <button type="submit" id="login-btn" class="w-full h-1/5 mx-auto rounded px-5 py-3 min-w-max overflow-hidden shadow relative bg-[#17535B] text-white hover:bg-opacity-[95%] disabled:cursor-progress disabled:bg-opacity-[50%]" onclick = "return validate()">Đăng nhập</button>
                        </li>
                        <div id="more" class="mt-3 flex justify-center text-sm font-light">
                            <span>Chưa có tài khoản? </span> <a id="signup" href="/sakura/access/register" class="ml-1 font-normal text-green-700 hover:font-normal hover:text-green-600"> Đăng ký</a>
                        </div>
                        <li class="mt-2">
                            <p class="text-center text-sm font-light">hoặc tiếp tục với</p>
                            <div class="social flex justify-center my-5">
                                <a class="social-el inline-block relative cursor-pointer h-[50px] rounded border-[1px] border-[#d6dcdf] transition-transform" href="https://accounts.google.com/o/oauth2/auth?scope=email+profile&redirect_uri=http://localhost:8080/sakura/access/googleAccess&response_type=code&client_id=730896390786-dleufk3i61p0pk8f6lavcrubmbucp5jq.apps.googleusercontent.com&approval_prompt=force">
                                    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 flex justify-center items-center">
                                        <object class="inline" data="../assets/icons/google.svg" width="20" height="20"></object>
                                        <span class="text-xl font-light">Google</span>
                                    </div>
                                </a>
                            </div>
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

            // Ripple Effect
            const button = document.querySelector('#login-btn');

            button.addEventListener('click', function (e) {
                // 1
                let x = e.clientX;
                let y = e.clientY;

                // 2
                let buttonTop = e.target.offsetTop;
                let buttonLeft = e.target.offsetLeft;

                // 3
                let xInside = x - buttonLeft;
                let yInside = y - buttonTop;

                let circle = document.createElement('span');
                circle.classList.add('circle');
                circle.style.top = yInside + 'px';
                circle.style.left = xInside + 'px';

                this.appendChild(circle);

                setTimeout(() => {
                    circle.remove();
                }, 500);
            });

            // ====================================
            // Validation
            function validate() {
                var username = $('#username').val().trim();
                var password = $('#password').val().trim();
                if (!username || !password) {
                    $('#error').html("Vui lòng điền đầy đủ thông tin đăng nhập!");
                    return false;
                }
                return true;
            }

            const form = document.getElementById('form');
            const submitBtn = document.getElementById('login-btn');
            form.addEventListener('submit', function () {
                console.log("Form submit");
                submitBtn.disabled = true;
                submitBtn.innerHTML = "Đang xác thực...";
            });
        </script>

    </body>
</html>
