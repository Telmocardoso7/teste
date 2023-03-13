$(document).ready(function () {
    var hPanel = $(".panel-content");
    if (hPanel) {
        hPanel.hide();
    }

    jQuery.validator.setDefaults({
        focusInvalid: false,
        onfocusout: false
    });

    if (typeof $calendPickerDate1 != "undefined") {
        var $calendPickerDateName1 = $calendPickerDate1.attr("name");

        var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
        $params['rules'][$calendPickerDateName1] = { "required": true, "ValidateMinDate": true, "ValidateMaxDate": true, "ValidateDateFormat": true };

        $params['messages'][$calendPickerDateName1] = {
            ValidateMinDate: function () { return "Data inferior ao limite mínimo permitido."; },
            ValidateMaxDate: function () { return "Data superior ao limite máximo permitido."; },
            ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg"); }
        };

        var validator = $("#aspnetForm").validate($params);

        jQuery.validator.messages.required = top.eBankit.Presentation.GetResource("RequiredField");

        $calendPickerDate1.click(function () {
            $calendPickerDate1.removeClass("error valid");
            $calendPickerDate1.next("label").remove();
        });
    }
});