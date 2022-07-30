<%-- 
    Document   : modalLandlordInvoiceList
    Created on : Jul 7, 2022, 2:35:44 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>
<!--Modal select hostel-->
<div id="hostelModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center z-[1000]">
    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
        <div class="relative bg-white rounded shadow">
            <div class="flex justify-between items-start p-4 rounded-t border-b">
                <h3 class="text-xl font-semibold text-gray-900">Chọn Nhà Trọ</h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="hostelModal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <div class="p-6 space-y-6">
                <c:forEach var="hostel" items="${sessionScope.hostelList}">
                    <button class="mb-[20px] mr-[20px] inline-block text-white bg-[#17535B] hover:bg-[13484F] font-medium rounded text-sm px-5 py-2.5 text-center" data-modal-toggle="hostelModal" onclick="changeHostel(${hostel.hostelID}, '${hostel.hostelName}')">${hostel.hostelName} </button>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!--End modal select hostel-->


<!--Modal select room-->
<div id="roomModal" tabindex="-1" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full z-[1000]">
    <div class="relative p-4 w-full max-w-7xl h-full md:h-auto">
        <!-- Modal content -->
        <div class="relative bg-white rounded shadow">
            <!-- Modal header -->
            <div class="flex justify-between items-center p-5 rounded-t border-b">
                <h3 class="text-xl font-medium text-gray-900">Chọn phòng</h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="roomModal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </button>
            </div>
            <!-- Modal body -->
            <div class="p-6 space-y-6">
                <input class="block" type="text" placeholder="Tìm phòng" value="" id="search-room"/>
                <div id="allRoom">
                    <c:if test="${requestScope.roomList.size() != 0}">
                        <form action="/sakura/invoice/list" class="inline-block" method="post">
                            <input hidden id="hostelID" name="hostelID" value="${requestScope.chosenHostel.hostelID}">
                                <button type="submit" name="roomID" value="0" class="mb-[20px] mr-[20px] inline-block text-white bg-[#17535B] hover:bg-[13484F] font-medium rounded text-sm px-5 py-2.5 text-center">Tất cả</button>
                        </form>
                    </c:if>
                </div>
                <div id="roomList">
                    <c:forEach items="${requestScope.roomList}" var="room">
                        <form action="/sakura/invoice/list" class="inline-block" method="post">
                            <button type="submit" name="roomID" value="${room.roomID}" class="mb-[20px] mr-[20px] inline-block text-white bg-[#17535B] hover:bg-[13484F] font-medium rounded text-sm px-5 py-2.5 text-center room">
                                ${room.roomNumber}
                            </button>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End modal select room-->