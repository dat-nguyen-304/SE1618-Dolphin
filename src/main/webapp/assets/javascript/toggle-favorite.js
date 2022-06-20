function toggleFavoriteHostel(hostelID, element) {
    if (element.style.color === 'red')
        element.style.color = 'gray';
    else
        element.style.color = 'red';
    console.log(hostelID);
    jQuery.ajax({
        type: 'POST',
        data: {'hostelID': hostelID},
        url: '/sakura/hostel/toggleFavHostel',
        success: function (result) {
        },
        error: function () {
        },
        complete: function (result) {
        }
    });
}