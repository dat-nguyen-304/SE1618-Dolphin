<aside class="w-[256px] top-[60px] h-[calc(100vh-60px)] fixed border-r border-[#e6e9e9]" aria-label="Sidebar">
    <div class="navigation-bar overflow-y-auto h-full py-4 px-3 bg-[#03353C]">
        <ul class="space-y-2">
            <li class="">
                <a href="/sakura/tenant/dashboard"
                   class="${(pageContext.request.requestURI == '/sakura/view/tenantPage.jsp') ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-slate-300 rounded hover:bg-[#17535B] hover:text-slate-100 group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-slate-300 transition duration-75 group-hover:text-slate-100" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
                    </svg>
                    <span class="ml-3">Tổng quan</span>
                </a>
            </li>
            <li class="menu-item">
                <button type="button" class="${(pageContext.request.requestURI == '/sakura/view/tenantPageInvoiceList.jsp' || pageContext.request.requestURI == '/sakura/view/tenantPageInvoiceDetail.jsp') ? 'parent-active' : ''} flex items-center p-2 w-full text-base font-normal text-slate-300 rounded transition duration-75 group hover:bg-[#17535B] hover:text-slate-100" aria-controls="dropdown-invoice" data-collapse-toggle="dropdown-invoice">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-slate-300 transition duration-75 group-hover:text-slate-100" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                        <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item="">Hoá đơn</span>
                    <svg sidebar-toggle-item="" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
                <ul id="dropdown-invoice" class="${(pageContext.request.requestURI == '/sakura/view/tenantPageInvoiceList.jsp' || pageContext.request.requestURI == '/sakura/view/tenantPageInvoiceDetail.jsp') ? '' : 'hidden'} py-2 space-y-2">
                    <li>
                        <a href="/sakura/invoice/list" class="${(pageContext.request.requestURI == '/sakura/view/tenantPageInvoiceList.jsp') ? 'active' : ''} menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-slate-300 rounded transition duration-75 hover:bg-[#17535B] hover:text-slate-100">Danh sách hoá đơn</a>
                    </li>
                    <li>
                        <a href="/sakura/invoice/detail" class="${(pageContext.request.requestURI == '/sakura/view/tenantPageInvoiceDetail.jsp') ? 'active' : ''} menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-slate-300 rounded transition duration-75 hover:bg-[#17535B] hover:text-slate-100"
                           id="list-item">Chi tiết hoá đơn</a>
                    </li>
                </ul>
            </li>
            <li class="menu-item">
                <a href="/sakura/tenant/contract-detail" class="menu-item flex items-center p-2 text-base font-normal text-slate-300 rounded hover:bg-[#17535B] hover:text-slate-100 group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-slate-300 transition duration-75 group-hover:text-slate-100" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M2 5a2 2 0 012-2h8a2 2 0 012 2v10a2 2 0 002 2H4a2 2 0 01-2-2V5zm3 1h6v4H5V6zm6 6H5v2h6v-2z" clip-rule="evenodd" />
                        <path d="M15 7h1a2 2 0 012 2v5.5a1.5 1.5 0 01-3 0V7z" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Hợp đồng</span>
                </a>
            </li>
            <li>
                <a href="/sakura/tenant/notifications" class="menu-item flex items-center p-2 text-base font-normal text-slate-300 rounded hover:bg-[#17535B] hover:text-slate-100 group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-slate-300 transition duration-75 group-hover:text-slate-100" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Thông báo</span>
                </a>
            </li>
            <li>
                <a href="/sakura/tenant/rentalRequestList"
                   class="${(pageContext.request.requestURI == '/sakura/view/tenantRentalRequestPage.jsp') ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-slate-300 rounded hover:bg-[#17535B] hover:text-slate-100 group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-slate-300 transition duration-75 group-hover:text-slate-100" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Yêu cầu thuê phòng</span>
                </a>
            </li>
        </ul>
    </div>
</aside>