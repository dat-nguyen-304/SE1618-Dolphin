<%-- 
    Document   : modalLandlordRoomList
    Created on : Jul 7, 2022, 5:31:01 PM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<!--Modal add room-->
<div id="addRoom" tabindex="-1" aria-hidden="true"
     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 w-full md:h-full justify-center items-center z-[100000]">
    <div class="relative p-4 w-fit h-full md:h-auto">
        <div class="relative bg-white rounded-lg shadow">
            <div class="flex justify-between items-start p-4 rounded-t border-b">
                <h3 class="text-xl font-semibold text-gray-900">Thêm Phòng mới</h3>

                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center"
                        data-modal-toggle="addRoom">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>

            <div class="p-[20px]">
                <form action="/sakura/landlord/room-type">
                    <input type="hidden" name="hostelId" value="${sessionScope.currentHostel.hostelID}" />
                    <div class="mb-[20px]">
                        <label class="w-[160px] inline-block text-[18px]" for="">Loại phòng</label>
                        <select name="roomTypeId" class="w-[250px] p-[10px] text-[18px]">
                            <c:forEach items="${requestScope.roomTypeList}" var="roomtype">
                                <option class="p-1" value="${roomtype.roomTypeID}">${roomtype.roomTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-[20px]">
                        <label class="w-[160px] inline-block text-[18px]" for="">Tên phòng</label>
                        <input type="hidden" name="roomTypeId" value="${requestScope.currentRoomType.roomTypeID}"/>
                        <input type="text" name="addRoomNumber" class="w-[250px] text-[18px] p-[10px]" onkeyup="checkValidRoom(this)"/>
                        <span class="ml-2 text-[16px]">VD: A101, A102, A510 ...</span>
                    </div>
                    <span class="ml-[160px] text-xs validRoomMessage"></span>
                    <div class="grid justify-items-end">
                        <button type="submit" class="addRoom rounded bg-[#17535B] hover:bg-[#13484F] text-[#fff] text-[16px] p-[10px]">Thêm phòng</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!--End modal add room-->

<!--Modal select hostel-->
<div id="hostelModal" tabindex="-1" aria-hidden="true"
     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 w-full md:inset-0 h-modal md:h-full justify-center items-center z-[1000]">
    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
        <div class="relative bg-white rounded-lg shadow">
            <div class="flex justify-between items-start p-4 rounded-t border-b">
                <h3 class="text-xl font-semibold text-gray-900">Chọn nhà trọ</h3>
                <button type="button"
                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center"
                        data-modal-toggle="hostelModal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <div class="p-6 space-y-6">
                <c:forEach items="${sessionScope.hostelList}" var="hostel">
                    <form action="/sakura/landlord/contract-list" class="inline-block">
                        <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-4 py-2 mx-2 rounded border hover:bg-[#F2F5F6]">${hostel.hostelName}</button>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!--End modal select hostel-->