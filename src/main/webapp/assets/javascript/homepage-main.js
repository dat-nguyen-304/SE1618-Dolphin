(function ($) {

    "use strict";

    var cfg = {
        scrollDuration: 800, // smoothscroll duration
        mailChimpURL: 'https://facebook.us8.list-manage.com/subscribe/post?u=cdb7b577e41181934ed6a6a44&amp;id=e6957d85dc'  // mailchimp url
    },
            $WIN = $(window);

    // Add the User Agent to the <html>
    // will be used for IE10 detection (Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0))
    var doc = document.documentElement;
    doc.setAttribute('data-useragent', navigator.userAgent);


//    /* Preloader 
//     * -------------------------------------------------- */
//    var ssPreloader = function () {
//
//        $WIN.on('load', function () {
//
//            // force page scroll position to top at page refresh
//            $('html, body').animate({scrollTop: 0}, 'normal');
//
//            // will fade out the whole preloader DIV that covers the website.
//            $("#preloader").delay(500).fadeOut('slow');
//
//        });
//    };


    /* Mobile Menu
     * ---------------------------------------------------- */
    var ssMobileMenu = function () {

        var toggleButton = $('.header-menu-toggle'),
                nav = $('#header-nav-wrap');

        toggleButton.on('click', function (event) {
            event.preventDefault();

            toggleButton.toggleClass('is-clicked');
            nav.slideToggle();
        });

        if (toggleButton.is(':visible'))
            nav.addClass('mobile');

        $(window).resize(function () {
            if (toggleButton.is(':visible'))
                nav.addClass('mobile');
            else
                nav.removeClass('mobile');
        });

        $('#header-nav-wrap').find('a').on("click", function () {

            if (nav.hasClass('mobile')) {
                toggleButton.toggleClass('is-clicked');
                nav.slideToggle();
            }
        });

    };


    /* FitVids
     * ---------------------------------------------------- */
    var ssFitVids = function () {
        $(".fluid-video-wrapper").fitVids();
    };

    /* Smooth Scrolling
     * ------------------------------------------------------ */
    var ssSmoothScroll = function () {

        $('.smoothscroll').on('click', function (e) {
            var target = this.hash,
                    $target = $(target);

            e.preventDefault();
            e.stopPropagation();

            $('html, body').stop().animate({
                'scrollTop': $target.offset().top
            }, cfg.scrollDuration, 'swing', function () {
                window.location.hash = target;
            });

        });

    };



    /* Placeholder Plugin Settings
     * ------------------------------------------------------ */
    var ssPlaceholder = function () {
        $('input, textarea, select').placeholder();
    };



    /* Alert Boxes
     ------------------------------------------------------- */
    var ssAlertBoxes = function () {

        $('.alert-box').on('click', '.close', function () {
            $(this).parent().fadeOut(500);
        });

    };



    /* Animate On Scroll
     * ------------------------------------------------------ */
    var ssAOS = function () {

        AOS.init({
            offset: 200,
            duration: 600,
            easing: 'ease-in-sine',
            delay: 300,
            once: true,
            disable: 'mobile'
        });

    };


    /* Initialize
     * ------------------------------------------------------ */
    (function ssInit() {

        ssPreloader();
        ssMobileMenu();
        ssFitVids();
        ssOwlCarousel();
        ssWaypoints();
        ssSmoothScroll();
        ssPlaceholder();
        ssAlertBoxes();
        ssAOS();
        ssBackToTop();

        // to use the mailchimp form, uncomment the 
        // function call ssAjaxChimp() below:
        // ssAjaxChimp(); 

    })();


})(jQuery);