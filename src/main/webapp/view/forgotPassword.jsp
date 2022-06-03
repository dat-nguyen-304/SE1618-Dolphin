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
        <!--<link rel="stylesheet" href="../assets/css/style.css">-->
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/app.css">
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

                <form class="login-form flex flex-col justify-center items-center w-full h-full" action="mainController" method="post"  id="form" name="login-form">
                    <!--form header-->
                    <div class="form-header w-full h-28 mb-5 text-center">
                        <h2 class="text-3xl text-[#FF6532] font-medium">Lấy lại mật khẩu</h2>
                        <p id="error" class="warning text-base font-light mt-4">Link khôi phục mật khẩu sẽ được gửi vào mail liên kết với tài khoản của bạn!</p>
                    </div>

                    <ul class="item-list list-none mt-12 w-3/5">
                        <!--Email input-->
                        <li class="item relative mt-[20px] mb-[40px]">
                            <input type="text" class="input-field text-[16px] w-full border-b-2 border-[#c5c5c5] text-[#252525] outline-none bg-transparent peer py-2 pr-[36px] placeholder-transparent" id="email" name="txt-email" placeholder="Email" value="" />
                            <label class="absolute left-0 -top-[15px] peer-placeholder-shown:text-[#7b8577] peer-placeholder-shown:font-light  peer-placeholder-shown:text-base peer-placeholder-shown:top-[8.5px] transition-all font-light text-sm" for="email">Email</label>
                        </li>
                        <!--Submit-->
                        <li>
                            <button type="button" id="login-btn" class="w-full h-1/5 mx-auto rounded px-5 py-3 min-w-max overflow-hidden shadow relative bg-[#17535B] text-white hover:bg-opacity-[95%]" name="action" value="Login">Gửi link khôi phục</button>  
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
