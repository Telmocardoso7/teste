
eBankit.Presentation.TRX01801 = {}


eBankit.Presentation.TRX01801.EndRequest = function () {

    $('img[id$=imgSearch]').on('keydown', function (e) {
        if (e.keyCode === 32 || e.keyCode === 13) {
            e.preventDefault();
            $(this).click();
        }
    });
    $('img[id*=imgOperationType]').attr('alt', '');

    $("img[id*=imgTransactionIcon]").attr("alt", "");
    $('span[id*=lnkEdit]').on('keydown', function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            $(this).click();
        }
    });

    $('input[id$=cbSelected]').on('keydown', function (e) {
            if (e.keyCode === 32) {
                e.preventDefault();
                $(".checkmark.all").click();
            }
    });
    $('input[id*=cbSelected_]').on('keydown', function (e) {
        if (e.keyCode === 32) {
            e.preventDefault();
            $(this).siblings('.checkmark.single').click();
        }
    });

    var cbCount = $('.cart-item-body.row').find('input:checkbox').length;
    if (cbCount == 0) {
        $('.trs_buttons-action').hide();
    } else { $('.trs_buttons-action').show(); }

    $(".checkmark.single").on('click', function () {

        $(this).prev().click();
        var row = $(this).closest(".cart-item-body");
        row.toggleClass("selected");

        eBankit.Presentation.TRX01801.VerifyAllCheck();
    });

    $(".checkmark.all").on('click', function () {

        cc = $(this).prev();
        cc.click();

        v = cc.prop('checked');
        var row = $(".cart-item-body.row");
        if (v) { row.addClass("selected"); } else {
            row.removeClass("selected");
        }
        row.find('input:checkbox').each(function () {
            $(this).prop('checked', v);
        });

        eBankit.Presentation.TRX01801.VerifyAllCheck();
    });

    $(".panel-search").slideUp();

    // Search validation
    jQuery.validator.setDefaults({
        focusInvalid: false,
        onfocusout: false
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

    $(".panel-search-toggle").on("click", function () {
        $(".panel-search").slideToggle();
    });

    $('.checkoutExecuteTop').on('click', function () {
        $('.checkoutExecuteSelected')[0].click();
    });

    var $calendPickerDateName1 = $calendPickerDate1.attr("name");
    var $calendPickerDateName2 = $calendPickerDate2.attr("name");


    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
    $params['rules'][$calendPickerDateName1] = { "required": true, "Validate1DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName2] = { "required": true, "Validate2DateLimit": true, "ValidateDateFormat2": true };

    $params['messages'][$calendPickerDateName1] = {
        Validate1DateLimit: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); }
    };

    $params['messages'][$calendPickerDateName2] = {
        Validate2DateLimit: function () { return ""; },
        ValidateDateFormat2: function () { return ""; }
    };

    var validator = $("#aspnetForm").validate($params);


    jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate1.val()) && eBankit.Presentation.InternalValidation($calendPickerDate1.val()); });
    jQuery.validator.addMethod("ValidateDateFormat2", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate2.val()) && eBankit.Presentation.InternalValidation($calendPickerDate2.val()); });

    jQuery.validator.addMethod("Validate1DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate2.val()); });
    jQuery.validator.addMethod("Validate2DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate1.val()); });


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
};
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01801.EndRequest);

$(document).ready(function () {
    eBankit.Presentation.TRX01801.EndRequest();
    eBankit.Presentation.TRX01801.AddLabelToCheckboxes();

    $('.btnDelete-all-bottom').on('click', function () {
        eBankit.Presentation.TRX01801.TriggerDeleteSelected();
    });
});

function pageLoad() {
    eBankit.Presentation.TRX01801.AddLabelToCheckboxes();
} 

eBankit.Presentation.TRX01801.VerifyAllCheck = function () {
    var cb = $('.cart-item-body.row').find('input:checkbox:checked');
    if (cb.length > 0) {
        $('.trs_buttons-action a').each(function () {
            $(this).removeClass('aspNetDisabled'); $(this).removeClass('disabled');
            $("[id*=btnDeleteAllTop]").removeClass('aspNetDisabled'); $("[id*=btnDeleteAllTop]").removeClass('disabled');
            $("[id*=btnCheckoutTop]").removeClass('aspNetDisabled'); $("[id*=btnCheckoutTop]").removeClass('disabled');

            eBankit.Presentation.TRX01801.EnableButtons($(this));
            eBankit.Presentation.TRX01801.EnableButtons($('[id*=btnDeleteAllTop]'));
            eBankit.Presentation.TRX01801.EnableButtons($('[id*=btnCheckoutTop]'));
        });
    } else {
        $('.trs_buttons-action a').each(function () {
            $(this).addClass('aspNetDisabled'); $(this).addClass('disabled');
            $("[id*=btnDeleteAllTop]").addClass('aspNetDisabled'); $("[id*=btnDeleteAllTop]").addClass('disabled');
            $("[id*=btnCheckoutTop]").addClass('aspNetDisabled'); $("[id*=btnCheckoutTop]").addClass('disabled');

            eBankit.Presentation.TRX01801.DisableButtons($(this));
            eBankit.Presentation.TRX01801.DisableButtons($('[id*=btnDeleteAllTop]'));
            eBankit.Presentation.TRX01801.DisableButtons($('[id*=btnCheckoutTop]'));
        });
    }
    var cbCount = $('.cart-item-body.row').find('input:checkbox').length;
    cbAll = $(".checkmark.all").prev();

    cbAll.prop('checked', cb.length == cbCount);
}

eBankit.Presentation.TRX01801.TriggerDeleteSelected = function () {
    $('.btnDeleteAllTop').trigger('click');
}

eBankit.Presentation.TRX01801.EnableButtons = function (buttonToEnable) {
    buttonToEnable.removeAttr("tabindex");
    buttonToEnable.removeAttr("aria-disabled");
}
eBankit.Presentation.TRX01801.DisableButtons = function (buttonToDisable) {
    buttonToDisable.attr("tabindex", "-1");
    buttonToDisable.attr("aria-disabled", "true");
}

eBankit.Presentation.TRX01801.AddLabelToCheckboxes = function () {
    $('input[id*=cbSelected_]').each(function (index) {
        var ariaLabel = "";
        $(this).parent().parent().siblings('div').find('p').each(function (index) {
            var thisP = $(this)[0];
            if (thisP.className !== "action-buttons") {
                if (thisP.className === "key") {
                    ariaLabel += thisP.innerText + ": ";
                }
                else {
                    ariaLabel += thisP.innerText + ". ";
                }
            }
        });
        $(this)[0].ariaLabel = ariaLabel;
    });
}

$('.pending-check-label').click(function (e) {
    e.preventDefault();
});