<%-- 
    Document   : LRoomType
    Created on : Jun 23, 2022, 12:33:26 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang người thuê</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="images/logo.png">

    <!-- <link rel="stylesheet" href="app.css"> -->
    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="../assets/css/LRoomType.css">

    <!-- icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>

<body>
    <%@include file="../view/LControllBar.jsp" %>

    <!-- MAIN CONTENT CONTAINER-->
    <div class="ml-[256px] my-0 h-fit overflow-hidden bg-[#f9fafb]">

        <!-- CONTENT -->
        <div class="h-full px-[20px] pt-[calc(60px+20px)] pb-[20px]">

            <!-- Breadcrumb -->
            <nav class="flex" aria-label="Breadcrumb">
                <ol class="inline-flex items-center space-x-1 md:space-x-3">
                    <li class="inline-flex items-center">
                        <a href="#"
                            class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-gray-900 ">
                            <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z">
                                </path>
                            </svg>
                            Phòng
                        </a>
                    </li>
                    <!-- <li aria-current="page">
                        <div class="flex items-center">
                            <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                    clip-rule="evenodd"></path>
                            </svg>
                            <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 text-gray-400">Danh sách hoá đơn</span>
                        </div>
                    </li> -->
                </ol>
            </nav>
            <!-- End breadcrumb -->

            <!-- General information -->
            <div class="general-info flex justify-between mt-[20px]">
                <div class="">
                    <span>Chọn nhà trọ: </span>
                    <button
                        class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                        type="button" data-modal-toggle="hostelModal">
                        Sakura
                    </button>

                    <div id="hostelModal" tabindex="-1" aria-hidden="true"
                        class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Chọn Phòng
                                    </h3>
                                    <button type="button"
                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                        data-modal-toggle="hostelModal">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </div>

                                <div class="p-6 space-y-6">
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Huyền Thiết</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Châu Tấn</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Á Bằng</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Doanh Doanh</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="mt-[20px]">
                <div class="">
                    <span>Chọn loại phòng: </span>
                    <button
                        class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                        type="button" data-modal-toggle="roomModal">
                        Bình Dân
                    </button>
                    <div id="roomModal" tabindex="-1" aria-hidden="true"
                        class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Chọn loại Phòng
                                    </h3>
                                    <button type="button"
                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                        data-modal-toggle="roomModal">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </div>

                                <div class="p-6 space-y-6">
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Bình Dân</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Trung Bình</a>
                                    <a href="" class="px-4 py-2 mx-2 rounded border-2">Cao Cấp</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <button
                        class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                        type="button" data-modal-toggle="addModal">
                        Thêm loại phòng mới
                    </button>
                    <div id="addModal" tabindex="-1" aria-hidden="true"
                        class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                        <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                <div
                                    class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Thêm loại Phòng mới
                                    </h3>
                                    <button type="button"
                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                        data-modal-toggle="addModal">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </div>

                                <div class="p-4">
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Tên</label>
                                        <input type="text" class="text-sm p-1">
                                        <span class="ml-2 text-xs">VD: bình dân, cao cấp, ...</span>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Giá</label>
                                        <input type="text" class="text-sm p-1">
                                        <span class="ml-2 text-xs">VD: bình dân, cao cấp, ...</span>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Diện tích</label>
                                        <input type="text" class="text-sm p-1">
                                        <span class="ml-2 text-xs">VD: bình dân, cao cấp, ...</span>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Số người tối đa</label>
                                        <input type="text" class="text-sm p-1">
                                        <span class="ml-2 text-xs">VD: bình dân, cao cấp, ...</span>
                                    </div>
                                    <div class="my-2">
                                        <label class="relative top-[-24px] w-[160px] inline-block" for="">Mô tả</label>
                                        <textarea class="text-sm p-1" name="" id="" cols="48" rows="2">abcxyz</textarea>
                                    </div>
                                    <div class="my-2">
                                        <label class="w-[160px] inline-block" for="">Thêm Hình ảnh</label>
                                        <input type="file" multiple rounded />
                                    </div>
                                </div>
                                <div class="grid justify-items-end">
                                    <button class=" px-8 py-2 mx-4 my-2 border-2 rounded">Thêm</button>
                                </div>

                            </div>
                        </div>
                    </div>



                    <div class="mt-[24px] grid grid-cols-12">
                        <div class="col-span-5 mx-8">
                            <input type="file" multiple />
                            <div class="mt-[24px] grid grid-cols-3 gap-4">
                                <div class="w-full border-2">Hinh anh</div>
                                <div class="w-full border-2">Hinh anh</div>
                                <div class="w-full border-2">Hinh anh</div>
                                <div class="w-full border-2">Hinh anh</div>
                                <div class="w-full border-2">Hinh anh</div>
                            </div>
                        </div>
                        <div class="col-span-7 mx-8">
                            <div class="text-lg">Thông số chung: </div>
                            <div class="mt-[24px] grid grid-cols-3 gap-4">
                                <div class="">
                                    <span>Giá: </span>
                                    <input type="text" name="" disabled
                                        class="border-none text-sm text-right p-1 bg-transparent inline-block w-24"
                                        value="6.000.000">
                                    <span>VNĐ</span>
                                </div>
                                <div class="">
                                    <span>Diện tích: </span>
                                    <input type="text" name="" disabled
                                        class="border-none text-sm text-right p-1 bg-transparent inline-block w-8"
                                        value="32">
                                    <span>m2</span>
                                </div>
                                <div class="">
                                    <span>Số người tối đa: </span>
                                    <input type="text" name="" disabled
                                        class="border-none text-sm text-right p-1 bg-transparent inline-block w-6"
                                        value="5">
                                    <span>người</span>
                                </div>
                                <div class="col-span-3">
                                    <p class="">Mô tả: </p>
                                    <textarea class="mt-[8px] p-2 border-none text-sm bg-transparent" disabled name=""
                                        id="" cols="72" rows="2">abcxyz</textarea>
                                </div>
                                <div class="col-span-2"></div>
                                <button class="border-2 rounded p-1 hidden">Lưu</button>
                                <button class="border-2 rounded p-1 ">Chỉnh sửa</button>

                            </div>
                        </div>
                    </div>
                    <div class="mt-[24px]">
                        <div class="grid grid-cols-6 gap-x-4">
                            <div class="text-center p-2 text-sm">Danh sách phòng hiện tại: </div>
                            <!-- <div class="border-2 rounded text-center p-2 text-sm">Thêm Phòng</div> -->
                            <button
                                class="ml-[20px] inline-block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                type="button" data-modal-toggle="addRoom">
                                Thêm Phòng
                            </button>
                            <div id="addRoom" tabindex="-1" aria-hidden="true"
                                class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full justify-center items-center">
                                <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">

                                    <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">

                                        <div
                                            class="flex justify-between items-start p-4 rounded-t border-b dark:border-gray-600">
                                            <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                Thêm Phòng mới
                                            </h3>
                                            <button type="button"
                                                class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                                data-modal-toggle="addRoom">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                        d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                        clip-rule="evenodd"></path>
                                                </svg>
                                            </button>
                                        </div>

                                        <div class="p-4">
                                            <div class="my-2">
                                                <label class="w-[160px] inline-block" for="">Tên phòng</label>
                                                <input type="text" class="text-sm p-1">
                                                <span class="ml-2 text-xs">VD: 101, 102, 510 ...</span>
                                            </div>
                                            <div class="my-2">
                                                <label class="relative top-[-24px] w-[160px] inline-block" for="">Mô
                                                    tả</label>
                                                <textarea class="text-sm p-1" name="" id="" cols="48"
                                                    rows="2">abcxyz</textarea>
                                            </div>
                                        </div>
                                        <div class="grid justify-items-end">
                                            <button class=" px-8 py-2 mx-4 my-2 border-2 rounded">Tiếp tục</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="my-[24px] grid grid-cols-10 gap-x-8">
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>
                            <button class="border-2 rounded text-center p-1">101</button>

                        </div>
                    </div>
                </div>

            </div>

            <!-- Footer -->

            <footer class="w-full px-[20px] pb-[20px]">
                <div class="card w-full h-fit bg-[#fff] rounded flex items-center justify-between p-[20px]">
                    <span class="text-sm text-gray-500 sm:text-center">© 2022 <a href="https://flowbite.com"
                            class="hover:text-[#17535B]">Sakura™</a>. All Rights Reserved.
                    </span>
                    <ul class="flex flex-wrap items-center mt-3 text-sm text-gray-400 sm:mt-0">
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6 ">Về Sakura</a>
                        </li>
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6">Chính sách bảo mật</a>
                        </li>
                        <li>
                            <a href="#" class="mr-4 hover:text-[#17535B] md:mr-6">FAQ</a>
                        </li>
                        <li>
                            <a href="#" class="hover:text-[#17535B]">Liên hệ</a>
                        </li>
                    </ul>
                </div>

            </footer>

            <!-- End footer -->

        </div>

        <!-- flowbite -->
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>

        <!-- chartJS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            const hasResident = document.querySelectorAll('input[name="status"]');
            const inputResident = document.querySelector('.inputResident');
            hasResident.forEach(element => {
                element.onclick = () => {
                    if (element.value == "2" || element.value == "3") {
                        inputResident.style.display = "block";
                    } else inputResident.style.display = "none";
                }
            });
        </script>
</body>

</html>