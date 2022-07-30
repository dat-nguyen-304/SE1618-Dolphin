<c:set var="requestPath" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<aside class="w-[256px] top-0 h-[100vh] fixed border-r border-[#e6e9e9] z-50" aria-label="Sidebar">
    <div class="navigation-bar overflow-y-auto h-full px-3 bg-[#03353C]">
        <a href="/sakura" class="h-[60px] flex items-center justify-center mb-[10px]">
            <img src="../assets/icons/logo_white.png" class="mr-3 h-6" alt="">
                <span class="self-center text-xl font-bold whitespace-nowrap text-[#fff]">Sakura</span>
        </a>
        <ul class="space-y-2">
            <li class="">
                <a href="/sakura/tenant/dashboard"
                   class="${(requestPath == '/sakura/tenant/dashboard') ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-slate-300 rounded hover:bg-[#17535B] hover:text-slate-100 group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-slate-300 transition duration-75 group-hover:text-slate-100" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
                    </svg>
                    <span class="ml-3">Tổng quan</span>
                </a>
            </li>
            <li class="">
                <a href="/sakura/invoice/list"
                   class="${(requestPath == '/sakura/invoice/list' || requestPath == '/sakura/invoice/detail' ) ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-slate-300 rounded hover:bg-[#17535B] hover:text-slate-100 group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-slate-300 transition duration-75 group-hover:text-slate-100" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                        <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd" />
                    </svg>
                    <span class="ml-3">Hoá đơn</span>
                </a>
            </li>
            <li class="menu-item">
                <a href="/sakura/tenant/contract-list" class="${(requestPath == '/sakura/tenant/contract-list' || requestPath == '/sakura/tenant/contract-detail' ) ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-slate-300 rounded hover:bg-[#17535B] hover:text-slate-100 group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-slate-300 transition duration-75 group-hover:text-slate-100" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M2 5a2 2 0 012-2h8a2 2 0 012 2v10a2 2 0 002 2H4a2 2 0 01-2-2V5zm3 1h6v4H5V6zm6 6H5v2h6v-2z" clip-rule="evenodd" />
                        <path d="M15 7h1a2 2 0 012 2v5.5a1.5 1.5 0 01-3 0V7z" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Hợp đồng</span>
                </a>
            </li>
            <li>
                <a href="/sakura/tenant/notifications"
                   class="${requestPath == '/sakura/tenant/notifications' ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-slate-300 rounded hover:bg-[#17535B] hover:text-slate-100 group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-slate-300 transition duration-75 group-hover:text-slate-100" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Thông báo</span>
                </a>
            </li>
            <li>
                <a href="/sakura/tenant/rental-request"
                   class="${requestPath == '/sakura/tenant/rental-request' ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-slate-300 rounded hover:bg-[#17535B] hover:text-slate-100 group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-slate-300 transition duration-75 group-hover:text-slate-100" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Yêu cầu thuê phòng</span>
                </a>
            </li>
        </ul>
    </div>
</aside>