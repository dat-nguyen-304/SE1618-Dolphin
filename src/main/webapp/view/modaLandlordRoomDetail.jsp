<%-- 
    Document   : modaRoomDetail
    Created on : Jul 8, 2022, 10:40:54 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<!--Modal select hostel-->
<div id="hostelModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 w-full md:inset-0 h-modal md:h-full justify-center items-center z-[1000]">
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
                    <form action="/sakura/landlord/room-detail" method="post" class="inline-block">
                        <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-[10px] py-[5px] mr-[10px] rounded bg-gray-200 text-gray-800 hover:bg-[#17535B] hover:text-[#fff] duration-150">${hostel.hostelName}</button>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!--End modal select hostel-->

<!--Modal select room-->
<div id="roomModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
        <div class="relative bg-white rounded shadow">
            <div class="flex justify-between items-start p-4 rounded-t border-b">
                <h3 class="text-xl font-semibold text-gray-900">Chọn phòng (loại ${requestScope.currentRoom.roomType.roomTypeName})</h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="roomModal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>

            <div class="p-6 space-y-6">
                <c:forEach items="${requestScope.roomList}" var="room">
                    <form action="/sakura/landlord/room-detail" method="post" class="inline-block">
                        <button type="submit" name="roomId" value="${room.roomID}" class="px-[10px] py-[5px] mr-[10px] rounded bg-gray-200 text-gray-800 hover:bg-[#17535B] hover:text-[#fff] duration-150">${room.roomNumber}</button>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!--End modal select room-->

<!--Modal update room-->
<div class="updateRoommodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-5/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="updateRoommodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Chỉnh sửa loại phòng ${requestScope.currentRoom.roomNumber}</p>
                <div class="updateRoommodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-4">
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block text-[16px]" for="">Loại phòng</label>
                    <select name="updateRoomType" id="" class="w-[250px] text-[18px] p-[10px]">
                        <c:forEach items="${requestScope.roomTypeList}" var="roomtype">
                            <c:if test="${requestScope.currentRoom.roomType.roomTypeID == roomtype.roomTypeID}">
                                <option selected value="${roomtype.roomTypeID}">${roomtype.roomTypeName}</option>
                            </c:if>
                            <c:if test="${requestScope.currentRoom.roomType.roomTypeID != roomtype.roomTypeID}">
                                <option value="${roomtype.roomTypeID}">${roomtype.roomTypeName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-[20px]">
                    <input type="hidden" name="hostelId" value="${sessionScope.currentHostel.hostelID}"/>
                    <input type="hidden" name="roomId" value="${requestScope.currentRoom.roomID}"/>
                    <input type="hidden" name="roomNumber" value="${requestScope.currentRoom.roomNumber}"/>

                    <label class="w-[160px] inline-block text-[16px]" for="">Tên phòng</label>
                    <input type="text" name="updateRoomNumber" value="${requestScope.currentRoom.roomNumber}" onkeyup="checkValidRoom(this)" class="w-[250px] text-[18px] p-[10px]"/>
                    <span class="font-light italic text-[13px]">VD: 101, 102, 510 ...</span>
                    <p class="ml-[165px] mt-[10px] text-[13px] text-red-600 validRoomMessage"></p>
                </div>
            </div>

            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="updateRoommodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <button id="updateRoom-2" onclick="updateRoom()" class="updateRoom px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>
<!--End modal update room-->
<!--Modal confirm update room-->
<div class="updateRoommodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="updateRoommodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Thông báo</p>
                <div class="updateRoommodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px]">
                <p class="updateRoomMessage text-[16px] font-medium"></p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="updateRoommodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Đóng</button>
                <form action="/sakura/landlord/room-detail" method="post">
                    <input type="hidden" name="roomId" value="${requestScope.currentRoom.roomID}"/>
                    <button type="submit" class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<!--End modal confirm update room-->

<!--Modal delete room-->
<div class="deleteRoommodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-1/3 mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="deleteRoommodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Xóa phòng ${requestScope.currentRoom.roomNumber}</p>
                <div class="deleteRoommodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-4">
                <svg class="mx-auto mb-4 w-14 h-14 text-[#951504]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                <h3 class="my-5 text-lg font-normal text-gray-800">Tất cả dữ liệu về hợp đồng, hóa đơn liên quan đến phòng ${requestScope.currentRoom.roomNumber} sẽ bị xóa. </h3>
                <p class="mb-5 text-lg font-normal text-gray-800">Bạn có chắc chắn muốn xóa?</p>
            </div>

            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="deleteRoommodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <button id="deleteRoom-2" onclick="deleteRoom()" class="deleteRoom px-5 py-2 rounded bg-[#B51905] text-white hover:bg-[#951504] mr-2">Chắc chắn</button>
            </div>
        </div>
    </div>
</div>
<!--End modal delete room-->
<!--Modal confirm delete room-->
<div class="deleteRoommodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="deleteRoommodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm">(Esc)</span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Xác nhận</p>
                <div class="deleteRoommodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px]">
                <p class="deleteRoomContent"></p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="deleteRoommodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <form action="/sakura/landlord/room-detail" method="post">
                    <button type="submit" class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<!--End modal confirm delete room-->

<!--Modal add room resident-->
<div class="addMembermodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-5/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="addMembermodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm">(Esc)</span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-[25px] font-bold">Thêm người ở mới</p>
                <div class="addMembermodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-4">
                <div class="mb-[20px]">
                    <label class="w-[160px] text-[16px] inline-block" for="">Tên người ở</label>
                    <input type="text" name="memberName" required class="w-[300px] text-[18px] p-[10px]">
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] text-[16px] inline-block" for="">Số điện thoại</label>
                    <input type="text" name="memberPhone" required class="w-[300px] text-[18px] p-[10px]" />
                    <p class="ml-[165px] text-[13px] italic font-light">Số điện thoại gồm 10 chữ số</p>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] text-[16px] inline-block" for="">Ngày sinh</label>
                    <input type="date" name="memberDob" required class="w-[300px] text-[18px] p-[10px]">
                </div>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="addMembermodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <button id="addMember-2" onclick="addMember()" class="addMemberBtn px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu</button>
            </div>
        </div>
    </div>
</div>
<!--End modal add room resident-->
<!--Modal confirm add room resident-->
<div class="addMembermodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="addMembermodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Xác nhận</p>
                <div class="addMembermodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px]">
                <p class="addMemberMessage"></p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button type="button" class="addMembermodal2-close px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">OK
                </button>
            </div>
        </div>
    </div>
</div>
<!--End modal confirm add room resident-->