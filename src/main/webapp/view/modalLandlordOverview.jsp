<%-- 
    Document   : modalLandlordOverview
    Created on : Jul 7, 2022, 2:03:09 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<!--Modal add hostel-->
<div class="addHostelmodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-5/12 mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="addHostelmodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Thêm nhà trọ mới</p>
                <div class="addHostelmodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-4">
                <input type="hidden" name="landlordId" value="${sessionScope.currentUser.account.accountID}"/>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Tên nhà trọ mới</label>
                    <input type="text" required name="name" class="w-[250px] text-[18px] p-[10px]" onkeyup="checkValidHostel(this)"/>
                    <span class="text-xs validHostelMessage"></span>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Chọn tỉnh</label>
                    <select id="province" class="w-[250px] p-[10px] text-[18px]" name="provinceId" onchange="renderDistrictSimple(this)">
                        <c:forEach items="${requestScope.provinceList}" var="province">
                            <option value="${province.provinceID}">${province.provinceName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Chọn huyện</label>
                    <select id="district" name="districtId" class="w-[250px] p-[10px] text-[18px]">
                        <c:forEach items="${requestScope.districtList}" var="district">
                            <option value="${district.districtID}">${district.districtName}</option>
                        </c:forEach>
                    </select> 
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Địa chỉ chi tiết</label>
                    <input type="text" name="streetAddress" required class="w-[500px] text-[18px] p-[10px]">
                        <p class="ml-[165px] text-[13px] font-light italic">(Nhập đến cấp phường/xã) VD: 100 Lê Việt - Tăng Nhơn Phú</p>
                </div>
                <div class="mb-[20px] flex items-start">
                    <label class="w-[160px] inline-block" for="">Mô tả</label>
                    <textarea required class="text-[15px] p-[10px] w-[500px]" name="description" id="" rows="5"></textarea>
                </div>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button
                    class="addHostelmodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <button id="addHostel-2" onclick="addHostel()"
                        class="addHostelBtn px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu</button>
            </div>
        </div>
    </div>
</div>
<!--Modal confirm add hostel-->
<div class="addHostelmodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[2000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-fit mx-auto rounded shadow z-50 overflow-y-auto">
        <div class="addHostelmodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b addHostelMessageTitle">
                <p class="text-2xl font-bold">Xác nhận</p>
                <div class="addHostelmodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px]">
                <p class="addHostelMessage text-[20px] font-normal text-gray-800"></p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="addHostelmodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Đóng</button>
                <form action="/sakura/landlord/overview">
                    <button type="submit" class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<!--Modal choose hostel-->
<div id="hostelModal" tabindex="-1" aria-hidden="true"
     class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center z-[50000]">
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
                    <form action="/sakura/landlord/overview" class="inline-block">
                        <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-4 py-2 mx-2 rounded bg-[#17535B] hover:bg-[#13484F] text-[#fff]">${hostel.hostelName}</button>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- End modal choose hostel-->


<!--Modal confirm edit hostel-->
<div class="editHostelmodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="editHostelmodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
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
                <div class="editHostelmodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px]">
                <p class="updateHostelMessage"></p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="editHostelmodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <c:if test="${sessionScope.needReload == true}">
                    <form action="/sakura/landlord/overview">
                        <input type="hidden" name="hostelId" value="${sessionScope.currentHostel.hostelID}"/>
                        <button type="submit" class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                        </button>
                    </form>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!--End modal confirm edit hostel-->

<!--Modal delete hostel-->
<div class="deleteHostelmodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-[30%] mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="deleteHostelmodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Xóa nhà trọ</p>
                <div class="deleteHostelmodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-4">
                <svg class="mx-auto mb-4 w-14 h-14 text-[#c81e25]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                <h3 class="text-[20px] font-normal text-gray-800">Tất cả dữ liệu về phòng, hợp đồng, hóa đơn liên quan đến nhà trọ ${sessionScope.currentHostel.hostelName} sẽ bị xóa.<br> </h3>
                <p class="text-[20px] text-gray-800 my-[10px]">Bạn có chắc chắn muốn xóa?</p>
                <input type="hidden" name="deleteHostelId" value="${sessionScope.currentHostel.hostelID}"/>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="deleteHostelmodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <button id="deleteHostel-2" onclick="deleteHostel()" class="deleteHostelBtn px-5 py-2 rounded bg-[#c81e25] text-white hover:bg-[#951504] mr-2">Chắc chắn</button>
            </div>
        </div>
    </div>
</div>
<!--End modal delete hostel-->
<!--Modal confirm delete hostel-->
<div class="deleteHostelmodal2 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="deleteHostelmodal2-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <!--            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                            <p class="text-2xl font-bold">Thông báo</p>
                            <div class="deleteHostelmodal2-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                                <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                                    <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                    </path>
                                </svg>
                            </div>
                        </div>-->
            <!--Body-->
            <div class="p-[20px]">
                <p class="deleteHostelContent text-[20px] font-normal text-gray-800 text-center"></p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="deleteHostelmodal2-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Đóng</button>
                <form action="/sakura/landlord/overview">
                    <button type="submit" class="px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Cập nhật lại trang
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<!--End modal confirm delete hostel-->