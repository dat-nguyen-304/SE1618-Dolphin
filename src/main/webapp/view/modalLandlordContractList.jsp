<%-- 
    Document   : modalLandlordContractList
    Created on : Jul 9, 2022, 1:27:13 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<!--Modal select hostel-->
<div id="hostelModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center z-[1000]">
    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
        <div class="relative bg-white rounded shadow">
            <div class="flex justify-between items-start p-4 rounded-t border-b">
                <h3 class="text-xl font-semibold text-gray-900">Chọn nhà trọ</h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="hostelModal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>

            <div class="p-6 space-y-6">
                <c:forEach items="${sessionScope.hostelList}" var="hostel">
                    <form action="/sakura/landlord/contract-list" method="post" class="inline-block">
                        <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-4 py-2 mx-2 rounded border-2">${hostel.hostelName}</button>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>


</div>
<!--End modal select hostel-->

<!--Modal select room-->
<div id="roomModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center z-[1000]">
    <div class="relative p-4 w-full max-w-4xl h-full md:h-auto">
        <div class="relative bg-white rounded shadow">
            <div class="flex justify-between items-start p-4 rounded-t border-b">
                <h3 class="text-xl font-semibold text-gray-900">Chọn Phòng</h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="roomModal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>

            <div class="p-6 space-y-6">
                <div>
                    <label>Tìm Phòng</label> 
                    <input type="text" name="searchRoom"/>
                    <button class="ml-[20px] border-2 py-2 px-4" onclick="searchRoomOnModal()">Tìm kiếm</button>
                </div>
                <form action="/sakura/landlord/contract-list" method="post">
                    <button type="submit" name="roomId" value="0" class="px-4 py-2 mx-2 rounded border-2">Tất cả</button>
                </form>
                <div class="room-list-modal">
                    <c:forEach items="${requestScope.roomList}" var="room">
                        <form action="/sakura/landlord/contract-list" class="inline-block" method="post">
                            <input type="hidden" name="roomNumber" value="${room.roomNumber}"/>
                            <button type="submit" name="roomId" value="${room.roomID}" class="px-4 py-2 mx-2 rounded border-2">${room.roomNumber}</button>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End modal select room-->