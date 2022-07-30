<%-- 
    Document   : modalRoomTypeList
    Created on : Jul 14, 2022, 8:40:58 PM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Modal update room-->
<div id="room-type-modal" class="opacity-0 pointer-events-none fixed w-full h-full top-0 left-0 flex items-center justify-center z-[1000]">
    <div class="modal-overlay absolute w-full h-full bg-gray-900 opacity-50"></div>
    <div class="modal-container bg-white w-fit mx-auto h-[80%] rounded shadow-md-lg z-50 ">
        <div class="modal-close absolute top-0 right-0 cursor-pointer flex flex-col items-center mt-4 mr-4 text-white text-sm z-50">
            <svg class="fill-current text-white" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                </path>
            </svg>
            <span class="text-sm"></span>
        </div>
        <div class="modal-content h-full">
            <!--Title-->
            <div class="flex justify-between items-center h-[60px] px-[20px] border-b">
                <p class="text-2xl font-bold">Các loại phòng của nhà trọ</p>
                <div class="modal-close cursor-pointer z-50 rounded-full p-[10px] hover:bg-[#F2F7F9]">
                    <svg class="fill-current text-black " xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
                        <path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                        </path>
                    </svg>
                </div>
            </div>
            <!--Body-->
            <div class="room-list px-8 py-3 h-[calc(100%-60px)] overflow-y-auto">
                <div class="mx-auto grid grid-cols-5 gap-[40px] pt-6 pb-8 mb-8">
                    <c:forEach items="${requestScope.roomTypeList}" var = "roomType">
                        <form action="/sakura/hostel/roomTypeDetail" method="post">
                            <input type="hidden" name="roomTypeID" value="${roomType.roomTypeID}">
                                <button type="submit"
                                        class="block m-0 room-item w-[220px] h-[250px] rounded bg-white shadow-md cursor-pointer outline-orange-500 outline-0 hover:outline hover:outline-1 hover:outline-orange-500">
                                    <div class="h-[35%] bg-[#FFF6F1] flex justify-center items-center">
                                        <h2 class="text-orange-500 text-[25px] font-bold">${roomType.roomTypeName}</h2>
                                    </div>
                                    <div class="h-[65%] p-[20px] relative">
                                        <p class="text-left text-slate-500 text-[16px] font-bold mb-2">${roomType.area}m<sup>2</sup></p>
                                        <p class="text-left text-slate-500 text-[16px] font-bold mb-2">
                                            <fmt:setLocale value = "vi_VN"/>
                                            <fmt:formatNumber value = "${roomType.advertisedPrice}" type = "number" pattern="###,###,###"/>
                                            / tháng
                                        </p>
                                        <p class="absolute right-[20px] bottom-[20px] text-orange-600 bg-[#FFF6F1] px-[10px] rounded font-medium text-[15px]">${roomType.availableRoom} phòng trống</p>
                                    </div>
                                </button>
                        </form>
                    </c:forEach>
                </div>
            </div>

        </div>
    </div>
</div>
<!--End modal update room-->
