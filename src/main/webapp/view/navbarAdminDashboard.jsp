<c:set var="requestPath" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<aside class="w-[256px] top-[60px] h-[calc(100vh-60px)] fixed border-r border-[#e6e9e9]" aria-label="Sidebar">
    <div class="navigation-bar overflow-y-auto h-full py-4 px-3 bg-[#ffffff]">
        <ul class="space-y-2">
            <li class="">
                <a href="/sakura/admin/dashboard"
                   class="${requestPath == '/sakura/admin/dashboard' ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                    <svg xmlns="http://www.w3.org/2000/svg"
                         class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                         viewBox="0 0 20 20" fill="currentColor">
                        <path
                            d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
                    </svg>
                    <span class="ml-3">Tổng quan</span>
                </a>
            </li>
            <li>
                <a href="/sakura/admin/tenant-management"
                   class="${requestPath == '/sakura/admin/tenant-management' ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Người thuê</span>
                </a>
            </li>
            <li>
                <a href="/sakura/admin/landlord-management"
                   class="${requestPath == '/sakura/admin/landlord-management' ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                    <svg xmlns="http://www.w3.org/2000/svg"
                         class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                         viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd"
                              d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                              clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Chủ nhà</span>
                </a>
            </li>
            <li>
                <a href="/sakura/admin/hostel-management"
                   class="${requestPath == '/sakura/admin/hostel-management' ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Nhà trọ</span>
                </a>
            </li>
        </ul>
    </div>
</aside>
