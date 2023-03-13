function createCookie(name, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    } else {
        var expires = "";
    }

    if ($("#gdprCookieInfoOverview").length > 0) {
        var performance = $("#gdprCookieButtonPerformanceInput").is(":checked");
        var functional = $("#gdprCookieButtonFunctionalInput").is(":checked");
        var advertisment = $("#gdprCookieButtonAdvertisingInput").is(":checked");

        var value = "cookie 1 " + (functional === true ? " 2 " : "") + (advertisment === true ? " 3 " : "") + (performance === true ? " 4 " : "");
        //SameSite flag must be Lax - account aggregation issues
        document.cookie = name + "=" + value + expires + "; path=/; samesite=lax" + (window.location.protocol == "https:" ? "; secure" : "");
    } else {
        var value = "cookie 1 2 4";
        //SameSite flag must be Lax - account aggregation issues
        document.cookie = name + "=" + value + expires + "; path=/; samesite=lax" + (window.location.protocol == "https:" ? "; secure" : "");
    }
    $('.gdprPopup_popup').hide();
    $('.gdprPopup_moreInfo').hide();
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}

function showCookieContainerDetail(detail)
{
    $(".gdprCookiesTabSelected").removeClass("gdprCookiesTabSelected").addClass("gdprCookiesTabItem");
    $(".select").removeClass("select").addClass("notselect");

    
    $(".gdprCookiesDescription").children().css("display", "none");
    switch (detail)
    {
        case "required":
            $("#gdprCookiesRequired").removeClass("gdprCookiesTabItem").addClass("gdprCookiesTabSelected");
            $("#gdprCookiesRequired").removeClass("notselect").addClass("select");
            $("#gdprCookiesRequiredDescription").css("display", "block");
            break;
        case "performance":
            $("#gdprCookiesPerformance").removeClass("gdprCookiesTabItem").addClass("gdprCookiesTabSelected");
            $("#gdprCookiesPerformance").removeClass("notselect").addClass("select");
            $("#gdprCookiesPerformanceDescription").css("display", "block");
            break;
        case "functional":
            $("#gdprCookiesFunctional").removeClass("gdprCookiesTabItem").addClass("gdprCookiesTabSelected");
            $("#gdprCookiesFunctional").removeClass("notselect").addClass("select");
            $("#gdprCookiesFunctionalDescription").css("display", "block");
            break;
        case "advertising":
            $("#gdprCookiesAdvertising").removeClass("gdprCookiesTabItem").addClass("gdprCookiesTabSelected");
            $("#gdprCookiesAdvertising").removeClass("notselect").addClass("select");
            $("#gdprCookiesAdvertisingDescription").css("display", "block");
            break;
    }
}

function RemoveCookie(name) {
    createCookie(name, -1);
}

function ChekCheckBox(aux) {
    var self = aux;
    $(self).prev().click();
}

function ShowCookiesInfo(){
    $(".gdprPopup_content :focusable").addClass("unfocus2").attr("tabindex", -1).attr("disabled", true);
    $(".gdprPopup_content .gdprIntro_link").attr("style", "pointer-events: none;");
    $(".gdprPopup_moreInfo").show();

    var template = "/controls/master/cookieinfo.html";

    if (IsMobile()) {
        template = "/controls/master/cookieinfomobile.html";
    }

    $.get(template, function (data) {

        $(".gdprPopup_moreInfo").append(data);

        //Common
        $('#gdprCookiesManagementFullTitle').replaceWith(top.eBankit.Presentation.GetResource("gdprCookiesManagementFullTitle"));
        $('.controlCookieTableNoCookies').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieTableNoCookies"));

        //Required
        $('#gdprCookieInfoRequired').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieInfoRequired"));
        $('#gdprSelectTypeForCheckBox').replaceWith(top.eBankit.Presentation.GetResource("gdprSelectTypeForCheckBox"));
        $('#gdprCookiesRequiredDescription1').replaceWith(top.eBankit.Presentation.GetResource("gdprCookiesRequiredDescription1"));
        $('#gdprCookieTableDetailsHeader1').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieTableDetailsHeader1"));
        $('#gdprCookieTableDetailsHeader2').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieTableDetailsHeader2"));
        $('#gdprCookieTableDetailsDescription1').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieTableDetailsDescription1"));
        $('#gdprCookieTableDetailsDescription2').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieTableDetailsDescription2"));
        $('#gdprCookieTableDetailsDescription3').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieTableDetailsDescription3"));
        $('#gdprCookieTableDetailsDescription4').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieTableDetailsDescription4"));
        $('#gdprCookieTableDetailsDescription5').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieTableDetailsDescription5"));
        $('#gdprCookieTableDetailsDescription6').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieTableDetailsDescription6"));

        //Performance
        $('#gdprCookieInfoPerformance').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieInfoPerformance"));
        $('#gdprCookiesRequiredDescription2').replaceWith(top.eBankit.Presentation.GetResource("gdprCookiesRequiredDescription2"));

        //Functional
        $('#gdprCookieInfoFunctional').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieInfoFunctional"));
        $('#gdprCookiesRequiredDescription3').replaceWith(top.eBankit.Presentation.GetResource("gdprCookiesRequiredDescription3"));

        //Advertising
        $('#gdprCookieInfoAdvertising').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieInfoAdvertising"));
        $('#gdprCookiesRequiredDescription4').replaceWith(top.eBankit.Presentation.GetResource("gdprCookiesRequiredDescription4"));       

        //Links docs
        $('#gdprPrivacyPolicyLinkText').replaceWith(top.eBankit.Presentation.GetResource("gdprPrivacyPolicyLinkText"));
        $('#gdprCookiesPolicyLinkText').replaceWith(top.eBankit.Presentation.GetResource("gdprCookiesPolicyLinkText"));

        //Buttons
        $('#gdprCookieInfoGoBack').replaceWith(top.eBankit.Presentation.GetResource("gdprCookieInfoGoBack"));
        $('#ComfirmationCookieButton').replaceWith(top.eBankit.Presentation.GetResource("ComfirmationCookieButton"));
    });
}


function ShowInitialConsent()
{
    $(".gdprPopup_moreInfo").hide();
    $(".gdprPopup_moreInfo").empty();

    $('.unfocus2').attr('tabindex', 0).removeClass('unfocus2').removeAttr('disabled');
    $(".gdprPopup_content .gdprIntro_link").removeAttr("style");
}


(function WriteCookiePopUp() {
    $(document).ready(function () {

        var template = "/controls/master/writecookie.html";

        if (IsMobile()) {
            template = "/controls/master/writecookiemobile.html";
        }

        $.get(template, function (data) {

            $("body").append(data);

            //Titles
            $('.controlCookiesManagementFullTitle').replaceWith(top.eBankit.Presentation.GetResource("gdprCookiesManagementFullTitle"));
            $('#CookieTitle').replaceWith(top.eBankit.Presentation.GetResource("CookieTitle"));

            //Buttons
            $('#MoreInfoCookieButton').replaceWith(top.eBankit.Presentation.GetResource("MoreInfoCookieButton"));
            $('.controlComfirmationCookieButton').replaceWith(top.eBankit.Presentation.GetResource("ComfirmationCookieButton"));

            //Links docs
            $('.controlPrivacyPolicyLinkText').replaceWith(top.eBankit.Presentation.GetResource("gdprPrivacyPolicyLinkText"));
            $('.controlCookiesPolicyLinkText').replaceWith(top.eBankit.Presentation.GetResource("gdprCookiesPolicyLinkText"));

            var isVisible = readCookie('ShowCookieBar');
            if (isVisible) {
                $("#CookieDisclaimer").hide();
                $('.gdprPopup_popup').hide();
                $('.gdprPopup_moreInfo').hide();
            }
            else {
                $("#aspnetForm :focusable")
                    .addClass("unfocus")
                    .attr("tabindex", -1)
                    .attr("disabled", true);
            }
        });

        
    });
})();

function IsMobile() {
    var isMobile = false; 
    
    if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent)
        || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0, 4))) {
        isMobile = true;
    }

    return isMobile;
}