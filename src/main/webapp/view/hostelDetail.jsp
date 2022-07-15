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
        <script src="https://cdn.tailwindcss.com"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/index.min.css" />
        <<link rel="stylesheet" href="../assets/css/flowbite.min.css"/>
        <link rel="stylesheet" href="../assets/css/hostel-detail.css">

        <c:if test="${sessionScope.currentUser != null}">
            <link rel="stylesheet" href="../assets/css/header-user-search-address.css"/>
        </c:if>
        <c:if test="${sessionScope.currentUser == null}">
            <link rel="stylesheet" href="../assets/css/header-guest-search-address.css"/>
        </c:if>


    </head>

    <body>
        <header id="header-section" class="stick z-[100]">
            <c:if test="${sessionScope.currentUser != null}">
                <%@include file="../view/headerUserSearchAddress.jsp" %>
            </c:if>
            <c:if test="${sessionScope.currentUser == null}">
                <%@include file="../view/headerGuestSearchAddress.jsp" %>
            </c:if>
        </header>

        <div class="w-[70%] mx-auto mt-[90px]">
            <div class="w-full main-content ">
                <div class="w-full grid grid-cols-12 h-[600px] gap-[20px]">
                    <div id="animation-carousel" class="col-span-8 relative" data-carousel="static"> 
                        <!-- Carousel wrapper -->
                        <div class="overflow-hidden relative h-full rounded">
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
                        <div class="hostel-info-title flex justify-between items-center">
                            <h3 class="hostel-name text-[25px] font-bold text-">${requestScope.hostel.hostelName}</h3>
                            <c:if test="${sessionScope.currentUser != null}">
                                <div class="hostel-favorite cursor-pointer">
                                    <c:if test="${requestScope.isFavorite == true}">
                                        <i class="bi bi-heart-fill" style="color: red;" onclick="toggleFavoriteHostel(${requestScope.hostel.hostelID}, this)"></i>
                                    </c:if>
                                    <c:if test="${requestScope.isFavorite == false}">
                                        <i class="bi bi-heart-fill" style="color: #ccc;" onclick="toggleFavoriteHostel(${requestScope.hostel.hostelID}, this)"></i>
                                    </c:if>
                                </div>
                            </c:if>
                        </div>
                        <div class="hostel-rating my-[20px] text-amber-400 font-bold">
                            <span class="hostel-rating-number">${requestScope.hostel.rating} / 5 <i class="bi bi-star-fill ml-[5px]"></i></span>
                        </div>

                        <div class="text-slate-600 font-medium text-slate-500 text-[18px] pb-[20px] my-[20px] border-b">
                            <div class="hostel-cost"><i class="bi bi-cash-stack"></i> ${requestScope.hostel.minPrice / 1000000} - ${requestScope.hostel.maxPrice / 1000000} triệu / tháng</div>
                            <div class="hostel-address"><i class="bi bi-geo-fill"></i> ${requestScope.hostel.streetAddress}, ${hostel.district.districtName}, ${hostel.district.province.provinceName}</div>
                        </div>

                        <div class="landlord-info my-[20px] pb-[20px] border-b">
                            <h2 class="landlord-info-title text-[18px] font-bold text-slate-800 mb-[5px]">Quản lí: <span>${requestScope.hostel.landlord.fullname}</span></h2>
                            <div class="landlord-phone text-slate-500"><i class="bi bi-telephone-fill"></i> <span>${requestScope.hostel.landlord.phone}</span> </div>
                            <div class="landlord-email text-slate-500"><i class="bi bi-envelope-fill"></i> <span>${requestScope.hostel.landlord.account.email}</span> </div>
                        </div>

                        <div class="room-cta text-[18px] w-full">
                            <div class="grid grid-cols-6 my-[20px]">
                                <div class="hostel-total-rom col-span-2 text-slate-500">Tổng số phòng</div>
                                <div class="col-span-1 text-slate-900 font-bold">${requestScope.hostel.totalRoom}</div>
                                <div class="hostel-available-room col-span-2 text-slate-500">Phòng trống</div>
                                <div class="col-span-1 text-slate-900 font-bold">${requestScope.hostel.availableRoom}</div>
                            </div>

                            <button id="view-room-type" type = "submit" name = "action" class="btn-view-all-room w-full h-[50px] rounded text-white bg-[#17535B] hover:bg-[#13484F]">Xem phòng</button>
                        </div>

                        <%@include file="../view/modalRoomTypeList.jsp" %>
                    </div>

                </div>
            </div>
            <div class="my-[20px] pb-[40px] border-b" >
                <ul class="nav nav-tabs flex flex-col md:flex-row flex-wrap list-none border-b-0 pl-0 mb-4" id="tabs-tabFill"
                    role="tablist">
                    <li class="nav-item flex-auto text-center" role="presentation">
                        <a href="#tabs-homeFill" class="nav-link w-full block font-medium text-[18px] leading-tight border-x-0 border-t-0 border-b-2 border-transparent px-6 py-3 my-2 hover:border-transparent bg-[#fff] hover:bg-slate-50 focus:border-transparent active" id="tabs-home-tabFill" data-bs-toggle="pill" data-bs-target="#tabs-homeFill" role="tab"
                           aria-controls="tabs-homeFill" aria-selected="true">Tổng quan</a>
                    </li>
                    <li class="nav-item flex-auto text-center" role="presentation">
                        <a href="#tabs-profileFill" class="nav-link w-full block font-medium text-[18px] leading-tight border-x-0 border-t-0 border-b-2 border-transparent px-6 py-3 my-2 hover:border-transparent bg-[#fff] hover:bg-slate-50 focus:border-transparent" id="tabs-profile-tabFill" data-bs-toggle="pill" data-bs-target="#tabs-profileFill" role="tab"
                           aria-controls="tabs-profileFill" aria-selected="false">Dịch vụ</a>
                    </li>
                </ul>
                <div class="tab-content" id="tabs-tabContentFill">
                    <div class="tab-pane fade show active" id="tabs-homeFill" role="tabpanel" aria-labelledby="tabs-home-tabFill">
                        ${requestScope.hostel.description}
                    </div>
                    <div class="tab-pane fade" id="tabs-profileFill" role="tabpanel" aria-labelledby="tabs-profile-tabFill">
                        Liệt kê các dịch vụ
                    </div>
                </div>
            </div>

            <div class="section">
                <h3 class="section-title font-bold text-[18px] text-slate-800">
                    Đánh giá
                </h3>

                <c:if test="${requestScope.feedbackList == null}">
                    <h3 class="no-rating">Chưa có đánh giá nào</h3>
                </c:if>

                <div class="feedback-header flex justify-between items-center my-[10px]">
                    <div class="feedback-average text-amber-400 font-medium flex items-center mb-[20px]">
                        <h3 class="feedback-average-title mr-[10px]">${requestScope.hostel.rating} / 5</h3>
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
                        <div class="ml-[20px] text-slate-800 italic">
                            <p>(53 lượt đánh giá)</p>
                        </div>
                    </div>
                    <ul class="feedback-header-list flex ">
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
                        <li class="feedback-item mt-[20px] mb-[25px] bg-[#FDFEFF] shadow rounded p-[20px]">
                            <div class="tenant-item-header">
                                <div class="flex items-center space-x-4">
                                    <img class="w-10 h-10 rounded-full" src="${sessionScope.currentUser.account.avatar == null ? '../assets/images/user-avatars/no_ava.jpg' : sessionScope.currentUser.account.avatar}" alt="">
                                    <div class="space-y-1 font-medium">
                                        <p> ${feedback.tenant.fullname} <time datetime="" class="block text-sm text-gray-500 dark:text-gray-400">${feedback.date}</time></p>
                                    </div>
                                </div>
                                <div class="tenant-rating text-amber-400">
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
                            <div class="tenant-item-content mt-[5px] text-slate-800 font-normal">
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
                                <button type="submit" name="paging" value="1"><i class="bi bi-arrow-left"></i></button>
                            </form>
                        </li>

                        <li class="pagination-item pagination-previous">
                            <form action="/sakura/hostel/detail">
                                <c:if test="${requestScope.currentPage > 1}">
                                    <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                    <input type="hidden" name="filterStar" value="${requestScope.filterStar}"/>
                                    <button type="submit" name="paging" value="${requestScope.currentPage - 1}">
                                        <i class="bi bi-arrow-left"></i>
                                    </button>
                                </c:if>
                                <c:if test="${requestScope.currentPage == 1}">
                                    <button>
                                        <i class="bi bi-arrow-left"></i>
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
                                        <i class="bi bi-arrow-right"></i>
                                    </button>
                                </c:if>
                                <c:if test="${requestScope.currentPage == requestScope.endPage}">
                                    <button type="submit" name="paging" value="${requestScope.endPage}">
                                        <i class="bi bi-arrow-right"></i>
                                    </button>
                                </c:if>
                            </form>
                        </li>
                        <li class="pagination-item pagination-next pagination-next--fast">
                            <form action="/sakura/hostel/detail">
                                <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                                <input type="hidden" name="filterStar" value="${requestScope.filterStar}"/>
                                <button type="submit" name="paging" value="${requestScope.pagingQuantity}"><i class="bi bi-arrow-right"></i></button>
                            </form>
                        </li>
                    </ul>
                </div>


            </div>

            <div class="section mt-[40px] mb-[50px]">
                <h3 class="section-title font-bold text-[18px] text-slate-800 mb-[20px]">
                    Đánh giá của bạn
                </h3>
                <c:if test="${sessionScope.currentUser != null}">
                    <form action="/sakura/hostel/detail">
                        <input type="hidden" name="hostelId" value="${requestScope.hostel.hostelID}"/>
                        <input type="hidden" name="filterStar" value="${requestScope.filterStar}"/>
                        <c:if test="${requestScope.feedback == null}">
                            <div class="send-feedback">
                                <input type="hidden" name="rating" value="5" />
                                <div class="send-feedback-star-list flex mb-[10px]">
                                    <div class="send-feedback-star"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                    <div class="send-feedback-star"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                    <div class="send-feedback-star"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                    <div class="send-feedback-star"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                    <div class="send-feedback-star"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                </div>
                                <textarea class="text-area w-full" placeholder="Viết đánh giá ở đây..." name="feedbackContent" rows="4"></textarea>
                                <button type="submit" name="message" value="Cảm ơn đánh giá của bạn" class="send-feedback-btn bg-[#17535B] px-[10px] py-[5px] text-[#fff] hover:bg-[#13484B]">Gửi đánh giá</button>
                            </div>
                        </c:if>
                        <c:if test="${requestScope.feedback != null}">
                            <div class="send-feedback">
                                <input type="hidden" name="oldRating" value="${requestScope.feedback.rating}" />
                                <input type="hidden" name="rating" value="${requestScope.feedback.rating}" />
                                <div class="send-feedback-star-list flex mb-[10px]">
                                    <div class="send-feedback-star"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                    <div class="send-feedback-star"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                    <div class="send-feedback-star"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                    <div class="send-feedback-star"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                    <div class="send-feedback-star"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                </div>
                                <textarea class="text-area w-full" disabled placeholder="Viết đánh giá ở đây..."
                                          name="updateContent" rows="4" cols="100">${requestScope.feedback.content}</textarea>
                                <button type="submit" class="send-feedback-btn bg-[#17535B] px-[10px] py-[5px] text-[#fff] hover:bg-[#13484B]">Gửi đánh giá</button>
                                <button class="update-feedback-btn bg-[#17535B] text-[#fff] px-[10px] py-[5px] hover:bg-[#13484B]">Chỉnh sửa đánh giá</button>
                            </div>
                        </c:if>
                    </form>
                </c:if>
                <c:if test="${sessionScope.currentUser == null}">
                    <h3>Bạn phải đăng nhập để đánh giá nhà trọ này</h3>
                </c:if>
            </div>

            <!--            <div class="section">
                            <h3 class="section-title">
                                Nhà trọ nổi bật
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
                <span><i class="bi bi-arrow-left"></i></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators-${i}" role="button"
               data-slide="next">
                <span><i class="bi bi-arrow-right"></i></span>
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
                            <i class="bi bi-star-fill"></i>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${(iterator - hostel.rating) > 0 && (iterator - hostel.rating) <= 0.2}">
                                    <i class="bi bi-star-fill"></i>
                                </c:when>
                                <c:when test="${(iterator - hostel.rating) > 0.2  && (iterator - hostel.rating) <= 0.7}">
                                    <i class="bi bi-star-fill-half-stroke"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="bi bi-star-fill" style="color: #ccc"></i>
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
    </div>-->
        </div>
    </div>

    <%@include file="footer.jsp" %>    
    <script src="../assets/javascript/hostel-detail.js"></script>
    <script src="../assets/javascript//jquery/jquery.min.js"></script>
    <script src="../assets/javascript//bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/javascript/jquery.js"></script>
    <script src="../assets/javascript/hostel-detail.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/tw-elements/dist/js/index.min.js"></script>
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
    <script>
        // MODAL 
        var open_modal_1 = document.querySelector('#view-room-type');
        open_modal_1.addEventListener('click', function (event) {
            event.preventDefault();
            toggleModal('#room-type-modal');
        });
        var close_modal_1 = document.querySelectorAll('.modal-close');
        console.log(close_modal_1);
        for (let i = 0; i < close_modal_1.length; ++i) {
            close_modal_1[i].addEventListener('click', () => {
                console.log("close");
                toggleModal('#room-type-modal');
            });
        }

        document.onkeydown = function (evt) {
            evt = evt || window.event;
            var isEscape = false;
            if ("key" in evt) {
                isEscape = (evt.key === "Escape" || evt.key === "Esc");
            } else {
                isEscape = (evt.keyCode === 27);
            }
            const modal_1 = document.querySelector('#room-type-modal');
            if (isEscape && modal_1.classList.contains('active-modal')) {
                toggleModal('#room-type-modal');
            }
        };

        function toggleModal(modal_item) {
            const modal = document.querySelector(modal_item);
            modal.classList.toggle('active-modal');
            modal.classList.toggle('opacity-0');
            modal.classList.toggle('pointer-events-none');
        }
    </script>
</body>
</html>
