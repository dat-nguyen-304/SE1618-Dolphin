<nav class="bg-[#ffffff] w-full h-[60px] flex items-center fixed z-50 border-b border-[#e6e9e9]">
    <div class="w-full flex flex-wrap justify-between items-center mx-[55px]">
        <a href="/sakura" class="flex items-center">
            <img src="../assets/icons/logo.png" class="mr-3 h-6" alt="">
                <span class="self-center text-xl font-bold whitespace-nowrap text-[#17535B]">Sakura</span>
        </a>
        <div class="flex items-center">
            <div class="relative">
                <!-- Notification button -->
                <button type="button"
                        class="h-10 w-10 flex justify-center items-center rounded-full text-[#17535B] mr-[20px] hover:bg-[#E6EEF1] active:bg-[#E6EEF1] focus:bg-[#E6EEF1] transition relative"
                        id="user-noti-button" aria-expanded="false" data-dropdown-toggle="dropdown-noti"
                        data-dropdown-placement="bottom-start">
                    <span class="sr-only">Open notification</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                         stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                    </svg>
                    <!--<span class="absolute top-2 right-2 inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-red-100 transform translate-x-1/2 -translate-y-1/2 bg-red-600 rounded-full">99</span>-->
                </button>
                <!-- Notification list (dropdown) -->
                <div class="hidden dropdown-shadow w-[300px] right-[70px] absolute z-50 my-5 text-base list-none rounded divide-y bg-[#fff] divide-[#E0E2E4]"
                     id="dropdown-noti" data-popper-reference-hidden="" data-popper-escaped=""
                     data-popper-placement="top">
                    <div class="py-3 px-4 flex justify-between items-center">
                        <div class="text-[18px] font-semibold text-[#40576C]">Thông báo</div>
                        <a class="text-[13px] font-normal text-[#40576C] rounded-lg px-3 py-2 hover:bg-[#F3F8FA]"
                           href="#">Xem tất cả</a>
                    </div>
                    <ul class="py-1 divide-y divide-[#EEF0F1]" aria-labelledby="dropdown">
                        <li>
                            <div id="toast-notification"
                                 class="w-full max-w-xs p-4 text-gray-900 bg-white hover:bg-[#F6F8FA]" role="alert">
                                <div class="flex items-center">
                                    <div class="relative inline-block shrink-0">
                                        <img class="w-12 h-12 rounded-full" src="../assets/images/user-avatars/no_ava.jpg"
                                             alt="Jese Leos image" />
                                    </div>
                                    <div class="ml-3 text-sm font-normal">
                                        <h4 class="text-sm font-semibold text-gray-900 ">Bonnie Green
                                        </h4>
                                        <div class="text-sm font-normal">commmented on your photo</div>
                                        <span class="text-xs font-medium text-[#288D87]">a few
                                            seconds ago</span>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div id="toast-notification"
                                 class="w-full max-w-xs p-4 text-gray-900 bg-white hover:bg-[#F6F8FA]" role="alert">
                                <div class="flex items-center">
                                    <div class="relative inline-block shrink-0">
                                        <img class="w-12 h-12 rounded-full" src="../assets/images/user-avatars/no_ava.jpg"
                                             alt="Jese Leos image" />
                                    </div>
                                    <div class="ml-3 text-sm font-normal">
                                        <h4 class="text-sm font-semibold text-gray-900 ">Bonnie Green
                                        </h4>
                                        <div class="text-sm font-normal">commmented on your photo</div>
                                        <span class="text-xs font-medium text-[#288D87]">a few
                                            seconds ago</span>
                                    </div>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>

            <div class="relative">
                <button type="button" class="flex text-sm rounded-full" id="user-menu-button" aria-expanded="false"
                        data-dropdown-toggle="dropdown" data-dropdown-placement="bottom-start">
                    <span class="sr-only">Open user menu</span>
                    <img class="w-10 h-10 rounded-full object-cover"
                         src="${empty sessionScope.currentUser.account.avatar ? "/sakura/assets/images/user-avatars/no_ava.jpg" : sessionScope.currentUser.account.avatar}"
                         alt="user photo">
                </button>
                <!-- Dropdown menu -->
                <div id="dropdown"
                     class="dropdown-shadow z-10 hidden bg-white divide-y divide-gray-100 rounded shadow w-[250px]">
                    <div class="px-4 py-3 text-sm text-gray-900">
                        <div>${sessionScope.currentUser.fullname} - Khách thuê</div>
                        <div class="font-medium truncate">${sessionScope.currentUser.account.email}</div>
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
    </div>
</nav>

