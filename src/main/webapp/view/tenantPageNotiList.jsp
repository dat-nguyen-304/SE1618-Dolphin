<%-- 
    Document   : tenantPageNotiList
    Created on : Jun 21, 2022, 8:40:37 AM
    Author     : Nguyen Dang Loc <locndse160199@fpt.edu.vn>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang người thuê - Thông báo</title>

        <%@include file="../view/assets.jsp" %>

        <link rel="stylesheet" href="../assets/css/tenant-page.css">
        <link rel="stylesheet" href="../assets/css/navbar-dashboard.css">
        <link href="../assets/toastr/toastr.min.css" rel="stylesheet" />
        <link href="../assets/toastr/toastr-custom.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="../view/headerTenantDashboard.jsp" %>
        <%@include file="../view/navbarTenantDashboard.jsp" %>

        <!-- MAIN CONTENT CONTAINER-->
        <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

            <!-- CONTENT -->
            <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

                <!-- Breadcrumb -->
                <nav class="flex" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <a href="#"
                               class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900">
                                <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-4 h-4" viewBox="0 0 20 20"
                                     fill="currentColor">
                                <path fill-rule="evenodd"
                                      d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                                      clip-rule="evenodd" />
                                </svg>
                                Thông báo
                            </a>
                        </li>
                    </ol>
                </nav>
                <!-- End breadcrumb -->

                <div class="content mt-[20px] flex justify-between grid grid-cols-2 gap-[20px]">
                    <!-- Notification list -->
                    <div class="noti-list flex flex-col space-y-[20px] h-[calc(100vh-225px)] overflow-y-auto">
                        <c:if test="${empty requestScope.notificationList}">
                            <div class="w-full h-full flex justify-center items-center">
                                <p class="text-[35px] font-bold text-slate-300">Không có thông báo</p>
                            </div>
                        </c:if>
                        <c:forEach var="notification" items="${requestScope.notificationList}">
                            <div class="card noti-item w-full h-fit bg-[#fff] p-5 flex flex-col justify-between">
                                <h3 class="rating text-[14px] font-bold text-slate-400 mb-[10px]">${notification.createdDate}</h3>
                                <div class="noti-content text-[17px] font-semibold text-slate-700 text-justify">
                                    <p class="">${notification.content}</p>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <!-- End Notification list -->
                    <c:if test = "${requestScope.contract ne null}">
                        <div>
                            <form method = "post" id="send-req" action="/sakura/tenant/notifications" class="card send-request h-[400px] bg-[#fff] p-5 overflow-hidden">
                                <input type="hidden" name="query" value="sendRequest"/>
                                <label for="message" class="block mb-[20px] text-[17px] font-medium text-gray-900">Gửi yêu cầu đến chủ nhà</label>
                                <textarea id="message" rows="4"
                                          class="block mb-[20px] p-3 w-full h-[250px] text-[15px] text-gray-900 bg-gray-50 rounded border border-gray-300 focus:ring-0 focus:border focus:border-[#17535B]"
                                          placeholder="Nhập nội dung của bạn..." name = "description"></textarea>

                                <button type="submit"
                                        class="float-right px-8 py-2 bg-[#17535B] rounded flex justify-center items-center text-[#fff] font-medium text-[15px] hover:bg-[#13484F]">Gửi <i class="bi bi-send-fill ml-[5px]"></i></button>

                            </form>
                            <div class="mt-[20px] text-[16px] text-slate-600 font-medium">
                                <p>Bạn có thể gửi yêu cầu để cho chủ nhà để có thể xử lý những vấn đề hay sự cố xảy ra trong quá trình sinh sống:</p>
                                <ul>
                                    <li>- Yêu cầu thêm thành viên</li>
                                    <li>- Yêu cầu sửa chữa</li>
                                    <li>- Yêu cầu khác ...</li>
                                </ul>
                            </div>
                        </div>
                    </c:if>
                </div>

            </div>

            <%@include file="../view/footerDashboard.jsp" %>
        </div>
        <script src="../assets/toastr/toastr.min.js"></script>
        <script type="text/javascript">
            function showToast(type, msg) {
                toastr.options.positionClass = 'toast-bottom-right';
                // toastr.options.extendedTimeOut = 0; //1000;
                toastr.options.timeOut = 7000;
                toastr.options.hideDuration = 250;
                toastr.options.showDuration = 250;
                toastr.options.hideMethod = 'slideUp';
                toastr.options.showMethod = 'slideDown';
                toastr.options.preventDuplicates = true;
                toastr.options.closeButton = true;
                toastr.options.progressBar = true;
                toastr[type](msg);
            }
            if (sessionStorage.getItem("message") && sessionStorage.getItem("msg-type")) {
                showToast(sessionStorage.getItem("msg-type"), sessionStorage.getItem("message"));
                sessionStorage.removeItem("message");
                sessionStorage.removeItem("msg-type");
            }
        </script>
        <script type="text/javascript">
            $("form#send-req").submit(function () {
                sessionStorage.setItem("message", "Gửi yêu cầu thành công!");
                sessionStorage.setItem("msg-type", "success");
            });
        </script>
    </body>
</html>
