<%--
    Document   : hostelDetail
    Created on : Jun 11, 2022, 6:32:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sakura - Nhà trọ ${requestScope.hostel.hostelName}</title>

        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../webjars/lightgallery/2.2.1/css/lightgallery-bundle.min.css">
        <link rel="stylesheet" href="../assets/css/hostel-detail.css">
        <c:if test="${sessionScope.currentUser != null}">
            <link rel="stylesheet" href="../assets/css/header-user-search-address.css">
        </c:if>
        <c:if test="${sessionScope.currentUser == null}">
            <link rel="stylesheet" href="../assets/css/header-guest-search-address.css">
        </c:if>
    </head>

    <body>
        <header id="header-section" class="stick z-[10]">
            <c:if test="${sessionScope.currentUser != null}">
                <%@include file="../view/headerUserSearchAddress.jsp" %>
            </c:if>
            <c:if test="${sessionScope.currentUser == null}">
                <%@include file="../view/headerGuestSearchAddress.jsp" %>
            </c:if>
        </header>
        <div class="w-[70%] mx-auto mt-[100px] mb-[50px]">
            <!--HEADING-->
            <div class="hostel-header mb-[20px]">
                <div class="flex items-center mb-[20px]">
                    <a class="font-bold text-[23px] duration-150 hover:text-[#FF6532] cursor-pointer" onclick="history.back()"><i class="bi bi-arrow-left"></i></a>
                    <h3 class="hostel-name ml-[20px] text-[23px] font-extrabold text-slate-600">Nhà trọ ${requestScope.hostel.hostelName}</h3>
                </div>
                <div class="flex items-center justify-between">
                    <div class="hostel-address font-semibold text-slate-700 text-[15px]">
                        <i class="bi bi-geo-fill text-[#288D87] text-[18px] mr-[10px]"></i> ${requestScope.hostel.streetAddress}, ${hostel.district.districtName}, ${hostel.district.province.provinceName}
                    </div>
                    <c:if test="${sessionScope.currentUser != null}">
                        <div class="cursor-pointer">
                            <c:if test="${requestScope.isFavorite == true}">
                                <button id="toggle-fav-hostel" class="active" onclick="toggleFavoriteHostel(${requestScope.hostel.hostelID}, this)">
                                    <i class="bi bi-bookmark-fill"></i> Bỏ lưu
                                </button>
                            </c:if>
                            <c:if test="${requestScope.isFavorite == false}">
                                <button id="toggle-fav-hostel" class="" onclick="toggleFavoriteHostel(${requestScope.hostel.hostelID}, this)">
                                    <i class="bi bi-bookmark-fill"></i> Lưu
                                </button>
                            </c:if>
                        </div>
                    </c:if>
                </div>
            </div>
            <!--END HEADING-->

            <!--HOSTEL IMAGES-->
            <div class="w-full grid grid-cols-4 grid-rows-2 h-[550px] gap-[20px]" id="animated-thumbnails-gallery">
                <c:if test="${requestScope.hostel.imgList.size() == 0}" >
                    <img class="overflow-hidden relative col-span-8 h-full rounded" src="../assets/images/hostel-list-images/empty_img.jpg" alt="alt"/>
                </c:if>
                <c:if test="${requestScope.hostel.imgList.size() > 0}">
                    <c:forEach begin="0" end="${requestScope.hostel.imgList.size() - 1}" var="iterator">
                        <c:if test="${iterator == 0}">
                            <a class="duration-200 col-span-2 row-span-2 ease-in-out active" data-src="${hostel.imgList.get(iterator)}" >
                                <img class="w-full h-full object-cover" src="${hostel.imgList.get(iterator)}">
                            </a>
                        </c:if>
                        <c:if test="${iterator > 0 && iterator < 4}">
                            <a class="duration-200 ease-in-out" data-src="${hostel.imgList.get(iterator)}" >
                                <img class="w-full h-full object-cover" src="${hostel.imgList.get(iterator)}">
                            </a>
                        </c:if>
                        <c:if test="${iterator == 4}">
                            <a class="duration-200 ease-in-out relative" data-src="${hostel.imgList.get(iterator)}" >
                                <c:if test="${requestScope.hostel.imgList.size() > 5}">
                                    <p class="w-full h-full absolute top-0 left-0 flex items-center justify-center z-10">
                                        <span class="text-[#fff] font-bold text-[28px]">+${requestScope.hostel.imgList.size() - iterator - 1}</span>
                                    </p>
                                    <p class="w-full h-full bg-[#000] opacity-[0.35] absolute"></p>
                                </c:if>
                                <img class="w-full h-full object-cover" src="${hostel.imgList.get(iterator)}">
                            </a>
                        </c:if>
                        <c:if test="${iterator > 4}">
                            <a class="duration-200 ease-in-out relative hidden" data-src="${hostel.imgList.get(iterator)}" >
                                <p class="w-full h-full absolute top-0 left-0 flex items-center justify-center z-10">
                                    <span class="text-[#fff] font-bold text-[28px]">+${requestScope.hostel.imgList.size() - iterator - 1}</span>
                                </p>
                                <p class="w-full h-full bg-[#000] opacity-[0.35] absolute"></p>
                                <img class="w-full h-full object-cover" src="${hostel.imgList.get(iterator)}">
                            </a>
                        </c:if>
                    </c:forEach>
                </c:if>
            </div>
            <!--END HOSTEL IMAGES-->

            <!--HOSTEL INFO-->
            <div class="w-full grid grid-cols-12 gap-[20px] mt-[40px]">
                <!--LEFT CONTENTS-->
                <div class="col-span-9" >
                    <!--DESC-->
                    <div class="hostel-desc">
                        ${requestScope.hostel.description}
                    </div>
                    <!--END DESC-->

                    <!--SERVICE-->
                    <div class="hostel-service mt-[20px] border-t border-slate-100 py-[20px]">
                        <h3 class="section-title font-bold text-[18px] text-slate-800 mb-[20px] uppercase">
                            Dịch vụ
                        </h3>
                        <div class="grid grid-cols-2 gap-y-[20px]">
                            <div class="flex ">
                                <div class="bg-[#17535B] rounded-full h-6 w-6 flex justify-center items-center">
                                    <i class="bi bi-lightning-charge-fill text-[#E6F4F0]"></i>
                                </div>
                                <div class="ml-[10px]">
                                    <h4 class="text-[#17535B] font-bold text-[18px]">Điện</h4>
                                    <p class="text-gray-500 font-semibold text-[15px]">3.500VNĐ/kWh</p>
                                </div>
                            </div>
                            <div class="flex ">
                                <div class="bg-[#17535B] rounded-full h-6 w-6 flex justify-center items-center">
                                    <i class="bi bi-droplet text-[#E6F4F0]"></i>
                                </div>
                                <div class="ml-[10px]">
                                    <h4 class="text-[#17535B] font-bold text-[18px]">Nước</h4>
                                    <p class="text-gray-500 font-semibold text-[15px]">3.500VNĐ/m<sup>3</sup></p>
                                </div>
                            </div>
                            <div class="flex ">
                                <div class="bg-[#17535B] rounded-full h-6 w-6 flex justify-center items-center">
                                    <i class="bi bi-check-lg text-[#E6F4F0]"></i>
                                </div>
                                <div class="ml-[10px]">
                                    <h4 class="text-[#17535B] font-bold text-[18px]">Giữ xe</h4>
                                    <p class="text-gray-500 font-semibold text-[15px]">50.000VNĐ/cái</p>
                                </div>
                            </div>
                            <div class="flex ">
                                <div class="bg-[#17535B] rounded-full h-6 w-6 flex justify-center items-center">
                                    <i class="bi bi-check-lg text-[#E6F4F0]"></i>
                                </div>
                                <div class="ml-[10px]">
                                    <h4 class="text-[#17535B] font-bold text-[18px]">Internet</h4>
                                    <p class="text-gray-500 font-semibold text-[15px]">90.000VNĐ/tháng</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--END SERVICE-->

                    <!--REVIEW-->
                    <div class="mt-[20px] border-t border-slate-100 py-[20px]">
                        <h3 class="section-title font-bold text-[18px] text-slate-800 mb-[20px] uppercase">
                            Đánh giá
                        </h3>
                        <c:if test="${requestScope.feedbackList == null}">
                            <h3 class="no-rating">Chưa có đánh giá nào</h3>
                        </c:if>
                        <c:if test="${requestScope.feedbackList != null}">
                            <div class="feedback-header flex justify-between items-center text-[20px] p-[20px] bg-slate-50">
                                <div class="feedback-average text-amber-500 font-medium flex items-center">
                                    <h3 class="feedback-average-title mr-[10px]">${requestScope.hostel.rating} / 5 <i class="bi bi-star-fill ml-[5px]"></i></h3>
                                    <p class="ml-[10px] text-slate-800 italic">
                                        (${requestScope.feedbackQuantity} lượt đánh giá)
                                    </p>
                                </div>
                                <ul class="feedback-header-list flex text-[15px]">
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
                            <input type='hidden' id='current_page' />
                            <input type='hidden' id='show_per_page' />
                            <div class="flex items-center justify-end">
                                <div id='page_navigation_id' class="font-bold text-slate-800 text-[15px] mr-[20px]"></div>
                                <div id='page_navigation' class=""></div>
                            </div>
                            <ul id="paging_box" class="feedback-list" >
                                <c:forEach var="feedback" items="${requestScope.feedbackList}">
                                    <li class="feedback-item my-[20px] bg-[#FDFEFF] border-b border-slate-200 pb-[20px] ">
                                        <div class="tenant-item-header">
                                            <div class="flex items-center space-x-4">
                                                <img class="w-10 h-10 rounded-full" src="${feedback.tenant.account.avatar == null ? '../assets/images/user-avatars/no_ava.jpg' : feedback.tenant.account.avatar}" alt="">
                                                <div class="w-full flex justify-between items-start">
                                                    <div class="">
                                                        <div>${feedback.tenant.fullname}</div>
                                                        <div class="tenant-rating text-[13px] text-amber-500">
                                                            <c:forEach begin="1" end="5" var="iterator">
                                                                <c:choose>
                                                                    <c:when test="${iterator <= feedback.rating}">
                                                                        <i class="bi bi-star-fill"></i>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <i class="bi bi-star-fill text-slate-200"></i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <p>  
                                                        <time class="block text-sm text-gray-500">${feedback.date}</time>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tenant-item-content mt-[5px] text-slate-800 font-normal">
                                            ${feedback.content}
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>

                        </c:if>
                    </div>

                    <!--YOUR REVIEW-->
                    <div class="">
                        <h3 class="section-title font-bold text-[18px] text-slate-800 mb-[20px] uppercase">
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
                                            <div class="send-feedback-star cursor-pointer"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                            <div class="send-feedback-star cursor-pointer"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                            <div class="send-feedback-star cursor-pointer"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                            <div class="send-feedback-star cursor-pointer"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                            <div class="send-feedback-star cursor-pointer"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                        </div>
                                        <textarea id="editor" class="text-area w-full" placeholder="Viết đánh giá ở đây..." name="feedbackContent" rows="4"></textarea>
                                        <button type="submit" name="message" value="Cảm ơn đánh giá của bạn" class="send-feedback-btn bg-[#17535B] px-[10px] py-[5px] text-[#fff] hover:bg-[#13484B]">Gửi đánh giá</button>
                                    </div>
                                </c:if>
                                <c:if test="${requestScope.feedback != null}">
                                    <div class="send-feedback">
                                        <input type="hidden" name="oldRating" value="${requestScope.feedback.rating}" />
                                        <input type="hidden" name="rating" value="${requestScope.feedback.rating}" />
                                        <div class="send-feedback-star-list flex mb-[10px]">
                                            <div class="send-feedback-star cursor-pointer"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                            <div class="send-feedback-star cursor-pointer"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                            <div class="send-feedback-star cursor-pointer"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                            <div class="send-feedback-star cursor-pointer"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                            <div class="send-feedback-star cursor-pointer"><i class="bi bi-star-fill" style="color: #ccc;"></i></div>
                                        </div>
                                        <textarea id="editor" class="text-area w-full " disabled placeholder="Viết đánh giá ở đây..."
                                                  name="updateContent" rows="4" cols="100">${requestScope.feedback.content}</textarea>
                                        <div class="my-[20px]">
                                            <button type="submit" class="send-feedback-btn bg-[#17535B] px-[10px] py-[5px] text-[#fff] hover:bg-[#13484B]">Gửi đánh giá</button>
                                            <button class="update-feedback-btn bg-[#17535B] text-[#fff] px-[10px] py-[5px] hover:bg-[#13484B]">Chỉnh sửa đánh giá</button>
                                        </div>
                                    </div>
                                </c:if>
                            </form>
                        </c:if>
                        <c:if test="${sessionScope.currentUser == null}">
                            <h3>Bạn phải đăng nhập để đánh giá nhà trọ này</h3>
                        </c:if>
                    </div>
                    <!--END YOUR REVIEW-->
                </div>

                <div class="col-span-3">
                    <div class="border border-slate-200 rounded-lg p-[20px] sticky top-[110px]">
                        <div class="grid grid-cols-2 gap-y-[20px]">
                            <div>
                                <h3 class="text-[13px] text-slate-400">Đánh giá</h3>
                                <p class="hostel-rating text-slate-900 text-[17.5px] font-bold">
                                    ${requestScope.hostel.rating} / 5 <i class="bi bi-star-fill ml-[5px] text-amber-500 "></i>
                                </p>
                            </div>
                            <div>
                                <h3 class="text-[13px] text-slate-400">Giá thuê theo tháng</h3>
                                <p class="hostel-rating text-slate-900 text-[17.5px] font-bold">
                                    ${requestScope.hostel.minPrice / 1000000} - ${requestScope.hostel.maxPrice / 1000000} triệu
                                </p>
                            </div>
                            <div>
                                <h3 class="text-[13px] text-slate-400">Tổng số phòng</h3>
                                <p class="hostel-rating text-slate-900 text-[17.5px] font-bold">
                                    ${requestScope.hostel.totalRoom}
                                </p>
                            </div>
                            <div class="">
                                <h3 class="text-[13px] text-slate-400">Phòng trống</h3>
                                <p class="hostel-rating text-slate-900 text-[17.5px] font-bold">
                                    ${requestScope.hostel.availableRoom}
                                </p>
                            </div>
                        </div>

                        <div class="landlord-info">
                            <div class="my-[20px]">
                                <h3 class="text-[13px] text-slate-400">Chủ nhà</h3>
                                <p class="hostel-rating text-slate-900 text-[17.5px] font-bold">
                                    ${requestScope.hostel.landlord.fullname}
                                </p>
                            </div>
                            <a target="_self" href="tel:${requestScope.hostel.landlord.phone}" class="landlord-phone mb-[20px] py-[10px] w-full rounded text-slate-400 flex items-center justify-center border border-slate-300 duration-150 hover:text-[#17535B] hover:border-[#17535B]">
                                <i class="bi bi-telephone-fill mr-[5px]"></i> <span>${requestScope.hostel.landlord.phone}</span> 
                            </a>
                            <a target="_self" href="mailto:${requestScope.hostel.landlord.phone}" class="landlord-mail mb-[20px] py-[10px] w-full rounded text-slate-400 flex items-center justify-center border border-slate-300 duration-150 hover:text-[#17535B] hover:border-[#17535B]">
                                <i class="bi bi-envelope-fill mr-[5px]"></i> <span>${requestScope.hostel.landlord.account.email}</span> 
                            </a>
                        </div>

                        <div class="room-cta text-[18px] w-full">
                            <button id="view-room-type" type = "submit" name = "action" class="btn-view-all-room w-full h-[50px] rounded text-white bg-[#17535B] hover:bg-[#13484F]">Xem phòng</button>
                        </div>


                    </div>
                </div>
            </div>
            <!--END HOSTEL INFO-->
        </div>
        <%@include file="../view/modalRoomTypeList.jsp" %>
        <%@include file="footer.jsp" %>

        <script src="../assets/javascript/hostel-detail.js"></script>
        <script src="../assets/javascript/keep-district.js"></script>
        <script src="../assets/javascript/custom-select.js"></script>
        <script src="../assets/javascript/ckeditor.js"></script>
        <script src="../webjars/lightgallery/2.2.1/lightgallery.umd.js"></script>
        <script src="../webjars/lightgallery/2.2.1/plugins/zoom/lg-zoom.umd.js"></script>
        <script src="../webjars/lightgallery/2.2.1/plugins/thumbnail/lg-thumbnail.umd.js"></script>

        <script>
                                    window.lightGallery(
                                            document.getElementById("animated-thumbnails-gallery"),
                                            {
                                                autoplayFirstVideo: false,
                                                pager: false,
                                                plugins: [lgZoom, lgThumbnail]
                                            }
                                    );

        </script>

        <script>
            //Pagination JS
            var show_per_page = 5;
            var number_of_items = jQuery('#paging_box').children().length; //getting the amount of elements inside pagingBox div
            var number_of_pages = Math.ceil(number_of_items / show_per_page); //calculate the number of pages we are going to have

            if (number_of_items > show_per_page) {
                jQuery(document).ready(function () {

                    jQuery('#current_page').val(0);
                    jQuery('#show_per_page').val(show_per_page);

                    var navigation_html = '<a class="previous_link " href="javascript:previous();"><i class="bi bi-chevron-left"></i></a>';
                    var current_link = 0;
                    while (number_of_pages > current_link) {
                        navigation_html += '<a class="page_link hidden" href="javascript:go_to_page(' + current_link + ')" longdesc="' + current_link + '">' + (current_link + 1) + '</a>';
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

        <script>
            ClassicEditor
                    .create(document.querySelector('#editor'), {
                        toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList'],
                        heading: {
                            options: [
                                {model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph'},
                                {model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1'},
                                {model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2'},
                                {model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3'}
                            ]
                        }
                    })
                    .catch(error => {
                        console.log(error);
                    });
        </script>
        <script>
            function toggleFavoriteHostel(hostelID, element) {
                jQuery.ajax({
                    type: 'POST',
                    data: {'hostelID': hostelID},
                    url: '/sakura/hostel/toggleFavHostel',
                    success: function (result) {
                        element.classList.toggle("active");
                        if (element.classList.contains("active")) {
                            element.innerHTML = "<i class='bi bi-bookmark-fill'></i> Bỏ lưu";
                        } else {
                            element.innerHTML = "<i class='bi bi-bookmark-fill'></i> Lưu";
                        }
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }
        </script>
        <script>
            // MODAL 
            var open_modal_1 = document.querySelector('#view-room-type');
            open_modal_1.addEventListener('click', function (event) {
                event.preventDefault();
                toggleModal('#room-type-modal');
            });
            var close_modal_1 = document.querySelectorAll('.modal-close');
            for (let i = 0; i < close_modal_1.length; ++i) {
                close_modal_1[i].addEventListener('click', () => {
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
