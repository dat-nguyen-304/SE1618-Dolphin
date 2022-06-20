function renderDistrict(element) {
    var provinceID = element.value;
    var districtElemet = document.querySelector('#district');
    jQuery.ajax({
        type: 'POST',
        data: {'provinceID': provinceID
        },
        url: '/sakura/hostel/address',
        success: function (response) {
            districtElemet.innerHTML = "<option value='0'>Quận huyện</option>" + response;
        },
        error: function () {
        },
        complete: function (result) {
        }
    });
}