/*!
 * Start Bootstrap - Grayscale Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery to collapse the navbar on scroll
$(window).scroll(function () {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
});

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function () {
    $('a.page-scroll').bind('click', function (event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function () {
    $('.navbar-toggle:visible').click();
});

function setCustomDimensions(width, height) {
    $("article").attr("class", "custom");
    if (width && height) {
        $('style').append('.custom iframe{width:' + width + '; height:' + height + '}');
    } else {
        if (width) {
            $('style').append('.custom iframe{width:' + width + '; height:100%}');
        } else {
            $('style').append('.custom iframe{width:100%; height:' + height + '}');
        }
    }
}

$(document).ready(function () {

    $("#source").click(function () {
        $(this).select();
    });

    $("#source").blur(function () {
        $(this).val($(this).val());
    });

    $("#switcher li").click(function () {
        $("article").attr("class", $(this).attr("id"));
        $("#switcher li.active").removeClass("active");
        $(this).addClass("active");
    });

    $(".showContents").click(function () {
        $(this).toggleClass("active");

        $("#MainPopupIframe").contents().find(pub_class).toggleClass("activeContent");
        if ($(this).hasClass('active')) {
            $("#MainPopupIframe").contents().find('#overlay').show(300);
            $("#MainPopupIframe").contents().find(pub_class).addClass('exposed');
            $("#MainPopupIframe").contents().find(pub_class).css('z-index', '99999');
        } else {
            $("#MainPopupIframe").contents().find('#overlay').hide(300);
            $("#MainPopupIframe").contents().find(pub_class).removeClass('exposed');
            $("#MainPopupIframe").contents().find(pub_class).css('z-index', '1');
        }
    });
});

var pub_class = ".publishingContent";

function InitPublishingMethods() {
    $("#MainPopupIframe").contents().find('body').bind('mousedown', function (e) {
        if (!$(e.target).parents(".ctx-menu").length > 0) {
            $(".ctx-menu").hide(100);
        }
    });

    $("#MainPopupIframe").contents().find(pub_class).bind('contextmenu', function (e) {
        if ($(this).hasClass('exposed')) {
            e.preventDefault();
            OpenMenu(e);
        }
    });

    $(".ctx-menu li").click(function () {
        //if the menu has more than one element this is already setup
        switch ($(this).attr("data-action")) {
            case "op-pub":
                OpenPublishingPage();
                break;
        }
        $(".ctx-menu").hide(100);
    });

}

function OpenMenu(e) {
    $(".ctx-menu").finish().show(0);

    var framePos = $("#MainPopupIframe").offset();
    var dimensions = $('.ctx-menu').width();
    var left = e.pageX + dimensions > $("#MainPopupIframe").width() ? $("#MainPopupIframe").width() - dimensions - 30 : e.pageX;

    $(".ctx-menu").css({
        top: (e.pageY + 50 - $("#MainPopupIframe").contents().find('body').scrollTop()) + "px",
        left: framePos.left + left + "px"
    });
}

function OpenPublishingPage() {
    var node = "LOGIN";//hardcoded
    var key = "PasswordRecoveryInfo"; //hardcoded

    $('.wrapper').addClass('loading');

    $.ajax({
        method: 'GET',
        url: '/umbraco/api/PublishingContent/get?node=' + node + '&key=' + key + '&culture=' + lang
    }).done(function (data) {
        if (data != "0") {
            window.open("/umbraco#/content/content/edit/" + data, "_blank");
        } else {
            console.log(data);
            console.log("Content not found on publishing");
        }
    }).fail(function () {
        console.log("There was an error while retrieving the content source.");
    }).always(function () {
        $('.wrapper').removeClass('loading');
    });
}