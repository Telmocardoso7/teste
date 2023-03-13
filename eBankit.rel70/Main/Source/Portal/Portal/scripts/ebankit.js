

/* ----- Detect touch or no-touch */
/*  Detects touch support and adds appropriate classes to html and returns a JS object
 *  Copyright (c) 2013 Izilla Partners Pty Ltd
 *  http://www.izilla.com.au
 *  Licensed under the MIT license
 *  https://coderwall.com/p/egbgdw
 */


var supports = (function () {
    var a = document.documentElement,
        b = "ontouchstart" in window || navigator.msMaxTouchPoints;
    if (b) {
        a.className += " touch";
        return {
            touch: true
        }
    } else {
        a.className += " no-touch";
        return {
            touch: false
        }
    }
})();

// -------- DO the stuff only on no-touch devices only

if ($("html").hasClass("no-touch")) {


    // ------- REMOVE THE DATA TOGGLE ONLY ON "no-touch" devices and get the link to work
    $('.dropdown > a').removeAttr("data-toggle");


    // Hover dropdown for Bootstrap 3.x wrapped in this no-touch var
    /*
     * Project: Bootstrap Hover Dropdown
     * Author: Cameron Spear
     * Contributors: Mattia Larentis
     *
     * Dependencies: Bootstrap's Dropdown plugin, jQuery
     *
     * A simple plugin to enable Bootstrap dropdowns to active on hover and provide a nice user experience.
     *
     * License: MIT
     *
     * http://cameronspear.com/blog/bootstrap-dropdown-on-hover-plugin/
     */
    (function (e, t, n) {
        if ("ontouchstart" in document) return;
        var r = e();
        e.fn.dropdownHover = function (n) {
            r = r.add(this.parent());
            return this.each(function () {
                var i = e(this),
                    s = i.parent(),
                    o = {
                        delay: 500,
                        instantlyCloseOthers: !0
                    }, u = {
                        delay: e(this).data("delay"),
                        instantlyCloseOthers: e(this).data("close-others")
                    }, a = e.extend(!0, {}, o, n, u),
                    f;
                s.hover(function (n) {
                    if (!s.hasClass("open") && !i.is(n.target)) return !0;
                    a.instantlyCloseOthers === !0 && r.removeClass("open");
                    t.clearTimeout(f);
                    s.addClass("open");
                    s.trigger(e.Event("show.bs.dropdown"))
                }, function () {
                    f = t.setTimeout(function () {
                        s.removeClass("open");
                        s.trigger("hide.bs.dropdown")
                    }, a.delay)
                });
                i.hover(function () {
                    a.instantlyCloseOthers === !0 && r.removeClass("open");
                    t.clearTimeout(f);
                    s.addClass("open");
                    s.trigger(e.Event("show.bs.dropdown"))
                });
                s.find(".dropdown-submenu").each(function () {
                    var n = e(this),
                        r;
                    n.hover(function () {
                        t.clearTimeout(r);
                        n.children(".dropdown-menu").show();
                        n.siblings().children(".dropdown-menu").hide()
                    }, function () {
                        var e = n.children(".dropdown-menu");
                        r = t.setTimeout(function () {
                            e.hide()
                        }, a.delay)
                    })
                })
            })
        };
        e(document).ready(function () {
            e('[data-hover="dropdown"]').dropdownHover()
        })
    })(jQuery, this);

} //END IF no-touch for hover script & removeAttr for the links to work

$(document).ready(function () {
    // ADD SLIDEDOWN ANIMATION TO DROPDOWN //
    $('.dropdown').on('show.bs.dropdown', function (e) {
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
        $(this).find('.menuitem').addClass('selected');
    });

    // ADD SLIDEUP ANIMATION TO DROPDOWN //
    $('.dropdown').on('hide.bs.dropdown', function (e) {
        $(this).find('.dropdown-menu').hide();
        $(this).find('.menuitem').removeClass('selected');
    });

    $('.dropdown:not(.login)').hover(function () {
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
        $(this).find('.menuitem').addClass('selected');
        $('.login').find('.dropdown-menu').hide();
        $('.login').find('.menuitem').removeClass('selected');
    }, function () {
        $(this).find('.dropdown-menu').hide()
        $(this).find('.menuitem').removeClass('selected');
    });

    $('.login').hover(function () {
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
        $(this).find('.menuitem').addClass('selected');
        $(this).addClass('open');
    }, function () {
        $(this).find('.dropdown-menu').hide()
        $(this).find('.menuitem').removeClass('selected'); return false;
    });
});


$('[data-toggle=dropdown]').each(function () {
    this.addEventListener('click', function () { }, false);
});

function scrollToAnchor(aid) {
    var aTag = $("#" + aid);
    $('html,body').animate({ scrollTop: aTag.offset().top }, 'slow');
}
 

function InitSearchControl(n, t, i, r, u, f, e) { var o = $("#" + n), s = $("#" + t); $("#Search").on("click", function () { $("#searchBox").fadeToggle("400", "linear") }); s.on("click", function () { return o.val().length > 0 && o.val() != e && o.val().match(f) ? !0 : !1 }); o.on("keypress", function (n) { var t = n.keyCode || n.which; if (t == 13) return s.click(), !1 }) } function InitSearchResultsControl(n, t, i, r, u, f, e) { var o = $("#" + n), s = $("#" + t); $("#Search").on("click", function () { $("#searchBoxMain").fadeToggle("400", "linear") }); s.on("click", function () { return o.val().length > 0 && o.val() != e && o.val().match(f) ? !0 : !1 }); o.on("keypress", function (n) { var t = n.keyCode || n.which; if (t == 13) return s.click(), !1 }) } function convertToPagination(n) { var t = $('<ul class="pagination"/>'); $(n).find("tbody tr").each(function () { var n = $(this).children().map(function () { return "<li>" + $(this).html() + "<\/li>" }); t.append("<li>" + $.makeArray(n).join("") + "<\/li>") }); t.find("span").parent().addClass("active"); $(n).replaceWith(t) } function InsertValidateMsg(n, t) { var i = document.createElement("label"); n.addClass("has-error"); n[0].parentNode.lastChild.nodeName == "SPAN" && n[0].parentNode.lastChild.className == "info" ? n[0].parentNode.lastChild.previousSibling.nodeName != "LABEL" ? (i.className = "has-error", i.setAttribute("id", n[0].id), document.all ? i.innerText = t : i.textContent = t, n[0].parentNode.insertBefore(i, n[0].parentNode.lastChild)) : document.all ? n[0].parentNode.lastChild.previousSibling.innerText = t : n[0].parentNode.lastChild.previousSibling.textContent = t : n[0].parentNode.lastChild.nodeName != "LABEL" ? (i.className = "has-error", i.setAttribute("id", n[0].id), document.all ? i.innerText = t : i.textContent = t, n[0].parentNode.appendChild(i)) : document.all ? n[0].parentNode.lastChild.innerText = t : n[0].parentNode.lastChild.textContent = t } function RemoveValidateMsg(n) { n.removeClass("has-error"); n.removeClass("error"); n != null && n[0] != null && n[0].parentNode != null && n[0].parentNode.lastChild.nodeName == "SPAN" && n[0].parentNode.lastChild.className == "info" && n[0].parentNode.lastChild.previousSibling.nodeName == "LABEL" ? n[0].parentNode.removeChild(n[0].parentNode.lastChild.previousSibling) : n != null && n[0] != null && n[0].parentNode != null && n[0].parentNode.lastChild.nodeName == "LABEL" && n[0].parentNode.removeChild(n[0].parentNode.lastChild) } function CardChanged(n) { for (var i = n.getElementsByTagName("input"), t = 0; t < i.length; t++) if (i[t].checked) return !0; return !1 } jQuery.fn.ForceNumericOnly = function () { return this.each(function () { $(this).keydown(function (n) { var t = n.charCode || n.keyCode || 0; return t == 8 || t == 9 || t == 46 || t >= 37 && t <= 40 || t >= 48 && t <= 57 || t >= 96 && t <= 105 }) }) }; $(document).ready(function () { $(".player img").on("click", function () { $(this).parent().find(".playerPreview").fadeToggle("slow"); $(this).fadeToggle("slow"); var n = $(this).parent().find("iframe"), t = n.attr("src"); n.attr("src", t + "&autoplay=1") }) });

$(document).ready(function () { $(".bs-pagination td table").each(function (n, t) { convertToPagination(t) }) });
/*
//# sourceMappingURL=common.min.js.map
*/

/*!
 * jQuery Lazy - min - v0.1.16
 * http://jquery.eisbehr.de/lazy/
 * http://eisbehr.de/
 *
 * Copyright 2014, Daniel 'Eisbehr' Kern
 *
 * Dual licensed under the MIT and GPL v2 licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl-2.0.html
 *
 * jQuery("img.lazy").lazy();
 */
(function (e, t, n, r) { e.fn.lazy = function (r) { function u(n) { if (typeof n != "boolean") n = false; s.each(function () { var r = e(this); var s = this.tagName.toLowerCase(); if (f(r) || n) { if (r.attr(i.attribute) && (s == "img" && r.attr(i.attribute) != r.attr("src") || s != "img" && r.attr(i.attribute) != r.css("background-image")) && !r.data("loaded") && (r.is(":visible") || !i.visibleOnly)) { var u = e(new Image); ++o; if (i.onError) u.error(function () { p(i.onError, r); h() }); else u.error(function () { h() }); var a = true; u.one("load", function () { var e = function () { if (a) { t.setTimeout(e, 100); return } r.hide(); if (s == "img") r.attr("src", u.attr("src")); else r.css("background-image", "url(" + u.attr("src") + ")"); r[i.effect](i.effectTime); if (i.removeAttribute) r.removeAttr(i.attribute); p(i.afterLoad, r); u.unbind("load"); u.remove(); h() }; e() }); p(i.beforeLoad, r); u.attr("src", r.attr(i.attribute)); p(i.onLoad, r); a = false; if (u.complete) u.load(); r.data("loaded", true) } } }); s = e(s).filter(function () { return !e(this).data("loaded") }) } function a() { if (i.delay >= 0) setTimeout(function () { u(true) }, i.delay); if (i.delay < 0 || i.combined) { u(false); e(i.appendScroll).bind("scroll", c(i.throttle, u)); e(i.appendScroll).bind("resize", c(i.throttle, u)) } } function f(e) { var t = n.documentElement.scrollTop ? n.documentElement.scrollTop : n.body.scrollTop; return t + l() + i.threshold > e.offset().top + e.height() } function l() { if (t.innerHeight) return t.innerHeight; if (n.documentElement && n.documentElement.clientHeight) return n.documentElement.clientHeight; if (n.body && n.body.clientHeight) return n.body.clientHeight; if (n.body && n.body.offsetHeight) return n.body.offsetHeight; return i.fallbackHeight } function c(e, t) { function s() { function o() { r = +(new Date); t.apply() } var s = +(new Date) - r; n && clearTimeout(n); if (s > e || !i.enableThrottle) o(); else n = setTimeout(o, e - s) } var n; var r = 0; return s } function h() { --o; if (!s.size() && !o) p(i.onFinishedAll, null) } function p(e, t) { if (e) { if (t !== null) e(t); else e() } } var i = { bind: "load", threshold: 500, fallbackHeight: 2e3, visibleOnly: true, appendScroll: t, delay: -1, combined: false, attribute: "data-src", removeAttribute: true, effect: "show", effectTime: 0, enableThrottle: false, throttle: 250, beforeLoad: null, onLoad: null, afterLoad: null, onError: null, onFinishedAll: null }; if (r) e.extend(i, r); var s = this; var o = 0; if (i.bind == "load") e(t).load(a); else if (i.bind == "event") a(); if (i.onError) s.bind("error", function () { p(i.onError, e(this)) }); return this }; e.fn.Lazy = e.fn.lazy })(jQuery, window, document);



$(document).ready(function () {
    $('.publicMenu .nav li.dropdown').hover(function () {
        $(this).addClass('open');
        $(this).find('.fade').addClass('in');
    }, function () {
        $(this).removeClass('open');
        $(this).find('.fade').removeClass('in');
    });
});


$(window).scroll(function () {
    if ($(this).scrollTop() > 142) {
        $('.navbar.menu.gradientBG').addClass("fixed-header");
    }
    else {
        $('.navbar.menu.gradientBG').removeClass("fixed-header");
    }
});
$(function () {
    // Remove Search if user Resets Form or hits Escape!
    $('body, .navbar-collapse form[role="search"] button[type="reset"]').on('click keyup', function (event) {
        //console.log(event.currentTarget);
        if (event.which == 27 && $('.navbar-collapse form[role="search"]').hasClass('active') ||
            $(event.currentTarget).attr('type') == 'reset') {
            closeSearch();
        }
    });

    function closeSearch() {
        var $form = $('.navbar-collapse form[role="search"].active')
        $form.find('input').val('');
        $form.removeClass('active');
    }

    // Show Search if form is not active // event.preventDefault() is important, this prevents the form from submitting
    $(document).on('click', '.navbar-collapse form[role="search"]:not(.active) button[type="submit"]', function (event) {
        if (window.innerWidth >= 768) {
            event.preventDefault();
        }
        else {
            submitSearch();
        }
        var $form = $(this).closest('form'),
            $input = $form.find('input');
        $form.addClass('active');
        $input.focus();

    });

    $(document).on('click', '.navbar-collapse form[role="search"].active button[type="submit"]', function (event) {
        submitSearch();
    });

    function submitSearch(){ 
        event.preventDefault();
        var input = $(".search-pos[type=text]").val();

        window.location.href = SERCHRESULTS + input;

        closeSearch()
    }
});


function decodeHtml(html) {
    var txt = document.createElement("textarea");
    txt.innerHTML = html;
    return txt.value;
}
