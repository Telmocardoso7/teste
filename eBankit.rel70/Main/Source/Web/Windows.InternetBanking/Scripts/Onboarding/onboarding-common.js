var eBankit = eBankit || {};
eBankit.Onboarding = eBankit.Onboarding || {};
eBankit.Onboarding = (function () {
    var bodyContainerSelector = ".orchestrator-container";
    var headerContainerSelector = ".onboarding-header-toggler";
    var LeaveContainerSelector = ".onboarding-leave-container";
    var forceLeaveDataAttribute = "force-leave";
    var btnContinueSelector = ".btn-onboarding-recover";
    var actionSubmitClassSelector = ".btn_action_1";
    function Leave(elem, force) {

        if (force === true) {
            return true;
        }
        elem = $(elem);
        if (elem && elem.data(forceLeaveDataAttribute)) {
            return true;
        }

        var body = $(bodyContainerSelector);
        var leaveContainer = $(LeaveContainerSelector);
        if (body && leaveContainer) {
            body.hide();
            leaveContainer.show();
            var header = $(headerContainerSelector);
            if (header) {
                header.hide();
            }

        }
        else {
            return true;
        }

        return false;
    };
    function ShowBody() {

        var body = $(bodyContainerSelector);
        if (body) {
            body.show();
        }

        var header = $(headerContainerSelector);
        if (header) {
            header.show();
        }

        var leaveContainer = $(LeaveContainerSelector);
        if (leaveContainer) {
            leaveContainer.hide();
        }
    };

    function Load() {
        var btn = $(btnContinueSelector);
        if (btn) {
            btn.on("click", function (event) {
                event.preventDefault();
                ShowBody();
            });
        }

        var inputs = $(bodyContainerSelector).find(":input");
        if (inputs) {
            inputs.on("keypress", function (e) {
                if (e.keyCode === 13) {
                    e.preventDefault();
                    var btn = $(actionSubmitClassSelector);
                    if (btn) {
                        btn.get(0).click();
                    }
                }
            });
            inputs.each(function () {
                var elem = $(this);
                if (elem.hasClass("trx-field") || elem.hasClass("fnumber")) {
                    elem.parent().append("<span class=\"focus-border\"></span>");
                }
            });
        }

        eBankit.Presentation.BlockPageForNormalRequest = eBankit.Presentation.BlockPageForAjaxRequest = function (args) {
            if (args && $(args.get_postBackElement()).closest('.onboarding-content-container').length) {
                $.unblockUI();
                $('.onboarding-content-container').block({
                    css: { background: "#f6f6f6", border: 0, width: "100%", height: "100%", padding: "4em 0", opacity: 0.6 },
                    message: '<div class=\"loading-image\" style=\"top:46%;margin:auto;opacity:1;\"></div>',
                    overlayCSS: { opacity: 0 }
                }
                );
            }
        }
    }
    return {
        Leave: Leave,
        ShowBody: ShowBody,
        Load: Load
    };

}());

$(document).ready(function () {
    $("img[id='imgOnboardingLogo']").attr('alt', '');
    $("img[id*='imgMarketing']").attr('alt', '');

    $('.slick-slide').on('keyup', function (e) {
        //arrow right
        if (e.keyCode === 39) {
            if ($(this)[0].nextSibling === null) {
                $(this)[0].parentElement.firstChild.focus();
            }
            else {
                $(this)[0].nextSibling.focus();
            }
        }      
        //arrow left
        if (e.keyCode === 37) {
            if ($(this)[0].previousSibling === null) {
                $(this)[0].parentElement.lastChild.focus();
            }
            else {
                $(this)[0].previousSibling.focus();
            }
        }
    });
    $('.slick-dots li button').on('keyup', function (e) {
        //arrow right
        if (e.keyCode === 39) {
            if ($(this)[0].closest('li').nextSibling === null) {
                $(this)[0].closest('li').parentElement.firstChild.children[0].focus();
            }
            else {
                $(this)[0].closest('li').nextSibling.children[0].focus();
            }
        }
        //arrow left
        if (e.keyCode === 37) {
            if ($(this)[0].closest('li').previousSibling === null) {
                $(this)[0].closest('li').parentElement.lastChild.children[0].focus();
            }
            else {
                $(this)[0].closest('li').previousSibling.children[0].focus();
            }
        }
    });

    $('.onboarding-marketing-images-container').slick({
        accessibility: true,
        waitForAnimate: false,
        rtl: document.currentCultureDirection ? true : false,
        draggable: false,
        fade: true,
        pauseOnHover: false,
        autoplaySpeed: 5000,
        autoplay: true,
        arrows: false,
        slidesToShow: 1,
        slidesToScroll: 1
    });

    $(".onboarding-content").css("height", `${window.innerHeight}px`);
    $(window).resize(() => {
        $(".onboarding-content").css("height", `${window.innerHeight}px`);
    });

    eBankit.Onboarding.Load();

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(eBankit.Onboarding.Load);

});