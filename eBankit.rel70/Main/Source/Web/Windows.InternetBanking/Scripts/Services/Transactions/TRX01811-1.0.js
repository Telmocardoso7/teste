
eBankit.Presentation.TRX01811 = {}


eBankit.Presentation.TRX01811.EndRequest = function () {

    $("img").each(function () {
        if ($(this).attr("alt") === undefined)
            $(this).attr("alt", "");
    });

    // Search validation
    jQuery.validator.setDefaults({
        focusInvalid: false,
        onfocusout: false,
        onkeyup: function (element) { $(element).valid() },
        onfocusout: function (element) { $(element).valid(); }
    });

    $(".panel-search").slideUp();

    $(".btn-search").on("click", function (e) {
        if ($("#aspnetForm").valid()) {
            $(".panel-search").slideUp();
        } else {
            e.preventDefault();
        }
    });

    $('.btn-search').keypress(function (e) {
        if (e.keyCode === 32 || e.keyCode === 13) {
            e.preventDefault();
            $(this).click();
        }
    });

    $(".panel-search-toggle").on("click keypress", function (e) {
        $(".panel-search").slideToggle();
    });

    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };

    //#region [Variables Pending]

    var $calendPickerDateName1 = $calendPickerDate1.attr("name");
    var $calendPickerDateName2 = $calendPickerDate2.attr("name");

    var $calendPickerDateName3 = $calendPickerDate3.attr("name");
    var $calendPickerDateName4 = $calendPickerDate4.attr("name");

    $params['rules'][$calendPickerDateName1] = { "required": true, "Validate1DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName2] = { "required": true, "Validate2DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName3] = { "required": true, "Validate3DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName4] = { "required": true, "Validate4DateLimit": true, "ValidateDateFormat": true };


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


    var txtBeneficiaryAccount = $('[id$=txtBeneficiaryAccountPending_txField]');
    var $txtBeneficiaryAccount = txtBeneficiaryAccount.attr("name");
    var pattern = new RegExp(/^[a-z0-9]+$/i);

    $params['rules'][$txtBeneficiaryAccount] = { "required": false, 'regex': pattern };
    $params['messages'][$txtBeneficiaryAccount] = {
        regex: function () {
            eBankit.Presentation.RemoveCustomValidateMsg(txtBeneficiaryAccount);
            eBankit.Presentation.RemoveValidateMsg(txtBeneficiaryAccount);
            return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg");
        }
    };

    //#endregion

    //#region [Variables Pending Third]

    var $calendPickerDateName5 = $calendPickerDate5.attr("name");
    var $calendPickerDateName6 = $calendPickerDate6.attr("name");

    var $calendPickerDateName7 = $calendPickerDate7.attr("name");
    var $calendPickerDateName8 = $calendPickerDate8.attr("name");

    $params['rules'][$calendPickerDateName5] = { "required": true, "Validate5DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName6] = { "required": true, "Validate6DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName7] = { "required": true, "Validate7DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName8] = { "required": true, "Validate8DateLimit": true, "ValidateDateFormat": true };

    $params['messages'][$calendPickerDateName5] = {
        Validate5DateLimit: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); }
    };

    $params['messages'][$calendPickerDateName6] = {
        Validate6DateLimit: function () { return ""; },
        ValidateDateFormat: function () { return ""; }
    };

    $params['messages'][$calendPickerDateName7] = {
        Validate7DateLimit: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); }
    };

    $params['messages'][$calendPickerDateName8] = {
        Validate8DateLimit: function () { return ""; },
        ValidateDateFormat: function () { return ""; }
    };

    var $amountIntervalName3 = $amountInterval3.attr("name");
    var $amountIntervalName4 = $amountInterval4.attr("name");

    $params['rules'][$amountIntervalName3] = { "required": false, "ValidateCurrencyAmountDecimalPlacesV2_6": true, "ValidateCurrencyAmountUnderOne_6": true, "Validate3CurrencyLimit": true };
    $params['rules'][$amountIntervalName4] = { "required": false, "ValidateCurrencyAmountDecimalPlacesV2_6": true, "ValidateCurrencyAmountUnderOne_6": true, "Validate4CurrencyLimit": true };

    $params['messages'][$amountIntervalName3] = {
        ValidateCurrencyAmountDecimalPlacesV2_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        ValidateCurrencyAmountUnderOne_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        Validate3CurrencyLimit: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistLimit2ErroMsg"); }
    };

    $params['messages'][$amountIntervalName4] = {
        ValidateCurrencyAmountDecimalPlacesV2_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        ValidateCurrencyAmountUnderOne_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        Validate4CurrencyLimit: function () { return ""; }
    };

    var txtBeneficiaryAccountThird = $('[id$=txtBeneficiaryAccountThird_txField]');
    var $txtBeneficiaryAccountThird = txtBeneficiaryAccountThird.attr("name");
    var pattern = new RegExp(/^[a-z0-9]+$/i);

    $params['rules'][$txtBeneficiaryAccountThird] = { "required": false, 'regex2': pattern };
    $params['messages'][$txtBeneficiaryAccountThird] = {
        regex: function () {
            eBankit.Presentation.RemoveCustomValidateMsg(txtBeneficiaryAccountThird);
            eBankit.Presentation.RemoveValidateMsg(txtBeneficiaryAccountThird);
            return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg");
        }
    };

    //#endregion

    //#region [Variables Pending Not Executed]

    var $calendPickerDateName9 = $calendPickerDate9.attr("name");
    var $calendPickerDateName10 = $calendPickerDate10.attr("name");

    var $calendPickerDateName11 = $calendPickerDate11.attr("name");
    var $calendPickerDateName12 = $calendPickerDate12.attr("name");

    $params['rules'][$calendPickerDateName9] = { "required": true, "Validate9DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName10] = { "required": true, "Validate10DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName11] = { "required": true, "Validate11DateLimit": true, "ValidateDateFormat": true };
    $params['rules'][$calendPickerDateName12] = { "required": true, "Validate12DateLimit": true, "ValidateDateFormat": true };

    $params['messages'][$calendPickerDateName9] = {
        Validate9DateLimit: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); }
    };

    $params['messages'][$calendPickerDateName10] = {
        Validate10DateLimit: function () { return ""; },
        ValidateDateFormat: function () { return ""; }
    };

    $params['messages'][$calendPickerDateName11] = {
        Validate11DateLimit: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); }
    };

    $params['messages'][$calendPickerDateName12] = {
        Validate12DateLimit: function () { return ""; },
        ValidateDateFormat: function () { return ""; }
    };

    var $amountIntervalName5 = $amountInterval5.attr("name");
    var $amountIntervalName6 = $amountInterval6.attr("name");

    $params['rules'][$amountIntervalName5] = { "required": false, "ValidateCurrencyAmountDecimalPlacesV2_6": true, "ValidateCurrencyAmountUnderOne_6": true, "Validate5CurrencyLimit": true };
    $params['rules'][$amountIntervalName6] = { "required": false, "ValidateCurrencyAmountDecimalPlacesV2_6": true, "ValidateCurrencyAmountUnderOne_6": true, "Validate6CurrencyLimit": true };

    $params['messages'][$amountIntervalName5] = {
        ValidateCurrencyAmountDecimalPlacesV2_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        ValidateCurrencyAmountUnderOne_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        Validate5CurrencyLimit: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistLimit2ErroMsg"); }
    };

    $params['messages'][$amountIntervalName6] = {
        ValidateCurrencyAmountDecimalPlacesV2_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        ValidateCurrencyAmountUnderOne_6: function () { return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"); },
        Validate6CurrencyLimit: function () { return ""; }
    };

    var txtBeneficiaryAccountNotExecuted = $('[id$=txtBeneficiaryAccountNotExecuted_txField]');
    var $txtBeneficiaryAccountNotExecuted = txtBeneficiaryAccountNotExecuted.attr("name");
    var pattern = new RegExp(/^[a-z0-9]+$/i);

    $params['rules'][$txtBeneficiaryAccountNotExecuted] = { "required": false, 'regex2': pattern };
    $params['messages'][$txtBeneficiaryAccountNotExecuted] = {
        regex: function () {
            eBankit.Presentation.RemoveCustomValidateMsg(txtBeneficiaryAccountNotExecuted);
            eBankit.Presentation.RemoveValidateMsg(txtBeneficiaryAccountNotExecuted);
            return top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg");
        }
    };

    //#endregion

    var validator = $("#aspnetForm").validate($params);

    //#region [Validations Pending]

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

    //#endregion

    //#region [Validations Pending Third]

    jQuery.validator.addMethod("ValidateDateFormat5", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate5.val()) && eBankit.Presentation.InternalValidation($calendPickerDate5.val()); });
    jQuery.validator.addMethod("ValidateDateFormat6", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate6.val()) && eBankit.Presentation.InternalValidation($calendPickerDate6.val()); });

    jQuery.validator.addMethod("Validate5DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate6.val()); });
    jQuery.validator.addMethod("Validate6DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate5.val()); });

    jQuery.validator.addMethod("ValidateDateFormat7", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate7.val()) && eBankit.Presentation.InternalValidation($calendPickerDate7.val()); });
    jQuery.validator.addMethod("ValidateDateFormat8", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate8.val()) && eBankit.Presentation.InternalValidation($calendPickerDate8.val()); });

    jQuery.validator.addMethod("Validate7DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate8.val()); });
    jQuery.validator.addMethod("Validate8DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate7.val()); });


    jQuery.validator.addMethod("Validate3CurrencyLimit", function (value, element) { return eBankit.Presentation.ValidateMaxAmount(value, $amountInterval4.val()); });
    jQuery.validator.addMethod("Validate4CurrencyLimit", function (value, element) { return eBankit.Presentation.ValidateMinAmount(value, $amountInterval3.val()); });

    //#endregion

    //#region [Validations Pending Not Executed]

    jQuery.validator.addMethod("ValidateDateFormat9", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate9.val()) && eBankit.Presentation.InternalValidation($calendPickerDate9.val()); });
    jQuery.validator.addMethod("ValidateDateFormat10", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate10.val()) && eBankit.Presentation.InternalValidation($calendPickerDate10.val()); });

    jQuery.validator.addMethod("Validate9DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate10.val()); });
    jQuery.validator.addMethod("Validate10DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate9.val()); });

    jQuery.validator.addMethod("ValidateDateFormat11", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate11.val()) && eBankit.Presentation.InternalValidation($calendPickerDate11.val()); });
    jQuery.validator.addMethod("ValidateDateFormat12", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate12.val()) && eBankit.Presentation.InternalValidation($calendPickerDate12.val()); });

    jQuery.validator.addMethod("Validate11DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate12.val()); });
    jQuery.validator.addMethod("Validate12DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate11.val()); });


    jQuery.validator.addMethod("Validate5CurrencyLimit", function (value, element) { return eBankit.Presentation.ValidateMaxAmount(value, $amountInterval6.val()); });
    jQuery.validator.addMethod("Validate6CurrencyLimit", function (value, element) { return eBankit.Presentation.ValidateMinAmount(value, $amountInterval5.val()); });

    //#endregion

    jQuery.validator.addMethod("ValidateCurrencyAmountDecimalPlacesV2_6", function (value, element) { if (!eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2(value, 2)) { return false; } else { return true; } });
    jQuery.validator.addMethod("ValidateCurrencyAmountUnderOne_6", function (value, element) { if (!eBankit.Presentation.ValidateCurrencyAmountCultureAllowZero(value, '.')) { return false; } else { return true; } });

    jQuery.validator.addMethod("regex", function (value, element, regexp) {
        eBankit.Presentation.RemoveCustomValidateMsg(txtBeneficiaryAccount);
        eBankit.Presentation.RemoveValidateMsg(txtBeneficiaryAccount);
        return this.optional(element) || regexp.test(value);
    }, top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"));

    jQuery.validator.addMethod("regex2", function (value, element, regexp) {
        eBankit.Presentation.RemoveCustomValidateMsg(txtBeneficiaryAccountThird);
        eBankit.Presentation.RemoveValidateMsg(txtBeneficiaryAccountThird);
        return this.optional(element) || regexp.test(value);
    }, top.eBankit.Presentation.GetResource("amountSearchOpHistDecimalPlacesErroMsg"));

    jQuery.validator.messages.required = top.eBankit.Presentation.GetResource("RequiredField");

    //#region [Actions Pending]

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

    //#endregion

    //#region [Actions Pending Thrid]

    $calendPickerDate5.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate6.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate5.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate5.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate6.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate5.removeClass("error valid");
            $calendPickerDate6.removeClass("error valid");
            $calendPickerDate5.next("label").remove();
            $calendPickerDate6.next("label").remove();
        } else {
            $calendPickerDate5.addClass("error valid");
            $calendPickerDate6.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $calendPickerDate6.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate6.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate5.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate5.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate6.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate5.removeClass("error valid");
            $calendPickerDate6.removeClass("error valid");
            $calendPickerDate5.next("label").remove();
            $calendPickerDate6.next("label").remove();
        } else {
            $calendPickerDate5.addClass("error valid");
            $calendPickerDate6.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $calendPickerDate6.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate5.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate6.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate5.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate6.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate6.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate6.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate6.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate5.removeClass("error valid");
            $calendPickerDate6.removeClass("error valid");
            $calendPickerDate5.next("label").remove();
            $calendPickerDate6.next("label").remove();
        } else {
            $calendPickerDate5.addClass("error valid");
            $calendPickerDate6.addClass("error valid");
            $("#aspnetForm").submit();

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate6.val('');
        }
    });


    $calendPickerDate5.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate6.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate5.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate5.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate6.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate6.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate6.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate5.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate5.removeClass("error valid");
            $calendPickerDate6.removeClass("error valid");
            $calendPickerDate5.next("label").remove();
            $calendPickerDate6.next("label").remove();
        } else {
            $calendPickerDate5.addClass("error valid");
            $calendPickerDate6.addClass("error valid");
            $("#aspnetForm").submit();

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate5.val('');
        }
    });

    $amountInterval3.click(function () {

        if (eBankit.Presentation.ValidateMaxAmount($amountInterval3.val(), $amountInterval4.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval3.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval4.val(), 2)) {
            $amountInterval3.removeClass("error valid");
            $amountInterval4.removeClass("error valid");
            $amountInterval3.next("label").remove();
            $amountInterval4.next("label").remove();
        } else {
            $amountInterval3.addClass("error valid");
            $amountInterval4.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $amountInterval4.click(function () {
        if (eBankit.Presentation.ValidateMaxAmount($amountInterval3.val(), $amountInterval4.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval3.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval4.val(), 2)) {
            $amountInterval3.removeClass("error valid");
            $amountInterval4.removeClass("error valid");
            $amountInterval3.next("label").remove();
            $amountInterval4.next("label").remove();
        } else {
            $amountInterval3.addClass("error valid");
            $amountInterval4.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $amountInterval3.focusout(function () {
        if (eBankit.Presentation.ValidateMaxAmount($amountInterval3.val(), $amountInterval4.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval3.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval4.val(), 2)) {
            $amountInterval3.removeClass("error valid");
            $amountInterval4.removeClass("error valid");
            $amountInterval3.next("label").remove();
            $amountInterval4.next("label").remove();
        } else {
            $amountInterval3.addClass("error valid");
            $amountInterval4.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $amountInterval4.focusout(function () {
        if (eBankit.Presentation.ValidateMaxAmount($amountInterval3.val(), $amountInterval4.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval3.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval4.val(), 2)) {
            $amountInterval3.removeClass("error valid");
            $amountInterval4.removeClass("error valid");
            $amountInterval3.next("label").remove();
            $amountInterval4.next("label").remove();
        } else {
            $amountInterval3.addClass("error valid");
            $amountInterval4.addClass("error valid");

        }
    });

    $calendPickerDate7.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate8.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate7.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate7.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate8.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate7.removeClass("error valid");
            $calendPickerDate8.removeClass("error valid");
            $calendPickerDate7.next("label").remove();
            $calendPickerDate8.next("label").remove();
        } else {
            $calendPickerDate7.addClass("error valid");
            $calendPickerDate8.addClass("error valid");

        }
    });

    $calendPickerDate8.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate8.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate7.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate7.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate8.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate7.removeClass("error valid");
            $calendPickerDate8.removeClass("error valid");
            $calendPickerDate7.next("label").remove();
            $calendPickerDate8.next("label").remove();
        } else {
            $calendPickerDate7.addClass("error valid");
            $calendPickerDate8.addClass("error valid");

        }
    });

    $calendPickerDate8.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate8.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate7.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate7.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate8.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate8.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate8.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate8.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate7.removeClass("error valid");
            $calendPickerDate8.removeClass("error valid");
            $calendPickerDate7.next("label").remove();
            $calendPickerDate8.next("label").remove();
        } else {
            $calendPickerDate7.addClass("error valid");
            $calendPickerDate8.addClass("error valid");

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate8.val('');
        }
    });


    $calendPickerDate7.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate8.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate7.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate7.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate8.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate8.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate8.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate7.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate7.removeClass("error valid");
            $calendPickerDate8.removeClass("error valid");
            $calendPickerDate7.next("label").remove();
            $calendPickerDate8.next("label").remove();
        } else {
            $calendPickerDate7.addClass("error valid");
            $calendPickerDate8.addClass("error valid");

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate7.val('');
        }
    });

    //#endregion

    //#region [Actions Pending Not Executed]

    $calendPickerDate9.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate10.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate9.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate9.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate10.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate9.removeClass("error valid");
            $calendPickerDate10.removeClass("error valid");
            $calendPickerDate9.next("label").remove();
            $calendPickerDate10.next("label").remove();
        } else {
            $calendPickerDate9.addClass("error valid");
            $calendPickerDate10.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $calendPickerDate10.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate10.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate9.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate9.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate10.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate9.removeClass("error valid");
            $calendPickerDate10.removeClass("error valid");
            $calendPickerDate9.next("label").remove();
            $calendPickerDate10.next("label").remove();
        } else {
            $calendPickerDate9.addClass("error valid");
            $calendPickerDate10.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $calendPickerDate10.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate9.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate10.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate9.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate10.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate10.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate10.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate10.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate9.removeClass("error valid");
            $calendPickerDate10.removeClass("error valid");
            $calendPickerDate9.next("label").remove();
            $calendPickerDate10.next("label").remove();
        } else {
            $calendPickerDate9.addClass("error valid");
            $calendPickerDate10.addClass("error valid");
            $("#aspnetForm").submit();

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate10.val('');
        }
    });


    $calendPickerDate9.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate10.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate9.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate9.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate10.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate10.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate10.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate9.removeClass("error valid");
            $calendPickerDate10.removeClass("error valid");
            $calendPickerDate9.next("label").remove();
            $calendPickerDate10.next("label").remove();
        } else {
            $calendPickerDate9.addClass("error valid");
            $calendPickerDate10.addClass("error valid");
            $("#aspnetForm").submit();

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate9.val('');
        }
    });

    $amountInterval5.click(function () {

        if (eBankit.Presentation.ValidateMaxAmount($amountInterval5.val(), $amountInterval6.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval5.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval6.val(), 2)) {
            $amountInterval5.removeClass("error valid");
            $amountInterval6.removeClass("error valid");
            $amountInterval5.next("label").remove();
            $amountInterval6.next("label").remove();
        } else {
            $amountInterval5.addClass("error valid");
            $amountInterval6.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $amountInterval6.click(function () {
        if (eBankit.Presentation.ValidateMaxAmount($amountInterval5.val(), $amountInterval6.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval5.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval6.val(), 2)) {
            $amountInterval5.removeClass("error valid");
            $amountInterval6.removeClass("error valid");
            $amountInterval5.next("label").remove();
            $amountInterval6.next("label").remove();
        } else {
            $amountInterval5.addClass("error valid");
            $amountInterval6.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $amountInterval5.focusout(function () {
        if (eBankit.Presentation.ValidateMaxAmount($amountInterval5.val(), $amountInterval6.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval5.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval6.val(), 2)) {
            $amountInterval5.removeClass("error valid");
            $amountInterval6.removeClass("error valid");
            $amountInterval5.next("label").remove();
            $amountInterval6.next("label").remove();
        } else {
            $amountInterval5.addClass("error valid");
            $amountInterval6.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $amountInterval6.focusout(function () {
        if (eBankit.Presentation.ValidateMaxAmount($amountInterval5.val(), $amountInterval6.val()) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval5.val(), 2) &&
            eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2($amountInterval6.val(), 2)) {
            $amountInterval5.removeClass("error valid");
            $amountInterval6.removeClass("error valid");
            $amountInterval5.next("label").remove();
            $amountInterval6.next("label").remove();
        } else {
            $amountInterval5.addClass("error valid");
            $amountInterval6.addClass("error valid");

        }
    });

    $calendPickerDate11.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate12.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate11.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate11.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate12.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate11.removeClass("error valid");
            $calendPickerDate12.removeClass("error valid");
            $calendPickerDate11.next("label").remove();
            $calendPickerDate12.next("label").remove();
        } else {
            $calendPickerDate11.addClass("error valid");
            $calendPickerDate12.addClass("error valid");

        }
    });

    $calendPickerDate12.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate12.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate11.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate11.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate12.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate11.removeClass("error valid");
            $calendPickerDate12.removeClass("error valid");
            $calendPickerDate11.next("label").remove();
            $calendPickerDate12.next("label").remove();
        } else {
            $calendPickerDate11.addClass("error valid");
            $calendPickerDate12.addClass("error valid");

        }
    });

    $calendPickerDate12.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate12.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate11.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate11.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate12.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate12.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate12.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate12.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate11.removeClass("error valid");
            $calendPickerDate12.removeClass("error valid");
            $calendPickerDate11.next("label").remove();
            $calendPickerDate12.next("label").remove();
        } else {
            $calendPickerDate11.addClass("error valid");
            $calendPickerDate12.addClass("error valid");

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate12.val('');
        }
    });


    $calendPickerDate11.focusout(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate12.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate11.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate11.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate12.val(), dateJSFormat));
        var firstDate = eBankit.dateJS.formatDate($calendPickerDate12.datepicker("getStartDate"), dateJSFormat);
        var lastDate = eBankit.dateJS.formatDate($calendPickerDate12.datepicker("getEndDate"), dateJSFormat);
        var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
        var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
        var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate11.val(), dateJSFormat);

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate11.removeClass("error valid");
            $calendPickerDate12.removeClass("error valid");
            $calendPickerDate11.next("label").remove();
            $calendPickerDate12.next("label").remove();
        } else {
            $calendPickerDate11.addClass("error valid");
            $calendPickerDate12.addClass("error valid");

        }
        if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
            $calendPickerDate11.val('');
        }
    });

    //#endregion
};

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01811.EndRequest);


$(document).ready(function () {
    eBankit.Presentation.TRX01811.EndRequest();
    eBankit.Presentation.TRX01811.AddLabelToCheckboxes();
});

function pageLoad() {
    eBankit.Presentation.TRX01811.AddLabelToCheckboxes();
}

function HideBulkButtons() {

    var btnUp = $('[id$=DivBulkButtonsUp]');
    var btnDown = $('[id$=DivBulkButtonsDown]');
    var infodiv = $('[id$=infoDivPendingCounterMessage]');
    btnUp.css("display", "none");
    btnDown.css("display", "none");
    infodiv.css("display", "none");
}

function ShowBulkButtons() {

    var btnUp = $('[id$=DivBulkButtonsUp]');
    var btnDown = $('[id$=DivBulkButtonsDown]');
    var infodiv = $('[id$=infoDivPendingCounterMessage]');
    btnUp.css("display", "block");
    btnDown.css("display", "block");
    infodiv.css("display", "block");
}

String.prototype.format = function (args) {
    var newStr = this;
    for (var key in args) {
        newStr = newStr.replace('{' + key + '}', args[key]);
    }
    return newStr;
}

eBankit.Presentation.TRX01811.AddLabelToCheckboxes = function () {
    $('input[id*=cbSelected_]').each(function (index) {
        var ariaLabel = "";
        $(this).parent().parent().siblings('div').children().children().each(function (index) {
            var thisP = $(this)[0];
            if (thisP.className !== "action-buttons") {
                if (thisP.classList.contains('key')) {
                    ariaLabel += thisP.innerText + ": ";
                }
                else {
                    ariaLabel += thisP.innerText + ". ";
                }
            }
        });
        $(this)[0].ariaLabel = ariaLabel;
        $(this)[0].tabIndex = "0";
    });

    $("[id*=pendingOperationImageThird_]").each(function (index) {
        var ariaLabel = "";
        $(this).parent().parent().siblings('div').children().children().each(function (index) {
            var thisP = $(this)[0];
            if (thisP.className !== "action-buttons") {
                if (thisP.classList.contains('key')) {
                    ariaLabel += thisP.innerText + ": ";
                }
                else {
                    ariaLabel += thisP.innerText + ". ";
                }
            }
        });
        $(this)[0].ariaLabel = ariaLabel;
        $(this)[0].tabIndex = "0";
    });

    $("[id*=pendingOperationImageExpires_]").each(function (index) {
        var ariaLabel = "";
        $(this).parent().parent().parent().siblings('div').children().children().each(function (index) {
            var thisP = $(this)[0];
            if (thisP.className !== "action-buttons") {
                if (thisP.classList.contains('key')) {
                    ariaLabel += thisP.innerText + ": ";
                }
                else {
                    ariaLabel += thisP.innerText + ". ";
                }
            }
        });
        $(this)[0].ariaLabel = ariaLabel;
        $(this)[0].tabIndex = "0";
    });


    
    
}