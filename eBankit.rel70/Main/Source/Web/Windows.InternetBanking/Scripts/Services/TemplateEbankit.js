function showTabOperations(e) {
    $("#benefsTabContent #favorit").hide();
    $(".col-transaction").hide();
    $("#benefsTabContent #operations").show();
    $(".tabSelectorBackground .tabActive").removeClass("tabActive");
    $(".tabSelectorBackground .tabOperacoesDisponiveis").parent().addClass("tabActive");
    $(".head.head-top").html(e.attr("data-title"));
    return false;
};

function showTabFavorites(e) {
    $("#benefsTabContent #operations").hide();
    $(".col-transaction").hide();
    $("#benefsTabContent #favorit").show();
    $(".tabSelectorBackground .tabActive").removeClass("tabActive");
    $(".tabSelectorBackground .tabOperacoesFavoritas").parent().addClass("tabActive");
    $(".head.head-top").html(e.attr("data-title"));
    return false;
};

$(document).ready(function () {
    var topHeight = 0;
    $("#oe_menu_b li > div.oe_options").each(function () {
        if ($(this).height() > topHeight) {
            topHeight = $(this).height();
        }
    });

    $("#oe_menu_b li > div.oe_options").each(function () {
        $(this).children("div:first-of-type").css("height", topHeight + "px");
    });

    $("#oe_menu_b li").mouseover(function () {
        if (!$(this).hasClass("oe_menu_search")) {
            if ($(".oe_menu_search > a").hasClass("active")) {
                $(".oe_menu_search > a").click();
            }
        }
    });

    $('#divVersion').click(function () {
        var queryString = '?reload=' + new Date().getTime();
        $('link[rel="stylesheet"]').each(function () {
            this.href = this.href.replace(/\?.*|$/, queryString);
        });

    });
});

$(document).ready(function () {
    $("#divLanguage").click(left);

    $(document).on('click', function (e) {
        $("#divLanguage").animate({ "left": "-205px" }, 100);
    });

    $('a[href^=mailto]').on('click', function () {
        eBankit.Presentation.IgnoreUnload = true;
    });
});

function left() {
    var position = $("#divLanguage").position();
    if (position.left == -205) {
        $("#divLanguage").animate({ "left": "+=202px" }, 100);
    }
    else
        $("#divLanguage").animate({ "left": "-=202px" }, 100);

    return false;
} // end left

function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    } else {
        var expires = "";
    }
    document.cookie = name + "=" + value + expires + "; path=/; samesite=strict" + (window.location.protocol == "https:" ? "; secure" : "");
}