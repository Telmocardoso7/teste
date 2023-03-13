function resolveAfter2Seconds() {
    return new Promise(resolve => {
        setTimeout(() => {
            $('.mce-open').attr("aria-label", "button-expand-options");
            $('.mce-widget.mce-btn.mce-splitbtn.mce-menubtn button').attr('aria-label', 'teste-al')
        }, 2000);
    });
}

$(document).ready(function () {
    $(".img-search-panel").attr("tabindex", "0");
    $(".img-search-panel").on("click", function () {
        $('.panel-search').slideToggle();
    });
    
    setTimeout(function () {
        $('.mce-open').attr("aria-label", "button-expand-options");
        $('.mce-widget.mce-btn.mce-splitbtn.mce-menubtn button').attr('aria-label', 'teste-al');
    }, 2000);

    $("img[id*='imgReadMode']").attr("tabindex", "0");
    $("div[id*='idSearchHeader']").on("mouseout focusout", function () {
        $("div[class='listHeader']").removeAttr("style");
    });
    $("img[id*='icoMessageDetails']").attr('alt', '');
    $("div[id*='idSearchHeader']").keypress(function (e) {
        if (e.keyCode == 32 || e.keyCode == 13) {
            $(this).click()
        }
    });

    var customerType = $('[id$=CustomerType]');

    $(".message-hover").on("mouseover focus", function () {
        if (customerType.val() === "0")
            var messageImg = "/Content/themes/" + ebkTheme + "/images/messages/ico_messages_received_selected.png";
        else
            var messageImg = "/Content/themes/" + ebkTheme + "/images/messages/corporate/ico_messages_received_selected.png";
        var img = $(this).parent().parent().find("img[id*='imgReadMode']");
        img.removeAttr("src");
        img.attr("src", messageImg);
    });
    $(".message-hover").on("mouseout focusout", function () {
        var line = $(this).parent().parent().parent();
        var messageImg;
        if (line.hasClass("unreadMessages"))
            if (customerType.val() === "0")
                messageImg = "/Content/themes/" + ebkTheme + "/images/messages/ico_message_unread.png";
            else
                messageImg = "/Content/themes/" + ebkTheme + "/images/messages/corporate/ico_message_unread.png";
        else
            if (customerType.val() === "0")
                messageImg = "/Content/themes/" + ebkTheme + "/images/messages/ico_message_read.png";
            else
                messageImg = "/Content/themes/" + ebkTheme + "/images/messages/corporate/ico_message_read.png";

        var img = $(this).parent().parent().find("img[id*='imgReadMode']");
        img.removeAttr("src");
        img.attr("src", messageImg);

    });

    $("a[id*='LinkButton1']").on("mouseover focus", function () {
        if (customerType.val() === "0")
            var deleteHover = "/Content/themes/" + ebkTheme + "/images/messages/delete_dark.png";
        else
            var deleteHover = "/Content/themes/" + ebkTheme + "/images/messages/corporate/action_delete_new_hover.png";
        dltImg = $(this).find("img");
        dltImg.removeAttr("src");
        dltImg.attr("src", deleteHover);
    });
    $("a[id*='LinkButton1']").on("mouseout focusout", function () {
        if (customerType.val() === "0")
            var deleteImg = "/Content/themes/" + ebkTheme + "/images/messages/delete.png";
        else
            var deleteImg = "/Content/themes/" + ebkTheme + "/images/messages/corporate/delete_dark.png";
        dltImg = $(this).find("img");
        dltImg.removeAttr("src");
        dltImg.attr("src", deleteImg);
    });

    $("#Div1").on("click", function () {
        var v = $("#searchOpen").val();
        $("#searchOpen").val(Math.abs(v - 1));
    });

    jQuery.validator.setDefaults({
        focusInvalid: false,
        onfocusout: false
    });

    var $calendPickerDateName1 = $calendPickerDate1.attr("name");
    var $calendPickerDateName2 = $calendPickerDate2.attr("name");
    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
    $params['rules'][$calendPickerDateName1] = { "required": true, "ValidateNotRequiredDateFormatExp": true, "Validate1DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName2] = { "required": true, "ValidateNotRequiredDateFormatExp": true, "Validate2DateLimit": true, "ValidateDateFormat": true };

    function chunkString(message) {
        var wordArray = message.split(" ");
        var newStr = "";
        wordIndex = 3;
        for (var i = 0; i < wordArray.length; i++) {
            newStr += wordArray[i];
            if (i != wordIndex) {
                newStr += ' ';
            } else {
                newStr += '</br>';
            }
        }

        return newStr;
    }

    $params['messages'][$calendPickerDateName1] = {
        ValidateMinDate: function () { return chunkString(top.eBankit.Presentation.GetResource("MinDateErrorMsg")); },
        ValidateMaxDate: function () { return chunkString(top.eBankit.Presentation.GetResource("MaxDateErrorMsg")); },
        ValidateNotRequiredDateFormatExp: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
        Validate1DateLimit: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); }
    };

    $params['messages'][$calendPickerDateName2] = {
        ValidateMinDate: function () { return chunkString(top.eBankit.Presentation.GetResource("MinDateErrorMsg")); },
        ValidateMaxDate: function () { return chunkString(top.eBankit.Presentation.GetResource("MaxDateErrorMsg")); },
        ValidateNotRequiredDateFormatExp: function () { return ""; },
        Validate2DateLimit: function () { return ""; },
        ValidateDateFormat: function () { return ""; }
    };

    $("#aspnetForm").validate($params);
    jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate1.val()) && eBankit.Presentation.InternalValidation($calendPickerDate1.val()); });
    jQuery.validator.addMethod("ValidateDateFormat2", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate2.val()) && eBankit.Presentation.InternalValidation($calendPickerDate2.val()); });
    jQuery.validator.addMethod("Validate1DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate2.val()); });
    jQuery.validator.addMethod("Validate2DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate1.val()); });
    $.validator.addMethod("ValidateNotRequiredDateFormatExp", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp(value); });
    jQuery.validator.addMethod("ValidateCurrencyAmountDecimalPlacesV2_6", function (value, element) { if (!eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2(value, 2)) { return false; } else { return true; } });
    jQuery.validator.addMethod("ValidateCurrencyAmountUnderOne_6", function (value, element) { if (!eBankit.Presentation.ValidateCurrencyAmountCultureAllowZero(value, ',')) { return false; } else { return true; } });

    $calendPickerDate1.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate2.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate1.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate2.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate1.removeClass("error valid");
            $calendPickerDate2.removeClass("error valid");
            $calendPickerDate1.next("label").remove();
            $calendPickerDate2.next("label").remove();
        } else {
            $calendPickerDate1.addClass("error valid");
            $calendPickerDate2.addClass("error valid");
            $("#aspnetForm").submit();
        }
    });

    $calendPickerDate2.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate2.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate1.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate2.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate1.removeClass("error valid");
            $calendPickerDate2.removeClass("error valid");
            $calendPickerDate1.next("label").remove();
            $calendPickerDate2.next("label").remove();
        } else {
            $calendPickerDate1.addClass("error valid");
            $calendPickerDate2.addClass("error valid");
            $("#aspnetForm").submit();
        }
    });

    $calendPickerDate2.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate2.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate1.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate2.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate2.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate2.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate2.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate1.removeClass("error valid");
            $calendPickerDate2.removeClass("error valid");
            $calendPickerDate1.next("label").remove();
            $calendPickerDate2.next("label").remove();
        } else {
            $calendPickerDate1.addClass("error valid");
            $calendPickerDate2.addClass("error valid");
            $("#aspnetForm").submit();

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate2.val('');
        }
    });

    $calendPickerDate1.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate2.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate1.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate2.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate2.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate2.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate1.removeClass("error valid");
            $calendPickerDate2.removeClass("error valid");
            $calendPickerDate1.next("label").remove();
            $calendPickerDate2.next("label").remove();
        } else {
            $calendPickerDate1.addClass("error valid");
            $calendPickerDate2.addClass("error valid");
            $("#aspnetForm").submit();

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate1.val('');
        }
    });
});

FilterSearch = function () {
    return $("#aspnetForm").valid();
};

eBankit.Presentation.TRX00901 = {};
eBankit.Presentation.TRX00901.ValidateSubject = function () {
    var ret = true;
    var subject = $('[id$=textMessageSubject_txField]');
    if (subject.val() == null || $.trim(subject.val()) == '') {
        ret = false;
        eBankit.Presentation.InsertValidateMsg_V2(subject, top.eBankit.Presentation.GetResource("txtMessageSubjectInvalidFormat"));
    } else {
        eBankit.Presentation.RemoveValidateMsg(subject);
    }
    return ret;
};
eBankit.Presentation.TRX00901.ValidateMessage = function () {
    var ret = false;
    var subject = $('[id$=textMessageContent_txField]');
    var editorContent = tinyMCE.get(subject.attr('id')).getContent();

    var div = document.createElement('div');
    div.innerHTML = editorContent.trim();

    for (var i = 0; i < div.children.length; i++) {
        if ($.trim(div.children[i].innerText) != '') {
            ret = true;
            break;
        }
    }

    if (ret) {
        eBankit.Presentation.RemoveValidateMsg(subject);
    } else {
        eBankit.Presentation.InsertValidateMsg_V2(subject, top.eBankit.Presentation.GetResource("txtMessageContentInvalidFormat"));
    }

    return ret;
};
eBankit.Presentation.TRX00901.ValidateCategory = function () {
    var ret = true;
    var subject = $('[id$=textMessageCategory_dlField]');
    if (isNaN(subject.val()) && subject.length == 0) {
        return ret;
    }
    if (subject.length > 0) {
        var index = subject[0].selectedIndex;
        if (index == 0) {
            ret = false;
            eBankit.Presentation.InsertValidateMsg_V2(subject, top.eBankit.Presentation.GetResource("ddlCategoryErroMsg"));
        } else {
            eBankit.Presentation.RemoveValidateMsg(subject);
        }
        return ret;
    } else {
        ret = false;
        return ret;
    }
};
eBankit.Presentation.TRX00901.ValidateSendMessageFields = function () {
    var validSubject = eBankit.Presentation.TRX00901.ValidateSubject();
    var validMessage = eBankit.Presentation.TRX00901.ValidateMessage();
    var validCategory = eBankit.Presentation.TRX00901.ValidateCategory();
    if (!validSubject || !validMessage || !validCategory) {
        return false;
    }
};