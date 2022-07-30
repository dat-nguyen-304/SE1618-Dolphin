<%-- 
    Document   : modalLandlordHostelInfo
    Created on : Jul 11, 2022, 9:17:01 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>
<!--Modal edit hostel-->
<div class="editHostelmodal1 opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-60"></div>
    <div class="modal-container bg-white w-1/2 h-[85%] mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="editHostelmodal1-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Chỉnh sửa nhà trọ</p>
                <div class="editHostelmodal1-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <input type="hidden" name="hostelId" value="${sessionScope.currentHostel.hostelID}"/>
            <input type="hidden" name="landlordId" value="${sessionScope.currentUser.account.accountID}"/>
            <div class="p-[20px] w-full">
                <p class="text-xs text-[red] validUpdateHostelMessage"></p>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Tên nhà trọ</label>
                    <input type="hidden" required name="currentName" value="${sessionScope.currentHostel.hostelName}"/>
                    <input type="text" name="updateName" value="${sessionScope.currentHostel.hostelName}" class="w-[250px] text-[18px] p-[10px]" onkeyup="checkValidUpdateHostel(this)"/>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Chọn tỉnh</label>
                    <select id="updateProvince" class="w-[250px] p-[10px] text-[18px]" name="updateProvinceId" onchange="renderDistrictSimple(this)">
                        <c:forEach items="${requestScope.provinceList}" var="province">
                            <c:if test="${province.provinceID == sessionScope.currentHostel.district.province.provinceID}">
                                <option selected value="${province.provinceID}">${province.provinceName}</option>
                            </c:if>
                            <c:if test="${province.provinceID != sessionScope.currentHostel.district.province.provinceID}">
                                <option value="${province.provinceID}">${province.provinceName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Chọn huyện</label>
                    <select id="updateDistrict" class="w-[250px] p-[10px] text-[18px]" name="updateDistrictId">
                        <c:forEach items="${requestScope.currentDistrictList}" var="district">
                            <c:if test="${district.districtID == sessionScope.currentHostel.district.districtID}">
                                <option selected value="${district.districtID}">${district.districtName}</option>
                            </c:if>
                            <c:if test="${district.districtID != sessionScope.currentHostel.district.districtID}">
                                <option value="${district.districtID}">${district.districtName}</option>
                            </c:if>
                        </c:forEach>
                    </select> 
                </div>
                <p class="text-xs text-[red] validUpdateAddressMessage"></p>
                <div class="mb-[20px]">
                    <label class="w-[160px] inline-block" for="">Địa chỉ chi tiết</label>
                    <input type="text" required name="updateStreetAddress" value="${sessionScope.currentHostel.streetAddress}" class="text-[18px] w-[500px] p-[10px]" onkeyup="checkValidUpdateAddress(this)"/>
                    <p class="ml-[165px] text-[13px] font-light italic">(Nhập đến cấp phường/xã) VD: 100 Lê Việt - Tăng Nhơn Phú)</p>
                </div>
                <p class="text-xs text-[red] validUpdateDescMessage"></p>
                <div class="flex items-start">
                    <label class="w-[160px] inline-block" for="">Mô tả</label>
                    <!--<textarea id="editor" class="text-area w-full" placeholder="Viết đánh giá ở đây..." name="feedbackContent" rows="4"></textarea>-->
<!--                    <textarea id="editor" class="text-area w-full " disabled placeholder="Viết đánh giá ở đây..." name="updateContent" rows="4" cols="100">
                        ${requestScope.feedback.content}
                    </textarea>-->
                    <textarea id="editor" class="text-area w-full" required name="updateDescription" onkeyup="checkValidUpdateDesc(this)">
                        ${sessionScope.currentHostel.description}
                    </textarea>
                </div>
            </div>
            <!--Footer-->
            <div class="flex justify-end px-[20px]">
                <button class="editHostelmodal1-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <button id="editHostel-2" onclick="updateHostel()" class="updateHostelBtn px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Lưu</button>
            </div>
        </div>
    </div>
</div>
<!--End modal edit hostel-->

<!--Modal remove an image-->
<div class="modal remove-an-image opacity-0 duration-100 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[10000]">
    <div class="modal-overlay absolute w-full h-full bg-[#0c1112] opacity-80"></div>
    <div class="modal-container bg-white w-[500px] h-fit mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="modal-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-[20px]">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
            </svg>
            <span class="text-sm">(Esc)</span>
        </div>
        <div class="modal-content h-full flex flex-col">
            <!--Title-->
            <div class="flex justify-between items-center px-[20px] py-[10px] border-b">
                <p class="text-[20px] font-bold text-[#17535B]">Xác nhận</p>
                <div class="modal-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-[#17535B]" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <p class="p-[20px] font-normal text-[18px]">Bạn chắc chắn muốn xoá hình ảnh này khỏi hệ thống?</p>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="modal-close px-5 py-2 text-[#7e7e7e] text-[18px] font-medium rounded hover:text-[#FF6532]">Huỷ</button>
                <button type="button" id="remove-an-image-btn" class="px-5 py-2 bg-[#f53b3b] hover:bg-[#e84343] text-[#fff] text-[18px] font-medium rounded">Xoá</button>
            </div>
        </div>
    </div>
</div>
<!--Modal remove image-->
<div class="modal remove-image opacity-0 duration-100 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[10000]">
    <div class="modal-overlay absolute w-full h-full bg-[#0c1112] opacity-80"></div>
    <div class="modal-container bg-white w-[500px] h-fit mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="modal-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-[20px]">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
            </svg>
            <span class="text-sm">(Esc)</span>
        </div>
        <div class="modal-content h-full flex flex-col">
            <!--Title-->
            <div class="flex justify-between items-center px-[20px] py-[10px] border-b">
                <p class="text-[20px] font-bold text-[#17535B]">Xác nhận</p>
                <div class="modal-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-[#17535B]" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <p class="p-[20px] font-normal text-[18px]">Bạn chắc chắn muốn xoá những hình ảnh này khỏi hệ thống?</p>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="modal-close px-5 py-2 text-[#7e7e7e] text-[18px] font-medium rounded hover:text-[#FF6532]">Huỷ</button>
                <button type="button" onclick="confirmRemoveMultipleFile()" id="remove-image-btn" class="px-5 py-2 bg-[#f53b3b] hover:bg-[#e84343] text-[#fff] text-[18px] font-medium rounded">Xoá</button>
            </div>
        </div>
    </div>
</div>
<!--Modal add image-->
<div class="modal add-image opacity-0 duration-100 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[10000]">
    <div class="modal-overlay absolute w-full h-full bg-[#0c1112] opacity-80"></div>
    <div class="modal-container bg-white w-[43%] h-[65%] mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="modal-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-[20px]">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
            </svg>
            <span class="text-sm">(Esc)</span>
        </div>
        <div class="modal-content h-full flex flex-col">
            <!--Title-->
            <div class="flex-none flex justify-between items-center px-[20px] py-[10px] border-b">
                <p class="text-[20px] font-bold text-[#17535B]">Tải lên hình nhà trọ</p>
                <div class="modal-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-[#17535B]" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="grow p-[20px]">
                <p class="mb-[10px] text-[18px] font-normal">Có thể đăng tối đa 10 ảnh!</p>
                <form method="post" action="/sakura/landlord/add-hostel-image" enctype="multipart/form-data"
                      class="dropzone border border-dashed overflow-y-auto w-full h-[85%] relative p-[20px]"
                      id="my-dropzone">
                    <div class="fallback">
                        <input name="file" type="file" multiple="multiple" />
                    </div>
                    <div class="dz-message needsclick flex flex-col justify-center items-center text-[#929CA5] absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-full">
                        <div class="mb-3">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 font-normal text-[#929CA5]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12" />
                            </svg>
                        </div>
                        <h4 class="text-[15px] font-normal text-[#929CA5]">Kéo thả hoặc ấn vào đây để tải ảnh lên.</h4>
                    </div>
                </form>
                <p id="error-file-qty-message" class="dz-max-files-reached hidden text-[14px] font-light italic text-[#ff4747]">
                    Tối đa 10 ảnh
                </p>
                <p id="error-file-size-message" class="dz-max-files-reached hidden text-[14px] font-light italic text-[#ff4747]">
                    Ảnh tải lên quá lớn (trên 5MB) sẽ không được tải lên.
                </p>
                <p id="success-upload-message" class="hidden text-[20px] font-medium text-center text-[#0e9c72]">
                    Tải lên thành công!
                </p>
            </div>
            <!--Footer-->
            <div class="flex-none flex justify-end p-[20px]">
                <button class="modal-close px-5 text-[#7e7e7e] text-[20px] font-medium py-2 rounded hover:text-[#FF6532]">Huỷ</button>
                <button type="button" id="upload-file" class="px-5 py-2 bg-[#17535B] hover:bg-[#11444b] text-[#fff] text-[20px] font-medium rounded">Tải lên</button>
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
            <div class="p-6 space-y-6 hostel-list">
                <c:forEach items="${sessionScope.hostelList}" var="hostel">
                    <form action="/sakura/landlord/hostel-info" method="post" class="inline-block">
                        <button type="submit" name="hostelId" value="${hostel.hostelID}" class="px-4 py-2 mx-2 rounded bg-[#17535B] hover:bg-[#13484F] text-[#fff]">${hostel.hostelName}</button>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- End modal choose hostel-->
