FavoritSelectorSlick = {}

METRO_AUTO_REINIT = true;
var isMobile = false;
var timeout = false;
var slider = null;
var delta = 200;
var rtime;
var displayMinSlides = 1; 		//displays no less than X slides at the same time
var displayMaxSlides = 3; 		//displays no more than X slides at the same time
var slideWidthDefault = 280; 	//Size of elements default
var slideWidthDevice = 280; 	//Size of elements in phone devices 
var scrollSpeedDefault = 500;	//Default scroll speed
var scrollSpeedDevice = 300;	//Scroll speed in devices
var slideMarginDefault = 10;		//Slide margin default
var slideMarginDevice = 5;     //Slide margin device

$(window).on('load', function () {
	var favoritcontent = document.getElementById("favoritcontent");
	if (favoritcontent != null)
		favoritcontent.style.visibility = "visible";
});

calcMinElements = function (selectorWidth, slideWidth, slideMarginValue) {
    var slideSize = slideWidth + slideMarginValue;
    if (selectorWidth > slideSize)
        return Math.floor(selectorWidth / slideSize);

    return 1;
};

FavoritSelectorSlick.LoadSlick = function () {

    var posSlide = 0;
    var selectorWidth = $("#benefTabContent").width();
    var nElements = 3;//default
    var slideWidth = 0;
    var slideMarginValue = 0;
    var scrollSpeed = 0;
    slideWidth = slideWidthDefault;
    scrollSpeed = scrollSpeedDefault;
    slideMarginValue = slideMarginDefault;
    nElements = calcMinElements(selectorWidth, slideWidth, slideMarginValue);
    isMobile = window.matchMedia("(min-width: 767px)").matches;
    var index = 0;

    //var selected = $('.selected');
    //var selected = $('.selected').filter(":contains('rptFavorits')");
    var selected = $("[id*='rptFavorits']").filter(".selected");
    if (selected && selected.length > 1) {
        for (var i = 0; i < selected.length; ++i) {
            if (selected[i].tagName == 'DIV' && selected[i].getAttribute("item-index") != null && selected[i].className.indexOf("panel-item") > -1) {
                index = selected[i].getAttribute("item-index");
                posSlide = Math.floor(parseFloat(index) / nElements);
            }
        }
    } else if (selected && selected.length > 0) {
        index = selected.attr("item-index");
        posSlide = Math.floor(parseFloat(index) / nElements);
    }

    var options = {
        slidesToShow: 3,
        slideWidth: slideWidth,
        infinite: false,
        speed: scrollSpeed,
        accessibility: true,
        initialSlide: posSlide,
        arrows: true,
        prevArrow: '<button type="button" class="slick-prev" aria-label="Previous Slide"></button>',
        nextArrow: '<button type="button" class="slick-next" aria-label="Next Slide"></button>',
        responsive: [
            {
                breakpoint: 1050,
                settings: {
                    slidesToShow: 3
                }
            }, {
                breakpoint: 768,
                settings: {
                    slidesToShow: 2
                }
            }, {
                breakpoint: 540,
                settings: {
                    slidesToShow: 1
                }
            }]
    };
    $('.slickSliderFavorits_FWBC').slick(options);

    $('.slickSliderFavorits_FWBC').on('afterChange', function () {
        if ($(this).find("button.slick-prev").attr("aria-disabled") === "true")
            $(this).find("button.slick-next").focus();

        if ($(this).find("button.slick-next").attr("aria-disabled") === "true")
            $(this).find("button.slick-prev").focus();
    });

    $('.slickSliderFavorits_FWBC').on('keyup', function (e) {
        if (e.keyCode === 39)//arrowright
            $(this).find("button.slick-next").focus();

        if (e.keyCode === 37) // arrow left
            $(this).find("button.slick-prev").focus();
    });

    $(".slickSliderFavorits_FWBC > button.slick-arrow").on('keyup', function (e) {
        if (e.keyCode === 13)//enter
        {
            $(this).click();
        }
    });
};
