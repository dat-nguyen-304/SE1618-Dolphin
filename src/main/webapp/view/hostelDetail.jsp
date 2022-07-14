<%-- 
    Document   : hostelDetail
    Created on : Jun 11, 2022, 6:32:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakura - Nhà trọ ${requestScope.hostel.hostelName}</title>

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">

        <!--Favicon-->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- Icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/index.min.css" />

        <<link rel="stylesheet" href="../assets/css/flowbite.min.css"/>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="../assets/css/hostel-detail.css">
        <c:choose>
            <c:when test="${sessionScope.currentUser != null}">
                <link rel="stylesheet" href="../assets/css/header-user-search-address.css">
            </c:when>
            <c:otherwise>
                <link rel="stylesheet" href="../assets/css/header-guest-search-address.css">
            </c:otherwise>
        </c:choose>
        <link rel="stylesheet" href="../assets/css/fix-hostel-detail.css">
    </head>

    <body>
        <c:choose>
            <c:when test="${sessionScope.currentUser != null}">
                <header id="header-section" class="stick z-[100]">
                    <%@include file="headerUserSearchAddress.jsp" %>
                </header>
            </c:when>
            <c:otherwise>
                <header id="header-section" class="stick z-[100]">
                    <%@include file="headerGuestSearchAddress.jsp" %>
                </header>
            </c:otherwise>
        </c:choose>

        <div class="w-[60%] mx-auto mt-[90px]">
            
            <!--Breadcrumb-->
            
            <!--End Breadcrumb-->
            <div></div>
            
            <div class="w-full main-content ">
                <div class="w-full grid grid-cols-12 gap-[20px]">
                    <div id="animation-carousel" class="col-span-8 relative" data-carousel="static"> <!--data-carousel=slide-->
                        <!-- Carousel wrapper -->
                        <div class="overflow-hidden relative h-[500px] rounded">
                            <c:if test="${requestScope.hostel.imgList.size() > 0}">
                                <c:forEach begin="0" end="${requestScope.hostel.imgList.size() - 1}" var="iterator">
                                    <c:if test="${iterator == 0}">
                                        <div class="hidden duration-200 ease-in-out active" data-carousel-item>
                                            <img class="w-full h-full object-cover" src="${hostel.imgList.get(iterator)}">
                                        </div>
                                    </c:if>
                                    <c:if test="${iterator > 0}">
                                        <div class="hidden duration-200 ease-in-out" data-carousel-item>
                                            <img class="w-full h-full object-cover" src="${hostel.imgList.get(iterator)}">
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </div>

                        <!-- Slider indicators -->
                        <div class="flex absolute bottom-5 left-1/2 z-30 space-x-3 -translate-x-1/2">
                            <c:if test="${requestScope.hostel.imgList.size() > 0}">
                                <c:forEach begin="0" end="${requestScope.hostel.imgList.size() - 1}" var="iterator">
                                    <c:if test="${iterator == 0}">
                                        <button type="button" class="slide-indicator w-6 h-[4px] rounded active text-[#fff] bg-[#fff]" aria-current="true" 
                                                data-carousel-slide-to="0"></button>
                                    </c:if>
                                    <c:if test="${iterator > 0}">
                                        <button type="button" class="slide-indicator w-6 h-[4px] rounded text-[#fff] bg-[#fff]" aria-current="true" aria-label="Slide 1"
                                                data-carousel-slide-to="${iterator}"></button>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </div>

                        <!-- Slider controls -->
                        <button type="button"
                                class="slide-control flex absolute top-0 left-0 z-30 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none"
                                data-carousel-prev>
                            <span
                                class="inline-flex justify-center items-center w-8 h-8 group-focus:outline-none">
                                <svg class="w-5 h-5 text-[#fff]" fill="none" stroke="currentColor"
                                     viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7">
                                </path>
                                </svg>
                                <span class="hidden">Previous</span>
                            </span>
                        </button>
                        <button type="button"
                                class="slide-control flex absolute top-0 right-0 z-30 justify-center items-center px-4 h-full cursor-pointer group focus:outline-none"
                                data-carousel-next>
                            <span
                                class="inline-flex justify-center items-center w-8 h-8 group-focus:outline-none">
                                <svg class="w-5 h-5 text-[#fff]" fill="none" stroke="currentColor"
                                     viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                                </svg>
                                <span class="hidden">Next</span>
                            </span>
                        </button>
                    </div>

                    <div class="information-column col-span-4">
                        <div class="hostel-info">
                            <div class="hostel-info-title">
                                <h3 class="hostel-name">${requestScope.hostel.hostelName}</h3>
                                <c:if test="${sessionScope.currentUser != null}">
                                    <div class="hostel-favorite">
                                        <c:if test="${requestScope.isFavorite == true}">
                                            <i class="bi bi-heart-fill" style="color: red;" onclick="toggleFavoriteHostel(${requestScope.hostel.hostelID}, this)"></i>
                                        </c:if>
                                        <c:if test="${requestScope.isFavorite == false}">
                                            <i class="bi bi-heart-fill" style="color: #ccc;" onclick="toggleFavoriteHostel(${requestScope.hostel.hostelID}, this)"></i>
                                        </c:if>
                                    </div>
                                </c:if>
                            </div>
                            <div class="hostel-rating">
                                <span class="hostel-rating-number">${requestScope.hostel.rating} <i class="bi bi-star-fill ml-[5px]"></i></span>
                            </div>
                            <div class="hostel-cost">${requestScope.hostel.minPrice / 1000000} triệu - ${requestScope.hostel.maxPrice / 1000000} triệu / tháng</div>
                            <div class="hostel-total-rom">Có tất cả ${requestScope.hostel.totalRoom} phòng</div>
                            <div class="hostel-available-room">Hiện đang có ${requestScope.hostel.availableRoom} phòng trống</div>
                            <div class="hostel-address">${requestScope.hostel.streetAddress} - ${hostel.district.districtName} - ${hostel.district.province.provinceName}</div>
                            <form action ="/sakura/hostel/roomList" method="post">
                                <input type="hidden" name="hostelID" value="${requestScope.hostel.hostelID}">
                                <button type = "submit" name = "action" class="btn-view-all-room bg-[#17535B] text-[#fff] hover:bg-[#13484F]">Xem tất cả phòng</button>
                            </form>
                        </div>
                        <div class="landlord-info mt-[10px]">
                            <h2 class="landlord-info-title">Thông tin người quản lí:</h2>
                            <div class="landlord-title">
                                <div class="landlord-content">
                                    <div class="landlord-avatar">
                                        <img src="https://anhdep123.com/wp-content/uploads/2021/05/hinh-avatar-trang.jpg"
                                             alt="">
                                    </div>
                                    <div class="landlord-name"><span>${requestScope.hostel.landlord.fullname}</span> </div>
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
                    <div class="col-12 col-sm-6 hostel-overview">
                        <h3 class="hostel-overview-title">Tổng quan</h3>
                        <div class="hostel-description">
                            ${requestScope.hostel.description}
                        </div>
                    </div>
                    <!--                    <div class="col-12 col-sm-4 hostel-room">
                                            <h3 class="hostel-room-title">Loại phòng</h3>
                                        </div>-->
                    <div class="col-12 col-sm-6 hostel-service">
                        <h3 class="hostel-service-title">Dịch vụ</h3>
                    </div>
                </div>
                <div class="section">

                    <h3 class="section-title">
                        đánh giá từ người dùng
                    </h3>

                    <c:if test="${requestScope.feedbackList == null}">
                        <h3 class="no-rating">Chưa có đánh giá nào</h3>
                    </c:if>

                    <div class="feedback-header">
                        <div class="feedback-average">
                            <h3 class="feedback-average-title">${requestScope.hostel.rating} trên 5</h3>
                            <div class="feedback-average-star">
                                <c:forEach begin="1" end="5" var="iterator">
                                    <c:choose>
                                        <c:when test="${iterator <= requestScope.hostel.rating}">
                                            <i class="bi bi-star-fill"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${(iterator - requestScope.hostel.rating) > 0 && (iterator - requestScope.hostel.rating) <= 0.2}">
                                                    <i class="bi bi-star-fill"></i>
                                                </c:when>
                                                <c:when test="${(iterator - requestScope.hostel.rating) > 0.2  && (iterator - requestScope.hostel.rating) <= 0.7}">
                                                    <i class="bi bi-star-fill"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="bi bi-star-fill" style="color: #ccc"></i>
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
                                            <img src="${sessionScope.currentUser.account.avatar}" alt="">
                                        </div>
                                        <div>
                                            <div class="tenant-name">
                                                ${feedback.tenant.fullname}
                                            </div>
                                            <div class="tenant-rating">
                                                <c:forEach begin="1" end="5" var="iterator">
                                                    <c:choose>
                                                        <c:when test="${iterator <= feedback.rating}">
                                                            <i class="bi bi-star-fill"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${(iterator - feedback.rating) > 0 && (iterator - feedback.rating) <= 0.2}">
                                                                    <i class="bi bi-star-fill"></i>
                                                                </c:when>
                                                                <c:when test="${(iterator - feedback.rating) > 0.2  && (iterator - feedback.rating) <= 0.7}">
                                                                    <i class="bi bi-star-fill"></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="bi bi-star-fill" style="color: #ccc"></i>
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
                                    <c:if test="${requestScope.currentPage < requestScope.endPage}">
                                        <button type="submit" name="paging" value="${requestScope.currentPage + 1}">
                                            <i class="fas fa-chevron-right"></i>
                                        </button>
                                    </c:if>
                                    <c:if test="${requestScope.currentPage == requestScope.endPage}">
                                        <button type="submit" name="paging" value="${requestScope.endPage}">
                                            <i class="fas fa-chevron-right"></i>
                                        </button>
                                    </c:if>
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
                    <c:if test="${sessionScope.currentUser != null}">
                        <form action="/sakura/hostel/detail">
                            <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                            <input type="hidden" name="filterStar" value="${requestScope.filterStar}"/>
                            <c:if test="${requestScope.feedback == null}">
                                <div class="send-feedback">
                                    <input type="hidden" name="rating" value="5" />
                                    <div class="send-feedback-star-list">
                                        <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                        <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                        <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                        <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                        <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                    </div>
                                    <textarea class="text-area" placeholder="Nhập vào đây đánh giá của bạn"
                                              name="feedbackContent" rows="4" cols="100"></textarea>
                                    <button type="submit" name="message" value="Cảm ơn đánh giá của bạn" class="send-feedback-btn bg-[#17535B] text-[#fff] hover:bg-[#13484B]">Gửi đánh giá</button>
                                </div>
                            </c:if>
                            <c:if test="${requestScope.feedback != null}">
                                <div class="send-feedback">
                                    <input type="hidden" name="oldRating" value="${requestScope.feedback.rating}" />
                                    <input type="hidden" name="rating" value="${requestScope.feedback.rating}" />
                                    <div class="send-feedback-star-list">
                                        <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                        <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                        <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                        <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                        <div class="send-feedback-star"><i class="fa-solid fa-star" style="color: #ccc;"></i></div>
                                    </div>
                                    <textarea class="text-area" disabled placeholder="Nhập vào đây đánh giá của bạn"
                                              name="updateContent" rows="4" cols="100">${requestScope.feedback.content}</textarea>
                                    <button type="submit" class="send-feedback-btn bg-[#17535B] text-[#fff] hover:bg-[#13484B]">Gửi đánh giá</button>
                                    <button class="update-feedback-btn bg-[#17535B] text-[#fff] hover:bg-[#13484B]">Chỉnh sửa đánh giá</button>
                                </div>
                            </c:if>
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.currentUser == null}">
                        <h3>Bạn phải đăng nhập để đánh giá nhà trọ này</h3>
                    </c:if>
                </div>

                <div class="section">
                    <h3 class="section-title">
                        nhà trọ nổi bật
                    </h3>
                    <ul class="hostel-vip-list row">
                        <c:set var="i" value="-1" />
                        <c:forEach var="hostel" items="${requestScope.outstandingHostels}">
                            <c:set var="i" value="${i + 1}" />
                            <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                                <form action="/sakura/hostel/detail">
                                    <input type="hidden" name="filterStar" value="0" />
                                    <button class="hostel-vip-item" name="hostelId" value="${hostel.hostelID}" class="hostel-item">
                                        <div id="carouselExampleIndicators-${i}" class="carousel slide" data-interval="false">
                                            <ol class="carousel-indicators carousel-vip-indicators">
                                                <c:if test="${hostel.imgList.size() > 0}">
                                                    <c:forEach begin="0" end="${hostel.imgList.size() - 1}" var="iterator">
                                                        <c:if test="${iterator == 0}">
                                                            <li data-target="#carouselExampleIndicators-${i}" data-slide-to="0" class="active">
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${iterator > 0}">
                                                            <li data-target="#carouselExampleIndicators-${i}" data-slide-to="${iterator}">
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </ol>
                                            <div class="hostel-vip-images">
                                                <div class="carousel-inner">
                                                    <c:if test="${hostel.imgList.size() > 0}">
                                                        <c:forEach begin="0" end="${hostel.imgList.size() - 1}" var="iterator">
                                                            <c:if test="${iterator == 0}">
                                                                <div class="carousel-item carousel-vip-item active">
                                                                </c:if>
                                                                <c:if test="${iterator > 0}">
                                                                    <div class="carousel-item carousel-vip-item">
                                                                    </c:if>
                                                                    <img class="d-block w-100" src="${hostel.imgList.get(iterator)}">
                                                                </div>
                                                            </c:forEach>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="btn-prev-next">
                                                    <a class="carousel-control-prev" href="#carouselExampleIndicators-${i}" role="button"
                                                       data-slide="prev">
                                                        <span><i class="fa-solid fa-angle-left"></i></span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                    <a class="carousel-control-next" href="#carouselExampleIndicators-${i}" role="button"
                                                       data-slide="next">
                                                        <span><i class="fa-solid fa-angle-right"></i></span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="hostel-vip-content btn-submit">

                                                <div class="hostel-vip-name">${hostel.hostelName}</div>
                                                <div class="hostel-vip-action">
                                                    <div class="hostel-vip-rating">
                                                        <c:forEach begin="1" end="5" var="iterator">
                                                            <c:choose>
                                                                <c:when test="${iterator <= hostel.rating}">
                                                                    <i class="fa-solid fa-star"></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:choose>
                                                                        <c:when test="${(iterator - hostel.rating) > 0 && (iterator - hostel.rating) <= 0.2}">
                                                                            <i class="fa-solid fa-star"></i>
                                                                        </c:when>
                                                                        <c:when test="${(iterator - hostel.rating) > 0.2  && (iterator - hostel.rating) <= 0.7}">
                                                                            <i class="fa-solid fa-star-half-stroke"></i>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <i class="fa-solid fa-star" style="color: #ccc"></i>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <span class="hostel-vip-rating-number">${hostel.rating}/5</span>
                                                    </div>
                                                </div>
                                                <div class="hostel-vip-address">${hostel.streetAddress} - ${hostel.district.districtName} - ${hostel.district.province.provinceName}</div>
                                                <div class="hostel-vip-info">
                                                    <span class="hostel-vip-room-available">Còn ${hostel.availableRoom} phòng trống</span>
                                                    <span class="hostel-vip-area">${hostel.minArea} - ${hostel.maxArea} m²</span>
                                                </div>
                                                <div class="hostel-vip-price">${hostel.minPrice / 1000000} triệu - ${hostel.maxPrice / 1000000} triệu</div>
                                            </div>
                                    </button>
                                </form>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div role="alert" style="box-shadow: rgba(100, 100, 111, 0.15) 0px 7px 29px 0px;"
                 class="top-[100px] absolute right-5 w-[330px] bg-[#ffffff] rounded flex flex-row transition duration-150 ease-in-out overflow-hidden ${(param.successBookingMessage == "true") ? 'show' : 'hide'}"
                 id="notification">
                <div class="px-3 flex items-center justify-center bg-[#36d39a] text-white text-lg w-1/6">
                    <i class="bi bi-check-circle"></i>
                </div>
                <div class="px-2 py-2">
                    <h1 class="text-lg text-[#4d4d4d] font-semibold">Yêu cầu thành công</h1>
                    <p class="text-[12px] text-[#8a8a8a] font-normal">Chủ nhà sẽ tiếp nhận yêu cầu và xác nhận lại với bạn.</p>
                </div>
                <a href="javascript:void(0)" class="flex justify-center items-center border-l text-[#c5c5c5] border-[#e0e0e0] w-1/6 cursor-pointer" onclick="closeNoti()">
                    <i class="bi bi-x-lg"></i>
                </a>
            </div>
        </div>
        <c:if test="${requestScope.message != null}">
            <div class="modaL">
                <div class="modal-ticket">
                    <div class="modalHeader">
                        <i class="bi bi-briefcase-fill"></i>
                        <span class="modalHeader-title">sakura</span>
                    </div>
                    <div class="modal-close-btn"><i class="bi bi-x"></i></div>
                    <div class="modal-content">
                        <h5>${requestScope.message}</h5>
                    </div>
                </div>
            </div>
        </c:if>

        <%@include file="footer.jsp" %>    
        <script src="../assets/javascript/hostel-detail.js"></script>
        <script src="../assets/javascript//jquery/jquery.min.js"></script>
        <script src="../assets/javascript//bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/javascript/jquery.js"></script>
        <script src="../assets/javascript/keep-district.js"></script>
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
        <script>
            let noti = document.getElementById("notification");
            noti.style.transform = "translateX(0%);";
            if (noti.classList.contains("show")) {
                noti.style.transform = "translateX(0%)";
                setTimeout(function () {
                    noti.style.transform = "translateX(150%)";
                }, 5000);
            }
            if (noti.classList.contains("hide")) {
                noti.style.display = "none";
            }

            function closeNoti() {
                noti.style.transform = "translateX(150%)";

            }
        </script>
        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
    </body>
</html>
