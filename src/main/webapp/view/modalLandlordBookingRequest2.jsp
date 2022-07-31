<%-- 
    Document   : modalLandlordBookingRequest2
    Created on : Aug 1, 2022, 12:12:46 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<!--Modal confirm show invite desc-->
<div class="viewInviteDesc opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-1/3 mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="viewInviteDesc-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content">
            <!--Body-->
            <div class="p-[20px]">
                <svg class="mx-auto mb-4 w-14 h-14 text-slate-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                <h3 class="text-[20px] font-semibold text-gray-800">Lý do từ chối</h3>
                <p class="text-[17px] text-slate-700 font-medium my-[20px]">
                    ${(invitation.description == null || invitation.description.length() == 0) ? "Không có" : invitation.description}
                </p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="viewInviteDesc-close px-5 py-2 rounded bg-emerald-800 text-white hover:bg-emerald-700">Đóng</button>
            </div>
        </div>
    </div>
</div>
<!--End modal show invite desc-->
