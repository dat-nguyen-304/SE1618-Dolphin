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
        <title>Sakura - Đăng ký</title>

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
        <script src="assets/javascript/jquery.js"></script>

    </head>
    <body>
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
                    <h2 class="z-10 pt-9 text-white opacity-100 text-[50px] font-semibold">Hello, Friend!</h2>
                    <p  class="z-10 pt-9 text-white opacity-100 text-[20px] font-extralight">Enter your personal details and start journey with us</p>
                </div>
                <img class="w-2/5 h-screen absolute " src="assets/images/bg2.jpg" alt="">
            </div>

            <!-- login form -->
            <div class="w-3/5 h-full pt-[4%] pb-[6%] px-[6%]">
                <form class="login-form flex flex-col justify-center items-center w-full h-full" action="/sakura/access/register" method="post" id="form" name="register-form" novalidate="">

                    <div class="form-header w-full h-14 text-center m-0 p-0 relative">
                        <h2 class="text-3xl text-[#FF6532] font-medium ">Đăng ký</h2>
                    </div>
                    <ul class="item-list list-none w-[52%]">

                        <!--Full name-->
                        <li class="item block relative z-0 w-full mb-7">
                            <input type="text" id="fullname" name="fullname" placeholder=" " required onchange="checkFullname()"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                            <p id="fullnameError" class="warning font-light absolute right-0"></p>
                            <label for="fullname" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Họ và tên</label>
                        </li>

                        <!--User name-->
                        <li class="item block relative z-0 w-full mb-7">
                            <input type="text" id="username" name="username" placeholder=" " required onchange="checkUsername()"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none  focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                            <p id="usernameError" class="warning font-light absolute right-0"></p>
                            <label for="username" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Tên đăng nhập <span class="font-extralight">(chỉ gồm chữ, số, kí tự '_')</span></label>
                        </li>

                        <!--Email-->
                        <li class="item block relative z-0 w-full mb-7">
                            <input type="email" id="email" name="email" placeholder=" " required onchange="checkEmail()"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                            <p id="emailError" class="warning font-light absolute right-0"></p>
                            <label for="email" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Email</label>
                        </li>

                        <!--Phone-->
                        <li class="item block relative z-0 w-full mb-7">
                            <input type="tel" id="phone" name="phone" placeholder=" " required onchange="checkPhone()"
                                   class="pt-3 pb-1 block w-full px-0 mt-2 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                            <p id="phoneError" class="warning font-light absolute right-0"></p>
                            <label for="phone" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Số điện thoại</label>
                        </li>

                        <!--Password-->
                        <li class="item block relative z-0 w-full mb-7">
                            <input type="password" id="password" name="password" placeholder=" " required onchange="checkPassword()"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200 pr-[36px]" />
                            <p id="passwordError" class="warning font-light absolute right-0">${requestScope.warning}</p>
                            <label for="password" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Mật khẩu <span class="font-extralight">(tối thiểu 8 kí tự)</span></label>
                            <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-password"></i>
                        </li>

                        <!--Confirm password-->
                        <li class="item block relative z-0 w-full mb-8">
                            <input type="password" id="cf-password" name="cf-password" placeholder=" " required onchange="checkConfirmPassword()"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200 pr-[36px]" />
                            <p id="cf-passwordError" class="warning font-light absolute right-0">${requestScope.warning}</p>
                            <label for="cf-password" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Xác nhận mật khẩu</label>
                            <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-cf-password"></i>
                        </li>

                        <!--Choose role-->
                        <li class="item relative mb-8" id="chooseRole">
                            <div class="flex flex-wrap justify-start text-lg mt-6 text-md ">
                                <span class="text-gray-500">Chọn chức năng: </span>
                                <div class="flex items-center mx-4">
                                    <input type="radio" id="tenant" name="role" class="hidden" value="1" checked/>
                                    <label for="tenant" class="role-label flex items-center cursor-pointer">
                                        <span class="w-4 h-4 inline-block mr-1 border border-gray-500 rounded-full"></span>Khách thuê
                                    </label>
                                </div>

                                <div class="flex items-center">
                                    <input type="radio" id="landlord" name="role" class="hidden" value="2"/>
                                    <label for="landlord" class="role-label flex items-center cursor-pointer">
                                        <span class="w-4 h-4 inline-block mr-1 border border-gray-500 rounded-full"></span>Chủ nhà</label>
                                </div>

                            </div>
                        </li>

                        <li class="mb-9">
                            <button type="submit" id="register-btn" class="w-full h-1/5 mx-auto rounded px-5 py-3 min-w-max overflow-hidden shadow relative bg-[#17535B] text-white hover:bg-opacity-[95%]" onclick="return validate()">
                                Đăng ký
                            </button>  
                        </li>
                        <div id="more" class="mt-3 flex justify-center text-sm font-light">
                            <span>Đã có tài khoản? </span> <a id="signin" href="/sakura/access/login" class="ml-1 font-normal text-green-700 hover:font-normal hover:text-green-600"> Đăng nhập</a>
                        </div>
                        <li class="mt-1">
                            <p class="text-center text-sm font-light">hoặc bắt đầu với</p>
                            <div class="social flex justify-between my-5">
                                <a class="social-el inline-block relative cursor-pointer h-[50px] rounded border-[1px] border-[#d6dcdf] transition-transform" href="#">
                                    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 flex justify-center items-center">
                                        <object class="inline" data="assets/icons/google.svg" width="20" height="20"></object>
                                        <span class="text-xl font-light">Google</span>
                                    </div>
                                </a>  
                                <a class="social-el inline-block relative cursor-pointer h-[50px] rounded border-[1px] border-[#d6dcdf] transition-transform" href="#">
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
                    <a class="w-[40px] h-[40px] flex justify-center items-center border-2 border-[#17535B] rounded-full animate-pulse" href="#" onclick="history.back()">
                        <i class="bi bi-arrow-left text-[#17535B] text-2xl"></i>
                    </a>
                </div>
            </div>


        </div>
        <script src="../assets/javascript/jquery.js"></script>
        <script>
                        // Toggle Password
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

                        // ====================================
                        // Ripple Effect
                        const button = document.querySelector('#register-btn');

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
                        function checkFullname() {
                            $("#fullnameError").html("");
                            $("#fullname").css("border-bottom", "");
                            var fullname = $("#fullname").val().trim();
                            if (fullname.length !== 0) {
                                var re = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$/;
                                if (!re.test(fullname) && fullname.length !== 0) {
                                    $("#fullnameError").html("Tên riêng chỉ gồm chữ cái tiếng Việt!");
                                    $("#fullnameError").css("color", "red");
                                }
                            }
                        }

                        function checkUsername() {
                            $("#usernameError").html("");
                            $("#username").css("border-bottom", "");
                            var username = $("#username").val().trim();
                            if (username.length < 6) {
                                $("#usernameError").html("Tên đăng nhập phải có ít nhất 6 kí tự!");
                                $("#usernameError").css("color", "red");
                            } else if (username.length !== 0) {
                                jQuery.ajax({
                                    type: 'POST',
                                    data: 'username=' + $("#username").val(),
                                    url: '/sakura/account/checkUsername',
                                    success: function (result) {
                                        if (result.length === 0) {
                                            var re = /^[a-zA-Z]\w+$/;
                                            if (!re.test($("#username").val())) {
                                                $("#usernameError").html("Tên đăng nhập bắt đầu bằng chữ cái, không chứa các kí tự đặc biệt trừ '_'!");
                                                $("#usernameError").css("color", "red");
                                            }
                                        } else {
                                            $("#usernameError").html(result);
                                            $("#usernameError").css("color", "red");
                                        }
                                        console.log('Success check username');
                                    },
                                    error: function () {
                                        console.log('Error check username');
                                    },
                                    complete: function (result) {
                                        console.log('Complete check username');
                                    }
                                });
                            }
                        }

                        function checkEmail() {
                            $("#emailError").html("");
                            $("#email").css("border-bottom", "");
                            var email = $("#email").val().trim();
                            if (email.length !== 0) {
                                jQuery.ajax({
                                    type: 'POST',
                                    data: 'email=' + $("#email").val(),
                                    url: '/sakura/account/checkEmail',
                                    success: function (result) {
                                        if (result.length === 0 && email.length !== 0) {
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

                        function checkPhone() {
                            $("#phoneError").html("");
                            $("#phone").css("border", "");
                            var phone = $("#phone").val().trim();
                            if (phone.length !== 0) {
                                var re = /^\d{10}$/;
                                if (!re.test(phone) && phone.length !== 0) {
                                    $("#phoneError").html("SĐT phải có 10 chữ số!");
                                    $("#phoneError").css("color", "red");
                                }
                            }
                        }

                        function validate() {
                            var registerForm = document.getElementById("registerForm");
                            var fullname = $("#fullname").val().trim();
                            var username = $("#username").val().trim();
                            var email = $("#email").val().trim();
                            var phone = $("#phone").val().trim();
                            var password = $("#password").val().trim();
                            var confirmPassword = $("#cf-password").val().trim();
////                var confirmPassword = registerForm.confirmPassword.value.trim();
                            if (!fullname || $("#fullnameError").html() !== "") {
                                $("#fullname").css("border-bottom", "1.5px solid red");
                                $("#fullname").focus();
//                    document.getElementById("fullname").style = "border:2px solid red";
//                    document.getElementById("fullname").focus();
                                return false;
                            } else if (!username || $("#usernameError").html() !== "") {
                                $("#username").css("border-bottom", "1.5px solid red");
                                $("#username").focus();
                                return false;
                            } else if (!email || $("#emailError").html() !== "") {
                                $("#email").css("border-bottom", "1.5px solid red");
                                $("#email").focus();
                                return false;
                            } else if (!phone || $("#phoneError").html() !== "") {
                                $("#phone").css("border-bottom", "1.5px solid red");
                                $("#phone").focus();
                                return false;
                            } else if (!password || $("#passwordError").html() !== "") {
                                $("#password").css("border-bottom", "1.5px solid red");
                                $("#password").focus();
                                return false;
                            } else if (!confirmPassword || $("#cf-passwordError").html() !== "") {
                                $("#cf-password").css("border-bottom", "1.5px solid red");
                                $("#cf-password").focus();
                                return false;
                            }
                        }
        </script>
    </body>
</html>
