eBankit.Presentation.TRX00171 = {};

var prm = Sys.WebForms.PageRequestManager.getInstance();
prm.add_endRequest(function () {
    // $('.input-control.text.field').datepicker();
    $(".searchCriteria").panel();
    $("#flwSearch").on("click", function () {
        var v = $("#searchOpen").val();
        $("#searchOpen").val(Math.abs(v - 1));
    });
});

$(document).ready(function () {
    $("#flwSearch").on("click", function () {
        var v = $("#searchOpen").val();
        $("#searchOpen").val(Math.abs(v - 1));
    });

    var $calendPickerDateName1 = $calendPickerDate1.attr("name");
    var $calendPickerDateName2 = $calendPickerDate2.attr("name");

    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
    $params['rules'][$calendPickerDateName1] = { "required": false, "Validate1DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName2] = { "required": false, "Validate2DateLimit": true, "ValidateDateFormat": true };

    $params['messages'][$calendPickerDateName1] = {
        Validate1DateLimit: function () { return top.eBankit.Presentation.GetResource("DateInfDateMax"); },
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg"); }
    };

    $params['messages'][$calendPickerDateName2] = {
        Validate2DateLimit: function () { return top.eBankit.Presentation.GetResource("DateMaxDateInf"); },
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg"); }
    };

    var validator = $("#aspnetForm").validate($params);

    jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate1.val()) && eBankit.Presentation.InternalValidation($calendPickerDate1.val()); });
    jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate2.val()) && eBankit.Presentation.InternalValidation($calendPickerDate2.val()); });
    jQuery.validator.addMethod("Validate1DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate2.val()); });
    jQuery.validator.addMethod("Validate2DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate1.val()); });
});
