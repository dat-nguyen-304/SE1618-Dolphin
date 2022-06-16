<%-- 
    Document   : headerUserSearchAddress
    Created on : Jun 15, 2022, 8:19:38 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="header">
    <!--LEFT-->
    <div class="header-left">
        <a class="logo" href="#">
            <img id="logo-header" src="/sakura/assets/icons/logo.png" alt="">
            <h3 id="name-header">Sakura</h3>
        </a>

        <div class="home-filter">
            <form action="/sakura/hostel/list" class="filter">
                <select id="province" name="province" class="filter-address" onchange="renderDistrict(this)">

                    <option value="0">Tỉnh</option>
                    <c:forEach items="${requestScope.provinceList}" var="province">
                        <c:if test="${province.provinceID == requestScope.province.provinceID}">
                            <option selected value="${province.provinceID}">${province.provinceName}</option>
                        </c:if>
                        <c:if test="${province.provinceID != requestScope.province.provinceID}">
                            <option value="${province.provinceID}">${province.provinceName}</option>
                        </c:if>
                    </c:forEach>


                </select>
                <select id="district" name="district" class="filter-address">
                    <option value='0'>Quận huyện</option>
                    <c:if test="${requestScope.district != null && requestScope.district.districtID != 0}">
                        <input type="hidden" class="districtSelected-hidden" value="${requestScope.district.districtID}" />
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
        <!--RIGHT-->
        <div class="item-list">
            <a class="item" href="/sakura">Trang chủ</a>
            <a class="item ${requestScope['javax.servlet.forward.servlet_path'] == '/hostel' ? 'select' : ''}" href="#">Thuê phòng</a>
        </div>
        <div class="profile">
            <div class="profile-avatar">    
                <img id="profile-btn" src="${sessionScope.currentUser.account.avatar}" alt="">
            </div>
            <div class="profile-menu">
                <h3>${sessionScope.currentUser.fullname}<br><span>${sessionScope.currentUser.account.username}</span></h3>
                <ul>
                    <form action = "/sakura/access/login" method = "post">
                        <a href="/sakura/account/userProfile">
                            <li><span><i class="bi bi-person-fill"></i>Trang cá nhân</span></li>
                        </a>
                        <a href="/sakura/account/changePassword">
                            <li><span><i class="bi bi-file-earmark-lock2-fill"></i>Đổi mật khẩu</span></li>
                        </a>
                        <a href="#">
                            <li><span><i class="bi bi-house-fill"></i>Phòng thuê</span></li>
                        </a>
                        <button type ="submit" name ="logout" value="true">
                            <li><span><i class="bi bi-box-arrow-right"></i>Đăng xuất</span></li>
                        </button>
                    </form>
                </ul>
            </div>
        </div>
    </div>
</nav>
<script>
    const toggleMenu = document.querySelector(".profile-menu");

    document.addEventListener('click', function (event) {
        if (event.target.id != 'profile-btn') {
            toggleMenu.classList.remove("active");
        } else {
            toggleMenu.classList.toggle("active");
        }
    });
</script>

<script>
    function renderDistrict(element) {
        var provinceID = element.value;
        jQuery.ajax({
            type: 'POST',
            data: {'provinceID': provinceID
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


