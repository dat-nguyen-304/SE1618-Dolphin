<c:set var="requestPath" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<aside class="w-[256px] top-[60px] h-[calc(100vh-60px)] fixed border-r border-[#e6e9e9]" aria-label="Sidebar">
    <div class="navigation-bar overflow-y-auto h-full py-4 px-3 bg-[#ffffff]">
        <ul class="space-y-2">
            <li class="">
                <a href="/sakura/landlord/overview"
                   class="${(pageContext.request.requestURI == '/sakura/view/LOverView.jsp') ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                    <svg xmlns="http://www.w3.org/2000/svg"
                         class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                         viewBox="0 0 20 20" fill="currentColor">
                        <path
                            d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
                    </svg>
                    <span class="ml-3">Tổng quan</span>
                </a>
            </li>
            <li class="menu-item">
                <button type="button"
                        class="${(pageContext.request.requestURI == '/sakura/view/LRoomType.jsp' || pageContext.request.requestURI == '/sakura/view/LRoomList.jsp') ? 'parent-active' : ''} flex items-center p-2 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 group hover:bg-[#F3F3F3] hover:text-[#17535B]"
                        aria-controls="dropdown-room-list" data-collapse-toggle="dropdown-room-list">
                    <svg xmlns="http://www.w3.org/2000/svg"
                         class="w-6 h-5 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                         viewBox="0 0 20 20" fill="currentColor">
                        <path
                            d="M18.991 2H9.01C7.899 2 7 2.899 7 4.01v5.637l-4.702 4.642A1 1 0 0 0 3 16v5a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V4.009C21 2.899 20.102 2 18.991 2zm-8.069 13.111V20H5v-5.568l2.987-2.949 2.935 3.003v.625zM13 9h-2V7h2v2zm4 8h-2v-2h2v2zm0-4h-2v-2h2v2zm0-4h-2V7h2v2z">
                        </path>
                        <path d="M7 15h2v2H7z"></path>
                    </svg>
                    <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item="">Phòng trọ</span>
                    <svg sidebar-toggle-item="" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                              clip-rule="evenodd"></path>
                    </svg>
                </button>
                <ul id="dropdown-room-list" class="${(pageContext.request.requestURI == '/sakura/view/LRoomType.jsp' || pageContext.request.requestURI == '/sakura/view/LRoomList.jsp') ? '' : 'hidden'} py-2 space-y-2">
                    <li>
                        <a href="/sakura/landlord/room-type"
                           class="menu-item ${pageContext.request.requestURI == '/sakura/view/LRoomType.jsp' ? 'active' : ''} flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Loại phòng</a>
                    </li>
                    <li>
                        <a href="/sakura/landlord/room-list"
                           class="menu-item ${pageContext.request.requestURI == '/sakura/view/LRoomList.jsp' ? 'active' : ''} flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Danh sách phòng</a>
                    </li>
                </ul>
            </li>
            <!--            <li class="menu-item">
                            <a href="#"
                               class="menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                                     viewBox="0 0 20 20" fill="currentColor">
                                    <path
                                        d="M8.433 7.418c.155-.103.346-.196.567-.267v1.698a2.305 2.305 0 01-.567-.267C8.07 8.34 8 8.114 8 8c0-.114.07-.34.433-.582zM11 12.849v-1.698c.22.071.412.164.567.267.364.243.433.468.433.582 0 .114-.07.34-.433.582a2.305 2.305 0 01-.567.267z" />
                                    <path fill-rule="evenodd"
                                          d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-13a1 1 0 10-2 0v.092a4.535 4.535 0 00-1.676.662C6.602 6.234 6 7.009 6 8c0 .99.602 1.765 1.324 2.246.48.32 1.054.545 1.676.662v1.941c-.391-.127-.68-.317-.843-.504a1 1 0 10-1.51 1.31c.562.649 1.413 1.076 2.353 1.253V15a1 1 0 102 0v-.092a4.535 4.535 0 001.676-.662C13.398 13.766 14 12.991 14 12c0-.99-.602-1.765-1.324-2.246A4.535 4.535 0 0011 9.092V7.151c.391.127.68.317.843.504a1 1 0 101.511-1.31c-.563-.649-1.413-1.076-2.354-1.253V5z"
                                          clip-rule="evenodd" />
                                </svg>
                                <span class="flex-1 ml-3 whitespace-nowrap">Doanh thu</span>
                                 <span
                                    class="inline-flex justify-center items-center px-2 ml-3 text-sm font-medium text-gray-800 bg-gray-200 rounded-full bg-gray-700 text-gray-300">Pro</span> 
                            </a>
                        </li>-->
            <li>
                <a href="/sakura/landlord/contract-list"
                   class="${(requestPath == '/sakura/landlord/contract-list' || requestPath == '/sakura/landlord/contract-detail') ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Hợp đồng</span>
                    <!-- <span
                        class="inline-flex justify-center items-center px-2 ml-3 text-sm font-medium text-gray-800 bg-gray-200 rounded-full bg-gray-700 text-gray-300">Pro</span> -->
                </a>
            </li>
            <!--            <li class="menu-item">
                            <button type="button"
                                    class="${(pageContext.request.requestURI == '/sakura/view/LContractList.jsp' || pageContext.request.requestURI == '/sakura/view/addContract.jsp') ? 'parent-active' : ''} flex items-center justify-between p-2 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 group hover:bg-[#F3F3F3] hover:text-[#17535B]"
                                    aria-controls="dropdown-example" data-collapse-toggle="dropdown-contract">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="w-6 h-5 text-[#929CA5] transition duration-75 group-hover:text-[#17535B] m-0 p-0"
                                     viewBox="0 0 20 20" fill="currentColor">
                                    <path d="M2 3h20v4H2zm17 5H3v11a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V8h-2zm-3 6H8v-2h8v2z"></path>
                                </svg>
                                <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item="">Hợp đồng</span>
                                <svg sidebar-toggle-item="" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </button>
                            <ul id="dropdown-contract" class="${(pageContext.request.requestURI == '/sakura/view/LContractList.jsp' || pageContext.request.requestURI == '/sakura/view/addContract.jsp') ? '' : 'hidden'}  py-2 space-y-2">
                                <li>
                                    <a href="/sakura/landlord/contract-list"
                                       class="${(pageContext.request.requestURI == '/sakura/view/LContractList.jsp') ? 'active' : ''} menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Danh
                                        sách hợp đồng</a>
                                </li>
                                <li>
                                    <a href="/sakura/contract/add-contract"
                                       class="${(pageContext.request.requestURI == '/sakura/view/addContract.jsp') ? 'active' : ''}  menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Thêm hợp đồng</a>
                                </li>
                            </ul>
                        </li>-->
            <li class="menu-item">
                <button type="button"
                        class="${(pageContext.request.requestURI == '/sakura/view/LInvoiceList.jsp' || pageContext.request.requestURI == '/sakura/view/LAddInvoice.jsp') ? 'parent-active' : ''} flex items-center p-2 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 group hover:bg-[#F3F3F3] hover:text-[#17535B]"
                        aria-controls="dropdown-example" data-collapse-toggle="dropdown-invoice">
                    <svg xmlns="http://www.w3.org/2000/svg"
                         class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                         viewBox="0 0 20 20" fill="currentColor">
                        <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
                        <path fill-rule="evenodd"
                              d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z"
                              clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item="">Hoá đơn</span>
                    <svg sidebar-toggle-item="" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                              clip-rule="evenodd"></path>
                    </svg>
                </button>
                <ul id="dropdown-invoice" class="${(pageContext.request.requestURI == '/sakura/view/LInvoiceList.jsp' || pageContext.request.requestURI == '/sakura/view/LAddInvoice.jsp') ? '' : 'hidden'}  py-2 space-y-2">
                    <li>
                        <a href="/sakura/invoice/list"
                           class="${(pageContext.request.requestURI == '/sakura/view/LInvoiceList.jsp') ? 'active' : ''} menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]">Danh
                            sách hoá đơn</a>
                    </li>
                    <li>
                        <a href="/sakura/invoice/new"
                           class="${(pageContext.request.requestURI == '/sakura/view/LAddInvoice.jsp') ? 'active' : ''} menu-item flex items-center p-2 pl-11 w-full text-base font-normal text-[#929CA5] rounded transition duration-75 hover:bg-[#F3F3F3] hover:text-[#17535B]"
                           id="list-item">Thêm hóa đơn</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="/sakura/landlord/notification"
                   class="menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                    <svg xmlns="http://www.w3.org/2000/svg"
                         class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                         viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd"
                              d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                              clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Thông báo</span>
                    <!-- <span
                        class="inline-flex justify-center items-center px-2 ml-3 text-sm font-medium text-gray-800 bg-gray-200 rounded-full bg-gray-700 text-gray-300">Pro</span> -->
                </a>
            </li>
            <li>
                <a href="/sakura/landlord/rentalRequestList"
                   class="${(pageContext.request.requestURI == '/sakura/view/landlordRentalRequestPage.jsp' || requestPath =='/sakura/contract/add-contract') ? 'active' : ''} menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Yêu cầu thuê phòng</span>
                    <!-- <span
                        class="inline-flex justify-center items-center px-2 ml-3 text-sm font-medium text-gray-800 bg-gray-200 rounded-full bg-gray-700 text-gray-300">Pro</span> -->
                </a>
            </li>
            <li>
                <a href="/sakura/landlord/service"
                   class="menu-item flex items-center p-2 text-base font-normal text-[#929CA5] rounded hover:bg-[#F3F3F3] hover:text-[#17535B] group">
                    <svg xmlns="http://www.w3.org/2000/svg"
                         class="w-6 h-6 text-[#929CA5] transition duration-75 group-hover:text-[#17535B]"
                         viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd"
                              d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                              clip-rule="evenodd" />
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap">Dịch vụ</span>
                    <!-- <span
                        class="inline-flex justify-center items-center px-2 ml-3 text-sm font-medium text-gray-800 bg-gray-200 rounded-full bg-gray-700 text-gray-300">Pro</span> -->
                </a>
            </li>
        </ul>
    </div>
</aside>
