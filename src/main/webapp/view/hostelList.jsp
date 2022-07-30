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

        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/hostel-list.css">
        <c:if test="${sessionScope.currentUser != null}">
            <link rel="stylesheet" href="../assets/css/header-user-search-address.css">
        </c:if>
        <c:if test="${sessionScope.currentUser == null}">
            <link rel="stylesheet" href="../assets/css/header-guest-search-address.css">
        </c:if>
        
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
        <div class="w-full m-0 p-0 bg-white mt-[90px] mb-[50px]">
            <!--    SEARCH BY NAME  -->
            <div class="w-[70%] mx-auto py-5">
                <div class="grid grid-cols-2">
                    <form action="/sakura/hostel/list" class="input-group relative flex w-[90%] h-[40px] mb-4" method="post">
                        <c:if test="${requestScope.favorite == true}">
                            <input type="hidden" name="favorite" value="true"/>
                        </c:if>
                        <c:if test="${sessionScope.province != null}">
                            <input type="hidden" name="province" value="${sessionScope.province.provinceID}"/>
                        </c:if>
                        <c:if test="${sessionScope.district != null}">
                            <input type="hidden" name="district" value="${sessionScope.district.districtID}"/>
                        </c:if>

                        <!--SEARCH BY KEYWORD INPUT-->
                        <input id="search-hostel" type="search" name="keyword" value="${requestScope.keyword}"  placeholder="Tìm theo tên nhà trọ..." aria-label="Search"
                               class="form-control relative block w-1/2 px-3 h-[40px] text-base font-normal text-gray-700 bg-white border border-gray-300 border-r-0 rounded-tl-md rounded-bl-md transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-[#17535B] focus:outline-none">

                        <!--SEARCH BY KEYWORD SUBMIT BTN-->
                        <button id="search-btn" class="btn px-6 bg-[#17535B] text-white font-medium text-xs leading-tight rounded-tr-md rounded-br-md hover:bg-[#13484F] hover:text-white focus:outline-none transition ease-in-out flex items-center"
                                type="submit">
                            <i class="bi bi-search"></i>
                        </button>
                    </form>
                    <div class="flex items-center justify-end z-[5]">
                        <c:if test="${requestScope.itemQuantity != 0}">
                            <div class="filter-item p-0 m-0 mr-[20px]">
                                <div class="rating-btn h-[40px] w-[180px] px-[15px] bg-[#FFF] text-[#17535B] text-lg font-semibold rounded cursor-pointer relative flex justify-between items-center group border border-[#17535B]">
                                    <c:if test="${param.sortByRate eq 'asc'}">
                                        <p class="w-full text-center">
                                            Đánh giá <i class="ml-[12px] bi bi-chevron-double-up"></i>
                                        </p>

                                    </c:if>
                                    <c:if test="${param.sortByRate eq 'desc'}">
                                        <p class="w-full text-center">
                                            Đánh giá <i class="ml-[12px] bi bi-chevron-double-down"></i>
                                        </p>
                                    </c:if>
                                    <c:if test="${param.sortByRate == null}">
                                        <p>Đánh giá</p>
                                        <p>
                                            <i class="bi bi-chevron-down"></i>
                                        </p>
                                    </c:if>

                                    <ul class="rating-sort-list hidden group-hover:block shadow-lg absolute top-[39px] left-0 w-full rounded bg-[#fff] text-[#17535B] overflow-hidden">
                                        <form action="/sakura/hostel/list" method="get">
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
                                            <c:if test="${param.sortByRate != null}">
                                                <li class="sort-criteria-item">
                                                    <button type="submit" class="h-[50px] w-full text-center text-[14px] font-bold hover:text-[#288D87] border-b border-gray-200">Mặc định</button>
                                                </li>
                                            </c:if>
                                            <c:if test="${param.sortByRate != 'asc'}">
                                                <li class="sort-criteria-item">
                                                    <button type="submit" value="asc" name="sortByRate" class="h-[50px] w-full text-center text-[14px] font-bold hover:text-[#288D87] border-b border-gray-200">Tăng dần</button>
                                                </li>
                                            </c:if>
                                            <c:if test="${param.sortByRate != 'desc'}">
                                                <li class="sort-criteria-item">
                                                    <button type="submit" value="desc" name="sortByRate" class="h-[50px] w-full text-center text-[14px] font-bold hover:text-[#288D87]">Giảm dần</button>
                                                </li>
                                            </c:if>
                                        </form>
                                    </ul>
                                </div>
                            </div>
                            <div class="filter-item p-0 m-0 mr-[20px]">
                                <div class="rating-btn h-[40px] w-[180px] px-[15px] bg-[#FFF] text-[#17535B] text-lg font-semibold rounded cursor-pointer relative flex justify-between items-center group border border-[#17535B]">
                                    <c:if test="${param.sortByMinPrice == null && sortByMaxPrice == null}">
                                        <p class="">Giá tiền</p>
                                        <p class="">
                                            <i class="bi bi-chevron-down"></i>
                                        </p>
                                    </c:if>
                                    <c:if test="${param.sortByMinPrice eq 'asc'}">
                                        <p class="w-full text-center">
                                            Giá đầu <i class="ml-[12px] bi bi-chevron-double-up"></i>
                                        </p>
                                    </c:if>
                                    <c:if test="${param.sortByMinPrice eq 'desc'}">
                                        <p class="w-full text-center">
                                            Giá đầu <i class="ml-[12px] bi bi-chevron-double-down"></i>
                                        </p>
                                    </c:if>
                                    <c:if test="${param.sortByMaxPrice eq 'asc'}">
                                        <p class="w-full text-center">
                                            Giá cuối <i class="ml-[12px] bi bi-chevron-double-up"></i>
                                        </p>
                                    </c:if>
                                    <c:if test="${param.sortByMaxPrice eq 'desc'}">
                                        <p class="w-full text-center">
                                            Giá cuối <i class="ml-[12px] bi bi-chevron-double-down"></i>
                                        </p>
                                    </c:if>

                                    <ul class="rating-sort-list hidden group-hover:block absolute top-[40px] left-0 w-full rounded-bl-md rounded-br-md bg-[#FAFAFA] text-[#17535B] overflow-hidden">
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
                                            <c:if test="${param.sortByMinPrice != null || param.sortByMaxPrice != null}"> 
                                                <li class="sort-criteria-item">
                                                    <button type="submit" class="h-[50px] w-full text-center text-[14px] font-bold hover:text-[#288D87] border-b border-gray-200">Mặc định</button>
                                                </li>
                                            </c:if>
                                            <c:if test="${param.sortByMinPrice != 'asc'}">
                                                <li class="sort-criteria-item">
                                                    <button type="submit" value="asc" name="sortByMinPrice" class="h-[50px] w-full text-center text-[14px] font-bold hover:text-[#288D87] border-b border-gray-200">Tăng dần theo giá đầu</button>
                                                </li>
                                            </c:if>
                                            <c:if test="${param.sortByMinPrice != 'desc'}">
                                                <li class="sort-criteria-item">
                                                    <button type="submit" value="desc" name="sortByMinPrice" class="h-[50px] w-full text-center text-[14px] font-bold hover:text-[#288D87] border-b border-gray-200">Giảm dần theo giá đầu</button>
                                                </li>
                                            </c:if>
                                            <c:if test="${param.sortByMaxPrice != 'asc'}">
                                                <li class="sort-criteria-item">
                                                    <button type="submit" value="asc" name="sortByMaxPrice" class="h-[50px] w-full text-center text-[14px] font-bold hover:text-[#288D87] border-b border-gray-200">Tăng dần theo giá cuối</button>
                                                </li>
                                            </c:if>
                                            <c:if test="${param.sortByMaxPrice != 'desc'}">
                                                <li class="sort-criteria-item">
                                                    <button type="submit" value="desc" name="sortByMaxPrice" class="h-[50px] w-full text-center text-[14px] font-bold hover:text-[#288D87]">Giảm dần theo giá cuối</button>
                                                </li>
                                            </c:if>
                                        </form>
                                    </ul>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.currentUser != null}">
                            <div class="filter-item p-0 m-0">
                                <form action="/sakura/hostel/list" method="post" class="submit-filter ">
                                    <c:if test="${requestScope.keyword != null}">
                                        <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
                                    </c:if>
                                    <c:if test="${requestScope.favorite == null}">
                                        <button type="submit" name="favorite" value="true" class="h-[40px] w-[180px] bg-[#288D87] hover:bg-[#1D837D] text-[#E6EEF1] text-lg font-semibold rounded cursor-pointer relative flex justify-center items-center">Nhà trọ đã lưu</button>
                                    </c:if>
                                    <c:if test="${requestScope.favorite != null}">
                                        <button type="submit" name="favorite" value="false" class="h-[40px] w-[180px] bg-[#288D87] hover:bg-[#1D837D] text-[#E6EEF1] text-lg font-semibold rounded cursor-pointer relative flex justify-center items-center">Tất cả nhà trọ</button>
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

                <c:if test="${requestScope.hostelList.size() != 0}">
                    <div class="hostel-list container">
                        <div class="hostel-list-header flex justify-between items-center my-[20px]">
                            <h4 class="result-number text-[#282C3B] text-[17px] font-md">Tìm thấy ${requestScope.hostelList.size() } nhà trọ</h4>
                            <input type='hidden' id='current_page' />
                            <input type='hidden' id='show_per_page' />
                            <div class="flex items-center justify-end">
                                <div id="page_navigation_id" class="hidden font-bold text-slate-800 text-[15px] mr-[20px]"></div>
                                <div id="page_navigation" class="flex space-x-[10px]"></div>
                            </div>
                        </div>
                        <ul class="hostel-list grid grid-cols-4 gap-[30px]" id="paging_box" >
                            <c:set var="i" value="-1" />
                            <c:forEach var="hostel" items="${requestScope.hostelList}">
                                <c:set var="i" value="${i + 1}" />
                                <li class="">
                                    <form action="/sakura/hostel/detail" method="post">
                                        <input type="hidden" name="filterStar" value="0" />
                                        <button name="hostelId" value="${hostel.hostelID}" class="hostel-item outline outline-1 outline-slate-200 hover:outline-[#288D87] duration-200 relative block rounded overflow-hidden ">
                                            <c:if test="${hostel.imgList.size() > 0}">
                                                <div id="carouselExampleIndicators-${i}" class="carousel slide" data-interval="false">
                                                    <ol class="carousel-indicators">
                                                        <c:forEach begin="0" end="${hostel.imgList.size() - 1}" var="iterator">
                                                            <c:if test="${iterator == 0}">
                                                                <li data-target="#carouselExampleIndicators-${i}" data-slide-to="0" class="active"></li>
                                                                </c:if>
                                                                <c:if test="${iterator > 0}">
                                                                <li data-target="#carouselExampleIndicators-${i}" data-slide-to="${iterator}"></li>
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
                                                        <a class="carousel-control-prev" href="#carouselExampleIndicators-${i}" role="button" data-slide="prev">
                                                            <span><i class="bi bi-caret-left-fill"></i></span>
                                                            <span class="sr-only">Previous</span>
                                                        </a>
                                                        <a class="carousel-control-next" href="#carouselExampleIndicators-${i}" role="button" data-slide="next">
                                                            <span><i class="bi bi-caret-right-fill"></i></span>
                                                            <span class="sr-only">Next</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${hostel.imgList.size() == 0}">
                                                <img class="empty-img d-block w-100 h-[200px] object-cover" src="../assets/images/hostel-list-images/empty_img.jpg" />
                                            </c:if>

                                            <div class="hostel-content text-left py-[10px] px-[15px]">
                                                <div class="hostel-name flex items-center justify-between text-[18px]">
                                                    <p class="font-bold text-slate-800">${hostel.hostelName}</p>
                                                    <p class="hostel-rating-number text-[16px] font-bold text-slate-600">${hostel.rating} <i class="bi bi-star-fill text-amber-500"></i></p>
                                                </div>
                                                <div class="hostel-info my-[10px] text-[14px] font-semibold text-gray-500">
                                                    <div class="hostel-avail-room mb-[8px]">
                                                        <i class="bi bi-archive w-[25px] mr-[8px]"></i>${hostel.availableRoom} phòng trống
                                                    </div>
                                                    <div class="hostel-info mb-[8px]">
                                                        <i class="bi bi-slash-square w-[25px] mr-[8px]"></i>${hostel.minArea} - ${hostel.maxArea}m<sup>2</sup>
                                                    </div>
                                                    <div class="hostel-address mb-[8px] h-[60px]">
                                                        <i class="bi bi-geo w-[25px] mr-[8px]"></i>${hostel.streetAddress}, ${hostel.district.districtName}, ${hostel.district.province.provinceName}
                                                    </div>
                                                </div>
                                                <div class="flex items-center justify-between border-t border-dashed border-gray-200 pt-[10px]">
                                                    <div class="hostel-action text-[13px]">
                                                        <c:if test="${sessionScope.currentUser != null}">
                                                            <c:choose>
                                                                <c:when test="${requestScope.toggleList.get(i) == true}">
                                                                    <div class="hostel-favorite ">
                                                                        <i id="toggle-fav-hostel" class="bi bi-bookmark-fill active text-[#fff] not-italic bg-[#288D87] hover:bg-[#1D837D] block flex justify-center items-center w-[80px] py-[3px] rounded" onclick="toggleFavoriteHostel(${hostel.hostelID}, this)">Bỏ lưu</i> 
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div id="toggle-fav-hostel" class="hostel-favorite">
                                                                        <i id="toggle-fav-hostel" class="bi bi-bookmark-fill text-[#fff] not-italic bg-slate-200 hover:bg-[#B8C3D1] block flex justify-center items-center w-[80px] py-[3px] rounded" onclick="toggleFavoriteHostel(${hostel.hostelID}, this)">Lưu</i>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </div>
                                                    <div class="hostel-price text-[18px] font-bold text-[#288D87]">${hostel.minPrice / 1000000} - ${hostel.maxPrice / 1000000} triệu</div>
                                                </div>
                                            </div>
                                        </button>
                                    </form>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${requestScope.hostelList.size() == 0}">
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
        <script src="../assets/javascript/hostel-list.js"></script>
        <script src="../assets/javascript/toggle-favorite.js"></script>
        <script src="../assets/javascript/keep-district.js"></script>
        <script src="../assets/javascript/custom-select.js"></script>
        <script src="../assets/javascript//bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>
                                                                            //Pagination JS
                                                                            var show_per_page = 8;
                                                                            var number_of_items = jQuery('#paging_box').children().length; //getting the amount of elements inside pagingBox div
                                                                            var number_of_pages = Math.ceil(number_of_items / show_per_page); //calculate the number of pages we are going to have

                                                                            if (number_of_items > show_per_page) {
                                                                                jQuery(document).ready(function () {

                                                                                    jQuery('#current_page').val(0);
                                                                                    jQuery('#show_per_page').val(show_per_page);

                                                                                    var navigation_html = '<a class="previous_link " href="javascript:previous();"><i class="bi bi-chevron-left"></i></a>';
                                                                                    var current_link = 0;
                                                                                    while (number_of_pages > current_link) {
                                                                                        navigation_html += '<a class="page_link" href="javascript:go_to_page(' + current_link + ')" longdesc="' + current_link + '">' + (current_link + 1) + '</a>';
                                                                                        current_link++;
                                                                                    }
                                                                                    navigation_html += '<a class="next_link" href="javascript:next();"><i class="bi bi-chevron-right"></i></a>';


                                                                                    jQuery('#page_navigation').html(navigation_html);


                                                                                    //add active_page class to the first page link
                                                                                    jQuery('#page_navigation .page_link:first').addClass('active_page');
                                                                                    var navigation_html_id = '<p class="next_link">Trang ' + 1 + ' / ' + number_of_pages + '</p>';
                                                                                    jQuery('#page_navigation_id').html(navigation_html_id);

                                                                                    //hide all the elements inside pagingBox div
                                                                                    jQuery('#paging_box').children().css('display', 'none');

                                                                                    //and show the first n (show_per_page) elements
                                                                                    jQuery('#paging_box').children().slice(0, show_per_page).css('display', 'block');




                                                                                });

                                                                                //Pagination JS
                                                                                function previous() {
                                                                                    new_page = parseInt(jQuery('#current_page').val()) - 1;
                                                                                    //if there is an item before the current active link run the function
                                                                                    if (jQuery('.active_page').prev('.page_link').length == true) {
                                                                                        go_to_page(new_page);
                                                                                    }
                                                                                }

                                                                                function next() {
                                                                                    new_page = parseInt(jQuery('#current_page').val()) + 1;
                                                                                    //if there is an item after the current active link run the function
                                                                                    if (jQuery('.active_page').next('.page_link').length == true) {
                                                                                        go_to_page(new_page);
                                                                                    }
                                                                                }

                                                                                function go_to_page(page_num) {
                                                                                    var navigation_html_id = '<p class="next_link">Trang ' + (page_num + 1) + ' / ' + number_of_pages + '</p>';
                                                                                    jQuery('#page_navigation_id').html(navigation_html_id);

                                                                                    //get the number of items shown per page
                                                                                    var show_per_page = parseInt(jQuery('#show_per_page').val());

                                                                                    //get the element number where to start the slice from
                                                                                    start_from = page_num * show_per_page;

                                                                                    //get the element number where to end the slice
                                                                                    end_on = start_from + show_per_page;

                                                                                    //hide all children elements of pagingBox div, get specific items and show them
                                                                                    jQuery('#paging_box').children().css('display', 'none').slice(start_from, end_on).css('display', 'block');

                                                                                    /*get the page link that has longdesc attribute of the current page and add active_page class to it
                                                                                     and remove that class from previously active page link*/
                                                                                    jQuery('.page_link[longdesc=' + page_num + ']').addClass('active_page').siblings('.active_page').removeClass('active_page');

                                                                                    //update the current page input field
                                                                                    jQuery('#current_page').val(page_num);
                                                                                }
                                                                            }
        </script>
    </body>
</html>