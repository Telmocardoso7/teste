eBankit.Presentation.TRX00701 = {}

eBankit.Presentation.TRX00701.ValidateCustom = function () {

};

var lastScrollPosition = 0;

eBankit.Presentation.TRX00701.EndRequest = function () {
    $("img[id*='imgType']").each(function () {
        if ($(this).attr("alt") === undefined)
            $(this).attr("alt", "");
    });
    // Search validation
    jQuery.validator.setDefaults({
        focusInvalid: false,
        onfocusout: false
    });

    $(".panel-search").slideUp();

    $(window).scroll(function () {
        var currentPosition = $(window).scrollTop();
        if ($('.panel-operations-display > input[type="hidden"]').val() === "Timeline"
            && currentPosition > lastScrollPosition) {
            var min = ($(document).height() - $("footer").height() - 50);
            var max = ($(document).height() - $("footer").height() + 50);
            var pos = currentPosition + $(window).height();

            if (pos > min && pos < max && $(".AutoScroll").attr("data-total-rows") == "True") {
                $(".AutoScroll").click();
            }
        }

        lastScrollPosition = currentPosition;
    });

    $(".btn-search-filter").on("click", function (e) {
        if ($("#aspnetForm").valid()) {
            $(".panel-search").slideUp();
        } else {
            e.preventDefault();
        }
    });

    $('.btn-search-filter').keypress(function (e) {
        if (e.keyCode === 32 || e.keyCode === 13) {
            e.preventDefault();
            $(this).click();
        }
    });

    $(".panel-search-toggle").on("click keypress", function (e) {
        $(".panel-search").slideToggle();
    });

    var $calendPickerDateName1 = $calendPickerDate1.attr("name");
    var $calendPickerDateName2 = $calendPickerDate2.attr("name");

    var $calendPickerDateName3 = $calendPickerDate3.attr("name");
    var $calendPickerDateName4 = $calendPickerDate4.attr("name");

    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
    $params['rules'][$calendPickerDateName1] = { "required": true, "Validate1DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName2] = { "required": true, "Validate2DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName3] = { "required": false, "Validate3DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName4] = { "required": false, "Validate4DateLimit": true, "ValidateDateFormat": true };

    $params['messages'][$calendPickerDateName1] = {
        Validate1DateLimit: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); }
    };

    $params['messages'][$calendPickerDateName2] = {
        Validate2DateLimit: function () { return ""; },
        ValidateDateFormat: function () { return ""; }
    };

    $params['messages'][$calendPickerDateName3] = {
        Validate3DateLimit: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); }
    };

    $params['messages'][$calendPickerDateName4] = {
        Validate4DateLimit: function () { return ""; },
        ValidateDateFormat: function () { return ""; }
    };

    var $amountIntervalName1 = $amountInterval1.attr("name");
    var $amountIntervalName2 = $amountInterval2.attr("name");

    $params['rules'][$amountIntervalName1] = { "required": false, "ValidateCurrencyAmountDecimalPlacesV2_6": true, "ValidateCurrencyAmountUnderOne_6": true, "Validate1CurrencyLimit": true };
    $params['rules'][$amountIntervalName2] = { "required": false, "ValidateCurrencyAmountDecimalPlacesV2_6": true, "ValidateCurrencyAmountUnderOne_6": true, "Validate2CurrencyLimit": true };

    $params['messages'][$amountIntervalName1] = {
        ValidateCurrencyAmountDecimalPlacesV2_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        ValidateCurrencyAmountUnderOne_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        Validate1CurrencyLimit: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistLimit2ErroMsg"); }
    };

    $params['messages'][$amountIntervalName2] = {
        ValidateCurrencyAmountDecimalPlacesV2_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        ValidateCurrencyAmountUnderOne_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        Validate2CurrencyLimit: function () { return ""; }
    };

    var validator = $("#aspnetForm").validate($params);

    jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate1.val()) && eBankit.Presentation.InternalValidation($calendPickerDate1.val()); });
    jQuery.validator.addMethod("ValidateDateFormat2", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate2.val()) && eBankit.Presentation.InternalValidation($calendPickerDate2.val()); });

    jQuery.validator.addMethod("Validate1DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate2.val()); });
    jQuery.validator.addMethod("Validate2DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate1.val()); });

    jQuery.validator.addMethod("ValidateDateFormat3", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate3.val()) && eBankit.Presentation.InternalValidation($calendPickerDate3.val()); });
    jQuery.validator.addMethod("ValidateDateFormat4", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate4.val()) && eBankit.Presentation.InternalValidation($calendPickerDate4.val()); });

    jQuery.validator.addMethod("Validate3DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate4.val()); });
    jQuery.validator.addMethod("Validate4DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate3.val()); });


    jQuery.validator.addMethod("Validate1CurrencyLimit", function (value, element) { return eBankit.Presentation.ValidateMaxAmount(value, $amountInterval2.val()); });
    jQuery.validator.addMethod("Validate2CurrencyLimit", function (value, element) { return eBankit.Presentation.ValidateMinAmount(value, $amountInterval1.val()); });

    jQuery.validator.addMethod("ValidateCurrencyAmountDecimalPlacesV2_6", function (value, element) { if (!eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2(value, 2)) { return false; } else { return true; } });
    jQuery.validator.addMethod("ValidateCurrencyAmountUnderOne_6", function (value, element) { if (!eBankit.Presentation.ValidateCurrencyAmountCultureAllowZero(value, '.')) { return false; } else { return true; } });

    jQuery.validator.messages.required = top.eBankit.Presentation.GetResource("RequiredField");

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

    $amountInterval1.click(function () {

        if (eBankit.Presentation.ValidateMaxAmount($amountInterval1.val(), $amountInterval2.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval1.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval2.val(), 2)) {
            $amountInterval1.removeClass("error valid");
            $amountInterval2.removeClass("error valid");
            $amountInterval1.next("label").remove();
            $amountInterval2.next("label").remove();
        } else {
            $amountInterval1.addClass("error valid");
            $amountInterval2.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $amountInterval2.click(function () {
        if (eBankit.Presentation.ValidateMaxAmount($amountInterval1.val(), $amountInterval2.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval1.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval2.val(), 2)) {
            $amountInterval1.removeClass("error valid");
            $amountInterval2.removeClass("error valid");
            $amountInterval1.next("label").remove();
            $amountInterval2.next("label").remove();
        } else {
            $amountInterval1.addClass("error valid");
            $amountInterval2.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $amountInterval1.focusout(function () {
        if (eBankit.Presentation.ValidateMaxAmount($amountInterval1.val(), $amountInterval2.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval1.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval2.val(), 2)) {
            $amountInterval1.removeClass("error valid");
            $amountInterval2.removeClass("error valid");
            $amountInterval1.next("label").remove();
            $amountInterval2.next("label").remove();
        } else {
            $amountInterval1.addClass("error valid");
            $amountInterval2.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $amountInterval2.focusout(function () {
        if (eBankit.Presentation.ValidateMaxAmount($amountInterval1.val(), $amountInterval2.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval1.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval2.val(), 2)) {
            $amountInterval1.removeClass("error valid");
            $amountInterval2.removeClass("error valid");
            $amountInterval1.next("label").remove();
            $amountInterval2.next("label").remove();
        } else {
            $amountInterval1.addClass("error valid");
            $amountInterval2.addClass("error valid");

        }
    });
    $calendPickerDate3.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate4.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate3.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate3.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate4.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate3.removeClass("error valid");
            $calendPickerDate4.removeClass("error valid");
            $calendPickerDate3.next("label").remove();
            $calendPickerDate4.next("label").remove();
        } else {
            $calendPickerDate3.addClass("error valid");
            $calendPickerDate4.addClass("error valid");

        }
    });

    $calendPickerDate4.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate4.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate3.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate3.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate4.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate3.removeClass("error valid");
            $calendPickerDate4.removeClass("error valid");
            $calendPickerDate3.next("label").remove();
            $calendPickerDate4.next("label").remove();
        } else {
            $calendPickerDate3.addClass("error valid");
            $calendPickerDate4.addClass("error valid");

        }
    });

    $calendPickerDate4.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate4.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate3.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate3.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate4.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate4.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate4.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate4.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate3.removeClass("error valid");
            $calendPickerDate4.removeClass("error valid");
            $calendPickerDate3.next("label").remove();
            $calendPickerDate4.next("label").remove();
        } else {
            $calendPickerDate3.addClass("error valid");
            $calendPickerDate4.addClass("error valid");

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate4.val('');
        }
    });


    $calendPickerDate3.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate4.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate3.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate3.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate4.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate4.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate4.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate3.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate3.removeClass("error valid");
            $calendPickerDate4.removeClass("error valid");
            $calendPickerDate3.next("label").remove();
            $calendPickerDate4.next("label").remove();
        } else {
            $calendPickerDate3.addClass("error valid");
            $calendPickerDate4.addClass("error valid");

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate3.val('');
        }
    });

    

}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX00701.EndRequest);

$(document).ready(function () {
    eBankit.Presentation.TRX00701.EndRequest();
});