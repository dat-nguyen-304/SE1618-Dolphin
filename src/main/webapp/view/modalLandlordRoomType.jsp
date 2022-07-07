<%-- 
    Document   : modalLandlordRoomType
    Created on : Jul 7, 2022, 3:09:33 PM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<!--Modal select hostel-->
<div id="hostelModal" tabindex="-1" aria-hidden="true"
     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
        <div class="relative bg-white rounded shadow">
            <div class="flex justify-between items-start p-4 rounded-t border-b">
                <h3 class="text-xl font-semibold text-gray-900">Chọn nhà trọ</h3>
                <button type="button"
                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded w-[250px] text-[18px] p-[10px].5 ml-auto inline-flex items-center"
                        data-modal-toggle="hostelModal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <div class="p-6 space-y-6">
                <c:forEach items="${sessionScope.hostelList}" var="hostel">
                    <form action="/sakura/landlord/overview" class="inline-block">
                        <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-4 py-2 mx-2 rounded border-2">${hostel.hostelName}</button>
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
                <h3 class="text-xl font-semibold text-gray-900">Chọn loại phòng</h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded w-[250px] text-[18px] p-[10px].5 ml-auto inline-flex items-center"
                        data-modal-toggle="roomModal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>

            <div class="p-6 space-y-6">
                <c:forEach items="${requestScope.roomTypeList}" var="roomtype">
                    <form action="/sakura/landlord/room-type" class="inline-block">
                        <button type="submit" name="roomTypeId" value="${roomtype.roomTypeID}" class="px-4 py-2 mx-2 rounded border-2">${roomtype.roomTypeName}</button>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!--End modal select room-->

<!--Modal delete room type-->
<div class="deleteRoomTypemodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-1/4 mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="deleteRoomTypemodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm">(Esc)</span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Xóa loại phòng</p>
                <div class="deleteRoomTypemodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-[#17535B] " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-4">
                <svg class="mx-auto mb-4 w-14 h-14 text-[#c81e25]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                <h3 class="mb-5 text-lg font-normal text-gray-500">Tất cả dữ liệu về hợp đồng, hóa đơn liên quan đến loại phòng <b>${requestScope.currentRoomType.roomTypeName}</b> sẽ bị xóa. </h3>
                <p class="text-lg font-normal text-gray-500">Bạn có chắc chắn muốn xóa?</p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="deleteRoomTypemodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <button id="deleteRoomType-2" onclick="deleteRoomType()" class="deleteRoomTypeBtn px-5 py-2 rounded bg-[#c81e25] text-white hover:bg-[#11444b] mr-2">Xóa</button>
            </div>
        </div>
    </div>
</div>
<!-- End modal delete room type -->            
<!--Modal confirm delete room type-->
<div class="deleteRoomTypemodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="deleteRoomTypemodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm">(Esc)</span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Thông báo</p>
                <div class="deleteRoomTypemodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px]">
                <p class="deleteRoomTypeContent"></p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="deleteRoomTypemodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <c:if test="${sessionScope.needReload == true}">
                    <form action="/sakura/landlord/room-type">
                        <button type="submit" class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                        </button>
                    </form>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!--End modal confirm delete room type-->

<!--Modal update room type-->
<div class="updateRoomTypemodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-5/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="updateRoomTypemodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm">(Esc)</span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-[25px] font-bold">Chỉnh sửa loại phòng</p>
                <div class="updateRoomTypemodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px]">
                <div class="mb-[20px]">
                    <p class="text-xs validUpdateRoomTypeMessage"></p>
                    <label class="w-[160px] inline-block text-[18px]" for="">Tên</label>
                    <input type="text" name="updateName" value="${requestScope.currentRoomType.roomTypeName}" required class="w-[250px] text-[18px] p-[10px]" onkeyup="checkValidUpdateRoomType(this)"/>
                    <input type="hidden" name="currentName" value="${requestScope.currentRoomType.roomTypeName}"/>
                    <span class="ml-2 text-[15px]">VD: Bình dân, Cao cấp, ...</span>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block text-[18px]" for="">Giá</label>
                    <input type="text" name="updatePrice" value="${requestScope.currentRoomType.advertisedPrice}" required class="w-[250px] text-[18px] p-[10px]">
                        <span class="ml-2 text-[15px]">VD: 3000000, 5000000 ...</span>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block text-[18px]" for="">Diện tích (m<sup>2</sup>)</label>
                    <input type="text" name="updateArea" value="${requestScope.currentRoomType.area}" placeholer="m<sup>2</sup>" required class="w-[250px] text-[18px] p-[10px]">
                        <span class="ml-2 text-[15px]">VD: 24, 30, ...</span>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block text-[18px]" for="">Số người tối đa</label>
                    <input type="text" name="updateMaxNumberOfResidents" value="${requestScope.currentRoomType.maxNumberOfResidents}" required class="w-[250px] text-[18px] p-[10px]">
                        <span class="ml-2 text-[15px]">VD: 4, 5, 6, ...</span>
                </div>
                <div class="mb-[20px] flex items-start">
                    <label class="w-[160px] inline-block text-[18px]" for="">Mô tả</label>
                    <textarea class="text-[16px] p-[10px] w-[500px]" name="updateDescription" value="${requestScope.currentRoomType.description}" id="" rows="5">${requestScope.currentRoomType.description}</textarea>
                </div>
                <input type="hidden" name="updateHostelId" value="${sessionScope.currentHostel.hostelID}" />
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="updateRoomTypemodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <button id="updateRoomType-2" onclick="updateRoomType()" class="updateRoomTypeBtn px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>
<!--End modal update room type-->      
<!--Modal confirm update room type-->
<div class="updateRoomTypemodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="updateRoomTypemodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
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
                <div class="updateRoomTypemodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px]">
                <p class="updateMessage"></p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="updateRoomTypemodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <c:if test="${sessionScope.needReload == true}">
                    <form action="/sakura/landlord/room-type">
                        <button type="submit" class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                        </button>
                    </form>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!--End modal confirm update room type-->

<!--Modal add room type-->
<div class="addRoomTypemodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-5/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="addRoomTypemodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm">(Esc)</span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-[25px] font-bold">Thêm loại phòng mới</p>
                <div class="addRoomTypemodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px] mx-auto">
                <div class="mb-[20px]">
                    <p class="text-xs validRoomTypeMessage"></p>
                    <label class="w-[160px] inline-block" for="">Tên</label>
                    <input type="text" name="name" required class="w-[250px] text-[18px] p-[10px]" onkeyup="checkValidRoomType(this)" />
                    <span class="ml-2 text-[16px]">VD: bình dân, cao cấp, ...</span>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Giá</label>
                    <input type="text" name="price" required class="w-[250px] text-[18px] p-[10px]">
                        <span class="ml-2 text-[16px]">VD: 3000000, 5000000 ...</span>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Diện tích</label>
                    <input type="text" name="area" required class="w-[250px] text-[18px] p-[10px]">
                        <span class="ml-2 text-[16px]">VD: 24, 30, ...</span>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Số người tối đa</label>
                    <input type="text" name="maxNumberOfResidents" required class="w-[250px] text-[18px] p-[10px]">
                        <span class="ml-2 text-[16px]">VD: 4, 5, 6, ...</span>
                </div>
                <div class="mb-[20px] flex items-start">
                    <label class="w-[160px] inline-block" for="">Mô tả</label>
                    <textarea class="w-[500px] text-[16px] p-[10px]" name="description" id="" rows="5"></textarea>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block flex items-start" for="">Thêm Hình ảnh</label>
                    <input type="file" multiple rounded />
                </div>
                <input type="hidden" name="hostelId" value="${sessionScope.currentHostel.hostelID}" />

            </div>

            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button
                    class="addRoomTypemodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <button id="addRoomType-2" onclick="addRoomType()"
                        class="addRoomTypeBtn px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu</button>
            </div>
        </div>
    </div>
</div>
<!--End modal add room type-->
<!--Modal confirm add room type-->
<div class="addRoomTypemodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="addRoomTypemodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
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
                <div
                    class="addRoomTypemodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px]">
                <p class="addRoomMessage"></p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="addRoomTypemodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <c:if test="${sessionScope.needReload == true}">
                    <form action="/sakura/landlord/room-type">
                        <button type="submit" class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                        </button>
                    </form>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!--End modal confirm add room type-->

<!--Modal add room-->
<div id="addRoom" tabindex="-1" aria-hidden="true"
     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
    <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
        <div class="relative bg-white rounded shadow">
            <div class="flex justify-between items-start p-4 rounded-t border-b">
                <h3 class="text-xl font-semibold text-gray-900">Thêm Phòng mới</h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded w-[250px] text-[18px] p-[10px].5 ml-auto inline-flex items-center" data-modal-toggle="addRoom">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                </button>
            </div>
            <div class="p-4">
                <span class="text-xs validRoomMessage"></span>
                <form action="/sakura/landlord/room-type" class="my-2">
                    <label class="w-[160px] inline-block" for="">Tên phòng</label>
                    <input type="hidden" name="roomTypeId" value="${requestScope.currentRoomType.roomTypeID}"/>
                    <input type="text" name="addRoomNumber" class="w-[250px] text-[18px] p-[10px]" onkeyup="checkValidRoom(this)"/>
                    <span class="ml-2 text-[16px]">VD: 101, 102, 510 ...</span>
                    <div class="grid justify-items-end">
                        <button type="submit" class="addRoom px-8 py-2 mx-4 my-2 border-2 rounded">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--End modal add room-->