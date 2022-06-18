<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakura - Xác nhận email</title>

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
                    <h2 class="z-10 pt-9 text-white opacity-100 text-[50px] font-semibold">One more step!</h2>
                    <p  class="z-10 pt-9 w-4/5 mx-auto text-center text-white opacity-100 text-[20px] font-extralight" >Check your email and enter verification code to join us!</p>
                </div>
                <img class="w-2/5 h-screen absolute " src="../assets/images/bg5.jpg" alt="">
            </div>

            <!-- form -->
            <div class="w-3/5 h-full pt-[5%] pb-[8%] px-[6%]">

                <form class="login-form flex flex-col justify-center items-center w-full h-full" action="/sakura/access/mailVerification" method="post" id="form" name="verification-form">
                    <!--form header-->
                    <div class="form-header w-full h-18 mb-3 text-center">
                        <h2 class="text-3xl text-[#FF6532] font-medium">Nhập mã xác minh</h2>
                        <p id="error" class="warning text-base font-light mt-4">Mã xác minh đã được gửi vào email của bạn!</p>
                        <p id="errorMessage" class="warning text-base font-light mt-4" style="color:red">${requestScope.errorMessage}</p>

                    </div>

                    <ul class="item-list list-none w-[52%]">
                        <!--Code input-->
                        <li class="item block relative z-0 w-full mb-12">
                            <input type="text" id="code" name="code" placeholder=" "
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                            <p id="emailError" class="warning font-light absolute right-0"></p>
                            <label for="email" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Mã xác minh</label>
                        </li>
                        <!--Submit-->
                        <li class="mb-7">
                            <button type="submit" id="login-btn" class="w-full h-1/5 mx-auto rounded px-5 py-3 min-w-max overflow-hidden shadow relative bg-[#17535B] text-white hover:bg-opacity-[95%]" onclick="return validateForm()">Xác nhận mã</button>  
                        </li>                     
                    </ul>
                </form>
            </div>
        </div>

        <script>
            function validateForm() {
                var code = $('#code').val().trim();
                if (!code) {
                    $("#emailError").html("Mời bạn điền mã xác minh!");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
