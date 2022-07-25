function customProvinceSelect() {
    $('#province').each(function () {

        // Cache the number of options
        var $this = $(this), numberOfOptions = $(this).children("option").length;

        // Hides the select element
        $this.addClass('s-hidden');

        // Wrap the select element in a div
        $this.wrap('<div class="select"></div>');

        // Insert a styled div to sit over the top of the hidden select element
        $this.after('<div class="styledSelect"></div>');

        // Cache the styled div
        var $styledSelect = $this.next('div.styledSelect');

        // Show the first select option in the styled div
        var selectedText = $this.children('option[selected]').text();
        $styledSelect.text(selectedText);
        if (selectedText === '')
            $styledSelect.text($this.children('option').eq(0).text());
        console.log($styledSelect.text());

        // Insert an unordered list after the styled div and also cache the list
        var $list = $('<ul />', {
            'class': 'options'
        }).insertAfter($styledSelect);

        // Insert a list item into the unordered list for each select option
        $('<li />', {
            text: "Tất cả thành phố", //$this.children('option').eq(0).text(),
            rel: $this.children('option').eq(0).val()
        }).appendTo($list);
        for (var i = 1; i < numberOfOptions; i++) {
            $('<li />', {
                text: $this.children('option').eq(i).text(),
                rel: $this.children('option').eq(i).val()
            }).appendTo($list);
        }

        // Cache the list items
        var $listItems = $list.children('li');

        // Show the unordered list when the styled div is clicked (also hides it if the div is clicked again)
        $styledSelect.click(function (e) {
            e.stopPropagation();
//            $('div.styledSelect.active').each(function () {
//                $(this).removeClass('active').next('ul.options').hide();
//            });
            console.log($('.options-district'));
            $('.options-district').hide();
            $('.options-district').css("display", "none");
            $('.styledSelect-district').removeClass("active");
            $(this).toggleClass('active').next('ul.options').toggle();
        });

        // Hides the unordered list when a list item is clicked and updates the styled div to show the selected list item
        // Updates the select element to have the value of the equivalent option
        $listItems.click(function (e) {
            e.stopPropagation();
            //console.log($(this).text());
            $styledSelect.text($(this).text()).removeClass('active');
            $this.val($(this).attr('rel'));
            $list.hide();
            //console.log($this.val());
            renderDist($this.val());
            /* alert($this.val()); Uncomment this for demonstration! */
        });

        // Hides the unordered list when clicking outside of it
        $(document).click(function () {
            $styledSelect.removeClass('active');
            $list.hide();
        });
    });

}

function renderDist(provinceID) {
    var districtElemet = document.querySelector('#district');
    jQuery.ajax({
        type: 'POST',
        data: {'provinceID': provinceID},
        url: '/sakura/hostel/address',
        success: function (response) {
            districtElemet.innerHTML = "<option value='0'>Tất cả quận/huyện</option>" + response;
            customDistrictSelect();
        },
        error: function () {
        },
        complete: function (result) {
        }
    });
}



function customDistrictSelect() {
    $('#district').each(function () {

        // Cache the number of options
        var $this = $(this), numberOfOptions = $(this).children("option").length;

        if ($this.parent().hasClass("select-district")) {
            console.log("UNWRAP");
            $(".styledSelect-district").remove();
            $(".options-district").remove();
            $this.unwrap();
        }

        // Hides the select element
        $this.addClass('s-hidden');

        // Wrap the select element in a div
        $this.wrap('<div class="select-district"></div>');

        // Insert a styled div to sit over the top of the hidden select element
        $this.after('<div class="styledSelect-district"></div>');

        // Cache the styled div
        var $styledSelect = $this.next('div.styledSelect-district');

        // Show the first select option in the styled div
        var selectedText = $this.children('option[selected]').text();
        $styledSelect.text(selectedText);
        if (selectedText === '')
            $styledSelect.text($this.children('option').eq(0).text());
        console.log($styledSelect.text());

        // Insert an unordered list after the styled div and also cache the list
        var $list = $('<ul />', {
            'class': 'options-district'
        }).insertAfter($styledSelect);

        if (numberOfOptions === 1)
            $list.addClass("singular");

        // Insert a list item into the unordered list for each select option
        $('<li />', {
            text: "Tất cả quận/huyện", //$this.children('option').eq(i).text(),
            rel: $this.children('option').eq(0).val()
        }).appendTo($list);
        for (var i = 1; i < numberOfOptions; i++) {
            $('<li />', {
                text: $this.children('option').eq(i).text(),
                rel: $this.children('option').eq(i).val()
            }).appendTo($list);
        }

        // Cache the list items
        var $listItems = $list.children('li');

        // Show the unordered list when the styled div is clicked (also hides it if the div is clicked again)
        $styledSelect.click(function (e) {
            e.stopPropagation();
//            $('div.styledSelect-district.active').each(function () {
//                $(this).removeClass('active').next('ul.options-district').hide();
//            });
            console.log($('.options-district'));
            $('.options').hide();
            $('.options').css("display", "none");
            $('.styledSelect').removeClass("active");
            $(this).toggleClass('active').next('ul.options-district').toggle();
        });

        // Hides the unordered list when a list item is clicked and updates the styled div to show the selected list item
        // Updates the select element to have the value of the equivalent option
        $listItems.click(function (e) {
            e.stopPropagation();
            $styledSelect.text($(this).text()).removeClass('active');
            $this.val($(this).attr('rel'));
            $list.hide();
            //alert($this.val());
        });

        // Hides the unordered list when clicking outside of it
        $(document).click(function () {
            $styledSelect.removeClass('active');
            $list.hide();
        });
    });
}
