<%-- 
    Document   : headerUser
    Created on : Jun 9, 2022, 8:24:15 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<nav class="header">
    <a class="logo" href="/sakura/home">
        <img id="logo-header" src="/sakura/assets/icons/logo.png" alt="">
        <h3 id="name-header">Sakura</h3>
    </a>
    <!-- left header section -->
    <div class="item-list">
        <a class="item  ${(empty requestScope['javax.servlet.forward.servlet_path'] || requestScope['javax.servlet.forward.servlet_path'] == '/home') ? 'select' : ''}" href="/sakura">Trang chủ</a>
        <a class="item  ${requestScope['javax.servlet.forward.servlet_path'] == '/hostel' ? 'select' : ''}" href="/sakura/hostel/list">Thuê phòng</a>
    </div>
    <!-- right header section -->
    <div class="profile">

        <div class="profile-avatar">    
            <img id="profile-btn" src="${empty sessionScope.currentUser.account.avatar ? "/sakura/assets/images/user-avatars/no_ava.jpg" : sessionScope.currentUser.account.avatar}" alt="/sakura/assets/images/user-avatars/no_ava.jpg">
        </div>
        <div class="profile-menu">
            <c:set var = "fullname" value = "${sessionScope.currentUser.fullname}"/>
            <c:set var="part" value="${fn:split(fullname, ' ')}" />
            <c:set var="sz" value="${fn:length(part)}" />
            <c:set var="firstName" value="${part[sz-1]}" />
            <h3>Xin chào, ${firstName}!<br><span>${sessionScope.currentUser.account.username}</span><br></h3>
            <p class="text-[#929CA5] font-normal text-[15px] w-full text-center mb-[10px]">${sessionScope.currentUser.account.role == 1 ? 'Người thuê' : (sessionScope.currentUser.account.role == 2 ?  'Chủ nhà' : 'Admin')}</p>
            <ul>
                <form action = "/sakura/access/login" method = "post">
                    <a href="/sakura/account/profile">
                        <li><span><i class="bi bi-person-fill"></i>Trang cá nhân</span></li>
                    </a>
                    <a href="/sakura/account/changePassword">
                        <li><span><i class="bi bi-file-earmark-lock2-fill"></i>Đổi mật khẩu</span></li>
                    </a>
                    <c:if test="${sessionScope.currentUser.account.role == 1}">
                        <a href="/sakura/tenant/dashboard">
                            <li><span><i class="bi bi-house-fill"></i>Phòng thuê</span></li>
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.currentUser.account.role == 2}">
                        <a href="/sakura/landlord/overview">
                            <li><span><i class="bi bi-house-fill"></i>Trang quản lí</span></li>
                        </a>
                    </c:if>
                    <button type ="submit" name ="logout" value="true">
                        <li><span><i class="bi bi-box-arrow-right"></i>Đăng xuất</span></li>
                    </button>
                </form>
            </ul>
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