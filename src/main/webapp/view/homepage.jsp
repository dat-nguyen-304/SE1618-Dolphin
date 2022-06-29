<%-- 
    Document   : home
    Created on : May 27, 2022, 4:47:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" ></script>
<script>
    /*$(window).bind("pageshow", function(event) {
     if (event.originalEvent.persisted) {
     window.location.reload(); 
     }
     });*/
</script> 

<% 
    //response.setHeader("Cache-Control", "no-cache, no-store");
%>

<html class="no-js" lang="en">
    <!--<![endif]-->

    <head>

        <!--- basic page needs
       ================================================== -->
        <meta charset="utf-8">
        <title>Sakura</title>
        <meta name="description" content="">
        <meta name="author" content="">


        <!-- Reload page-->

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">

        <!-- mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSS -->

        <link rel="stylesheet" href="/sakura/assets/css/homepage-main.css">
        <link rel="stylesheet" href="/sakura/assets/css/header-user.css">
        <link rel="stylesheet" href="/sakura/assets/css/header-guest.css">
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- script -->
        <script src="assets/javascript/homepage-modernizr.js"></script>
        <script src="assets/javascript/homepage-pace.min.js"></script>

        <!-- favicons -->
        <link rel="shortcut icon" href="/sakura/assets/icons/logo.png" type="image/x-icon">

        <!-- Icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    </head>

    <body id="top" onbeforeunload='return reloadPage()'>

        <!-- HOME -->
        <section id="home" class="parallax w-full h-full bg-transparent relative">
            <header id="header-section"class="z-[5] ">
                <c:choose>
                    <c:when test="${sessionScope.currentUser == null}">
                        <%@include file="../view/headerGuest.jsp"%>
                    </c:when>    
                    <c:otherwise>
                        <%@include file="../view/headerUser.jsp" %>
                    </c:otherwise>
                </c:choose>
            </header>
            <div class="overlay absolute top-0 left-0 w-full h-full bg-[#000] opacity-[0.6] z-0"></div>
            <div class="home-content w-[65%] h-full mx-auto flex flex-col justify-center ">
                <div class="home-content-title mb-[50px] z-[2]">
                    <h1 data-aos="fade-up" class="text-[50px] text-[#fff] font-bold mb-[20px] tracking-wide">
                        Không gian sống tiêu chuẩn<br>
                        <span style="color: #FF9410;">dành cho giới trẻ</span>
                    </h1>
                    <h5 data-aos="fade-up" class="text-[#fff] text-[20px] font-medium tracking-wide	">Điều kiện sống chất lượng với nhiều ưu điểm nổi bật</h5>
                </div>
                <div data-aos="fade-up" class="filter-container w-full h-auto bg-white/80 backdrop-blur-md  py-[20px] px-[60px] rounded z-[2]">
                    <form action="/sakura/hostel/list" class="filter grid grid-cols-5 gap-[20px]">
                        <select id="province" class="filter-address col-span-2 outline-none border border-[#40576C] hover:border-[#FF9F47] rounded text-[18px] font-bold text-[#40576C] w-full h-full p-2" name="province">
                            <option value="0">Chọn thành phố</option>
                        </select>

                        <select id="district" class="filter-address col-span-2 outline-none border border-[#40576C] hover:border-[#FF9F47] rounded text-[18px] font-bold text-[#40576C] w-full h-full p-2" name="district">
                            <option value="0">Chọn quận</option>
                        </select>

                        <button class="btn btn-search text-[#fff] bg-[#17535B] hover:bg-[#13484F] w-full h-full rounded cursor-pointer" type="submit">
                            <i class="bi-search"></i> Tìm phòng
                        </button>
                    </form>
                </div>
            </div> <!-- end home-content -->
            <div class="home-scrolldown absolute bottom-0 right-0 rotate-90 origin-top-right float-right cursor-pointer z-[2] text-[17px]">
                <a href="#about" class="scroll-icon smoothscroll inline-block relative font-light text-[#afafaf] hover:text-[#fff] focus:text-[#fff] bg-transparent top-[36px] right-[42px] tracking-wide">
                    <span>Khám phá</span>
                    <i class="bi-arrow-right pl-[9px] relative text-[15px]" aria-hidden="true"></i>
                </a>
            </div>


        </section> <!-- end home -->

        <!-- about
        ================================================== -->
        <section id="about" class="w-full bg-[#fff] overflow-hidden pt-[80px]">
            <div class="about-intro w-[65%] mx-auto pb-[40px] border-b border-b-[#C5C7C9] grid grid-cols-3">
                <div class="col-span-1">
                    <h1 class="intro-header text-[40px] font-bold text-[#17535B] relative pb-[15px]" data-aos="fade-up">Về Sakura</h1>
                </div>
                <div class="col-span-2">
                    <p class="lead text-justify text-[20px] text-[#727980] font-normal leading-9" data-aos="fade-up">
                        Hệ thống quản lý nhà trọ Sakura hướng đến mục tiêu trở thành một ứng dụng thuận tiện cho cả người thuê và chủ nhà. Chủ nhà sẽ được hỗ trợ rất nhiều với các chức năng như quản lý khách thuê, phòng thuê, xem thống kê doanh thu, dịch sử dụng,... Sakura cung cấp cho chủ nhà khả năng tương tác với người thuê một cách thuận tiện, gửi - nhận yêu cầu cũng như đăng thông tin thanh toán. Khách thuê có thể nhanh chóng tìm kiếm giá thuê phù hợp nhờ chức năng lọc thông minh của hệ thống.
                    </p>
                </div>
            </div>

            <div class="about-how w-[65%] mx-auto mt-[30px] pb-[40px] border-b border-b-[#C5C7C9]">
                <div class="flex justify-center">
                    <h1 class="intro-header mx-auto text-[40px] font-bold text-[#17535B] relative pb-[15px]" data-aos="fade-up">Tại sao nên chọn Sakura?</h1>
                    <%-- <p class="text-gray-500 sm:text-[25px]">Here at Flowbite we focus on markets where technology, innovation, and capital can unlock long-term value and drive economic growth.</p> --%>
                </div>
                <div class="mt-14 space-y-8 md:grid md:grid-cols-2 lg:grid-cols-3 md:gap-12 md:space-y-0">
                    <div data-aos="fade-up">
                        <div class="flex justify-center items-center mb-4 w-10 h-10 rounded-full bg-[#ECF4F4]" data-aos="fade-up">
                            <svg class="w-5 h-5 text-[#17535B]" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 0l-2 2a1 1 0 101.414 1.414L8 10.414l1.293 1.293a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        </div>
                        <h3 class="mb-2 text-[25px] font-bold">Không gian tiêu chuẩn, mức giá hợp lý</h3>
                        <p class="text-gray-500">SAKURA cung cấp các căn hộ khép kín tọa lạc tại các vị trí thuận lợi với mức giá hợp lí nhưng vẫn đảm bảo đầy đủ các thiết bị nội thất và dịch vụ thiết yếu.</p>
                    </div>
                    <div data-aos="fade-up">
                        <div class="flex justify-center items-center mb-4 w-10 h-10 rounded-full bg-[#ECF4F4]">
                            <svg class="w-5 h-5 text-[#17535B] " fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10.394 2.08a1 1 0 00-.788 0l-7 3a1 1 0 000 1.84L5.25 8.051a.999.999 0 01.356-.257l4-1.714a1 1 0 11.788 1.838L7.667 9.088l1.94.831a1 1 0 00.787 0l7-3a1 1 0 000-1.838l-7-3zM3.31 9.397L5 10.12v4.102a8.969 8.969 0 00-1.05-.174 1 1 0 01-.89-.89 11.115 11.115 0 01.25-3.762zM9.3 16.573A9.026 9.026 0 007 14.935v-3.957l1.818.78a3 3 0 002.364 0l5.508-2.361a11.026 11.026 0 01.25 3.762 1 1 0 01-.89.89 8.968 8.968 0 00-5.35 2.524 1 1 0 01-1.4 0zM6 18a1 1 0 001-1v-2.065a8.935 8.935 0 00-2-.712V17a1 1 0 001 1z"></path></svg>
                        </div>
                        <h3 class="mb-2 text-[25px] font-bold">Thông tin cập nhật liên tục, chính xác</h3>
                        <p class="text-gray-500">Thông tin chi tiết và hình ảnh về các dự án căn hộ cũng như các dịch vụ tiện ích luôn được cập nhật liên tục và chính xác bởi SAKURA.</p>
                    </div>
                    <div data-aos="fade-up">
                        <div class="flex justify-center items-center mb-4 w-10 h-10 rounded-full bg-[#ECF4F4]">
                            <svg class="w-5 h-5 text-[#17535B]" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 6V5a3 3 0 013-3h2a3 3 0 013 3v1h2a2 2 0 012 2v3.57A22.952 22.952 0 0110 13a22.95 22.95 0 01-8-1.43V8a2 2 0 012-2h2zm2-1a1 1 0 011-1h2a1 1 0 011 1v1H8V5zm1 5a1 1 0 011-1h.01a1 1 0 110 2H10a1 1 0 01-1-1z" clip-rule="evenodd"></path><path d="M2 13.692V16a2 2 0 002 2h12a2 2 0 002-2v-2.308A24.974 24.974 0 0110 15c-2.796 0-5.487-.46-8-1.308z"></path></svg>                    
                        </div>
                        <h3 class="mb-2 text-[25px] font-bold">Dễ dàng đặt lịch xem phòng</h3>
                        <p class="text-gray-500">Dễ dàng đặt lịch tư vấn và xem phòng vào các khung giờ phù hợp cùng với đại diện của SAKURA.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- end about -->

        <!-- customer-review Section
        ================================================== -->
        <section id="customer-review" class="w-full bg-[#fff] overflow-hidden pt-[80px]">
            <div class="review-container w-[65%] mx-auto mt-[30px] pb-[40px]">
                <div class="flex justify-center">
                    <h1 class="intro-header mx-auto text-[40px] font-bold text-[#17535B] relative pb-[15px]" data-aos="fade-up">Khách hàng đánh giá về SAKURA</h1>
                </div>
                <div id="animation-carousel" class="relative w-[80%] mx-auto py-[30px] px-[70px]" data-carousel="static">
                    <!-- Carousel wrapper -->
                    <div class="overflow-hidden relative h-[250px] rounded px-5">
                        <!-- Item 1 -->
                        <div class="hidden duration-200 ease-linear" data-carousel-item>
                            <div class="review w-[80%] mx-auto">
                                <p class="text-[28px] font-normal text-[#40576C] text-center">"Chọn SAKURA mình vừa tiết kiệm vừa có chỗ ở chất lượng không như các phòng trọ khác."</p>
                            </div>
                            <div class="author mt-[20px] flex items-center justify-center">
                                <img src="assets/images/homepage-images/avatars/ava1.jpg" alt="Author image"
                                     class="w-8 h-8 object-cover rounded-full">
                                <p class="ml-[10px] text-[18px] font-bold text-[#40576C]">
                                    Nguyễn Thuỷ Tiên <span class="font-light"> | Cư dân Sakura Phú Nhuận</span>
                                </p>
                            </div>
                        </div>
                        <!-- Item 2 -->
                        <div class="hidden duration-200 ease-linear" data-carousel-item>
                            <div class="review w-[80%] mx-auto">
                                <p class="text-[28px] font-normal text-[#40576C] text-center">"Cảm ơn SAKURA đã mang lại nơi ở tiện nghi, an ninh. Mình rất hài lòng về mọi thứ."</p>
                            </div>
                            <div class="author mt-[20px] flex items-center justify-center">
                                <img src="assets/images/homepage-images/avatars/ava2.jpg" alt="Author image"
                                     class="w-8 h-8 object-cover rounded-full">
                                <p class="ml-[10px] text-[18px] font-bold text-[#40576C]">
                                    Trần Ngọc An <span class="font-light"> | Cư dân Sakura Trần Ngọc An</span>
                                </p>
                            </div>
                        </div>
                        <!-- Item 3 -->
                        <div class="hidden duration-200 ease-linear" data-carousel-item="active">
                            <div class="review w-[80%] mx-auto">
                                <p class="text-[28px] font-normal text-[#40576C] text-center">"Đội ngũ tư vấn nhượng quyền rất tận tình, đưa ra phương án kinh doanh giúp tôi đạt được lợi nhuận lâu dài."</p>
                            </div>
                            <div class="author mt-[20px] flex items-center justify-center">
                                <img src="assets/images/homepage-images/avatars/ava3.jpg" alt="Author image"
                                     class="w-8 h-8 object-cover rounded-full">
                                <p class="ml-[10px] text-[18px] font-bold text-[#40576C]">
                                    Lê Hải Hoàng <span class="font-light"> | Khách hàng nhượng quyền SAKURA</span>
                                </p>
                            </div>
                        </div>
                        <!-- Item 3 -->
                        <div class="hidden duration-200 ease-linear" data-carousel-item="active">
                            <div class="review w-[80%] mx-auto">
                                <p class="text-[28px] font-normal text-[#40576C] text-center">"Một trải nghiệm thuê và quản lý cho thuê nhà ở hoàn toàn mới lạ, chuyên nghiệp. Mình vô cùng hài lòng về dịch vụ của Sakura"</p>
                            </div>
                            <div class="author mt-[20px] flex items-center justify-center">
                                <img src="assets/images/homepage-images/avatars/ava3.jpg" alt="Author image"
                                     class="w-8 h-8 object-cover rounded-full">
                                <p class="ml-[10px] text-[18px] font-bold text-[#40576C]">
                                    Hoàng Văn Dũng <span class="font-light"> | Cư dân Sakura Bình Thạnh</span>
                                </p>
                            </div>
                        </div>
                        <!-- Item 3 -->
                        <div class="hidden duration-200 ease-linear" data-carousel-item="active">
                            <div class="review w-[80%] mx-auto">
                                <p class="text-[28px] font-normal text-[#40576C] text-center">"Không gian và tiện ích nhà ở của Sakura thực sự rất tuyệt. Không chỉ vậy các khâu quản lý cũng cực kỳ chỉn chu, nghiêm ngặt và cẩn thận. Mình cảm thấy rất an toàn và hài lòng khi ở phòng của Sakura."</p>
                            </div>
                            <div class="author mt-[20px] flex items-center justify-center">
                                <img src="assets/images/homepage-images/avatars/ava3.jpg" alt="Author image"
                                     class="w-8 h-8 object-cover rounded-full">
                                <p class="ml-[10px] text-[18px] font-bold text-[#40576C]">
                                    Dương Thị Vân <span class="font-light"> | Cư dân Sakura Quận 1</span>
                                </p>
                            </div>
                        </div>

                    </div>
                    <!-- Slider indicators -->
                    <div class="flex absolute bottom-5 left-1/2 z-30 space-x-3 -translate-x-1/2">
                        <button type="button" class="w-6 h-[4px] rounded" aria-current="true" aria-label="Slide 1"
                                data-carousel-slide-to="0"></button>
                        <button type="button" class="w-6 h-[4px] rounded" aria-current="false" aria-label="Slide 2"
                                data-carousel-slide-to="1"></button>
                        <button type="button" class="w-6 h-[4px] rounded" aria-current="false" aria-label="Slide 3"
                                data-carousel-slide-to="2"></button>
                        <button type="button" class="w-6 h-[4px] rounded" aria-current="false" aria-label="Slide 4"
                                data-carousel-slide-to="3"></button>
                        <button type="button" class="w-6 h-[4px] rounded" aria-current="false" aria-label="Slide 5"
                                data-carousel-slide-to="4"></button>
                    </div>
                    <!-- Slider controls -->
                    <button type="button"
                            class="flex absolute top-0 left-0 z-30 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none"
                            data-carousel-prev>
                        <span
                            class="inline-flex justify-center items-center w-8 h-8 rounded-ful group-focus:outline-none">
                            <svg class="w-5 h-5 text-[#40576C]" fill="none" stroke="currentColor"
                                 viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7">
                            </path>
                            </svg>
                            <span class="hidden">Previous</span>
                        </span>
                    </button>
                    <button type="button"
                            class="flex absolute top-0 right-0 z-30 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none"
                            data-carousel-next>
                        <span
                            class="inline-flex justify-center items-center w-8 h-8 rounded-ful group-focus:outline-none">
                            <svg class="w-5 h-5 text-[#40576C]" fill="none" stroke="currentColor"
                                 viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                            </svg>
                            <span class="hidden">Next</span>
                        </span>
                    </button>
                </div>
            </div>


        </section> <!-- end customer-review -->

        <!-- footer
        ================================================== -->
        <div>
            <div class="footer-bottom">
                <div class="row">
                    <div class="col-twelve">
                        <div id="go-top">
                            <a class="smoothscroll" title="Back to Top" href="#top"><i class="bi-arrow-up"></i></a>
                        </div>
                    </div>
                </div> <!-- end footer-bottom -->
            </div>
        </div>
        <%@include file="footer.jsp" %>      
        <%-- <div id="preloader"><div id="loader"></div></div> --%>

        <!-- Java Script
        ================================================== -->

        <script src="assets/javascript/homepage-jquery-2.1.3.min.js"></script>
        <script src="assets/javascript/homepage-plugins.js"></script>
        <script src="assets/javascript/homepage-main.js"></script>

        <script type="text/javascript">
    window.addEventListener("scroll", function () {
        var header = document.querySelector("#header-section");
        header.classList.toggle("stick", window.scrollY > 0);

        // var img = document.querySelector("#logo-header");
        // img.src = "../assets/images/homepage-icon/logo.png"; 
    });

    var initialSrc = "assets/images/homepage-icon/logo_white.png";
    var scrollSrc = "assets/images/homepage-icon/logo.png";

    $(window).scroll(function () {
        var value = $(this).scrollTop();
        if (value > 0) {
            //$("#name-header").css("color", "#17535B");
            $("#logo-header").attr("src", scrollSrc);
        } else {
            //$("#name-header").css("color", "#fff");
            $("#logo-header").attr("src", initialSrc);
        }
    });
        </script>
        <script>
            /* When the user clicks on the button, toggle between hiding and showing the dropdown content */
            function myFunction() {
                document.querySelector("#myDropdown").classList.toggle("show");
            }

            // Close the dropdown if the user clicks outside of it
            window.onclick = function (event) {
                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            };
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                console.log('Line 69');
                jQuery.ajax({
                    url: '/sakura/hostel/findDistrictProvince',
                    type: 'GET',
                    data: {param: "province"},
                    dataType: 'text',
                    sucess: function (response) {
                    },
                    error: function () {
                        console.log('Error 78');
                    },
                    complete: function (obj) {
                        var data = JSON.parse(obj.responseText);
                        for (var i = 0; i < data.length; i++) {
                            $("#province").append($("<option/>", {
                                value: data[i].provinceID,
                                text: data[i].provinceName,
                            }
                            ));
                        }
                        console.log('Complete 71');
                    }
                });
            });

            $('#province').change(function () {
                $('#district').find('option').remove();
                $('#district').append('<option value="0">Chọn quận</option>');

                let provinceID = $('#province').val();
                let data = {
                    param: "district",
                    provinceID: provinceID
                };

                jQuery.ajax({
                    url: "/sakura/hostel/findDistrictProvince",
                    method: "GET",
                    data: data,
                    sucess: function (response) {
                    },
                    error: function () {
                        console.log('Error 78');
                    },
                    complete: function (obj) {
                        var data = JSON.parse(obj.responseText);
                        for (var i = 0; i < data.length; i++) {
                            $("#district").append($("<option/>", {
                                value: data[i].districtID,
                                text: data[i].districtName,
                            }
                            ));
                        }
                        console.log('Complete 71');
                    }
                });
            });
        </script>
        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
    </body>
</html>
