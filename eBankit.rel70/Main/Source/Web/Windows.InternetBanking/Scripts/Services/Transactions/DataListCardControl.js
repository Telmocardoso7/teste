$(document).ready(function () {
    var hPanel = $(".panel-content");
    if (hPanel) {
        hPanel.hide();
    }

    jQuery.validator.setDefaults({
        focusInvalid: false,
        onfocusout: false
    });

    var $calendPickerDateName1 = $calendPickerDate1.attr("name");
    var $calendPickerDateName2 = $calendPickerDate2.attr("name");

    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
    $params['rules'][$calendPickerDateName1] = { "required": true, "ValidateNotRequiredDateFormatExp": true, "ValidateMinDate": true, "ValidateMaxDate": true, "Validate1DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName2] = { "required": true, "ValidateNotRequiredDateFormatExp": true, "ValidateMinDate": true, "ValidateMaxDate": true, "Validate2DateLimit": true, "ValidateDateFormat": true };

    $params['messages'][$calendPickerDateName1] = {
        ValidateMinDate: function () { return "Data inferior ao limite mínimo permitido."; },
        ValidateMaxDate: function () { return "Data superior ao limite máximo permitido."; },
        ValidateDateFormat: function () { return "[TRX00121:dtTransferDateValidationMessage]"; },
        ValidateNotRequiredDateFormatExp: function () { return "[TRX00121:dtTransferDateValidationMessage]"; },
        Validate1DateLimit: function () { return "Data mínima superior à data máxima."; }
    };

    $params['messages'][$calendPickerDateName2] = {
        ValidateMinDate: function () { return "Data inferior ao limite mínimo permitido."; },
        ValidateMaxDate: function () { return "Data superior ao limite máximo permitido."; },
        ValidateDateFormat: function () { return "[TRX00121:dtTransferDatePermValidationMessage]"; },
        ValidateNotRequiredDateFormatExp: function () { return "[TRX00121:dtTransferDatePermValidationMessage]"; },
        Validate2DateLimit: function () { return "Data máxima inferior à data mínima."; }
    };

    var validator = $("#aspnetForm").validate($params);

    jQuery.validator.addMethod("Validate1DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate2.val()); });
    jQuery.validator.addMethod("Validate2DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate1.val()); });

    $.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateDateFormatExpV2(value) && eBankit.Presentation.InternalValidation(value); });
    $.validator.addMethod("ValidateNotRequiredDateFormatExp", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp(e.target.value) && InternalValidation(e.target.value); });

    jQuery.validator.messages.required = top.eBankit.Presentation.GetResource("RequiredField");

    $calendPickerDate1.click(function () {
        $calendPickerDate1.removeClass("error valid");
        $calendPickerDate1.next("label").remove();
        $calendPickerDate2.removeClass("error valid");
        $calendPickerDate2.next("label").remove();
    });

    $calendPickerDate2.click(function () {
        $calendPickerDate1.removeClass("error valid");
        $calendPickerDate1.next("label").remove();
        $calendPickerDate2.removeClass("error valid");
        $calendPickerDate2.next("label").remove();
    });
});