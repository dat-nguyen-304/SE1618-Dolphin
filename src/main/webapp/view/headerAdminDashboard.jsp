<nav class="bg-[#ffffff] mr-[250px] w-[100vw] h-[60px] flex items-center fixed z-10 border-b border-[#e6e9e9]">
    <div class="absolute right-0 flex items-center mx-[55px]">

        <div class="relative">
            <button type="button" class="flex text-sm rounded-full" id="user-menu-button" aria-expanded="false"
                    data-dropdown-toggle="dropdown" data-dropdown-placement="bottom-start">
                <span class="sr-only">Open user menu</span>
                <img class="w-10 h-10 rounded-full object-cover"
                     src="${empty sessionScope.currentUser.avatar ? "/sakura/assets/images/user-avatars/no_ava.jpg" : sessionScope.currentUser.avatar}"
                     alt="user photo">
            </button>
            <!-- Dropdown menu -->
            <div id="dropdown"
                 class="dropdown-shadow z-10 hidden bg-white divide-y divide-gray-100 rounded shadow w-[250px]">
                <div class="px-4 py-3 text-sm text-gray-900">
                    <div>${sessionScope.currentUser.username} - Chủ nhà</div>
                    <div class="font-medium truncate">${sessionScope.currentUser.email}</div>
                </div>
                <ul class="py-1 text-sm text-gray-700" aria-labelledby="dropdownInformationButton">
                    <li>
                        <a href="/sakura" class="block px-4 py-2 hover:bg-gray-100">Trang chủ</a>
                    </li>
                    <li>
                        <a href="/sakura/account/profile" class="block px-4 py-2 hover:bg-gray-100">Trang cá nhân</a>
                    </li>
                    <li>
                        <a href="/sakura/account/changePassword" class="block px-4 py-2 hover:bg-gray-100">Đổi mật khẩu</a>
                    </li>
                </ul>
                <form action = "/sakura/access/login" method = "post" class="py-1">
                    <button type="submit" name ="logout" value="true" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 w-full text-left">
                        Đăng xuất
                    </button>
                </form>
            </div>
        </div>

        <button data-collapse-toggle="mobile-menu-2" type="button"
                class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 text-gray-400 hover:bg-gray-700 focus:ring-gray-600"
                aria-controls="mobile-menu-2" aria-expanded="false">
            <span class="sr-only">Open main menu</span>
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                      clip-rule="evenodd"></path>
            </svg>
            <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                      clip-rule="evenodd"></path>
            </svg>
        </button>

    </div>
</nav>
