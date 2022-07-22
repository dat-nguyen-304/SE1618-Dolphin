<%-- 
    Document   : headerUserSearchAddress
    Created on : Jun 15, 2022, 8:19:38 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="header">
    <!--LEFT-->
    <div class="header-left">
        <a class="logo" href="/sakura/home">
            <img id="logo-header" src="/sakura/assets/icons/logo.png" alt="">
            <h3 id="name-header">Sakura</h3>
        </a>

        <div class="home-filter">
            <form action="/sakura/hostel/list" class="filter" method="post">
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
        <!--RIGHT-->
        <div class="item-list">
            <a class="item" href="/sakura">Trang chủ</a>
            <a class="item ${requestScope['javax.servlet.forward.servlet_path'] == '/hostel' ? 'select' : ''}" href="#">Thuê phòng</a>
        </div>
        <div class="profile">
            <div class="profile-avatar">    
                <img id="profile-btn" src="${empty sessionScope.currentUser.account.avatar ? "../assets/images/user-avatars/no_ava.jpg" : sessionScope.currentUser.account.avatar}" alt="">
            </div>
            <div class="profile-menu">
                <h3>${sessionScope.currentUser.fullname}<br><span>${sessionScope.currentUser.account.username}</span></h3>
                <p class="text-[#929CA5] font-normal text-[15px] w-full text-center mb-[10px]">${sessionScope.currentUser.account.role == 1 ? 'Người thuê' : (sessionScope.currentUser.account.role == 2 ?  'Chủ nhà' : 'Admin')}</p>
                <ul>
                    <form action = "/sakura/access/login" method = "post">
                        <a href="/sakura/account/profile">
                            <li><span><i class="bi bi-person-fill"></i>Trang cá nhân</span></li>
                        </a>
                        <a href="/sakura/account/changePassword">
                            <li><span><i class="bi bi-file-earmark-lock2-fill"></i>Đổi mật khẩu</span></li>
                        </a>
                        <a href="/sakura/tenant/dashboard">
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
        if (event.target.id !== 'profile-btn') {
            toggleMenu.classList.remove("active");
        } else {
            toggleMenu.classList.toggle("active");
        }
    });
</script>
<script src="../assets/javascript/render-district.js"></script>


