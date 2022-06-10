<%-- 
    Document   : headerUser
    Created on : Jun 9, 2022, 8:24:15 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>
<nav class="header">
    <a class="logo" href="#">
        <img id="logo-header" src="/sakura/assets/icons/logo.png" alt="">
        <h3 id="name-header">Sakura</h3>
    </a>
    <!-- left header section -->
    <div class="item-list">
        <a class="item select" href="/sakura">Trang chủ</a>
        <a class="item" href="#">Thuê phòng</a>
    </div>
    <!-- right header section -->
    <div class="profile">
        <div class="profile-avatar" onclick="menuToggle()" >    
            <img src="/sakura/assets/images/user-avatar/ava3.jpg" alt="">
        </div>
        <div class="profile-menu">
            <h3>${sessionScope.currentUser.fullname}<br><span>${sessionScope.currentUser.account.username}</span></h3>
            <ul>
                <a href="#">
                    <li><span><i class="bi bi-person-fill"></i>Trang cá nhân</span></li>
                </a>
                <a href="MainController?action=changePassword.jsp">
                    <li><span><i class="bi bi-file-earmark-lock2-fill"></i>Đổi mật khẩu</span></li>
                </a>
                <a href="#">
                    <li><span><i class="bi bi-house-fill"></i>Phòng thuê</span></li>
                </a>
                <a href="MainController?action=Logout">
                    <li><span><i class="bi bi-box-arrow-right"></i>Đăng xuất</span></li>
                </a>
            </ul>
        </div>
    </div>
</nav>
<script>
    function menuToggle() {
        const toggleMenu = document.querySelector(".profile-menu");
        toggleMenu.classList.toggle("active");
    }
</script>