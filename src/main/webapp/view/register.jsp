<%-- 
    Document   : register
    Created on : May 31, 2022, 10:11:38 AM
    Author     : Vu Thien An - SE160296
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakura - Đăng ký</title>

        <%@include file="../view/assets.jsp" %>

        <!--CSS-->
        <link rel="stylesheet" href="../assets/css/register.css">
        <link rel="stylesheet" href="../assets/css/app.css">

        <!--Javascript-->
        <script src="../assets/javascript/jquery/jquery.min.js"></script>
        
        <script src="../assets/pacejs/pace.min.js" type="text/javascript"></script>
        <link href="../assets/pacejs/pace-theme-default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/pacejs/flash.css" rel="stylesheet" type="text/css"/>
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
                    <h2 class="z-10 pt-9 text-white opacity-100 text-[50px] font-semibold">Xin chào!</h2>
                    <p  class="z-10 pt-9 text-white text-[20px] font-extralight">Nhập thông tin của bạn để đăng ký tài khoản để đồng hành cùng Sakura</p>
                </div>
                <img class="w-2/5 h-screen absolute " src="../assets/images/bg2.jpg" alt="">
            </div>

            <!-- login form -->
            <div class="w-3/5 h-full pt-[4%] pb-[6%] px-[6%]">
                <form class="login-form flex flex-col justify-center items-center w-full h-full" action="/sakura/access/register" method="post" id="form" name="register-form" novalidate="">

                    <div class="form-header w-full h-14 text-center m-0 p-0 relative">
                        <h2 class="text-3xl text-[#288D87] font-medium ">Đăng ký</h2>
                    </div>
                    <ul class="item-list list-none w-[52%]">

                        <!--Full name-->
                        <li class="item block relative z-0 w-full mb-7">
                            <input type="text" id="fullname" name="fullname" placeholder=" " required onchange="checkFullname()" value ="${sessionScope.name}"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                            <p id="fullnameError" class="warning font-light absolute right-0"></p>
                            <label for="fullname" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Họ và tên</label>
                        </li>

                        <!--User name-->
                        <li class="item block relative z-0 w-full mb-7">
                            <input type="text" id="username" name="username" placeholder=" " required onchange="checkUsername()"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none  focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                            <p id="usernameError" class="warning font-light absolute right-0">(tối thiểu 6 kí tự gồm chữ, số hoặc kí tự '_', bắt đầu với chữ cái)</p>
                            <label for="username" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Tên đăng nhập</label>
                        </li>

                        <!--Email-->
                        <c:choose>
                            <c:when test = "${sessionScope.googleToken != null}">
                                <li class="item block relative z-0 w-full mb-7">
                                    <input type="email" id="email" name="email" placeholder=" " required onchange="checkEmail()" value ="${sessionScope.email}" readonly
                                           class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                                    <p id="emailError" class="warning font-light absolute right-0"></p>
                                    <label for="email" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Email</label>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="item block relative z-0 w-full mb-7">
                                    <input type="email" id="email" name="email" placeholder=" " required onchange="checkEmail()"
                                           class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                                    <p id="emailError" class="warning font-light absolute right-0"></p>
                                    <label for="email" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Email</label>
                                </li>
                            </c:otherwise>
                        </c:choose>

                        <!--Phone-->
                        <li class="item block relative z-0 w-full mb-7">
                            <input type="tel" id="phone" name="phone" placeholder=" " required onchange="checkPhone()"
                                   class="pt-3 pb-1 block w-full px-0 mt-2 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200" />
                            <p id="phoneError" class="warning font-light absolute right-0"><span class="font-extralight"></span></p>
                            <label for="phone" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Số điện thoại <span class="font-extralight"> (10 chữ số)</label>
                        </li>

                        <!--Password-->
                        <li class="item block relative z-0 w-full mb-7">
                            <input type="password" id="password" name="password" placeholder=" " required onchange="checkPassword()"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200 pr-[36px]" />
                            <p id="password-error" class="warning font-light absolute right-0">${requestScope.warning}</p>
                            <label for="password" class="absolute duration-300 top-3 -z-1 origin-0 text-gray-500">Mật khẩu <span class="font-extralight">(8-15 kí tự, không khoảng trắng)</span></label>
                            <i class="bi bi-eye-slash absolute right-[10px] bottom-[6px] cursor-pointer" id="toggle-password"></i>
                        </li>

                        <!--Confirm password-->
                        <li class="item block relative z-0 w-full mb-8">
                            <input type="password" id="cf-password" name="cf-password" placeholder=" " required onchange="checkConfirmPassword()"
                                   class="pt-3 pb-1 block w-full px-0 mt-0 bg-transparent border-0 border-b-[1.5px] appearance-none outline-none focus:outline-none focus:ring-0 focus:border-[#17535B] border-gray-200 pr-[36px]" />
                            <p id="cf-password-error" class="warning font-light absolute right-0">${requestScope.warning}</p>
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
                            <button type="submit" id="register-btn" class="w-full h-1/5 mx-auto rounded px-5 py-3 min-w-max overflow-hidden shadow relative bg-[#17535B] text-white hover:bg-opacity-[95%] disabled:cursor-progress disabled:bg-opacity-[50%]" onclick="return validate()">
                                Đăng ký
                            </button>  
                        </li>
                        <div id="more" class="mt-3 flex justify-center text-sm font-light">
                            <span>Đã có tài khoản? </span> <a id="signin" href="/sakura/access/login" class="ml-1 font-normal text-green-700 hover:font-normal hover:text-green-600"> Đăng nhập</a>
                        </div>
                        <li class="mt-1">
                            <p class="text-center text-sm font-light">hoặc bắt đầu với</p>
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
            window.onload = () => {
                const myInput = document.querySelector("#cf-password");
                myInput.onpaste = e => e.preventDefault();
            };
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
            function removeAscent(str) {
                if (str === null || str === undefined)
                    return str;
                str = str.toLowerCase();
                str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
                str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
                str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
                str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
                str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
                str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
                str = str.replace(/đ/g, "d");
                return str;
            }

            function checkFullname(submit) {
                $("#fullnameError").html("");
                $("#fullname").css("border-bottom", "");
                var fullname = $("#fullname").val().trim();
                if (fullname.length !== 0) {
                    var re = /^[a-zA-Z\s]{2,}$/g; // regex here
                    if (!re.test(removeAscent(fullname)) && fullname.length !== 0) {
                        $("#fullnameError").html("Tên riêng chỉ gồm chữ cái, ít nhất 2 kí tự!");
                        $("#fullnameError").css("color", "red");
                        if (submit === 1)
                            $("#fullname").focus();
                        return false;
                    }
                    return true;
                }
                return false;
            }

            function checkUsername(submit) {
                $("#usernameError").html("");
                $("#username").css("border-bottom", "");
                var username = $("#username").val().trim();
                if (username.length > 0 && username.length < 6) {
                    $("#usernameError").html("(tối thiểu 6 kí tự gồm chữ, số hoặc kí tự '_', bắt đầu với chữ cái)");
                    $("#usernameError").css("color", "red");
                    if (submit === 1)
                        $("#username").focus();
                    return false;
                } else if (username.length !== 0) {
                    jQuery.ajax({
                        type: 'POST',
                        data: 'username=' + $("#username").val(),
                        url: '/sakura/account/checkUsername',
                        success: function (result) {
                            if (result.length === 0) {
                                var re = /^[a-zA-Z]\w+$/;
                                if (!re.test($("#username").val())) {
                                    $("#usernameError").html("(tối thiểu 6 kí tự gồm chữ, số hoặc kí tự '_', bắt đầu với chữ cái)");
                                    $("#usernameError").css("color", "red");
                                    if (submit === 1)
                                        $("#username").focus();
                                    return false;
                                }
                            } else {
                                $("#usernameError").html(result);
                                $("#usernameError").css("color", "red");
                                if (submit === 1)
                                    $("#username").focus();
                                return false;
                            }
                            return true;
                            //console.log('Success check username');
                        },
                        error: function () {
                            //console.log('Error check username');
                        },
                        complete: function (result) {
                            //console.log('Complete check username');
                        }
                    });
                    return true;
                }
                $("#usernameError").html("(tối thiểu 6 kí tự gồm chữ, số hoặc kí tự '_', bắt đầu với chữ cái)");
                $("#usernameError").css("color", "");
                return false;
            }

            function checkEmail(submit) {
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
                                    if (submit === 1)
                                        $("#email").focus();
                                    return false;
                                }
                            } else {
                                $("#emailError").html(result);
                                $("#emailError").css("color", "red");
                                if (submit === 1)
                                    $("#email").focus();
                                return false;
                            }
                            return true;
                            //console.log('Success 65');
                        },
                        error: function () {
                            //console.log('Error 68');
                        },
                        complete: function (result) {
                            //console.log('Complete 71');
                        }
                    });
                    return true;
                }
                return false;
            }

            function checkPassword(submit) {
                $("#password-error").html("");
                $("#password").css("border", "");
                var re = /\S{8,15}/; // regex here
                console.log($("#password").val());
                if ($("#password").val().trim().length > 0 && !re.test($("#password").val().trim())) {
                    if ($("#password").val().trim().length < 8 || $("#password").val().trim() > 15) {
                        $("#password-error").html("8-15 kí tự!");
                    } else {
                        $("#password-error").html("Không khoảng trắng!");
                    }
                    console.log($("#password").val());
                    $("#password-error").css("color", "red");
                    if (submit === 1)
                        $("#password").focus();
                    return false;
                }
                return true;
            }

            function checkConfirmPassword(submit) {
                $("#cf-password-error").html("");
                $("#cf-password").css("border", "");
                if ($("#password").val().trim() !== $("#cf-password").val().trim()) {
                    $("#cf-password-error").html("Không khớp!");
                    $("#cf-password-error").css("color", "red");
                    if (submit === 1)
                        $("#cf-password").focus();
                    return false;
                }
                return true;
            }

            function checkPhone(submit) {
                $("#phoneError").html("");
                $("#phone").css("border", "");
                var phone = $("#phone").val().trim();
                if (phone.length !== 0) {
                    var re = /^\d{10}$/;
                    if ($("#phone").val().trim().length > 0 && !re.test(phone)) {
                        $("#phoneError").html("SĐT gồm 10 chữ số!");
//                                    if (phone.length < 10)
//                                        $("#phoneError").html("SĐT phải gồm 10 chữ số!");
//                                    if (phone.length > 10)
//                                        $("#phoneError").html("SĐT chỉ gồm 10 chữ số!");
                        $("#phoneError").css("color", "red");
                        if (submit === 1)
                            $("#phone").focus();
                        return false;
                    }
                    return true;
                }
                return false;
            }

            function validate() {
                var registerForm = document.getElementById("registerForm");
                var fullname = $("#fullname").val().trim();
                var username = $("#username").val().trim();
                var email = $("#email").val().trim();
                var phone = $("#phone").val().trim();
                var password = $("#password").val();
                var confirmPassword = $("#cf-password").val();
////                var confirmPassword = registerForm.confirmPassword.value.trim();
                var res = true;
                if (confirmPassword === "") {
                    $("#cf-password").css("border-bottom", "1.5px solid red");
                    $("#cf-password").focus();
                    $("#cf-password-error").html("Không được để trống!");
                    $("#cf-password-error").css("color", "red");

                    res = false;
                    // return false;
                } else {
                    var tmp = checkConfirmPassword(1);
                    console.log("Cf pass: " + tmp);
                    if (tmp === false)
                        res = false;
                }
                if (password === "") {
                    $("#password").css("border-bottom", "1.5px solid red");
                    $("#password").focus();
                    $("#password-error").html("Không được để trống!");
                    $("#password-error").css("color", "red");

                    res = false;
                    // return false;
                } else {
                    var tmp = checkPassword(1);
                    console.log("Pass: " + tmp);
                    if (tmp === false)
                        res = false;
                }
                if (phone === "") {
                    $("#phone").css("border-bottom", "1.5px solid red");
                    $("#phone").focus();
                    $("#phoneError").html("Không được để trống!");
                    $("#phoneError").css("color", "red");
                    res = false;
                    // return false;
                } else {
                    var tmp = checkPhone(1);
                    console.log("Phone: " + tmp);
                    if (tmp === false)
                        res = false;
                }
                if (email === "") {
                    $("#email").css("border-bottom", "1.5px solid red");
                    $("#email").focus();
                    $("#emailError").html("Không được để trống!");
                    $("#emailError").css("color", "red");
                    res = false;
                    // return false;
                } else {
                    var tmp = checkEmail(1);
                    console.log("Email: " + tmp);
                    if (tmp === false)
                        res = false;
                }
                if (username === "") {
                    $("#username").css("border-bottom", "1.5px solid red");
                    $("#username").focus();
                    $("#usernameError").html("Không được để trống!");
                    $("#usernameError").css("color", "red");
                    res = false;
                } else {
                    var tmp = checkUsername(1);
                    console.log("Username " + tmp);
                    if (tmp === false)
                        res = false;
                }
                if (fullname === "") {
                    $("#fullname").css("border-bottom", "1.5px solid red");
                    $("#fullname").focus();
                    $("#fullnameError").html("Không được để trống!");
                    $("#fullnameError").css("color", "red");
                    res = false;
                } else {
                    var tmp = checkFullname(1);
                    console.log("Fullname " + tmp);
                    if (tmp === false)
                        res = false;
                }
                console.log("Res: " + res);
                return res;
            }

            const form = document.getElementById('form');
            const submitBtn = document.getElementById('register-btn');
            form.addEventListener('submit', function () {
                console.log("Form submit");
                submitBtn.disabled = true;
                submitBtn.innerHTML = "Đang gửi mã xác thực đến mail...";
            });
        </script>
    </body>
</html>