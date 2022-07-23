function toggleFavoriteHostel(hostelID, element) {
    console.log(hostelID);
    jQuery.ajax({
        type: 'POST',
        data: {'hostelID': hostelID},
        url: '/sakura/hostel/toggleFavHostel',
        success: function (result) {
//            let par = element.parentElement;
//            console.log(par);
//            if (par.classList.contains("active"))
//                par.classList.remove("active");
//            else
//                par.classList.add("active");
//            if (par.classList.contains("active")) {
//                console.log("active");
//                element.innerHTML = "Bỏ lưu";
//            } else {
//                console.log("inactive");
//                element.innerHTML = "Lưu";
//            }
        },
        error: function () {
        },
        complete: function (result) {
        }
    });
}