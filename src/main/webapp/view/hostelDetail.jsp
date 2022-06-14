<%-- 
    Document   : hostelDetail
    Created on : Jun 11, 2022, 6:32:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <link href="./css/sb-admin-2.min.css" rel="stylesheet">
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/hostel-detail.css">
        <link rel="stylesheet" href="../assets/css/header.css">
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
                            <li class="nav-item no-arrow d-md-none">
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
                                    <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
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
            <div class="row section">
                <div class="col-12 col-sm-7">
                    <div id="carouselExampleIndicators" class="carousel slide" data-interval="false">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <c:if test="${hostel.imgList.size() > 0}">
                                <c:forEach begin="0" end="${hostel.imgList.size() - 1}" var="iterator">
                                    <c:if test="${iterator == 0}">
                                        <div class="carousel-item active">
                                        </c:if>
                                        <c:if test="${iterator > 0}">
                                            <div class="carousel-item">
                                            </c:if>
                                            <img class="d-block w-100" src="${hostel.imgList.get(iterator)}">
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-12 col-sm-5 information-column">
                        <div class="hostel-info">
                            <div class="hostel-info-title">
                                <h3 class="hostel-name">${requestScope.hostel.hostelName}</h3>
                                <div class="hostel-favorite">
                                    <c:if test="${requestScope.isFavorite == true}">
                                        <i class="fa-solid fa-heart" style="color: red;" onclick="toggleFavoriteHostel(${requestScope.hostel.hostelID}, this)"></i>
                                    </c:if>
                                    <c:if test="${requestScope.isFavorite == false}">
                                        <i class="fa-solid fa-heart" style="color: #ccc;" onclick="toggleFavoriteHostel(${requestScope.hostel.hostelID}, this)"></i>
                                    </c:if>
                                </div>
                            </div>
                            <div class="hostel-rating">
                                <c:forEach begin="1" end="5" var="iterator">
                                    <c:choose>
                                        <c:when test="${iterator <= requestScope.hostel.rating}">
                                            <i class="fa-solid fa-star"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${(iterator - requestScope.hostel.rating) > 0 && (iterator - requestScope.hostel.rating) <= 0.2}">
                                                    <i class="fa-solid fa-star"></i>
                                                </c:when>
                                                <c:when test="${(iterator - requestScope.hostel.rating) > 0.2  && (iterator - requestScope.hostel.rating) <= 0.7}">
                                                    <i class="fa-solid fa-star-half-stroke"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="fa-solid fa-star" style="color: #ccc"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <span style="margin-left: 16px" class="hostel-rating-number">${requestScope.hostel.rating}</span>
                            </div>
                            <div class="hostel-cost">${requestScope.hostel.minPrice / 1000-00} triệu - ${requestScope.hostel.maxPrice / 1000000} triệu VNÐ</div>
                            <div class="hostel-total-rom">Có tất cả ${requestScope.hostel.totalRoom} phòng</div>
                            <div class="hostel-available-room">Hiện đang có ${requestScope.hostel.availableRoom} phòng trống</div>
                            <div class="hostel-address">${requestScope.hostel.streetAddress}</div>
                            <form action ="/sakura/hostel/roomList" method="post">
                                <input type="hidden" name="hostelID" value="${requestScope.hostel.hostelID}">
                            <button type = "submit" name = "action" class="btn-view-all-room">Xem tất cả phòng</button>
                            </form>
                        </div>
                        <div class="landlord-info">
                            <h2 class="landlord-info-title">Thông tin người quản lí:</h2>
                            <div class="landlord-title">
                                <div class="landlord-content">
                                    <div class="landlord-avatar">
                                        <img src="https://anhdep123.com/wp-content/uploads/2021/05/hinh-avatar-trang.jpg"
                                             alt="">
                                    </div>
                                    <div class="landlord-name">Họ và tên: <span>${requestScope.hostel.landlord.fullname}</span> </div>
                                </div>
                                <a href="" class="landlord-messenger">
                                    <i class="fa-brands fa-facebook-messenger"></i>
                                </a>
                            </div>
                            <div class="landlord-phone">Số điện thoại: <span>${requestScope.hostel.landlord.phone}</span> </div>
                            <div class="landlord-email">Email: <span>${requestScope.hostel.landlord.account.email}</span> </div>
                        </div>
                    </div>
                </div>
                <div class="row section" style="margin-top: 20px">
                    <div class="col-12 col-sm-4 hostel-overview">
                        <h3 class="hostel-overview-title">Tổng quan</h3>
                        <div class="hostel-description">
                            ${requestScope.hostel.description}
                        </div>
                        <div class="hostel-policy">
                            <h4 class="hostel-policy-title">Chính sách:</h4>
                            <div class="hostel-policy">
                                射雕英雄传 射雕英雄传 射雕英雄传 射雕英雄传 射雕英雄传 射雕英雄传 射雕英雄传
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-4 hostel-room">
                        <h3 class="hostel-room-title">Loại phòng</h3>
                    </div>
                    <div class="col-12 col-sm-4 hostel-service">
                        <h3 class="hostel-service-title">Dịch vụ</h3>
                    </div>
                </div>
                <div class="section">

                    <h3 class="section-title">
                        đánh giá từ người dùng
                    </h3>

                    <div class="feedback-header">
                        <div class="feedback-average">
                            <h3 class="feedback-average-title">${requestScope.hostel.rating} trên 5</h3>
                            <div class="feedback-average-star">
                                <c:forEach begin="1" end="5" var="iterator">
                                    <c:choose>
                                        <c:when test="${iterator <= requestScope.hostel.rating}">
                                            <i class="fa-solid fa-star"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${(iterator - requestScope.hostel.rating) > 0 && (iterator - requestScope.hostel.rating) <= 0.2}">
                                                    <i class="fa-solid fa-star"></i>
                                                </c:when>
                                                <c:when test="${(iterator - requestScope.hostel.rating) > 0.2  && (iterator - requestScope.hostel.rating) <= 0.7}">
                                                    <i class="fa-solid fa-star-half-stroke"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="fa-solid fa-star" style="color: #ccc"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                        <ul class="feedback-header-list">
                            <c:if test="${requestScope.filterStar == 0}">
                                <li class="feedback-header-item active">
                                    <form action="/sakura/hostel/detail">
                                        <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                        <button type="submit" name="filterStar" value="0">Tất cả</button>
                                    </form>
                                </li>
                            </c:if>
                            <c:if test="${requestScope.filterStar != 0}">
                                <li class="feedback-header-item">
                                    <form action="/sakura/hostel/detail">
                                        <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                        <button type="submit" name="filterStar" value="0">Tất cả</button>
                                    </form>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="5" var="i">
                                <c:if test="${requestScope.filterStar == i}">
                                    <li class="feedback-header-item active">
                                        <form action="/sakura/hostel/detail">
                                            <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                            <button type="submit" name="filterStar" value="${i}">${i} sao</button>
                                        </form>
                                    </li>
                                </c:if>
                                <c:if test="${requestScope.filterStar != i}">
                                    <li class="feedback-header-item">
                                        <form action="/sakura/hostel/detail">
                                            <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                            <button type="submit" name="filterStar" value="${i}">${i} sao</button>
                                        </form>
                                    </li>
                                </c:if>


                            </c:forEach>
                        </ul>
                    </div>

                    <ul class="feedback-list">
                        <c:forEach var="feedback" items="${requestScope.feedbackList}">
                            <li class="feedback-item">
                                <div class="tenant-item-header">
                                    <div class="tenant-info">
                                        <div class="tenant-avt">
                                            <img src="https://upload.wikimedia.org/wikipedia/vi/0/03/Haruno_Sakura.jpg" alt="">
                                        </div>
                                        <div>
                                            <div class="tenant-name">
                                                ${feedback.tenant.fullname}
                                            </div>
                                            <div class="tenant-rating">
                                                <c:forEach begin="1" end="5" var="iterator">
                                                    <c:choose>
                                                        <c:when test="${iterator <= feedback.rating}">
                                                            <i class="fa-solid fa-star"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${(iterator - feedback.rating) > 0 && (iterator - feedback.rating) <= 0.2}">
                                                                    <i class="fa-solid fa-star"></i>
                                                                </c:when>
                                                                <c:when test="${(iterator - feedback.rating) > 0.2  && (iterator - feedback.rating) <= 0.7}">
                                                                    <i class="fa-solid fa-star-half-stroke"></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa-solid fa-star" style="color: #ccc"></i>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tenant-posting-date">${feedback.date}</div>

                                </div>

                                <div class="tenant-item-content">
                                    ${feedback.content}
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                    <div class="pagination">
                        <ul class="pagination__list">
                            <li class="pagination-item pagination-previous pagination-previous--fast">
                                <form action="/sakura/hostel/detail">
                                    <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                    <input type="hidden" name="filterStar" value="${requestScope.filterStar}"/>
                                    <button type="submit" name="paging" value="1"><i class="fa-solid fa-angles-left"></i></button>
                                </form>
                            </li>

                            <li class="pagination-item pagination-previous">
                                <form action="/sakura/hostel/detail">
                                    <c:if test="${requestScope.currentPage > 1}">
                                        <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                        <input type="hidden" name="filterStar" value="${requestScope.filterStar}"/>
                                        <button type="submit" name="paging" value="${requestScope.currentPage - 1}">
                                            <i class="fas fa-chevron-left"></i>
                                        </button>
                                    </c:if>
                                    <c:if test="${requestScope.currentPage == 1}">
                                        <button>
                                            <i class="fas fa-chevron-left"></i>
                                        </button>
                                    </c:if>
                                </form>
                            </li>

                            <c:forEach begin="${requestScope.beginPage}" end="${requestScope.endPage}" var="iterator">
                                <c:if test="${requestScope.currentPage == iterator}">
                                    <li class="pagination-item pagination-item--active">
                                    </c:if>
                                    <c:if test="${requestScope.currentPage != iterator}">
                                    <li class="pagination-item">
                                    </c:if>
                                    <form action="/sakura/hostel/detail">
                                        <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                        <input type="hidden" name="filterStar" value="${requestScope.filterStar}"/>
                                        <button type="submit" name="paging" value="${iterator}">${iterator}</button>
                                    </form>
                                </li>

                            </c:forEach>
                            <li class="pagination-item pagination-next">
                                <form action="/sakura/hostel/detail">
                                    <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                    <input type="hidden" name="filterStar" value="${requestScope.filterStar}"/>
                                    <button type="submit" name="paging" value="${requestScope.currentPage + 1}"><i class="fas fa-chevron-right"></i></button>
                                </form>
                            </li>
                            <li class="pagination-item pagination-next pagination-next--fast">
                                <form action="/sakura/hostel/detail">
                                    <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                    <input type="hidden" name="filterStar" value="${requestScope.filterStar}"/>
                                    <button type="submit" name="paging" value="${requestScope.pagingQuantity}"><i class="fa-solid fa-angles-right"></i></button>
                                </form>
                            </li>
                        </ul>
                    </div>


                </div>

                <div class="section">
                    <h3 class="section-title">
                        đánh giá của bạn
                    </h3>
                    <form action="/sakura/hostel/detail">
                        <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                        <input type="hidden" name="filterStar" value="${requestScope.filterStar}"/>
                        <div class="send-feedback">
                            <input type="hidden" name="rating" value="" />
                            <div class="send-feedback-star-list">
                                <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                            </div>
                            <textarea class="text-area" placeholder="Nhập vào đây đánh giá của bạn"
                                      name="feedbackContent" rows="4" cols="100"></textarea>
                            <button type="submit" class="send-feedback-btn">Gửi đánh giá</button>
                        </div>
                    </form>
                </div>

                <div class="section">
                    <h3 class="section-title">
                        nhà trọ nổi bật
                    </h3>
                    <ul class="hostel-vip-list row">
                        <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="hostel-vip-item">

                                <div id="carouselExampleIndicators-0" class="carousel slide" data-interval="false">
                                    <ol class="carousel-indicators carousel-vip-indicators">
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="2"></li>
                                    </ol>
                                    <a href="hostel-vip-list.html" class="hostel-vip-images">
                                        <div class="carousel-inner">
                                            <div class="carousel-item carousel-vip-item active">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item carousel-vip-item">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="Second slide">
                                            </div>
                                            <div class="carousel-item carousel-vip-item">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="Third slide">
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn-prev-next">
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators-0" role="button"
                                           data-slide="prev">
                                            <span><i class="fa-solid fa-angle-left"></i></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators-0" role="button"
                                           data-slide="next">
                                            <span><i class="fa-solid fa-angle-right"></i></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>

                                </div>

                                <a href="hostel-vip-list.html" class="hostel-vip-content">

                                    <div class="hostel-vip-name">APLUS Sao Nam</div>
                                    <div class="hostel-vip-action">
                                        <div class="hostel-vip-rating">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star-half"></i>
                                            <i class="fa-solid fa-star-half-stroke"></i>
                                            <i class="fa-solid fa-star" style="color: #ccc;"></i>
                                            <i class="fa-solid fa-star" style="color: #ccc;"></i>
                                            <span class="hostel-vip-rating-number">4.9/5</span>
                                        </div>
                                        <div class="hostel-vip-favorite"><i class="fa-solid fa-heart"> </i> < /div>
                                        </div>
                                        <div class="hostel-vip-address">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức,
                                            Thành
                                            phố Hồ Chí Minh 700000</div>
                                        <div class="hostel-vip-info">
                                            <span class="hostel-vip-room-available">Còn 1000 phòng trống</span>
                                            <span class="hostel-vip-area">20 - 40 m²</span>
                                        </div>

                                        <div class="hostel-vip-price">5,0 - 7,0 triệu</div>
                                </a>

                            </div>
                        </li>
                        <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="hostel-vip-item">

                                <div id="carouselExampleIndicators-0" class="carousel slide" data-interval="false">
                                    <ol class="carousel-indicators carousel-vip-indicators">
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="2"></li>
                                    </ol>
                                    <a href="hostel-vip-list.html" class="hostel-vip-images">
                                        <div class="carousel-inner">
                                            <div class="carousel-item carousel-vip-item active">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item carousel-vip-item">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="Second slide">
                                            </div>
                                            <div class="carousel-item carousel-vip-item">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="Third slide">
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn-prev-next">
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators-0" role="button"
                                           data-slide="prev">
                                            <span><i class="fa-solid fa-angle-left"></i></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators-0" role="button"
                                           data-slide="next">
                                            <span><i class="fa-solid fa-angle-right"></i></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>

                                </div>

                                <a href="hostel-vip-list.html" class="hostel-vip-content">

                                    <div class="hostel-vip-name">APLUS Sao Nam</div>
                                    <div class="hostel-vip-action">
                                        <div class="hostel-vip-rating">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star-half"></i>
                                            <i class="fa-solid fa-star-half-stroke"></i>
                                            <i class="fa-solid fa-star" style="color: #ccc;"></i>
                                            <i class="fa-solid fa-star" style="color: #ccc;"></i>
                                            <span class="hostel-vip-rating-number">4.9/5</span>
                                        </div>
                                        <div class="hostel-vip-favorite"><i class="fa-solid fa-heart"></i></div>
                                    </div>
                                    <div class="hostel-vip-address">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức,
                                        Thành
                                        phố Hồ Chí Minh 700000</div>
                                    <div class="hostel-vip-info">
                                        <span class="hostel-vip-room-available">Còn 1000 phòng trống</span>
                                        <span class="hostel-vip-area">20 - 40 m²</span>
                                    </div>

                                    <div class="hostel-vip-price">5,0 - 7,0 triệu</div>
                                </a>

                            </div>
                        </li>
                        <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="hostel-vip-item">

                                <div id="carouselExampleIndicators-0" class="carousel slide" data-interval="false">
                                    <ol class="carousel-indicators carousel-vip-indicators">
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="2"></li>
                                    </ol>
                                    <a href="hostel-vip-list.html" class="hostel-vip-images">
                                        <div class="carousel-inner">
                                            <div class="carousel-item carousel-vip-item active">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item carousel-vip-item">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="Second slide">
                                            </div>
                                            <div class="carousel-item carousel-vip-item">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="Third slide">
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn-prev-next">
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators-0" role="button"
                                           data-slide="prev">
                                            <span><i class="fa-solid fa-angle-left"></i></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators-0" role="button"
                                           data-slide="next">
                                            <span><i class="fa-solid fa-angle-right"></i></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>

                                </div>

                                <a href="hostel-vip-list.html" class="hostel-vip-content">

                                    <div class="hostel-vip-name">APLUS Sao Nam</div>
                                    <div class="hostel-vip-action">
                                        <div class="hostel-vip-rating">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star-half"></i>
                                            <i class="fa-solid fa-star-half-stroke"></i>
                                            <i class="fa-solid fa-star" style="color: #ccc;"></i>
                                            <i class="fa-solid fa-star" style="color: #ccc;"></i>
                                            <span class="hostel-vip-rating-number">4.9/5</span>
                                        </div>
                                        <div class="hostel-vip-favorite"><i class="fa-solid fa-heart"></i></div>
                                    </div>
                                    <div class="hostel-vip-address">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức,
                                        Thành
                                        phố Hồ Chí Minh 700000</div>
                                    <div class="hostel-vip-info">
                                        <span class="hostel-vip-room-available">Còn 1000 phòng trống</span>
                                        <span class="hostel-vip-area">20 - 40 m²</span>
                                    </div>

                                    <div class="hostel-vip-price">5,0 - 7,0 triệu</div>
                                </a>

                            </div>
                        </li>
                        <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="hostel-vip-item">

                                <div id="carouselExampleIndicators-0" class="carousel slide" data-interval="false">
                                    <ol class="carousel-indicators carousel-vip-indicators">
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators-0" data-slide-to="2"></li>
                                    </ol>
                                    <a href="hostel-vip-list.html" class="hostel-vip-images">
                                        <div class="carousel-inner">
                                            <div class="carousel-item carousel-vip-item active">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="First slide">
                                            </div>
                                            <div class="carousel-item carousel-vip-item">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="Second slide">
                                            </div>
                                            <div class="carousel-item carousel-vip-item">
                                                <img class="d-block w-100"
                                                     src="https://anlandpremium.vn/wp-content/uploads/2021/07/Hostel-la-gi.jpg"
                                                     alt="Third slide">
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn-prev-next">
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators-0" role="button"
                                           data-slide="prev">
                                            <span><i class="fa-solid fa-angle-left"></i></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators-0" role="button"
                                           data-slide="next">
                                            <span><i class="fa-solid fa-angle-right"></i></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>

                                </div>

                                <a href="hostel-vip-list.html" class="hostel-vip-content">

                                    <div class="hostel-vip-name">APLUS Sao Nam</div>
                                    <div class="hostel-vip-action">
                                        <div class="hostel-vip-rating">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star-half"></i>
                                            <i class="fa-solid fa-star-half-stroke"></i>
                                            <i class="fa-solid fa-star" style="color: #ccc;"></i>
                                            <i class="fa-solid fa-star" style="color: #ccc;"></i>
                                            <span class="hostel-vip-rating-number">4.9/5</span>
                                        </div>
                                        <div class="hostel-vip-favorite"><i class="fa-solid fa-heart"></i></div>
                                    </div>
                                    <div class="hostel-vip-address">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức,
                                        Thành
                                        phố Hồ Chí Minh 700000</div>
                                    <div class="hostel-vip-info">
                                        <span class="hostel-vip-room-available">Còn 1000 phòng trống</span>
                                        <span class="hostel-vip-area">20 - 40 m²</span>
                                    </div>

                                    <div class="hostel-vip-price">5,0 - 7,0 triệu</div>
                                </a>

                            </div>
                        </li>
                    </ul>
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
            <script src="../assets/javascript/jquery.js"></script>
            <script src="../assets/javascript/hostel-detail.js"></script>
            <script>
                                            function toggleFavoriteHostel(hostelID, element) {
                                                if (element.style.color === 'red')
                                                    element.style.color = 'gray';
                                                else
                                                    element.style.color = 'red';
                                                console.log("line 413");
                                                console.log(hostelID);
                                                jQuery.ajax({
                                                    type: 'POST',
                                                    data: {'hostelID': hostelID},
                                                    url: '/sakura/hostel/toggleFavHostel',
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
