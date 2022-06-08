<%-- 
    Document   : homepage
    Created on : Jun 3, 2022, 1:22:27 PM
    Author     : Vu Thien An - SE160296
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">


        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/hostel-list.css">
        <link rel="stylesheet" href="../assets/css/header.css">
        <link rel="stylesheet" href="../assets/css/hostel-list-responsive.css">

    </head>
    <body>
        <header>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <nav class="header-navbar navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <img src="../assets/images/logo.png" alt="" class="header-logo">


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

                                <!--                            Distrct, ward filter    -->
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
                                    <img class="img-profile rounded-circle" src="../assets/images/undraw_profile.svg">

                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
<<<<<<< HEAD
                                    <a class="dropdown-item" href="/sakura/account/changeProfilePage">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Thông tin tài khoản
                                    </a>
                                    <a class="dropdown-item" href="/sakura/account/changePasswordPage">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Đổi mật khẩu
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="/sakura/account/logout">

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

            <!--    SEARCH BY NAME  -->
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
            <section>
                <h4>Số kết quả trên một trang</h4>
                <form action="MainController" method="post">
                    <input type="hidden" value="${param.txtsearch}" name="txtsearch">
                    <input type="hidden" value="${param.searchby}" name="searchby">
                    <select name="displayOption">
                        <option value="all" <% if (request.getParameter("displayOption") != null && request.getParameter("displayOption").equals("all")) { %> selected <% } %>>Tất cả</option>
                        <option value="5" <% if (request.getParameter("displayOption") != null && request.getParameter("displayOption").equals("5")) { %> selected <% }%>>5</option>
                    </select>
                    <input type="submit" name="action" value="Thay Đổi">
                </form>
            </section>

            <div class="grid">
                <ul class="hostel-list row">
                    <c:forEach var="hostel" items="${requestScope.hostelList}">
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

                                    <div class="hostel-name">${hostel.hostelName}</div>
                                    <div class="hostel-action">
                                        <div class="hostel-rating">
                                            <c:forEach begin="1" end="5" var="iterator">
                                                <c:choose>
                                                    <c:when test="${iterator <= hostel.rating}">
                                                        <i class="fa-solid fa-star"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${iterator > hostel.rating + .5}">
                                                                <i class="fa-solid fa-star" style="color: #ccc;"></i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="fa-solid fa-star-half-stroke"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <span class="hostel-rating-number">${hostel.rating}/5</span>
                                        </div>
                                        <c:set var="contains" value="false"/>
                                        <c:forEach var="item" items="${sessionScope.favoriteHostels}">
                                            <c:if test="${item.hostel.hostelID eq hostel.hostelID && item.activate == true}">
                                                <c:set var="contains" value="true" />
                                            </c:if>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${contains == true}">
                                                <div class="hostel-favorite"><i class="fa-solid fa-heart" style="color: red;" onclick="toggleFavoriteHostel(${hostel.hostelID})"></i></div>
                                                </c:when>
                                                <c:otherwise>
                                                <div class="hostel-favorite"><i class="fa-solid fa-heart" style="color: #ccc;" onclick="toggleFavoriteHostel(${hostel.hostelID})"></i></div>
                                                </c:otherwise>
                                            </c:choose>
                                    </div>
                                    <div class="hostel-address">${hostel.streetAddress} ${hostel.ward.wardName} ${hostel.ward.district.districtName}</div>
                                    <div class="hostel-info">
                                        <span class="hostel-room-available">Còn 1000 phòng trống</span>
                                        <span class="hostel-area">${hostel.minArea} - ${hostel.maxArea} m²</span>
                                    </div>

                                    <div class="hostel-price">${hostel.minPrice} - ${hostel.maxPrice} VNĐ</div>
                                </a>

                            </div>
                        </li>
                    </c:forEach>
                </ul>

                <!--            PAGING-->
                <c:if test="${requestScope.pages != null}">
                    <div class="pagination">
                        <ul class="pagination__list">
                            <li class="pagination-item pagination-previous"><a href=""><i class="fas fa-chevron-left"></i></a>
                            </li>
                            <c:forEach var="page" items="${requestScope.pages}">
                                <c:choose>
                                    <c:when test="${requestScope.pageNumber == page + 1}">
                                        <li class="pagination-item pagination-item--active"><a href="MainController?action=Thay%Đổi&displayOption=${param.displayOption}&pageNumber=${page + 1}&searchby=${param.searchby}&txtsearch=${param.txtsearch}">${page + 1}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li class="pagination-item"><a href="MainController?action=Thay%20Đổi&displayOption=${param.displayOption}&pageNumber=${page + 1}&searchby=${param.searchby}&txtsearch=${param.txtsearch}">${page + 1}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            <li class="pagination-item pagination-next"><a href=""><i class="fas fa-chevron-right"></i></a></li>
                        </ul>
                    </div>
                </c:if>

            </div>

        </div>

        <footer class="sticky-footer">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; SE1618 Dolphin 2022</span>
                </div>
            </div>
        </footer>

        <script src="../assets/javascript//jquery/jquery.min.js"></script>
        <script src="../assets/javascript//bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/javascript/hostel-list.js"></script>
        <script src="../assets/javascript/jquery.js"></script>

        <script>
            function toggleFavoriteHostel(hostelID) {
                console.log("line 413");
                console.log(hostelID);
                jQuery.ajax({
                    type: 'POST',
                    data: {'hostelID' : hostelID},
                    url: 'ToggleFavHostelServlet',
                    success: function (result) {
                        console.log('Success 36');
                    },
                    error: function () {
                        console.log('Error 39');
                    },
                    complete: function (result) {
                        console.log('Complete 41');
                    }
                });
                console.log("line 429");
            }
        </script>
    </body>
</html>
