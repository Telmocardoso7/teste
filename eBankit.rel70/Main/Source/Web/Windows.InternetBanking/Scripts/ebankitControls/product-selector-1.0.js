ProductSelector = {}

METRO_AUTO_REINIT = true;
var isMobile = false;
var timeout = false;
var slider = null;
var delta = 200;
var rtime;
var displayMinSlides = 1;       //displays no less than X slides at the same time
var displayMaxSlides = 4;       //displays no more than X slides at the same time
var slideWidthDefault = 280;    //Size of elements default
var slideWidthDevice = 280;     //Size of elements in phone devices 
var scrollSpeedDefault = 500;   //Default scroll speed
var scrollSpeedDevice = 300;    //Scroll speed in devices
var slideMarginDefault = 10;        //Slide margin default
var slideMarginDevice = 5;     //Slide margin device

$(window).on('load', function () {
    var scrool = document.getElementById("scroolContent");
    if (scrool != null)
        scrool.style.visibility = "visible";
});

$(window).resize(function () {
    rtime = new Date();
    if (timeout === false) {
        timeout = true;
        setTimeout(resizeend, delta);
    }
});

resizeend = function () {
    if (new Date() - rtime < delta) {
        setTimeout(resizeend, delta);
    } else {
        timeout = false;
        ProductSelector.LoadSlider(true);
    }
};

calcMinElements = function (selectorWidth, slideWidth, slideMarginValue) {
    var slideSize = slideWidth + slideMarginValue;
    if (selectorWidth > slideSize)
        return Math.floor(selectorWidth / slideSize);

    return 1;
};

ProductSelector.LoadSlider = function (reloadSelector) {
    var posSlide = 0;
    var selectorWidth = $("#scroolContent").width();
    var nElements = 3;//default
    var slideWidth = 0;
    var slideMarginValue = 0;
    var scrollSpeed = 0;
    slideWidth = slideWidthDefault;
    scrollSpeed = scrollSpeedDefault;
    slideMarginValue = slideMarginDefault;
    nElements = calcMinElements(selectorWidth, slideWidth, slideMarginValue);
    displayMaxSlides = nElements;
    isMobile = window.matchMedia("(min-width: 767px)").matches;

    var selected = $('.selected');
    if (selected && selected.length > 1) {
        for (var i = 0; i < selected.length; ++i) {
            if (selected[i].tagName == 'DIV' && selected[i].getAttribute("item-index") != null && (selected[i].className.indexOf("no-update-selector") == -1)) {
                index = selected[i].getAttribute("item-index");
                posSlide = Math.floor(parseFloat(index) / nElements);
            }
        }
    } else if (selected) {
        index = selected.attr("item-index");
        posSlide = Math.floor(parseFloat(index) / nElements);
    }


    var options = {
        minSlides: displayMinSlides,
        maxSlides: displayMaxSlides,
        slideWidth: slideWidth,
        infiniteLoop: false,
        hideControlOnEnd: true,
        slideMargin: slideMarginValue,
        speed: scrollSpeed,
        startSlide: posSlide
    };
    if (reloadSelector) {
        slider.reloadSlider(options);
    } else {
        slider = $('.bxslider').bxSlider(options);
    }
};
