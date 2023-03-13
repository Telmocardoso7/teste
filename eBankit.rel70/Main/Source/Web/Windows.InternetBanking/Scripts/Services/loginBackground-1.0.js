jQuery(document).ready(function () {
    $('.campaign-carousel').slick({
        draggable: false,
        fade: true,
        pauseOnDotsHover: false,
        pauseOnHover: false,
        autoplaySpeed: 10000,
        autoplay: true,
        dots: true,
        arrows: false,
        dotsClass: "slick-dots campaign-carousel-dots campaign-carousel-dots-height",
        variableWidth: false
    });

    $('.campaign-carousel .slick-list').css({ 'overflow': 'visible' });

    $(window).on('resize', function () {
        //$('.slick-track').css({ 'overflow': 'visible' });
        //$('.slick-track').css({ 'width': '100% !important' });
    });
});

window.onbeforeunload = function () {
    if (!eBankit.Presentation.NoLoading)
        if (typeof (SessionGuid) == 'undefined')
            eBankit.Presentation.BlockPageForNormalRequest();
    $('body').css("position", "");
};