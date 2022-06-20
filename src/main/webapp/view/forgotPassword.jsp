<%-- 
    Document   : forgotPassword
    Created on : Jun 2, 2022, 9:52:43 AM
    Author     : Loc NgD <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakura - Forgot password</title>

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
        <!-- logo -->
        <div class="logo absolute z-10">
            <div class="container px-6 py-5">
                <div class="flex justify-center items-center">
                    <img class="w-9 h-9" src="../assets/icons/logo_white.png" alt="">
                </div>
            </div>
        </div>

        <!-- main section -->
        <div class="bg-slate-50 h-screen w-screen flex">
            <!-- banner -->
            <div class="w-2/5 relativee">
                <div class="w-2/5 h-screen absolute z-[5] bg-black black opacity-80 flex flex-col justify-center items-center">
                    <h2 class="z-10 pt-9 text-white opacity-100 text-[50px] font-semibold">It's okay</h2>
                    <p  class="z-10 pt-9 w-4/5 mx-auto text-center text-white opacity-100 text-[20px] font-extralight" >Enter the email address or phone number associated with your account and reset your password</p>
                </div>
                <img class="w-2/5 h-screen absolute " src="../assets/images/bg5.jpg" alt="">
            </div>

            <!-- form -->
            <div class="w-3/5 h-full pt-[5%] pb-[8%] px-[6%]">

                <form class="login-form flex flex-col justify-center items-center w-full h-full" action="/sakura/access/forgotPassword" method="post"  id="form" name="login-form">
                    <!--form header-->
                    <div class="form-header w-full h-18 mb-3 text-center">
                        <h2 class="text-3xl text-[#FF6532] font-medium">Lấy lại mật khẩu</h2>
                        <p id="error" class="warning text-base font-light mt-4">Mật khẩu mới sẽ được gửi vào email liên kết của bạn!</p>
                    </div>

                    <ul class="item-list list-none w-[52%]">
                        <!--Email input-->
                        <li class="item block relative z-0 w-full mb-12">
                            <input type="email" id="email" name="email" placeholder=" " required onchange="checkEmail()"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                            <p id="emailError" class="warning font-light absolute right-0"></p>
                            <label for="email" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Email</label>
                        </li>

                        <!--Submit-->
                        <li class="mb-7">
                            <button type="submit" id="login-btn" class="w-full h-1/5 mx-auto rounded px-5 py-3 min-w-max overflow-hidden shadow relative bg-[#17535B] text-white hover:bg-opacity-[95%]">Gửi link khôi phục</button>  
                        </li>

                        <div id="more" class="mt-3 flex justify-center text-sm font-light">
                            <span>Thử lại với tài khoản khác? </span> <a id="signin" href="/sakura/access/login" class="ml-1 font-normal text-green-700 hover:font-normal hover:text-green-600"> Đăng nhập</a>
                        </div>
                        <div id="more" class="mt-3 flex justify-center text-sm font-light">
                            <span>Chưa có tài khoản? </span> <a id="signup" href="/sakura/access/register" class="ml-1 font-normal text-green-700 hover:font-normal hover:text-green-600"> Đăng ký</a>
                        </div>
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


            function checkEmail() {
                $("#emailError").html("");
                $("#email").css("border-bottom", "");
                jQuery.ajax({
                    type: 'POST',
                    data: 'email=' + $("#email").val(),
                    url: '/sakura/account/checkEmail',
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
        </script>
    </body>
</html>
