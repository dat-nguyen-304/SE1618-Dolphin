<%-- 
    Document   : replace-contract
    Created on : Jul 9, 2022, 3:02:48 PM
    Author     : Admin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.dolphin.hostelmanagement.DTO.Contract"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ nhà - Thay hợp đồng</title>
        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/toastr.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/flowbite@1.4.7/dist/datepicker.js"></script>
        <link rel="stylesheet" href="../assets/css/LAddContract.css">

    </head>
    <body>
        <%@include file="../view/headerLandlordDashboard.jsp" %>
        <%@include file="../view/navbarLandlordDashboard.jsp" %>
        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">
            <!-- CONTENT -->
            <div class="h-[calc(100vh-80px)] px-[20px] pt-[calc(60px+20px)] pb-[20px]">
                <div class="general-info flex justify-between mt-[20px]">
                    <div class="card mx-auto w-[45%] h-fit bg-[#fff] p-[30px] flex flex-col justify-between">
                        <h2 class="text-[20px] font-medium text-[#17535B]">Thay hợp đồng mới cho phòng ${requestScope.oldContract.room.roomNumber}, nhà trọ ${requestScope.oldContract.hostel.hostelName}
                        </h2>
                        <form id="contract-form" action = "/sakura/contract/replace-contract" method = "post" class="mt-[40px]">
                            <input type="hidden" name="queryType" value="add"/>
                            <input type="hidden" name="tenantID" value="${requestScope.bookingRequest.tenant.account.accountID}"/>
                            <input type="hidden" name="bookingRequestID" value="${requestScope.bookingRequest.bookingRequestID}"/>

                            <div class="mt-[40px] flex items-center grid grid-cols-6 gap-[20px]">
                                <div class=" col-span-3">
                                    <label for="rentalFeePerMonth" class="block mb-2 text-sm font-medium text-gray-900">Giá thuê theo tháng</label>
                                    <input type="number" name="rentalFeePerMonth" oninput="validity.valid||(value='');" 
                                           min="0" id="rentalFeePerMonth" value = "${requestScope.oldContract.rentalFeePerMonth}" class="w-[250px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded focus:ring-[#17535B] focus:border-[#17535B] block w-full p-2.5 " placeholder="" required>
                                </div>
                                <div class=" col-span-3">
                                    <label for="deposit" class="block mb-2 text-sm font-medium text-gray-900">Tiền đặt cọc</label>
                                    <input type="number" name="deposit" oninput="validity.valid||(value='');" 
                                           min="0" id="deposit" value = "${requestScope.oldContract.deposit}" class="w-[250px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded focus:ring-[#17535B] focus:border-[#17535B] block w-full p-2.5" placeholder="" required>
                                </div>
                                <p class="text-sm font-medium" id="moneyError"></p>
                            </div>

                            <div class="mt-[20px] w-full">
                                <label for="description" class="block mb-2 text-sm font-medium text-gray-900">Mô tả / Thông tin bổ sung</label>
                                <textarea type ="text" id="description" name="description"
                                          rows="4" class="w-full block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded border border-gray-300 focus:ring-[#17535B] focus:border-[#17535B]" placeholder="">${requestScope.oldContract.description}</textarea>
                            </div>

                            <div date-rangepicker datepicker-format="dd/mm/yyyy" datepicker-orientation="bottom" class="invoice-time-range mt-[30px] col-span-6 grid grid-cols-6 gap-[20px]">
                                <div class="start-date flex items-center col-span-3 flex items-center">
                                    <label for="start" class="mr-[20px] text-[15px] text-gray-900 font-normal flex items-center">Ngày bắt đầu:</label>
                                    <input type="text" id="start" name="startDate" value = "${requestScope.startDate}" autocomplete="off"
                                           class="bg-[#fff] border border-gray-300 text-gray-900 rounded p-[5px] text-[15px]"
                                           placeholder="Chọn ngày...">
                                </div>
                                <div class="end-date flex items-center col-span-3 flex items-center">
                                    <label for="end" class="mr-[20px] text-[15px] text-gray-900 font-normal flex items-center">Ngày kết thúc</label>
                                    <input type="text" id="end" name="endDate" value = "${requestScope.endDate}" autocomplete="off"
                                           class="bg-[#fff] border border-gray-300 text-gray-900 rounded p-[5px] text-[15px]"
                                           placeholder="Chọn ngày...">
                                </div>
                                <div>
                                    <p class="text-sm font-medium" id="lengthError"></p>
                                </div>
                            </div>
                            <input type="hidden" name="queryType" value="replace"/>
                            <input type="hidden" name="tenantID" value="${requestScope.oldContract.tenant.account.accountID}"/>
                            <input type="hidden" name="contractID" value="${requestScope.oldContract.contractID}"/>
                            <button type ="submit" id="submitButton" class="mt-[40px] w-full h-[50px] rounded bg-[#17535B] hover:bg-[#13484F] text-[#fff] flex items-center justify-center">Lưu hợp đồng</button>
                        </form>
                    </div>
                </div>

            </div>
            <%@include file="../view/footerDashboard.jsp" %>
        </div>

        <script src="../assets/javascript/moment.js"></script>
        <script src="../assets/toastr/toastr.min.js"></script>
        <script>
            function showToast(type, msg) {
                toastr.options.positionClass = 'toast-bottom-right';
                toastr.options.extendedTimeOut = 0; //1000;
                toastr.options.timeOut = 3000;
                toastr.options.hideDuration = 250;
                toastr.options.showDuration = 250;
                toastr.options.hideMethod = 'slideUp';
                toastr.options.showMethod = 'slideDown';
                toastr.options.preventDuplicates = true;
                toastr.options.closeButton = true;
                toastr.options.progressBar = true;
                toastr[type](msg);
            }
        </script>
        <script>
            let room = $("#rooms");
            let start = $("#start");
            let end = $("#end");
            let deposit = $("#deposit");
            let rentalFeePerMonth = $("#rentalFeePerMonth");
            let lengthError = $("#lengthError");
            let moneyError = $("#moneyError");
            let description = $("#description");
            let count = $("#count");

            $(document).ready(function () {
                count.html("0");
            });

            room.change(function () {
                room.css("border", "");
            });

            rentalFeePerMonth.click(function () {
                rentalFeePerMonth.css("border", "");
            });

            rentalFeePerMonth.change(function () {
                rentalFeePerMonth.css("border", "");
                checkMoney();
            });

            deposit.change(function () {
                deposit.css("border", "");
                checkMoney();
            });

            deposit.click(function () {
                deposit.css("border", "");
            });

//            description.on("input", function () {
//                $("#count").html($(this).val().length);
//            });

            description.click(function () {
                description.css("border", "");
            });

            start.change(function () {
                checkDate();
            });

            start.click(function () {
                start.css("border", "");
            });

            end.change(function () {
                checkDate();
            });

            end.click(function () {
                end.css("border", "");
            });

            function checkMoney() {
                moneyError.html("");
                let check = true;
                if (rentalFeePerMonth.val()) {
                    if (rentalFeePerMonth.val() === 0 || rentalFeePerMonth.val() % 1000 !== 0) {
                        rentalFeePerMonth.css("border", "1.5px solid red");
                        check = false;
                    }
                }
                if (deposit.val()) {
                    if (deposit.val() === 0 || deposit.val() % 1000 !== 0) {
                        deposit.css("border", "1.5px solid red");
                        check = false;
                    }
                }
                if (!check) {
                    moneyError.html("Tiền đặt cọc và giá thuê phòng chia hết cho 1000 và khác 0!");
                    moneyError.css("color", "red");
                }
            }

            function pendingRoomCheck(element) {
                const roomID = element.value;

                $("#roomError").html("");

                console.log("RoomID: ", roomID);

                jQuery.ajax({
                    type: 'POST',
                    data: {'roomID': roomID,

                    },
                    url: '/sakura/room/pending-room-check',
                    success: function (response) {
                        //messageElement.innerHTML = response;
                        console.log(response);
                        if (response === "1") {
                            //showToast("success", "Phòng này đã có hợp đồng đang chờ!");
                            $("#roomError").html("Phòng này có hợp đồng đang chờ!");
                            $("#roomError").css("color", "red");
                        }
                    },
                    error: function () {
                    },
                    complete: function (result) {
                    }
                });
            }

            function checkDate() {
                if (end.val() !== "" && start.val() !== "") {
                    let soonest = moment($(start).val(), "DD/MM/YYYY").add(30, 'days');
//                     if (moment(start.val()) > moment(end.val())) {
//                         $(start).css("border", "1.5px solid red");
//                         $(end).css("border", "1.5px solid red");
//                         $(lengthError).html("Ngày bắt đầu phải trước ngày kết thúc!");
//                         $(lengthError).css("color", "red");
//                     }
                    if (moment($(end).val(), "DD/MM/YYYY") < soonest) {
                        console.log("Too short");
                        $(start).css("border", "1.5px solid red");
                        $(end).css("border", "1.5px solid red");
                        $(lengthError).html("Thời gian thuê ngắn nhất là 30 ngày!");
                        $(lengthError).css("color", "red");
                    } else {
                        $(start).css("border", "");
                        $(end).css("border", "");
                        $(lengthError).html("");
                    }
                }
            }

            let interval = setInterval(checkDate, 100);

            $("#submitButton").click(function () {
                let check = true;
                if (!room.val() || room.val() === '0') {
                    room.css("border", "1.5px solid red");
                    check = false;
                }

                console.log(check, room.val());

                if (lengthError.html() !== "" || moneyError.html() !== "" || $("#roomError").html() !== "")
                    check = false;
                if (!rentalFeePerMonth.val()) {
                    rentalFeePerMonth.css("border", "1.5px solid red");
                    check = false;
                }
                if (!deposit.val()) {
                    deposit.css("border", "1.5px solid red");
                    check = false;
                }
                if (!start.val()) {
                    start.css("border", "1.5px solid red");
                    check = false;
                }
                if (!end.val()) {
                    end.css("border", "1.5px solid red");
                    check = false;
                }
                if (!description.val()) {
                    description.css("border", "1.5px solid red");
                    check = false;
                }
                if (!check)
                    console.log("LOI");
                else
                    $("#contract-form").submit();
            });
        </script>
    </body>
</html>
