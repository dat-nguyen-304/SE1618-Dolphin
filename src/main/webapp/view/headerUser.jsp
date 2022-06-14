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
</nav>
<script>
    const toggleMenu = document.querySelector(".profile-menu");
    
    document.addEventListener('click', function(event) {
        if (event.target.id != 'profile-btn') {
            toggleMenu.classList.remove("active");
        } else {
            toggleMenu.classList.toggle("active");
        }
    });
</script>