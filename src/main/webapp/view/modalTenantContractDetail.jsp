<%-- 
    Document   : modalTenantContractDetail
    Created on : Aug 1, 2022, 8:50:04 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>


<!--Modal view contract desc-->
<div class="viewContractDesc opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
        <div class="viewContractDesc-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm">(Esc)</span>
        </div>
        <div class="modal-content">
            <!--Title-->
            <div class="flex justify-between items-center p-[20px] py-[10px] border-b">
                <p class="text-2xl font-bold">Nội dung hợp đồng</p>
                <div class="viewContractDesc-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="p-[20px]">
                <p class="text-[18px] text-[#2A3C46] font-semibold">
                    ${not empty requestScope.contract.description ? requestScope.contract.description : 'Không có'}
                </p>
            </div>
            <!--Footer-->
            <div class="flex justify-end p-[20px]">
                <button class="viewContractDesc-close px-5 py-2 rounded bg-[#17535B] text-white hover:bg-[#11444b] mr-2">Đóng</button>
            </div>
        </div>
    </div>
</div>
<!--End modal view contract desc-->
