<%-- 
    Document   : outstandingHostel
    Created on : Jul 22, 2022, 12:15:46 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<div class="section">
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
</div>