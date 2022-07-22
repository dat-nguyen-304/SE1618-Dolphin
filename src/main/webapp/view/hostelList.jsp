<%-- 
    Document   : homepage
    Created on : Jun 3, 2022, 1:22:27 PM
    Author     : Vu Thien An - SE160296
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>

<%
    //response.setHeader("Cache-Control", "no-cache, no-store");
%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakura - Danh sách nhà trọ</title>

        <!--Font-->
        <link rel="stylesheet" href="/sakura/assets/css/font.css">

        <!-- Icon -->
        <link rel="stylesheet" href="/sakura/assets/icons/bootstrap-icons.css">

        <!--Favicon-->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <script src="https://cdn.tailwindcss.com"></script>
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/hostel-list.css">
        <link rel="stylesheet" href="../assets/css/fix-hostel-list.css">
        <c:choose>
            <c:when test="${sessionScope.currentUser != null}">
                <link rel="stylesheet" href="../assets/css/header-user-search-address.css">
            </c:when>
            <c:otherwise>
                <link rel="stylesheet" href="../assets/css/header-guest-search-address.css">
            </c:otherwise>
        </c:choose>

    </head>
    <body>
        <header id="header-section" class="stick z-[100]">
            <c:if test="${sessionScope.currentUser != null}">
                <%@include file="headerUserSearchAddress.jsp" %>
            </c:if>
            <c:if test="${sessionScope.currentUser == null}">
                <%@include file="headerGuestSearchAddress.jsp" %>
            </c:if>
        </header>
        <div class="w-full m-0 p-0 bg-white mt-[90px]">
            <!--    SEARCH BY NAME  -->
            <div class="w-[70%] mx-auto py-5">
                <div class="grid grid-cols-2">
                    <form action="/sakura/hostel/list" class="input-group relative flex w-[90%] h-[50px] mb-4" method="post">
                        <c:if test="${requestScope.favorite == true}">
                            <input type="hidden" name="favorite" value="true"/>
                        </c:if>
                        <c:if test="${sessionScope.province != null}">
                            <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                        </c:if>
                        <c:if test="${sessionScope.district != null}">
                            <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                        </c:if>
                        <input id="search-hostel" type="search" name="keyword" value="${requestScope.keyword}"
                               class="form-control relative block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white border border-solid border-gray-300 border-r-0 rounded-tl-md rounded-bl-md transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-[#17535B] focus:outline-none" placeholder="Nhập tên phòng trọ..." aria-label="Search" aria-describedby="button-addon2">
                        <button id="search-btn" class="btn px-6 py-2.5 bg-[#17535B] text-white font-medium text-xs leading-tight rounded-tr-md rounded-br-md hover:bg-[#13484F] hover:text-white focus:outline-none transition ease-in-out flex items-center"
                                type="submit" id="button-addon2">
                            <i class="bi bi-search"></i>
                        </button>
                    </form>
                    <div class="grid grid-cols-3 gap-5 z-[5]">
                        <c:if test="${requestScope.itemQuantity != 0}">
                            <div class="filter-item p-0 m-0 mr-[50px]">
                                <div class="rating-btn h-[50px] w-[180px] bg-[#FFF] text-[#17535B] text-lg font-semibold rounded cursor-pointer relative flex justify-center items-center group border border-1 border-[#17535B]">
                                    Đánh giá <i class="bi bi-caret-down-fill ml-[10px]"></i>
                                    <ul class="rating-sort-list hidden group-hover:block absolute top-[50px] left-0 w-full rounded-bl-md rounded-br-md bg-[#FAFAFA] text-[#17535B] overflow-hidden">
                                        <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                            <form action="/sakura/hostel/list" method="post">
                                                <c:if test="${requestScope.favorite == true}">
                                                    <input type="hidden" name="favorite" value="true"/>
                                                </c:if>
                                                <c:if test="${requestScope.keyword != null}">
                                                    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.province != null}">
                                                    <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.district != null}">
                                                    <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                                </c:if>
                                                <button type="submit" value="asc" name="sortByRate">Tăng dần</button>
                                            </form>
                                        </li>
                                        <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                            <form action="/sakura/hostel/list" method="post">
                                                <c:if test="${requestScope.favorite == true}">
                                                    <input type="hidden" name="favorite" value="true"/>
                                                </c:if>
                                                <c:if test="${requestScope.keyword != null}">
                                                    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.province != null}">
                                                    <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.district != null}">
                                                    <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                                </c:if>
                                                <button type="submit" value="desc" name="sortByRate">Giảm dần</button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="filter-item p-0 m-0 mr-[50px]">
                                <div class="rating-btn h-[50px] w-[180px] bg-[#FFF] text-[#17535B] text-lg font-semibold rounded cursor-pointer relative flex justify-center items-center group border border-1 border-[#17535B]">
                                    Giá tiền <i class="bi bi-caret-down-fill ml-[10px]"></i>
                                    <ul class="rating-sort-list hidden group-hover:block absolute top-[50px] left-0 w-full rounded-bl-md rounded-br-md bg-[#FAFAFA] text-[#17535B] overflow-hidden">
                                        <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                            <form action="/sakura/hostel/list" method="post">
                                                <c:if test="${requestScope.favorite == true}">
                                                    <input type="hidden" name="favorite" value="true"/>
                                                </c:if>
                                                <c:if test="${requestScope.keyword != null}">
                                                    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.province != null}">
                                                    <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.district != null}">
                                                    <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                                </c:if>
                                                <button type="submit" value="asc" name="sortByMinPrice">Tăng dần theo giá đầu</button>
                                            </form>
                                        </li>
                                        <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                            <form action="/sakura/hostel/list" method="post">
                                                <c:if test="${requestScope.favorite == true}">
                                                    <input type="hidden" name="favorite" value="true"/>
                                                </c:if>
                                                <c:if test="${requestScope.keyword != null}">
                                                    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.province != null}">
                                                    <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.district != null}">
                                                    <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                                </c:if>
                                                <button type="submit" value="desc" name="sortByMinPrice">Giảm dần theo giá đầu</button>
                                            </form>
                                        </li>
                                        <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                            <form action="/sakura/hostel/list" method="post">
                                                <c:if test="${requestScope.favorite == true}">
                                                    <input type="hidden" name="favorite" value="true"/>
                                                </c:if>
                                                <c:if test="${requestScope.keyword != null}">
                                                    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.province != null}">
                                                    <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.district != null}">
                                                    <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                                </c:if>
                                                <button type="submit" value="asc" name="sortByMaxPrice">Tăng dần theo giá cuối</button>
                                            </form>
                                        </li>
                                        <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                            <form action="/sakura/hostel/list" method="post">
                                                <c:if test="${requestScope.favorite == true}">
                                                    <input type="hidden" name="favorite" value="true"/>
                                                </c:if>
                                                <c:if test="${requestScope.keyword != null}">
                                                    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.province != null}">
                                                    <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.district != null}">
                                                    <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                                </c:if>
                                                <button type="submit" value="desc" name="sortByMaxPrice">Giảm dần theo giá cuối</button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.currentUser != null}">
                            <div class="filter-item p-0 m-0">
                                <form action="/sakura/hostel/list" method="post" class="submit-filter h-[50px] w-[180px] bg-[#ee7b35] text-[#E6EEF1] text-lg font-semibold rounded cursor-pointer relative flex justify-center items-center">
                                    <c:if test="${requestScope.keyword != null}">
                                        <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                    </c:if>
                                    <c:if test="${requestScope.favorite == null}">
                                        <button type="submit" name="favorite" value="true">Yêu thích</button>
                                    </c:if>
                                    <c:if test="${requestScope.favorite != null}">
                                        <button type="submit" name="favorite" value="false">Yêu thích</button>
                                    </c:if>
                                </form>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="result-address my-[20px]">
                    <c:if test="${sessionScope.province != null}"> 
                        <span>Phòng cho thuê:  </span><span class="search-result-dsc">${sessionScope.province.provinceName}</span>
                        <c:if test="${sessionScope.district == null}"> <br/></c:if>
                    </c:if>
                    <c:if test="${sessionScope.district != null}"> 
                        <span class="search-result-dsc"> - ${sessionScope.district.districtName}</span><br/>
                    </c:if>
                    <c:if test="${requestScope.keyword != null}"> 
                        <span>Từ khoá:</span><span class="search-result-dsc"> ${requestScope.keyword}</span>
                    </c:if>
                </div>

                <c:if test="${requestScope.itemQuantity != 0}">
                    <h4 class="result-number text-[#282C3B] text-[17px] font-md mt-[20px]">Có ${requestScope.itemQuantity} kết quả</h4>
                    <div class="grid">
                        <ul class="hostel-list row">
                            <c:set var="i" value="-1" />
                            <c:forEach var="hostel" items="${requestScope.hostelList}">
                                <c:set var="i" value="${i + 1}" />
                                <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                                    <form action="/sakura/hostel/detail" method="post">
                                        <input type="hidden" name="filterStar" value="0" />
                                        <button name="hostelId" value="${hostel.hostelID}" class="hostel-item w-100">
                                            <c:if test="${hostel.imgList.size() > 0}">
                                                <div id="carouselExampleIndicators-${i}" class="carousel slide" data-interval="false">
                                                    <ol class="carousel-indicators">
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
                                                    </ol>
                                                    <div class="hostel-images">
                                                        <div class="carousel-inner">
                                                            <c:forEach begin="0" end="${hostel.imgList.size() - 1}" var="iterator">
                                                                <c:if test="${iterator == 0}">
                                                                    <div class="carousel-item active">
                                                                        <img class="d-block w-100" src="${hostel.imgList.get(iterator)}">
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${iterator > 0}">
                                                                    <div class="carousel-item">
                                                                        <img class="d-block w-100" src="${hostel.imgList.get(iterator)}">
                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="btn-prev-next">
                                                        <a class="carousel-control-prev" href="#carouselExampleIndicators-${i}" role="button"
                                                           data-slide="prev">
                                                            <span><i class="bi bi-caret-left-fill"></i></span>
                                                            <span class="sr-only">Previous</span>
                                                        </a>
                                                        <a class="carousel-control-next" href="#carouselExampleIndicators-${i}" role="button"
                                                           data-slide="next">
                                                            <span><i class="bi bi-caret-right-fill"></i></span>
                                                            <span class="sr-only">Next</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${hostel.imgList.size() == 0}">
                                                <img class="d-block w-100 h-[200px] object-cover" src="../assets/images/hostel-list-images/empty_img.jpg" />
                                            </c:if>

                                            <div class="hostel-content btn-submit">

                                                <div class="hostel-name">${hostel.hostelName}</div>
                                                <div class="hostel-action">
                                                    <div class="hostel-rating">
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
                                                                            <i class="bi bi-star-half"></i>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <i class="bi bi-star"></i>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <span class="hostel-rating-number ml-[5px]">${hostel.rating}/5</span>
                                                    </div>
                                                    <c:if test="${sessionScope.currentUser != null}">
                                                        <c:choose>
                                                            <c:when test="${requestScope.toggleList.get(i) == true}">
                                                                <div class="hostel-favorite">
                                                                    <i class="bi bi-heart-fill" style="color: red;" onclick="toggleFavoriteHostel(${hostel.hostelID}, this)"></i>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="hostel-favorite">
                                                                    <i class="bi bi-heart-fill" style="color: #DBDBDB;" onclick="toggleFavoriteHostel(${hostel.hostelID}, this)"></i>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </div>
                                                <div class="hostel-address">${hostel.streetAddress} - ${hostel.district.districtName} - ${hostel.district.province.provinceName}</div>

                                                <div class="hostel-info">
                                                    <span class="hostel-room-available">${hostel.availableRoom} phòng trống</span>
                                                    <span class="hostel-area">${hostel.minArea} - ${hostel.maxArea}m<sup>2</sup></span>
                                                </div>

                                                <div class="hostel-price">${hostel.minPrice / 1000000} - ${hostel.maxPrice / 1000000} triệu</div>
                                            </div>
                                        </button>
                                    </form>
                                </li>
                            </c:forEach>
                        </ul>

                        <!--  PAGING-->
                        <div class="pagination">
                            <ul class="pagination__list">
                                <!--  PAGING-->
                                <c:if test="${!(requestScope.currentPage == 1 || requestScope.itemQuantity <= 8)}">
                                    <li class="pagination-item pagination-previous pagination-previous--fast">
                                        <form action="/sakura/hostel/list" method="post">
                                            <c:if test="${requestScope.keyword != null}">
                                                <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByMinPrice != null}">
                                                <input type="hidden" name="sortByMaxPrice" value="${requestScope.sortByMinPrice}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByMaxPrice != null}">
                                                <input type="hidden" name="sortByMaxPrice" value="${requestScope.sortByMaxPrice}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByRate != null}">
                                                <input type="hidden" name="sortByRate" value="${requestScope.sortByRate}"/>
                                            </c:if>
                                            <c:if test="${sessionScope.province != null}">
                                                <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                            </c:if>
                                            <c:if test="${sessionScope.district != null}">
                                                <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                            </c:if>
                                            <button type="submit" name="paging" value="1"><i class="bi bi-arrow-bar-left"></i></button>
                                        </form>
                                    </li>

                                    <li class="pagination-item pagination-previous">
                                        <form action="/sakura/hostel/list" method="post">
                                            <c:if test="${sessionScope.province != null}">
                                                <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                            </c:if>
                                            <c:if test="${sessionScope.district != null}">
                                                <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                            </c:if>
                                            <c:if test="${requestScope.keyword != null}">
                                                <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByMinPrice != null}">
                                                <input type="hidden" name="sortByMaxPrice" value="${requestScope.sortByMinPrice}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByMaxPrice != null}">
                                                <input type="hidden" name="sortByMaxPrice" value="${requestScope.sortByMaxPrice}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByRate != null}">
                                                <input type="hidden" name="sortByRate" value="${requestScope.sortByRate}"/>
                                            </c:if>
                                            <c:if test="${requestScope.currentPage > 1}">
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
                                </c:if>
                                <c:if test="${requestScope.itemQuantity > 8}">
                                    <c:forEach begin="${requestScope.beginPage}" end="${requestScope.endPage}" var="iterator">
                                        <c:if test="${requestScope.currentPage == iterator}">
                                            <li class="pagination-item pagination-item--active">
                                            </c:if>
                                            <c:if test="${requestScope.currentPage != iterator}">
                                            <li class="pagination-item">
                                            </c:if>
                                            <form action="/sakura/hostel/list" method="post">
                                                <c:if test="${sessionScope.province != null}">
                                                    <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                                </c:if>
                                                <c:if test="${sessionScope.district != null}">
                                                    <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                                </c:if>
                                                <c:if test="${requestScope.keyword != null}">
                                                    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                                </c:if>
                                                <c:if test="${requestScope.sortByMinPrice != null}">
                                                    <input type="hidden" name="sortByMaxPrice" value="${requestScope.sortByMinPrice}"/>
                                                </c:if>
                                                <c:if test="${requestScope.sortByMaxPrice != null}">
                                                    <input type="hidden" name="sortByMaxPrice" value="${requestScope.sortByMaxPrice}"/>
                                                </c:if>
                                                <c:if test="${requestScope.sortByRate != null}">
                                                    <input type="hidden" name="sortByRate" value="${requestScope.sortByRate}"/>
                                                </c:if>
                                                <button type="submit" name="paging" value="${iterator}">${iterator}</button>
                                            </form>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${!(requestScope.currentPage == requestScope.endPage || requestScope.itemQuantity <= 8)}">
                                    <li class="pagination-item pagination-next">
                                        <form action="/sakura/hostel/list" method="post">
                                            <c:if test="${sessionScope.province != null}">
                                                <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                            </c:if>
                                            <c:if test="${sessionScope.district != null}">
                                                <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                            </c:if>
                                            <c:if test="${requestScope.keyword != null}">
                                                <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByMinPrice != null}">
                                                <input type="hidden" name="sortByMaxPrice" value="${requestScope.sortByMinPrice}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByMaxPrice != null}">
                                                <input type="hidden" name="sortByMaxPrice" value="${requestScope.sortByMaxPrice}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByRate != null}">
                                                <input type="hidden" name="sortByRate" value="${requestScope.sortByRate}"/>
                                            </c:if>
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
                                        <form action="/sakura/hostel/list" method="post">
                                            <c:if test="${sessionScope.province != null}">
                                                <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                                            </c:if>
                                            <c:if test="${sessionScope.district != null}">
                                                <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                                            </c:if>
                                            <c:if test="${requestScope.keyword != null}">
                                                <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByMinPrice != null}">
                                                <input type="hidden" name="sortByMaxPrice" value="${requestScope.sortByMinPrice}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByMaxPrice != null}">
                                                <input type="hidden" name="sortByMaxPrice" value="${requestScope.sortByMaxPrice}"/>
                                            </c:if>
                                            <c:if test="${requestScope.sortByRate != null}">
                                                <input type="hidden" name="sortByRate" value="${requestScope.sortByRate}"/>
                                            </c:if>
                                            <button type="submit" name="paging" value="${requestScope.pagingQuantity}"><i class="bi bi-arrow-bar-right"></i></button>
                                        </form>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </c:if>
                <c:if test="${requestScope.itemQuantity == 0}">
                    <h4 class="result-number text-[#282C3B] text-[20px] font-bold mt-[20px]">Không tìm thấy kết quả</h4>
                    <div class="w-full h-fit flex flex-col justify-center items-center mb-[160px]">
                        <img class="w-[400px] h-[400px] mt-[80px] objectfit-cover" src="../assets/images/no-result.svg" alt="alt"/>
                        <span>
                            Tìm nhà trọ ở <a class="text-[#288D87] font-bold hover:text-[#30C2BA]" href="/sakura/hostel/list?province=2&district=0">Thành phố Hồ Chí Minh </a>
                            hoặc <a class="text-[#288D87] font-bold hover:text-[#30C2BA]" href="/sakura/hostel/list?province=1&district=0">Hà Nội</a>
                        </span>
                    </div>
                </c:if>
            </div>
        </div>
        <%@include file="footer.jsp" %>      

        <script src="../assets/javascript//jquery/jquery.min.js"></script>
        <script src="../assets/javascript//bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/javascript/hostel-list.js"></script>
        <script src="../assets/javascript/jquery.js"></script>
        <script src="../assets/javascript/toggle-favorite.js"></script>
        <script src="../assets/javascript/keep-district.js"></script>

        <script>
                                                                        let noti = document.getElementById("notification");
                                                                        noti.style.transform = "translateX(0%);";
                                                                        if (noti.classList.contains("show"))
                                                                        {
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
    </body>
</html>