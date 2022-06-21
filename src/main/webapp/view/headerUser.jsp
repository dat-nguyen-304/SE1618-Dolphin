<%-- 
    Document   : headerUser
    Created on : Jun 9, 2022, 8:24:15 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>
<nav class="header">
    <a class="logo" href="/sakura/home">
        <img id="logo-header" src="/sakura/assets/icons/logo.png" alt="">
        <h3 id="name-header">Sakura</h3>
    </a>
    <!-- left header section -->
    <div class="item-list">
        <a class="item  ${empty requestScope['javax.servlet.forward.servlet_path'] ? 'select' : ''}" href="/sakura">Trang chủ</a>
        <a class="item  ${requestScope['javax.servlet.forward.servlet_path'] == '/hostel' ? 'select' : ''}" href="/sakura/hostel/list">Thuê phòng</a>
    </div>
    <!-- right header section -->
    <div class="profile">

        <div class="profile-avatar">    
            <img id="profile-btn" src="${empty sessionScope.currentUser.account.avatar ? "/sakura/assets/images/user-avatars/no_ava.jpg" : sessionScope.currentUser.account.avatar}" alt="/sakura/assets/images/user-avatars/no_ava.jpg">
        </div>
        <div class="profile-menu">
            <h3>${sessionScope.currentUser.fullname}<br><span>${sessionScope.currentUser.account.username}</span></h3>
            <ul>
                <form action = "/sakura/access/login" method = "post">
                    <a href="/sakura/account/profile">
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