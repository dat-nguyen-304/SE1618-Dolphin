<%-- 
    Document   : userProfile
    Created on : May 31, 2022, 10:09:59 PM
    Author     : Vu Thien An - SE160296
--%>

<%@page import="com.dolphin.hostelmanagement.DTO.Tenant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User profile</title>

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

        <!--Icon-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!--Favicon-->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!--CSS-->
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="/sakura/assets/css/user-profile.css">   
        <link rel="stylesheet" href="/sakura/assets/css/header-user.css">
        
        <!--Javascript-->
        <script src="../assets/javascript/jquery.js"></script>
    </head>
    <body>
        <header id="header-section" class="sticky">
            <%@include file="headerUser.jsp" %>
        </header>
        
        <c:choose>
            <c:when test="${sessionScope.currentUser != null}">
                <!--Profile panel-->
                <div class="profile-section w-screen h-screen flex justify-center pt-[70px] relative overflow-hidden">
                    <%-- Notification --%>
                    <!--code for notification starts--> 
                    <c:if test = "${not empty requestScope.message}">
                        <div role="alert" style="box-shadow: rgba(100, 100, 111, 0.15) 0px 7px 29px 0px;"
                             class="top-[100px] absolute right-5 w-[330px] bg-[#ffffff] rounded flex flex-row transition duration-150 ease-in-out overflow-hidden"
                             id="notification">
                            <div class="px-3 flex items-center justify-center bg-[#36d39a] text-white text-lg w-1/6">
                                <i class="bi bi-check-circle"></i>
                            </div>
                            <div class="px-2 py-2">
                                <h1 class="text-lg text-[#4d4d4d] font-semibold">Lưu thành công!</h1>
                                <p class="text-[12px] text-[#8a8a8a] font-normal">Thông tin của bạn đã được cập nhật.</p>
                            </div>
                            <a href="javascript:void(0)" class="flex justify-center items-center border-l text-[#c5c5c5] border-[#e0e0e0] w-1/6 cursor-pointer" onclick="closeModal()">
                                <i class="bi bi-x-lg"></i>
                            </a>
                        </div>
                    </c:if>
                    <!--code for notification ends-->

                    <div class="profile-container w-3/5 h-[70%] p-[30px] border border-[#17535b2d] flex justify-center rounded-lg mt-[30px]">
                        <form id="user-profile-form" class="w-full h-full flex p-0 m-0 mx-auto" action="/sakura/account/userProfile" method="post" enctype="multipart/form-data">
                            <!-- Left Side -->
                            <div class="profile-left w-[30%] h-full relative">
                                <!-- Profile Card -->
                                <div class="card">
                                    <div class="card-image">
                                        <div class="avatar-edit">
                                            <input id="image-upload" type="file" name="image" />
                                            <label for="image-upload"><i class="bi bi-pen-fill"></i></label>
                                        </div>
                                        <img id="image-preview" src="${sessionScope.currentUser.account.avatar}" alt="">
                  
                                    </div>
                                    <h1 class="text-[25px] font-semibold text-[#FF6532] mt-[20px]">${sessionScope.currentUser.fullname}</h1>
                                    <h3 class="text-[15px] font-normal text-[#bbbbbb]">${sessionScope.currentUser.account.username}</h3>

                                </div>
                                <ul class="addition w-full h-auto p-2 absolute bottom-0 bg-[#f6fafc] rounded-lg">
                                    <li>
                                        <span>Trạng thái</span>
                                        <span class="label">${sessionScope.currentUser.account.activate == true ? "Active" : "Inactive"}</span>
                                    </li>
                                    <li>
                                        <span>Đang thuê</span>
                                        <span class="label inactive">Không</span>
                                    </li>
                                    <li class="flex items-center py-3">
                                        <span>Ngày đăng ký</span>
                                        <span class="ml-auto">${sessionScope.currentUser.account.registrationDate}</span>
                                    </li>
                                </ul>
                                <!-- End of profile card -->
                            </div>

                            <!-- Right Side -->
                            <div class="profile-right w-3/5 h-full ml-[60px] relative">
                                <!-- About Section -->
                                <div id="profile-form">
                                    <div class="profile-info">

                                        <div class="info-title">
                                            <i class="bi bi-person-rolodex"></i>
                                            <span> Thông tin cá nhân</span>
                                        </div>
                                        <div class="info-detail">
                                            <div class="detail-item">
                                                <label for="fullname">Họ tên</label>
                                                <input type="text" id="fullname" name="fullname" placeholder="${sessionScope.currentUser.fullname}" value="${sessionScope.currentUser.fullname}">
                                                <!--<p class="error" id="fullnameError">Tên không hợp lệ</p>-->
                                            </div>
                                            <div class="detail-item">
                                                <label for="username">Tên đăng nhập</label>
                                                <input type="text" id="username" name="username" placeholder="${sessionScope.currentUser.account.username}" value="${sessionScope.currentUser.account.username}">
                                                <!--<p class="error" id="usernameError">Tên đăng nhập không hợp lệ</p>-->
                                            </div>
                                            <div class="detail-item">
                                                <label for="birthday">Ngày sinh</label>
                                                <p id="birthday">19 / 11 / 2002</p>
                                            </div>
                                        </div>
                                        <div class="info-title">
                                            <i class="bi bi-chat-square-text-fill"></i>
                                            <span> Thông tin liên hệ</span>
                                        </div>
                                        <div class="info-detail">
                                            <div class="detail-item">
                                                <label for="phone">Số điện thoại</label>
                                                <input type="tel" id="phone" name="phone" placeholder="${sessionScope.currentUser.phone}" value="${sessionScope.currentUser.phone}">
                                                <!--<p class="error" id="phoneError">Số điện thoại bao gồm 10 chữ số</p>-->
                                            </div>
                                            <div class="detail-item">
                                                <label for="email">Email</label>
                                                <input type="tel" id="phone" name="email" placeholder="${sessionScope.currentUser.account.email}" value="${sessionScope.currentUser.account.email}">
                                                <!--<p class="error" id="emailError">Không đúng định dạng email</p>-->
                                            </div>
                                            <div class="detail-item">
                                                <label for="facebook">Facebook</label>
                                                <input type="text" id="facebook" name="facebook" value="">
                                            </div>
                                        </div>
                                    </div>
                                    <button id="confirm" type="submit" name="action" value="Save" class="w-[120px] h-[45px] bg-[#17535B] text-[#f6fafc] rounded-lg absolute right-0 bottom-0">Lưu thay đổi</button>
                                    <!-- End of about section -->
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!--Modal-->
                <div class="modal opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
                    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
                    <div class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded-lg shadow-lg z-50 overflow-y-auto">
                        <div
                            class="modal-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
                            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                 viewBox="0 0 18 18">
                            <path
                                d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                            </path>
                            </svg>
                            <span class="text-sm">(Esc)</span>
                        </div>
                        <div class="modal-content py-4 text-left px-6">
                            <!--Title-->
                            <div class="flex justify-between items-center pb-3 mb-5">
                                <p class="text-2xl font-bold">Xác nhận thay đổi</p>
                                <div class="modal-close cursor-pointer z-50">
                                    <svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                                    <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                                    </svg>
                                </div>
                            </div>
                            <!--Body-->
                            <p>Bạn chắc chắn muốn lưu thông tin thay đổi?</p>
                            <!--Footer-->
                            <div class="flex justify-end pt-2 mt-5">
                                <button class="modal-close px-4 text-[#7e7e7e] p-3 rounded-lg hover:text-[#FF6532]">Huỷ</button>
                                <button id="cf-btn" class="px-4 p-3 rounded-lg bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h2>Login to see this page</h2>
                <a href="login.jsp">Go to login page</a>
            </c:otherwise>
        </c:choose>
        <script>
            var openmodal = document.querySelectorAll('#confirm');
            for (var i = 0; i < openmodal.length; i++) {
                openmodal[i].addEventListener('click', function (event) {
                    event.preventDefault();
                    toggleModal();
                });
            }

            const overlay = document.querySelector('.modal-overlay');
            overlay.addEventListener('click', toggleModal);

            var closemodal = document.querySelectorAll('.modal-close');
            for (var i = 0; i < closemodal.length; i++) {
                closemodal[i].addEventListener('click', toggleModal);
            }

            document.onkeydown = function (evt) {
                evt = evt || window.event;
                var isEscape = false;
                if ("key" in evt) {
                    isEscape = (evt.key === "Escape" || evt.key === "Esc");
                } else {
                    isEscape = (evt.keyCode === 27);
                }
                if (isEscape && document.body.classList.contains('modal-active')) {
                    toggleModal();
                }
            };

            function toggleModal() {
                const body = document.querySelector('body');
                const modal = document.querySelector('.modal');
                modal.classList.toggle('opacity-0');
                modal.classList.toggle('pointer-events-none');
                body.classList.toggle('modal-active');
            }

            const cfBtn = document.querySelector("#cf-btn");
            const form = document.querySelector("#user-profile-form");
            cfBtn.addEventListener("click", () => {
                console.log("Submit");
                form.submit();
            });
        </script>
        <script>
            function menuToggle() {
                const toggleMenu = document.querySelector(".profile-menu");
                toggleMenu.classList.toggle("active");
            }
        </script>
        <script>
            var Notification = document.getElementById("notification");
            Notification.style.transform = "translateX(150%)";
            Notification.classList.remove("hidden");
            Notification.style.transform = "translateX(0%)";
            function closeModal() {
                Notification.style.transform = "translateX(150%)";
                Notification.classList.remove("hidden");
                //setTimeout(function () {Notification.style.transform = "translateX(0%)";}, 1000);
            }
        </script>
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#image-preview').attr('src', e.target.result);
                        $('#image-preview').toggle("active");
                        $('#image-preview').hide();
                        $('#image-preview').fadeIn(500);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#image-upload").change(function () {
                readURL(this);
            });
        </script>

    </body>
</html>