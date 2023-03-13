
$(document).ready(function () {

    $(".btn-campaign-dismiss").on("click", function () {
        HideCampaignContent($(this), 1000);
    });

    $(".panel-campaign-image").each(function () {
        var hasControls = $(this).children().length > 1;
        if (!hasControls) {
            HideCampaignContent($(this), "fast");
        }
    });

    $('.campaign-carousel').slick({
        draggable: false,
        fade: true,
        pauseOnDotsHover: false,
        pauseOnHover: false,
        autoplaySpeed: 10000,
        autoplay: true,
        dots: true,
        arrows: false,
        dotsClass: "slick-dots campaign-carousel-dots"
    });

    function HideCampaignContent(element, easing) {
        $(element).parents().find(".bottom-banner-img-container").each(function () {
            var parentElem = $(this);
            parentElem.slideUp(easing);
        });
    }

});

function CampaignClick(url, contentKey, elem) {
    event.stopPropagation();
    event.preventDefault();
    eBankit.Presentation.Dashboard.triggerPostBack($(elem),contentKey);
    window.open(url, "_blank");
}



