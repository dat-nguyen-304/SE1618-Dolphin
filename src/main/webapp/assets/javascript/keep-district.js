
if (document.querySelector(".districtSelected-hidden"))
    var districtSelected = document.querySelector(".districtSelected-hidden").value;
var districtElemet = document.querySelector('#district');
if (districtSelected) {
    var provinceID = document.querySelector('#province').value;
    jQuery.ajax({
        type: 'POST',
        data: {'provinceID': provinceID,
            'districtSelected': districtSelected
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

