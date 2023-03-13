
eBankit.Presentation.TRX01172 = {}


eBankit.Presentation.TRX01172.EndRequest = function () {
    //   
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01172.EndRequest);


$(document).ready(function () {
    $("#flwSearch").on("click", function () {
        var v = $("#searchOpen").val();
        $("#searchOpen").val(Math.abs(v - 1));
    });

    $('.btn-search-filter').keypress(function (e) {
        if (e.keyCode === 32 || e.keyCode === 13) {
            e.preventDefault();
            $(this).click();
        }
    });

    $("img[id*='imgBalance'],img[id*='imgTransactions'],img[id*='imgAccount'],img[id*='imgAccountType'], img[id*='imgContract']").each(function () {
        if ($(this).attr("alt") === undefined)
            $(this).attr("alt", "");
    });

    jQuery.validator.setDefaults({
        focusInvalid: false,
        onfocusout: false
    });

    var $calendPickerDateName1 = $calendPickerDate1.attr("name");
    var $calendPickerDateName2 = $calendPickerDate2.attr("name");

    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
    $params['rules'][$calendPickerDateName1] = { "required": true, "ValidateNotRequiredDateFormatExp": true, "ValidateMinDate": true, "ValidateMaxDate": true, "Validate1DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName2] = { "required": true, "ValidateNotRequiredDateFormatExp": true, "ValidateMinDate": true, "ValidateMaxDate": true, "Validate2DateLimit": true, "ValidateDateFormat": true };

    function chunkString(message) {
        var wordArray = message.split(" ");
        var newStr = "";
        wordIndex = 3; // or whatever you want
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
    jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate2.val()) && eBankit.Presentation.InternalValidation($calendPickerDate2.val()); });

    jQuery.validator.addMethod("Validate1DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate2.val()); });
    jQuery.validator.addMethod("Validate2DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate1.val()); });

    $.validator.addMethod("ValidateNotRequiredDateFormatExp", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp(value); });

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

    eBankit.Presentation.TRX01172.EndRequest();
});


eBankit.Presentation.TRX01172.FilterSearch = function () {
    return $("#aspnetForm").valid();
};



eBankit.Presentation.TRX01172.ConfirmConsentDelete = function (current, msgTitle, msgText) {
    top.confirmDeleteHandler = function () {
        eval(current.href);
    };

    var titleConfirm = top.eBankit.Presentation.GetResource("ConfirmTitle");

    $("#deletePopup").find("#ltlDeleteAuthTitle").html(msgTitle);
    $("#deletePopup").find("#ltlDeleteAuthMsg").html(msgText);
    var msg = $("#deletePopup").html().replace('style="display: none">', 'style="display: block">');

    itcore_ui.ShowTopPopupConfirm(msg, titleConfirm, 'top.confirmDeleteHandler();', top.eBankit.Presentation.GetResource("ConfirmDeleteAuthorization"), top.eBankit.Presentation.GetResource("Cancel"));
    $(".modal-footer #btnyes").attr('style', 'text-transform:initial');
    $('.modal-footer').attr("style", "text-align:center;padding-bottom:30px;padding-top:0px");
    $('.modal-footer a').addClass("minWidthButton");
    $(".modal-header").remove();
}


