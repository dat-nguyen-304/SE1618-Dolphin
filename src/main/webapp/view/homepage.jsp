<%-- 
    Document   : home
    Created on : May 27, 2022, 4:47:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="no-js" lang="en">
    <!--<![endif]-->

    <head>

        <!--- basic page needs
       ================================================== -->
        <meta charset="utf-8">
        <title>Sakura</title>
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap"
            rel="stylesheet">

        <!-- mobile specific metas
       ================================================== -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSS
       ================================================== -->
        <link rel="stylesheet" href="assets/css/homepage-base.css">
        <link rel="stylesheet" href="assets/css/homepage-vendor.css">
        <link rel="stylesheet" href="assets/css/homepage-main.css">

        <!-- script
       ================================================== -->
        <script src="assets/javascript/homepage-modernizr.js"></script>
        <script src="assets/javascript/homepage-pace.min.js"></script>

        <!-- favicons
            ================================================== -->
        <link rel="shortcut icon" href="assets/icons/logo.png" type="image/x-icon">
        <link rel="icon" href="assets/icons/logo.png" type="image/x-icon">
        <!-- Icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    </head>

    <body id="top">

        <!-- home
       ================================================== -->
        <section id="home" class="parallax">
            <div class="overlay"></div>
            <div class="home-content">
                <div class="row contents">
                    <div class="home-content-left">
                        <h1 data-aos="fade-up">
                            Không gian sống tiêu chuẩn<br>
                            <span style="color: #ff771d;">dành cho giới trẻ</span>
                        </h1>
                        <h5 data-aos="fade-up">Điều kiện sống chất lượng với nhiều ưu điểm nổi bật</h5>
                    </div>
                </div>

            </div> <!-- end home-content -->
            <div class="home-scrolldown">
                <a href="#about" class="scroll-icon smoothscroll">
                    <span>Khám phá</span>
                    <i class="bi-arrow-right" aria-hidden="true"></i>
                </a>
            </div>
            <div class="home-filter">
                <div data-aos="fade-up" class="row filter-container">
                    <form action="" class="filter">
                        <select class="filter-address">
                            <option value="">Chọn tỉnh/thành phố</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>

                        <select class="filter-address">
                            <option value="">Chọn quận/huyện</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>

                        <div class="filter-submit">
                            <button class="btn btn-search" type="button">
                                <i class="bi-search"></i> Tìm phòng
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <nav class="container header">
                <a class="logo" href="#">
                    <img id="logo-header" src="assets/images/homepage-icon/logo_white.png" alt="">
                    <h3 id="name-header">Sakura</h3>
                </a>
                <!-- left header section -->
                <div class="item-list">
                    <a class="item active" href="#">Trang chủ</a>
                    <a class="item" href="#">Thuê phòng</a>
                    <a class="item" href="#">Đăng tin nhà trọ</a>
                </div>
                <!-- right header section -->
                <div class="access">
                    <a href="/sakura/access/loginPage">Đăng nhập</a>
                    <a href="/sakura/access/registerPage">Đăng kí</a>
                </div>
            </nav>
        </section> <!-- end home -->

        <!-- about
        ================================================== -->
        <section id="about">

            <div class="row about-intro">

                <div class="col-four">
                    <h1 class="intro-header" data-aos="fade-up">Về hệ thống Sakura</h1>
                </div>
                <div class="col-eight">
                    <p class="lead" data-aos="fade-up">
                        Hệ thống Quản lý Nhà trọ Sakura hướng đến mục tiêu trở thành một ứng dụng thuận tiện cho cả người
                        thuê và chủ nhà và chủ nhà. Với hệ thống này, chủ nhà sẽ được hỗ trợ rất nhiều với các chức năng
                        khác nhau như quản lý khách thuê, phòng thuê, xem thống kê doanh thu, dịch sử dụng ký,... Hệ thống
                        cung cấp cho chủ nhà khả năng tương tác với người thuê của họ một cách nhanh chóng và thuận tiện,
                        bao gồm cả việc gửi và nhận yêu cầu cũng như đăng thông tin thanh toán. Mặt khác, khách thuê có thể
                        nhanh chóng tìm kiếm giá thuê phù hợp nhờ chức năng lọc thông minh của hệ thống.
                    </p>
                </div>

            </div>




            <div class="row about-how">

                <h1 class="intro-header" data-aos="fade-up">Tại sao nên chọn APLUS Home?</h1>
                <div class="row about-features">

                    <div class="features-list block-1-3 block-m-1-2 block-mob-full group">

                        <div class="bgrid feature" data-aos="fade-up">

                            <span class="icon"><i class="icon-window"></i></span>
                            <div class="service-content">

                                <h3>Không gian tiêu chuẩn, mức giá hợp lý</h3>

                                <p>SAKURA cung cấp các căn hộ khép kín tọa lạc tại các vị trí thuận lợi với mức giá hợp lí
                                    nhưng
                                    vẫn đảm bảo đầy đủ các thiết bị nội thất và dịch vụ thiết yếu.
                                </p>

                            </div>

                        </div> <!-- /bgrid -->

                        <div class="bgrid feature" data-aos="fade-up">

                            <span class="icon"><i class="icon-image"></i></span>

                            <div class="service-content">
                                <h3>Thông tin cập nhật liên tục và chính xác</h3>

                                <p>Thông tin chi tiết và hình ảnh về các dự án căn hộ cũng như các dịch vụ tiện ích luôn
                                    được
                                    cập nhật liên tục và chính xác bởi SAKURA.
                                </p>


                            </div>

                        </div> <!-- /bgrid -->

                        <div class="bgrid feature" data-aos="fade-up">

                            <span class="icon"><i class="icon-paint-brush"></i></span>

                            <div class="service-content">
                                <h3>Dễ dàng đặt lịch xem phòng</h3>

                                <p>Dễ dàng đặt lịch tư vấn và xem phòng vào các khung giờ phù hợp cùng với đại diện của
                                    SAKURA.
                                </p>

                            </div>

                        </div> <!-- /bgrid -->


                    </div> <!-- end features-list -->

                    <div class="row about-bottom-image">
                        <img src="assets/images/homepage-images/bg2.jpg" alt="App Screenshots" data-aos="fade-up">
                        <img src="assets/images/homepage-images/bg3.jpg" alt="App Screenshots" data-aos="fade-up">
                        <img src="assets/images/homepage-images/bg5.jpg" alt="App Screenshots" data-aos="fade-up">
                        <img src="assets/images/homepage-images/bg6.jpg" alt="App Screenshots" data-aos="fade-up">
                        <img src="assets/images/homepage-images/bg7.jpg" alt="App Screenshots" data-aos="fade-up">
                        <img src="assets/images/homepage-images/bg8.jpg" alt="App Screenshots" data-aos="fade-up">
                    </div> <!-- end about-bottom-image -->
                </div>

        </section>
        <!-- end about -->

        <!-- Testimonials Section
        ================================================== -->
        <section id="testimonials">

            <div class="row">
                <div class="col-twelve">
                    <h1 class="intro-header" data-aos="fade-up">Khách hàng đánh giá về SAKURA</h1>
                </div>
            </div>

            <div class="row owl-wrap">

                <div id="testimonial-slider" data-aos="fade-up">

                    <div class="slides owl-carousel">

                        <div>
                            <p>
                                Chọn SAKURA mình vừa tiết kiệm vừa có chỗ ở chất lượng không như các phòng trọ khác.
                            </p>
                            <div class="testimonial-author">
                                <img src="assets/images/homepage-images/avatars/ava1.jpg" alt="Author image">

                                <div class="author-info">
                                    Nguyễn Thuỷ Tiên
                                    <span class="position">Cư dân Sakura Phú Nhuận</span>
                                </div>
                            </div>
                        </div>

                        <div>
                            <p>
                                Cảm ơn SAKURA đã mang lại nơi ở tiện nghi, an ninh. Mình rất hài lòng về mọi thứ.
                            </p>
                            <div class="testimonial-author">

                                <img src="assets/images/homepage-images/avatars/ava2.jpg" alt="Author image">

                                <div class="author-info">
                                    Trần Ngọc An
                                    <span>Cư đân Sakura Thủ Đức</span>
                                </div>
                            </div>
                        </div>

                        <div>
                            <p>
                                Đội ngũ tư vấn nhượng quyền rất tận tình, đưa ra phương án kinh doanh giúp tôi đạt được lợi
                                nhuận lâu dài.
                            </p>
                            <div class="testimonial-author">

                                <img src="assets/images/homepage-images/avatars/ava3.jpg" alt="Author image">

                                <div class="author-info">
                                    Lê Hải Hoàng
                                    <span>Khách hàng nhượng quyền SAKURA</span>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end slides -->

                </div> <!-- end testimonial-slider -->

            </div> <!-- end flex-container -->

        </section> <!-- end testimonials -->

        <!-- footer
        ================================================== -->
        <footer>

            <div class="footer-main">
                <div class="row">

                    <div class="col-three md-1-3 tab-full footer-info">

                        <div class="footer-logo"></div>
                        <p>
                            Sakura mong muốn trở thành công cụ thuận tiện cho người thuê và chủ nhà để quản lý phòng trọ.
                            Với Sakura, chủ nhà sẽ được hỗ trợ rất nhiều về các chức năng khác nhau như quản lý người thuê
                            và phòng trọ, xem số liệu thống kê về doanh thu và sử dụng nhà trọ...
                        </p>

                        <ul class="footer-social-list">
                            <li>
                                <a href="#"><i class="fa fa-facebook-square"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </li>
                        </ul>

                    </div> <!-- end footer-info -->

                    <div class="col-three md-1-3 tab-1-2 mob-full footer-contact">

                        <h4>Liên hệ</h4>

                        <p>
                            101 đường Nguyễn Xiển, phường Long Thạnh Mỹ, Quận 9<br>
                            Thành phố Hồ Chí Minh<br>
                            71200 VN<br>
                        </p>

                        <p>
                            Email: locnd.fpt@gmail.com<br>
                            Điện thoại: (+84) 357 543 620<br>
                            Fax: (+63) 555 0100
                        </p>

                    </div> <!-- end footer-contact -->

                    <div class="col-two md-1-3 tab-1-2 mob-full footer-site-links">

                        <h4>Site Links</h4>

                        <ul class="list-links">
                            <li><a href="#">Trang chủ</a></li>
                            <li><a href="#">Thuê phòng</a></li>
                            <li><a href="#">Chủ nhà</a></li>
                            <li><a href="#">FAQ</a></li>
                        </ul>

                    </div> <!-- end footer-site-links -->

                    <div class="col-four md-1-2 tab-full footer-subscribe">

                        <h4>Nhận thư từ chúng tôi</h4>

                        <p>Chúng tôi sẽ gửi cho bạn những thông báo mới về các căn hộ, phòng trọ cùng những cập nhật, ưu đãi
                            mới nhất</p>

                        <div class="subscribe-form">

                            <form id="mc-form" class="group" novalidate="true">

                                <input type="email" value="" name="EMAIL" class="email" id="mc-email"
                                       placeholder="Địa chỉ mail" required="">

                                <input type="submit" name="subscribe" value="Go!">

                                <label for="mc-email" class="subscribe-message"></label>

                            </form>

                        </div>

                    </div> <!-- end footer-subscribe -->

                </div> <!-- /row -->
            </div> <!-- end footer-main -->


            <div class="footer-bottom">
                <div class="row">
                    <div class="col-twelve">
                        <div class="copyright">
                            <span>© Copyright Sakura 2022</span>
                        </div>
                        <div id="go-top">
                            <a class="smoothscroll" title="Back to Top" href="#top"><i class="bi-arrow-up"></i></a>
                        </div>
                    </div>
                </div> <!-- end footer-bottom -->
            </div>
        </footer>

        <div id="preloader">
            <div id="loader"></div>
        </div>

        <!-- Java Script
        ================================================== -->

        <script src="assets/javascript/homepage-jquery-2.1.3.min.js"></script>
        <script src="assets/javascript/homepage-plugins.js"></script>
        <script src="assets/javascript/homepage-main.js"></script>

        <script type="text/javascript">
            window.addEventListener("scroll", function () {
                var header = document.querySelector(".header");
                header.classList.toggle("sticky", window.scrollY > 0);

                // var img = document.querySelector("#logo-header");
                // img.src = "../assets/images/homepage-icon/logo.png"; 
            })


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
    </body>

</html>
