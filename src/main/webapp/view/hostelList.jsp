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
        <title>Sakura - Danh sách nhà trọ</title>

        <!-- Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

        <!--Favicon-->
        <link rel="shortcut icon" href="../assets/icons/logo.png" type="image/x-icon">

        <!-- Icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <script src="https://cdn.tailwindcss.com"></script>
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/hostel-list.css">
        <!--<link rel="stylesheet" href="../assets/css/hostel-list-responsive.css">-->
        <link rel="stylesheet" href="../assets/css/fix-hostel-list.css">
        <link rel="stylesheet" href="../assets/css/header-user-search-address.css">
    </head>
    <body>
        <header id="header-section" class="stick z-[10]">
            <%@include file="headerUserSearchAddress.jsp" %>
        </header>

        <div class="w-full m-0 p-0 bg-white mt-[90px]">
            <!--    SEARCH BY NAME  -->

            <div class="w-[60%] mx-auto py-5">
                <div class="grid grid-cols-2">
                    <form action="/sakura/hostel/list" class="input-group relative flex w-[90%] h-[50px] mb-4" method="get">
                        <c:if test="${requestScope.favorite == true}">
                            <input type="hidden" name="favorite" value="true"/>
                        </c:if>
                        <c:if test="${requestScope.province != null}">
                            <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                        </c:if>
                        <c:if test="${requestScope.district != null}">
                            <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
                        </c:if>
                        <input id="search-hostel" type="search" name="keyword" value="${requestScope.keyword}"
                               class="form-control relative block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white border border-solid border-gray-300 border-r-0 rounded-tl-md rounded-bl-md transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-[#17535B] focus:outline-none" placeholder="Nhập tên phòng trọ..." aria-label="Search" aria-describedby="button-addon2">
                        <button id="search-btn" class="btn px-6 py-2.5 bg-[#17535B] text-white font-medium text-xs leading-tight rounded-tr-md rounded-br-md hover:bg-[#13484F] hover:text-white focus:outline-none transition ease-in-out flex items-center"
                                type="submit" id="button-addon2">
                            <i class="bi bi-search"></i>
                        </button>
                    </form>
                    <div class="grid grid-cols-3 gap-5 z-[5]">
                        <div class="filter-item p-0 m-0 mr-[50px]">
                            <div class="rating-btn h-[50px] w-[180px] bg-[#FFF] text-[#17535B] text-lg font-semibold rounded cursor-pointer relative flex justify-center items-center group border border-1 border-[#17535B]">
                                Đánh giá <i class="bi bi-caret-down-fill ml-[10px]"></i>
                                <ul class="rating-sort-list hidden group-hover:block absolute top-[50px] left-0 w-full rounded-bl-md rounded-br-md bg-[#FAFAFA] text-[#17535B] overflow-hidden">
                                    <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                        <form action="/sakura/hostel/list">
                                            <c:if test="${requestScope.favorite == true}">
                                                <input type="hidden" name="favorite" value="true"/>
                                            </c:if>
                                            <c:if test="${requestScope.keyword != null}">
                                                <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                            </c:if>
                                            <c:if test="${requestScope.province != null}">
                                                <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                            </c:if>
                                            <c:if test="${requestScope.district != null}">
                                                <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
                                            </c:if>
                                            <button type="submit" value="asc" name="sortByRate">Tăng dần</button>
                                        </form>
                                    </li>
                                    <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                        <form action="/sakura/hostel/list">
                                            <c:if test="${requestScope.favorite == true}">
                                                <input type="hidden" name="favorite" value="true"/>
                                            </c:if>
                                            <c:if test="${requestScope.keyword != null}">
                                                <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                            </c:if>
                                            <c:if test="${requestScope.province != null}">
                                                <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                            </c:if>
                                            <c:if test="${requestScope.district != null}">
                                                <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
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
                                        <form action="/sakura/hostel/list">
                                            <c:if test="${requestScope.favorite == true}">
                                                <input type="hidden" name="favorite" value="true"/>
                                            </c:if>
                                            <c:if test="${requestScope.keyword != null}">
                                                <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                            </c:if>
                                            <c:if test="${requestScope.province != null}">
                                                <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                            </c:if>
                                            <c:if test="${requestScope.district != null}">
                                                <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
                                            </c:if>
                                            <button type="submit" value="asc" name="sortByMinPrice">Tăng dần theo giá đầu</button>
                                        </form>
                                    </li>
                                    <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                        <form action="/sakura/hostel/list">
                                            <c:if test="${requestScope.favorite == true}">
                                                <input type="hidden" name="favorite" value="true"/>
                                            </c:if>
                                            <c:if test="${requestScope.keyword != null}">
                                                <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                            </c:if>
                                            <c:if test="${requestScope.province != null}">
                                                <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                            </c:if>
                                            <c:if test="${requestScope.district != null}">
                                                <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
                                            </c:if>
                                            <button type="submit" value="desc" name="sortByMinPrice">Giảm dần theo giá đầu</button>
                                        </form>
                                    </li>
                                    <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                        <form action="/sakura/hostel/list">
                                            <c:if test="${requestScope.favorite == true}">
                                                <input type="hidden" name="favorite" value="true"/>
                                            </c:if>
                                            <c:if test="${requestScope.keyword != null}">
                                                <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                            </c:if>
                                            <c:if test="${requestScope.province != null}">
                                                <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                            </c:if>
                                            <c:if test="${requestScope.district != null}">
                                                <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
                                            </c:if>
                                            <button type="submit" value="asc" name="sortByMaxPrice">Tăng dần theo giá cuối</button>
                                        </form>
                                    </li>
                                    <li class="sort-criteria-item h-[50px] text-[14px] font-normal flex justify-center items-center hover:bg-[#eff3f5]">
                                        <form action="/sakura/hostel/list">
                                            <c:if test="${requestScope.favorite == true}">
                                                <input type="hidden" name="favorite" value="true"/>
                                            </c:if>
                                            <c:if test="${requestScope.keyword != null}">
                                                <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                            </c:if>
                                            <c:if test="${requestScope.province != null}">
                                                <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                            </c:if>
                                            <c:if test="${requestScope.district != null}">
                                                <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
                                            </c:if>
                                            <button type="submit" value="desc" name="sortByMaxPrice">Giảm dần theo giá cuối</button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <c:if test="${sessionScope.currentUser != null}">
                            <div class="filter-item p-0 m-0">
                                <form class="submit-filter h-[50px] w-[180px] bg-[#ee7b35] text-[#E6EEF1] text-lg font-semibold rounded cursor-pointer relative flex justify-center items-center" action="/sakura/hostel/list">
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
                <div class="result-address my-[20px] ">
                    <span class="search-result-dsc">Phòng cho thuê: </span>
                    <c:if test="${requestScope.province != null}"> 
                        <span class="search-result-dsc"> >> ${requestScope.province.provinceName}</span>
                    </c:if>
                    <c:if test="${requestScope.district != null}"> 
                        <span class="search-result-dsc"> - ${requestScope.district.districtName}</span>
                    </c:if>
                    <c:if test="${requestScope.keyword != null}"> 
                        <span class="search-result-dsc"> >> Từ khoá: ${requestScope.keyword}</span>
                    </c:if>
                </div>

                <c:if test="${requestScope.itemQuantity != 0}">
                    <h4 class="result-number text-[#282C3B] text-[17px] font-md mt-[20px]">Có ${requestScope.itemQuantity} kết quả</h4>
                </c:if>
                <c:if test="${requestScope.itemQuantity == 0}">
                    <h4 class="result-number text-[#282C3B] text-[20px] font-bold mt-[20px]">Không tìm thấy kết quả</h4>
                </c:if>
                <div class="grid">
                    <ul class="hostel-list row">
                        <c:set var="i" value="-1" />
                        <c:forEach var="hostel" items="${requestScope.hostelList}">
                            <c:set var="i" value="${i + 1}" />
                            <li class="col-12 col-sm-6 col-md-4 col-lg-3">
                                <form action="/sakura/hostel/detail">
                                    <input type="hidden" name="filterStar" value="0" />
                                    <button name="hostelId" value="${hostel.hostelID}" class="hostel-item">
                                        <div id="carouselExampleIndicators-${i}" class="carousel slide" data-interval="false">
                                            <ol class="carousel-indicators">
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
                                            <div class="hostel-images">
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
                            <li class="pagination-item pagination-previous pagination-previous--fast">
                                <form action="/sakura/hostel/list">
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
                                    <c:if test="${requestScope.province != null}">
                                        <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                    </c:if>
                                    <c:if test="${requestScope.district != null}">
                                        <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
                                    </c:if>
                                    <button type="submit" name="paging" value="1"><i class="bi bi-arrow-bar-left"></i></button>
                                </form>
                            </li>

                            <li class="pagination-item pagination-previous">
                                <form action="/sakura/hostel/list">
                                    <c:if test="${requestScope.province != null}">
                                        <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                    </c:if>
                                    <c:if test="${requestScope.district != null}">
                                        <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
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

                            <c:forEach begin="${requestScope.beginPage}" end="${requestScope.endPage}" var="iterator">
                                <c:if test="${requestScope.currentPage == iterator}">
                                    <li class="pagination-item pagination-item--active">
                                    </c:if>
                                    <c:if test="${requestScope.currentPage != iterator}">
                                    <li class="pagination-item">
                                    </c:if>
                                    <form action="/sakura/hostel/list">
                                        <c:if test="${requestScope.province != null}">
                                            <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                        </c:if>
                                        <c:if test="${requestScope.district != null}">
                                            <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
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
                            <li class="pagination-item pagination-next">
                                <form action="/sakura/hostel/list">
                                    <c:if test="${requestScope.province != null}">
                                        <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                    </c:if>
                                    <c:if test="${requestScope.district != null}">
                                        <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
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
                                <form action="/sakura/hostel/list">
                                    <c:if test="${requestScope.province != null}">
                                        <input type="hidden" name="province" value="${requestScope.province.provinceID}"/>
                                    </c:if>
                                    <c:if test="${requestScope.district != null}">
                                        <input type="hidden" name="district" value="${requestScope.district.districtID}"/>
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
                        </ul>
                    </div>

                </div>

            </div>
        </div>

        <footer class="w-full h-auto mx-0 bg-[#FBFBFB]">
            <div class="px-4 pt-16 mx-auto sm:max-w-xl md:max-w-full lg:max-w-screen-xl md:px-24 lg:px-8 ">
                <div class="grid gap-10 row-gap-6 mb-8 sm:grid-cols-2 lg:grid-cols-4">
                    <div class="sm:col-span-2">
                        <a href="/" aria-label="Go home" title="Company" class="inline-flex items-center">
                            <img class="w-9 h-9" src="../assets/icons/logo.png" alt="">
                            <span class="ml-2 text-xl font-bold tracking-wide text-gray-800 uppercase">SAKURA</span>
                        </a>
                        <div class="mt-6 lg:max-w-sm">
                            <p class="text-sm text-gray-800">
                                Sakura mong muốn trở thành công cụ thuận tiện cho người thuê và chủ nhà để quản lý phòng trọ.
                            </p>
                            <p class="mt-4 text-sm text-gray-800">
                                Với Sakura, chủ nhà sẽ được hỗ trợ rất nhiều về các chức năng khác nhau như quản lý người thuê và phòng trọ, xem số liệu thống kê về doanh thu và sử dụng nhà trọ...
                            </p>
                        </div>
                    </div>
                    <div class="space-y-2 text-sm">
                        <p class="text-base font-bold tracking-wide text-gray-900">Liên hệ</p>
                        <div class="flex">
                            <p class="mr-1 text-gray-800">Số điện thoại</p>
                            <a href="tel:0357543625" aria-label="Our phone" title="Our phone" class="transition-colors duration-300 text-deep-purple-accent-400 hover:text-deep-purple-800">(+84) 357 543 625</a>
                        </div>
                        <div class="flex">
                            <p class="mr-1 text-gray-800">Email:</p>
                            <a href="mailto:info@lorem.mail" aria-label="Our email" title="Our email" class="transition-colors duration-300 text-deep-purple-accent-400 hover:text-deep-purple-800">sakura.support@gmail.com</a>
                        </div>
                        <div class="flex">
                            <p class="mr-1 text-gray-800">Địa chỉ:</p>
                            <a href="https://www.google.com/maps" target="_blank" rel="noopener noreferrer" aria-label="Our address" title="Our address" class="transition-colors duration-300 text-deep-purple-accent-400 hover:text-deep-purple-800">
                                101 Nguyễn Xiển, Q.9<br>
                            </a>
                        </div>
                    </div>
                    <div>
                        <span class="text-base font-bold tracking-wide text-gray-900">Kết nối</span>
                        <div class="flex items-center mt-1 space-x-3">
                            <a href="/" class="text-gray-500 transition-colors duration-300 hover:text-deep-purple-accent-400">
                                <svg viewBox="0 0 24 24" fill="currentColor" class="h-5">
                                <path
                                    d="M22,0H2C0.895,0,0,0.895,0,2v20c0,1.105,0.895,2,2,2h11v-9h-3v-4h3V8.413c0-3.1,1.893-4.788,4.659-4.788 c1.325,0,2.463,0.099,2.795,0.143v3.24l-1.918,0.001c-1.504,0-1.795,0.715-1.795,1.763V11h4.44l-1,4h-3.44v9H22c1.105,0,2-0.895,2-2 V2C24,0.895,23.105,0,22,0z"
                                    ></path>
                                </svg>
                            </a>
                            <a href="/" class="text-gray-500 transition-colors duration-300 hover:text-deep-purple-accent-400">
                                <svg viewBox="0 0 30 30" fill="currentColor" class="h-6">
                                <circle cx="15" cy="15" r="4"></circle>
                                <path
                                    d="M19.999,3h-10C6.14,3,3,6.141,3,10.001v10C3,23.86,6.141,27,10.001,27h10C23.86,27,27,23.859,27,19.999v-10   C27,6.14,23.859,3,19.999,3z M15,21c-3.309,0-6-2.691-6-6s2.691-6,6-6s6,2.691,6,6S18.309,21,15,21z M22,9c-0.552,0-1-0.448-1-1   c0-0.552,0.448-1,1-1s1,0.448,1,1C23,8.552,22.552,9,22,9z"
                                    ></path>
                                </svg>
                            </a>

                        </div>
                        <p class="mt-4 text-sm text-gray-500">
                            Kết nối và theo dõi SAKURA trên các nền tảng xã hội để cập nhật tin tức, xu hướng cùng những ưu đãi mới nhất!
                        </p>
                    </div>
                </div>
                <div class="flex flex-col-reverse justify-between pt-5 pb-10 border-t lg:flex-row">
                    <p class="text-sm text-gray-600">
                        © Copyright 2022 Dolphin Inc. All rights reserved.
                    </p>
                    <ul class="flex flex-col mb-3 space-y-2 lg:mb-0 sm:space-y-0 sm:space-x-5 sm:flex-row">
                        <li>
                            <a href="/" class="text-sm text-gray-600 transition-colors duration-300 hover:text-deep-purple-accent-400">F.A.Q</a>
                        </li>
                        <li>
                            <a href="/" class="text-sm text-gray-600 transition-colors duration-300 hover:text-deep-purple-accent-400">Chính sách &amp; Điều kiện</a>
                        </li>
                    </ul>
                </div>
            </div>
        </footer>                        

        <script src="../assets/javascript//jquery/jquery.min.js"></script>
        <script src="../assets/javascript//bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/javascript/hostel-list.js"></script>
        <script src="../assets/javascript/jquery.js"></script>
        <script>
                                                                        function toggleFavoriteHostel(hostelID, element) {
                                                                            if (element.style.color === 'red')
                                                                                element.style.color = '#DBDBDB';
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
            console.log(document.querySelector(".districtSelected-hidden"));
            if (document.querySelector(".districtSelected-hidden"))
                var districtSelected = document.querySelector(".districtSelected-hidden").value;
            var districtElemet = document.querySelector('#district');
            if (districtSelected) {
                console.log(districtSelected);
                var provinceID = document.querySelector('#province').value;
                jQuery.ajax({
                    type: 'POST',
                    data: {'provinceID': provinceID,
                        'districtSelected': districtSelected
                    },
                    url: '/sakura/hostel/address',
                    success: function (response) {
                        districtElemet.innerHTML = "<option value='0'>Quận huyện</option>" + response;
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }

        </script>
    </body>
</html>
