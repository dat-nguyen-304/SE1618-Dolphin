<%-- 
    Document   : roomDetail
    Created on : Jun 9, 2022, 3:55:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.roomType.hostel.hostelName} - Loại phòng ${requestScope.roomType.roomTypeName}</title>

        <%@include file="../view/assets.jsp" %>

        <!--CSS-->
        <link rel="stylesheet" href="../assets/css/room-type-detail.css">

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
        <div class="w-[70%] mx-auto my-[100px]">
            <!--HEADING-->
            <div class="room-type-header mb-[20px]">
                <div class="room-detail-title flex items-center mb-[20px]">
                    <a class="font-bold text-[23px] duration-150 hover:text-[#FF6532] cursor-pointer" onclick="history.back()"><i class="bi bi-arrow-left"></i></a>
                    <h3 class="hostel-name ml-[20px] text-[20px] font-extrabold text-slate-600">Phòng ${requestScope.roomType.roomTypeName} - Nhà trọ ${requestScope.roomType.hostel.hostelName}</h3>
                </div>
                <div class="w-full h-fit grid grid-cols-3 gap-[25px]">

                    <div class="col-span-2">
                        <!--HOSTEL IMAGES-->
                        <c:if test="${requestScope.roomType.imgList.size() > 0}">
                            <div id="carouselExampleIndicators" class="carousel slide" data-interval="false">
                                <ol class="carousel-indicators">
                                    <c:forEach begin="0" end="${requestScope.roomType.imgList.size() - 1}" var="iterator">
                                        <c:if test="${iterator == 0}">
                                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">
                                            </li>
                                        </c:if>
                                        <c:if test="${iterator > 0}">
                                            <li data-target="#carouselExampleIndicators" data-slide-to="${iterator}">
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ol>
                                <div class="hostel-images">
                                    <div class="carousel-inner">
                                        <c:forEach begin="0" end="${requestScope.roomType.imgList.size() - 1}" var="iterator">
                                            <c:if test="${iterator == 0}">
                                                <div class="carousel-item active">
                                                    <img class="d-block w-100" src="${requestScope.roomType.imgList.get(iterator)}">
                                                </div>
                                            </c:if>
                                            <c:if test="${iterator > 0}">
                                                <div class="carousel-item">
                                                    <img class="d-block w-100" src="${requestScope.roomType.imgList.get(iterator)}">
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="btn-prev-next">
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                        <span><i class="bi bi-caret-left-fill"></i></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                        <span><i class="bi bi-caret-right-fill"></i></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${requestScope.roomType.imgList.size() == 0}">
                            <img class="empty-img d-block w-100 h-[200px] object-cover" src="../assets/images/hostel-list-images/empty_img.jpg" />
                        </c:if>

                        <!--END HOSTEL IMAGES-->
                        <!--DESC-->
                        <div class="room-type-desc mt-[20px] border-t border-slate-100 py-[20px]">
                            <h3 class="section-title font-bold text-[18px] text-slate-800 mb-[20px] uppercase">
                                Mô tả
                            </h3>
                            <div class="grid grid-cols-2 gap-y-[20px]">
                                ${requestScope.roomType.description}
                            </div>
                        </div>
                        <!--END DESC-->
                    </div>
                    <div class="">
                        <div class="bg-[#fff] border border-slate-200 rounded-lg p-[20px] sticky top-[110px]">
                            <div class="grid grid-cols-2 gap-y-[20px] pb-[20px] mb-[20px] border-b border-slate-200">
                                <div>
                                    <h3 class="text-[13px] text-slate-400">Diện tích</h3>
                                    <p class="hostel-rating text-slate-900 text-[17.5px] font-bold">
                                        ${requestScope.roomType.area}m<sup>2</sup>
                                    </p>
                                </div>
                                <div>
                                    <h3 class="text-[13px] text-slate-400">Giá thuê</h3>
                                    <p class="hostel-rating text-slate-900 text-[17.5px] font-bold">
                                        ${requestScope.roomType.advertisedPrice / 1000000 } triệu / tháng
                                    </p>
                                </div>
                                <div>
                                    <h3 class="text-[13px] text-slate-400">Tổng số phòng</h3>
                                    <p class="hostel-rating text-slate-900 text-[17.5px] font-bold">
                                        ${requestScope.roomType.totalRoom}
                                    </p>
                                </div>
                                <div class="">
                                    <h3 class="text-[13px] text-slate-400">Phòng trống</h3>
                                    <p class="hostel-rating text-slate-900 text-[17.5px] font-bold">
                                        ${requestScope.roomType.availableRoom}
                                    </p>
                                </div>
                                <div class="">
                                    <h3 class="text-[13px] text-slate-400">Số thành viên tối đa</h3>
                                    <p class="hostel-rating text-slate-900 text-[17.5px] font-bold">
                                        ${requestScope.roomType.maxNumberOfResidents} người / phòng
                                    </p>
                                </div>
                            </div>
                            <div class="w-full h-fit">
                                <c:if test="${sessionScope.currentUser == null}">
                                    <h3 class="font-normal text-[18px] text-rose-500">Vui lòng đăng nhập để có thể thuê phòng!</h3>
                                    <form action="/sakura/access/login" method="post" class="mt-[20px] w-full m-0 p-0">
                                        <button type="submit" name="action" class="w-full text-white text-[18px] font-semibold bg-[#17535B] border-0 py-2 px-6 focus:outline-none hover:bg-[#13484F] rounded">Đăng nhập ngay</button>
                                    </form>
                                </c:if>
                                <c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.account.role == 2}">
                                    <h1 class="font-medium text-[18px] text-rose-600 mb-[20px]">Không thể thuê phòng với tài khoản chủ nhà!</h1>
                                    <div class="w-full text-white text-[20px] font-semibold bg-gray-300 border-0 py-2 px-6 text-center rounded cursor-not-allowed">Đặt thuê</div>
                                </c:if>
                                <c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.account.role == 1 && sessionScope.currentUser.rentStatus == true}">
                                    <h1 class="font-medium text-[18px] text-rose-600 mb-[20px]">Tài khoản của bạn đã thuê phòng thành công. Không thể thực hiện thuê phòng khác.</h1>
                                    <div class="w-full text-white text-[20px] font-semibold bg-gray-300 border-0 py-2 px-6 text-center rounded cursor-not-allowed">Đặt thuê</div>
                                </c:if>
                                <c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.account.role == 1 && sessionScope.currentUser.rentStatus == false}">
                                    <div class="form-head mb-[20px]">
                                        <h3 class="font-bold text-[20px] text-slate-800">Gửi yêu cầu thuê nhà</h3>
                                        <p class="font-normal text-[15px] text-gray-500">Bạn có thể điền các thông tin bổ sung dưới đây</p>
                                    </div>
                                    <form action="/sakura/hostel/sendRentalRequest" method="post" class="w-full" id = "rental-request-form">
                                        <div class="w-full mb-[20px]">
                                            <h3 class="text-[15px] font-normal text-slate-500 mb-[8px]">Ngày đến xem phòng (dự kiến)</h3>
                                            <input type="date" name="intentStartDate" class="w-full"/>
                                        </div>
                                        <div class="w-full mb-[20px]">
                                            <label for="note" class="text-[15px] font-normal text-slate-500 mb-[8px]">Ghi chú bổ sung</label>
                                            <textarea id="note" name="rentalNote" rows="4" class="w-full"></textarea>
                                        </div>
                                        <div class="">
                                            <input id = "roomTypeID" type="hidden" name="roomTypeID" value ="${requestScope.roomType.roomTypeID}">
                                            <p id = "rentingError"></p>
                                            <button onclick="pendingRentingCheck()" id="renting-submit-button" type="button" name="action" class="w-full text-white text-[20px] font-semibold bg-[#17535B] border-0 py-2 px-6 focus:outline-none hover:bg-[#13484F] rounded">Đặt thuê</button>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>   
        <script src="../assets/javascript/keep-district.js"></script>
        <script src="../assets/javascript/custom-select.js"></script>
        <script src="../assets/javascript//bootstrap/js/bootstrap.bundle.min.js"></script>
        
        <script>
            let renting = $("#rentingError");
            function pendingRentingCheck() {
                const roomTypeID = document.getElementById('roomTypeID').value;
                
                
                console.log("RoomTypeID: ", roomTypeID);
                
                jQuery.ajax({
                            type: 'POST',
                            async: false,
                            data: {'roomTypeID': roomTypeID,
                                
                            },
                            url: '/sakura/tenant/pending-booking-request',
                            success: function (response) {
                                //messageElement.innerHTML = response;
                                if(response === "1") {
                                    //showToast("success", "Phòng này đã có hợp đồng đang chờ!");
                                        $("#rentingError").html("Bạn đã gửi yêu cầu xem phòng này rồi!");
                                        $("#rentingError").css("color", "red");
                                }
                            },
                            error: function () {
                            },
                            complete: function (result) {
                            }
                        });
            }
            
            $("#renting-submit-button").click(function () {
                let check = true;
                if (renting.html() !== "")
                    check = false;
                
                console.log("Check: " + check);
                console.log("Check: " + $("#rentingError").html());
                if (!check)
                    console.log("LOI");
                else
                    $("#rental-request-form").submit();
            });
        </script>
    </body>
</html>