<%-- 
    Document   : hostel-list
    Created on : May 27, 2022, 4:47:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/hostel-list.css">
        <link rel="stylesheet" href="assets/css/header.css">
        <link rel="stylesheet" href="assets/css/hostel-list-responsive.css">
    </head>
    <body>
        <header>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <nav class="header-navbar navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <img src="./img/logo.png" alt="" class="header-logo">

                    <!-- Topbar Search -->
                    <form style="width: 100%;"
                        class="d-none d-md-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group header-search-container">
                            <div class="header-search-title"></div>
                            <select class="custom-select filter-address">
                                <option value="">Chọn Tỉnh --</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>

                            <select class="custom-select filter-address">
                                <option value="">Chọn Huyện --</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>



                            <div class="input-group-append">
                                <button class="btn btn-search" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item  no-arrow d-md-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <span style="margin-right: 12px;">Tôi muốn tìm nhà tại....</span>
                                    <div class="input-group">
                                        <select class="custom-select">
                                            <option value="">Chọn Tỉnh --</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                        </select>

                                        <select class="custom-select">
                                            <option value="">Chọn Huyện --</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                        </select>
                                        <div class="input-group-append">
                                            <button class="btn btn-search" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style>
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Thông báo
                                </h6>
                                <div style="max-height: 50vh; overflow: auto;" class="">
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">2/1/2022</div>
                                            Ngẩng mặt hận đời Ngẩng mặt hận đời Ngẩng mặt hận
                                            đời Ngẩng mặt hận đời
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">2/1/2022</div>
                                            Ngẩng mặt hận đời Ngẩng mặt hận đời Ngẩng mặt hận
                                            đời Ngẩng mặt hận đời
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">2/1/2022</div>
                                            Ngẩng mặt hận đời Ngẩng mặt hận đời Ngẩng mặt hận
                                            đời Ngẩng mặt hận đời
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">2/1/2022</div>
                                            Ngẩng mặt hận đời Ngẩng mặt hận đời Ngẩng mặt hận
                                            đời Ngẩng mặt hận đời
                                        </div>
                                    </a>
                                </div>



                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>



                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Ngẩng mặt hận đời</span>
                                <img class="img-profile rounded-circle" src="assets/images/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Thông tin tài khoản
                                </a>

                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Đăng xuất
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>

            </div>

        </div>
    </header>
    <div class="container">

        <h2 class="result-address">Phòng cho thuê ở HCM</h2>
        <div class="grid">
            <div class="row">
                <form class="search-bar__input col-12 col-md-6">
                    <input type="text" placeholder="Nhập tên phòng trọ ...">
                    <button class="search-bar__submit" type="submit">Tìm
                        kiếm</button>
                </form>
                <form class="col-12 col-md-6" action="/hostel-list.html">
                    <div class="grid">
                        <div class="row filter-list">
                            <div class="filter-item col-6 col-sm-4">
                                <div class="search-bar__sort">
                                    Đánh giá
                                    <ul class="search-bar-sort-list">
                                        <li class="search-bar-sort-item">
                                            <a href="">Tăng dần</a>
                                        </li>
                                        <li class="search-bar-sort-item">
                                            <a href="">Giảm dần</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="filter-item col-6 col-sm-4">
                                <div class="search-bar__sort">
                                    Giá tiền
                                    <ul class="search-bar-sort-list">
                                        <li class="search-bar-sort-item">
                                            <a href="">Tăng dần</a>
                                        </li>
                                        <li class="search-bar-sort-item">
                                            <a href="">Giảm dần</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="filter-item favorite-filter col-12 col-sm-4">
                                <a href="#" class="submit-filter">Yêu thích</a>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>

        <h4 class="result-number">Có 100 kết quả:</h4>
        <div class="grid">
            <ul class="hostel-list row">
                <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="hostel-item">

                        <div id="carouselExampleIndicators" class="carousel slide" data-interval="false">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <a href="hostel-list.html" class="hostel-images">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="Third slide">
                                    </div>
                                </div>
                            </a>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                        <a href="hostel-list.html" class="hostel-content">

                            <div class="hostel-name">APLUS Sao Nam</div>
                            <div class="hostel-action">
                                <div class="hostel-rating">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <span class="hostel-rating-number">4.9/5</span>
                                </div>
                                <div class="hostel-favorite"><i class="fa-solid fa-heart"></i></div>
                            </div>



                            <div class="hostel-address">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức,
                                Thành
                                phố Hồ Chí Minh 700000</div>
                            <div class="hostel-info">
                                <span class="hostel-room-available">Còn 1000 phòng trống</span>
                                <span class="hostel-area">20 - 40 m²</span>
                            </div>

                            <div class="hostel-price">5,0 - 7,0 triệu</div>
                        </a>

                    </div>
                </li>
                <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="hostel-item">

                        <div id="carouselExampleIndicators" class="carousel slide" data-interval="false">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <a href="hostel-list.html" class="hostel-images">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="Third slide">
                                    </div>
                                </div>
                            </a>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                        <a href="hostel-list.html" class="hostel-content">

                            <div class="hostel-name">APLUS Sao Nam</div>
                            <div class="hostel-action">
                                <div class="hostel-rating">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <span class="hostel-rating-number">4.9/5</span>
                                </div>
                                <div class="hostel-favorite"><i class="fa-solid fa-heart"></i></div>
                            </div>



                            <div class="hostel-address">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức,
                                Thành
                                phố Hồ Chí Minh 700000</div>
                            <div class="hostel-info">
                                <span class="hostel-room-available">Còn 1000 phòng trống</span>
                                <span class="hostel-area">20 - 40 m²</span>
                            </div>

                            <div class="hostel-price">5,0 - 7,0 triệu</div>
                        </a>

                    </div>
                </li>
                <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="hostel-item">

                        <div id="carouselExampleIndicators" class="carousel slide" data-interval="false">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <a href="hostel-list.html" class="hostel-images">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"
                                            src="https://2sao.vietnamnetjsc.vn/images/2017/01/18/15/50/2saolynhatdonghoangdunganhhungxadieu00a.jpg"
                                            alt="Third slide">
                                    </div>
                                </div>
                            </a>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                        <a href="hostel-list.html" class="hostel-content">

                            <div class="hostel-name">APLUS Sao Nam</div>
                            <div class="hostel-action">
                                <div class="hostel-rating">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <span class="hostel-rating-number">4.9/5</span>
                                </div>
                                <div class="hostel-favorite"><i class="fa-solid fa-heart"></i></div>
                            </div>



                            <div class="hostel-address">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức,
                                Thành
                                phố Hồ Chí Minh 700000</div>
                            <div class="hostel-info">
                                <span class="hostel-room-available">Còn 1000 phòng trống</span>
                                <span class="hostel-area">20 - 40 m²</span>
                            </div>

                            <div class="hostel-price">5,0 - 7,0 triệu</div>
                        </a>

                    </div>
                </li>
                <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="hostel-item">

                        <div id="carouselExampleIndicators" class="carousel slide" data-interval="false">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <a href="hostel-list.html" class="hostel-images">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"
                                            src="https://2sao.vietnamnetjsc.vn/images/2017/01/18/15/50/2saolynhatdonghoangdunganhhungxadieu00a.jpg"
                                            alt="Third slide">
                                    </div>
                                </div>
                            </a>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                        <a href="hostel-list.html" class="hostel-content">

                            <div class="hostel-name">APLUS Sao Nam</div>
                            <div class="hostel-action">
                                <div class="hostel-rating">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <span class="hostel-rating-number">4.9/5</span>
                                </div>
                                <div class="hostel-favorite"><i class="fa-solid fa-heart"></i></div>
                            </div>



                            <div class="hostel-address">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức,
                                Thành
                                phố Hồ Chí Minh 700000</div>
                            <div class="hostel-info">
                                <span class="hostel-room-available">Còn 1000 phòng trống</span>
                                <span class="hostel-area">20 - 40 m²</span>
                            </div>

                            <div class="hostel-price">5,0 - 7,0 triệu</div>
                        </a>

                    </div>
                </li>
                <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="hostel-item">

                        <div id="carouselExampleIndicators" class="carousel slide" data-interval="false">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <a href="hostel-list.html" class="hostel-images">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"
                                            src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                            alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100"
                                            src="https://2sao.vietnamnetjsc.vn/images/2017/01/18/15/50/2saolynhatdonghoangdunganhhungxadieu00a.jpg"
                                            alt="Third slide">
                                    </div>
                                </div>
                            </a>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                        <a href="hostel-list.html" class="hostel-content">

                            <div class="hostel-name">APLUS Sao Nam</div>
                            <div class="hostel-action">
                                <div class="hostel-rating">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <span class="hostel-rating-number">4.9/5</span>
                                </div>
                                <div class="hostel-favorite"><i class="fa-solid fa-heart"></i></div>
                            </div>



                            <div class="hostel-address">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức,
                                Thành
                                phố Hồ Chí Minh 700000</div>
                            <div class="hostel-info">
                                <span class="hostel-room-available">Còn 1000 phòng trống</span>
                                <span class="hostel-area">20 - 40 m²</span>
                            </div>

                            <div class="hostel-price">5,0 - 7,0 triệu</div>
                        </a>

                    </div>
                </li>

            </ul>
            <div class="pagination">
                <ul class="pagination__list">
                    <li class="pagination-item pagination-previous"><a href=""><i class="fas fa-chevron-left"></i></a>
                    </li>
                    <li class="pagination-item pagination-item--active"><a href="">1</a></li>
                    <li class="pagination-item"><a href="">2</a></li>
                    <li class="pagination-item"><a href="">3</a></li>
                    <li class="pagination-item"><a href="">4</a></li>
                    <li class="pagination-item"><a href="">5</a></li>
                    <li class="pagination-dot">...</li>
                    <li class="pagination-item"><a href="">14</a></li>
                    <li class="pagination-item pagination-next"><a href=""><i class="fas fa-chevron-right"></i></a></li>
                </ul>
            </div>
        </div>

    </div>

    <footer class="sticky-footer">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; SE1618 Dolphin 2022</span>
            </div>
        </div>
    </footer>
    <script src="assets/javascript//jquery/jquery.min.js"></script>
    <script src="assets/javascript//bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/javascript/hostel-list.js"></script>
    </body>
</html>
