<%-- 
    Document   : modalTenantBookingRequest3
    Created on : Aug 1, 2022, 9:07:22 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<!--Modal confirm deny contract-->
<div class="denyContract opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-1/3 mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="denyContract-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Xác nhận từ chối</p>
                <div class="denyContract-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <form method="POST" action="/sakura/landlord/rentalRequestList" >
                <!--Body-->
                <div class="p-[20px]">
                    <svg class="mx-auto mb-4 w-14 h-14 text-[#c81e25]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    <h3 class="text-[20px] font-semibold text-gray-800">Bạn chắc chắn từ chối hợp đồng thuê phòng <b>${invitation.roomType.roomTypeName}</b> của nhà trọ <b>${invitation.roomType.hostel.hostelName}</b>?</h3>
                    <p class="text-[17px] italic text-slate-600 font-medium my-[20px]"><span class="text-[17px] text-slate-500">Lưu ý:</span> Hành động này không thể hoàn tác!</p>
                    <textarea type="text" name="denyDescMessage" value="" placeholder="Thêm mô tả ngắn gọn lí do từ chối..."class="w-full max-h-[80px]"></textarea>
                </div>
                <!--Footer-->
                <div class="flex justify-end p-[20px]">
                    <button class="confirmDenyRequest-close px-5 text-[#7e7e7e] py-2 rounded hover:text-[#FF6532]">Huỷ</button>

                    <input type ="hidden" name ="queryType" value ="reject"/>
                    <input type ="hidden" name ="hostelID" value="${requestScope.hostelID}"/>
                    <input type ="hidden" name ="bookingRequestID" value="${booking.bookingRequestID}"/>
                    <button type="submit" class="deleteHostelBtn px-5 py-2 rounded bg-[#c81e25] text-white hover:bg-[#951504] mr-2">Xác nhận</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--End modal confirm deny contract-->