<%-- 
    Document   : headerGuestSearchAddress
    Created on : Jun 15, 2022, 11:01:55 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<nav class="header">
    <div class="header-left">
        <a class="logo" href="/sakura/">
            <img id="logo-header" src="../assets/icons/logo.png" alt="">
            <h3 id="name-header">Sakura</h3>
        </a>
        <div class="home-filter">
            <form action="/sakura/hostel/list" method="post" class="filter">
                <select id="province" name="province" class="filter-address" onchange="renderDistrict(this)">
                    <option value="0">Thành phố</option>
                    <c:forEach items="${sessionScope.provinceList}" var="province">
                        <c:if test="${province.provinceID == sessionScope.province.provinceID}">
                            <option selected value="${province.provinceID}">${province.provinceName}</option>
                        </c:if>
                        <c:if test="${province.provinceID != sessionScope.province.provinceID}">
                            <option value="${province.provinceID}">${province.provinceName}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <select id="district" name="district" class="filter-address">
                    <option value='0'>Quận huyện</option>
                    <c:if test="${sessionScope.district != null && sessionScope.district.districtID != 0}">
                        <input type="hidden" class="districtSelected-hidden" value="${sessionScope.district.districtID}" />
                    </c:if>
                </select>
                <div class="filter-submit">
                    <button class="btn btn-search" type="submit">
                        Lọc
                    </button>
                </div>
            </form>
        </div>
    </div> 
    <div class="header-right">
        <div class="item-list">
            <a class="item ${empty requestScope['javax.servlet.forward.servlet_path'] ? 'select' : ''}" href="/sakura">Trang chủ</a>
            <a class="item ${requestScope['javax.servlet.forward.servlet_path'] == '/hostel' ? 'select' : ''}"  href="#">Thuê phòng</a>
            <a class="item" href="#">Đăng tin nhà trọ</a>
        </div>
        <div class="access">
            <a href="/sakura/access/login">Đăng nhập</a>
            <a href="/sakura/access/register">Đăng ký</a>
        </div>
    </div>

</nav>
<script src="../assets/javascript/render-district.js"></script>