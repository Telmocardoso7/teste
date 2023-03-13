var tbCollateralValue = $("input[id*='tbCollateralValue']");
var tbLoanAmount = $("input[id*='tbLoanAmount']");
var tbBalloonPayment = $("input[id*='tbBalloonPayment']");
var tbInitialPayment = $("input[id*='tbInitialPayment']");
var hdnmaxBallonVar = $("input[id*='hdnmaxBallonVar']");
var hdnmaxInitialVar = $("input[id*='hdnmaxInitialVar']");

var jsonObj;
var prm = Sys.WebForms.PageRequestManager.getInstance();

prm.add_endRequest(function () {
    
    if ($("input[id$='hdnSelectedLoanProduct']").val() != undefined) {
        jsonObj = JSON.parse($("input[id$='hdnSelectedLoanProduct']").val());
    }
});

//add required star
$(document).ready(function () {
    
    if ($("input[id$='hdnSelectedLoanProduct']").val() != undefined) {
        jsonObj = JSON.parse($("input[id$='hdnSelectedLoanProduct']").val());
    }

    $('#aspnetForm').keypress(function (e) {
        if (e.keyCode == '13') {
            var btnNext = $("a[id*='btnNextFlowItem']").attr('id');
            var defaultValidation = eBankit.Presentation.TRX00514158.ValidateForm();
            var customValidation = eBankit.Presentation.TRX00154.ValidateCustom();

            if (customValidation && defaultValidation) {
                document.getElementById(btnNext).click();

            }
            return false;
        }
    });

    $("a[id*='btnNextFlowItem']").click(function (e) {
        $("input").blur();
        $("textarea").blur();
    });
});



$(document).on('blur', "input[id*='tbLoanAmount']", function () {
    //if method return error leave it, and don't continue with validation
    if (monitorDependence($(this))) {

        controlLoanAmountRange(jsonObj.LoanAmountMin, jsonObj.LoanAmountMax);
    }
});

$(document).on('blur', "input[id*='tbCollateralValue']", function () {

    monitorDependence($(this));
});

$(document).on('blur', "input[id*='tbBalloonPayment']", function () {

    controlBalloonAmountRange();
});

$(document).on('blur', "input[id*='tbLoanDuration']", function () {

    controlLoanDuration();
});

$(document).on('blur', "input[id*='tbInterestOnlyPeriod']", function () {

    controlGracePeriod();
});

$(document).on('blur', "input[id*='tbInitialPayment']", function () {

    controlInitialPayment();
});

function monitorDependence(elem) {
    var ret = true;
    if ($("input[id*='tbCollateralValue']").length && $("input[id*='tbCollateralValue']").val() != undefined) {
        if ($("input[id*='tbCollateralValue']").val() != '' && $("input[id*='tbLoanAmount']").val() != '') {

            if (parseCurrency($("input[id*='tbCollateralValue']").val(), numberDecimalSeparator, numberGroupSeparator) > 0 && parseCurrency($("input[id*='tbCollateralValue']").val(), numberDecimalSeparator, numberGroupSeparator) < parseCurrency($("input[id*='tbLoanAmount']").val(), numberDecimalSeparator, numberGroupSeparator)) {
                eBankit.Presentation.InsertValidateMsg(elem, top.eBankit.Presentation.GetResource("InvalidValueColateral"));
                ret = false;
            }
            else {
                eBankit.Presentation.RemoveValidateMsg(tbCollateralValue);
                eBankit.Presentation.RemoveValidateMsg(tbLoanAmount);
            }
        }
        else {
            eBankit.Presentation.RemoveValidateMsg(elem);
        }
    }
    if ( $("input[id*='tbCollateralValue']").val() == '') {
        eBankit.Presentation.InsertValidateMsg(elem, '');
    }
    return ret;
}

eBankit.Presentation.TRX00154 = {}

//// VALIDATE FORM FIELDS
eBankit.Presentation.TRX00154.ValidateCustom = function () {
    var ret = true;
    var tbCollateralValue = $("input[id*='tbCollateralValue']");
    var tbLoanAmount = $("input[id*='tbLoanAmount']");

    //control of relation between colateral and loan amount, colateral should be higher than loan amount
    if (tbCollateralValue.length && tbCollateralValue.val() != undefined) {
        if (tbCollateralValue.val() != '' && tbLoanAmount.val() != '' && parseCurrency(tbCollateralValue.val(), numberDecimalSeparator, numberGroupSeparator) > 0) {
            if (parseCurrency(tbCollateralValue.val(), numberDecimalSeparator, numberGroupSeparator) < parseCurrency(tbLoanAmount.val(), numberDecimalSeparator, numberGroupSeparator)) {
                eBankit.Presentation.InsertValidateMsg(tbCollateralValue, top.eBankit.Presentation.GetResource("InvalidValueColateral"));
                ret = false;
            }
            else {
                eBankit.Presentation.RemoveValidateMsg(tbCollateralValue);
            }
        }
        else {
            eBankit.Presentation.RemoveValidateMsg(tbCollateralValue);
        }
    }

    //get json from hidden field to get values of selected product
    var jsonObj = JSON.parse($("input[id$='hdnSelectedLoanProduct']").val());


    if (!controlLoanAmountRange(jsonObj.LoanAmountMin, jsonObj.LoanAmountMax)) {
        ret = false;
    }

    if (!controlBalloonAmountRange()) {
        ret = false;
    }

    if (!controlLoanDuration()) {
        ret = false;
    }

    if (!controlGracePeriod()) {
        ret = false;
    }

    if (!controlInitialPayment()) {
        ret = false;
    }

    return ret;
}

//control of loan amount range
controlLoanAmountRange = function (LoanAmountMin, LoanAmountMax) {
    var ret = true;
    if ($("input[id*='tbLoanAmount']").val() != '') {
        if (checkIfInRange(LoanAmountMin, LoanAmountMax, $("input[id*='tbLoanAmount']").val())) {
            eBankit.Presentation.RemoveValidateMsg($("input[id*='tbLoanAmount']"));
        }
        else {
            eBankit.Presentation.InsertValidateMsg($("input[id*='tbLoanAmount']"), top.eBankit.Presentation.GetResource("InvalidRangeValue").concat(LoanAmountMax).concat(top.eBankit.Presentation.GetResource("InvalidRangeValue2")).concat(LoanAmountMin));
            ret = false;
        }
    }
    else {
        eBankit.Presentation.RemoveValidateMsg($("input[id*='tbLoanAmount']"));
        eBankit.Presentation.InsertValidateMsg($("input[id*='tbLoanAmount']"), "");
    }
    return ret;
}

//control of ballon amount
controlBalloonAmountRange = function () {
    var ret = true;
    if ($("[id*='tbBalloonPayment']").length && hdnmaxBallonVar.length) {
        //control of relative max amount for ballon payment
		var ballonPaymentProductValue = $("input[id*='hdnmaxBallonVar']").val();
		if(ballonPaymentProductValue.indexOf('.') > -1)
			ballonPaymentProductValue = ballonPaymentProductValue.replace('.',',');
	
        if ($("input[id*='tbBalloonPayment']").val() != '' && ballonPaymentProductValue != '') {
			var loanAmount = parseCurrency($("input[id*='tbLoanAmount']").val(), numberDecimalSeparator, numberGroupSeparator);
			var ballonPaymentProductMax = parseCurrency(ballonPaymentProductValue, numberDecimalSeparator, numberGroupSeparator) / 100;
            var balloonPaymentRelativeMax = eval(loanAmount * ballonPaymentProductMax);
            var ballonPaymentInput = parseCurrency($("input[id*='tbBalloonPayment']").val(), numberDecimalSeparator, numberGroupSeparator);
			if ( ballonPaymentInput > balloonPaymentRelativeMax) {
                eBankit.Presentation.InsertValidateMsg($("input[id*='tbBalloonPayment']"), top.eBankit.Presentation.GetResource("InvalidBallonValue").concat(balloonPaymentRelativeMax));
                ret = false;
            }
                //control of fixed range for balloon amount
            else if (!checkIfInRange(jsonObj.LoanBalloonPaymentFixedMin, jsonObj.LoanBalloonPaymentFixedMax, $("input[id*='tbBalloonPayment']").val())) {
                eBankit.Presentation.InsertValidateMsg($("input[id*='tbBalloonPayment']"), top.eBankit.Presentation.GetResource("InvalidRangeValue").concat(jsonObj.LoanBalloonPaymentFixedMax).concat(top.eBankit.Presentation.GetResource("InvalidRangeValue2")).concat(jsonObj.LoanBalloonPaymentFixedMin));
                ret = false;
            }
            else {
                eBankit.Presentation.RemoveValidateMsg($("input[id*='tbBalloonPayment']"));
            }
        }
    }
    return ret;
}

//control of loan duration range
controlLoanDuration = function () {
    var ret = true;
    if ($("[id*='tbLoanDuration']").length && $("[id*='tbLoanDuration']").val() != undefined) {
        if ($("input[id*='tbLoanDuration']").val() != '') {
            var regex = /^[0-9]{1,2}$/;
            //check if input is number
            if (!regex.test($("input[id*='tbLoanDuration']").val())) {
                eBankit.Presentation.InsertValidateMsg($("input[id*='tbLoanDuration']"), top.eBankit.Presentation.GetResource("InvalidAmout"));
                ret = false;
            }
            else {
                eBankit.Presentation.RemoveValidateMsg($("input[id*='tbLoanDuration']"));

                if (!checkIfInRange(jsonObj.LoanDurationMin, jsonObj.LoanDurationMax, $("input[id*='tbLoanDuration']").val())) {
                    eBankit.Presentation.InsertValidateMsg($("input[id*='tbLoanDuration']"), top.eBankit.Presentation.GetResource("InvalidRangeValue").concat(jsonObj.LoanDurationMin).concat(top.eBankit.Presentation.GetResource("InvalidRangeValue2")).concat(jsonObj.LoanDurationMax));
                    ret = false;

                }
                else {
                    eBankit.Presentation.RemoveValidateMsg($("input[id*='tbLoanDuration']"));
                }
            }
        }
        else {
            eBankit.Presentation.InsertValidateMsg($("input[id*='tbLoanDuration']"), top.eBankit.Presentation.GetResource("FillData"));
            ret = false;
        }
    }
    return ret;
}

//control of grace period
controlGracePeriod = function () {
    var ret = true;
    if ($("[id*='tbInterestOnlyPeriod']").length && $("[id*='tbInterestOnlyPeriod']").val() != undefined) {
        if ($("input[id*='tbInterestOnlyPeriod']").val() != '') {

            var regex = /^[0-9]{1,2}$/;
            //check if input is number
            if (!regex.test($("input[id*='tbInterestOnlyPeriod']").val())) {
                eBankit.Presentation.InsertValidateMsg($("input[id*='tbInterestOnlyPeriod']"), top.eBankit.Presentation.GetResource("InvalidAmout"));
                ret = false;
            }
            else {
                if (!checkIfInRange(jsonObj.LoanGracePeriodMin, jsonObj.LoanGracePeriodMax, $("input[id*='tbInterestOnlyPeriod']").val())) {

                    eBankit.Presentation.InsertValidateMsg($("input[id*='tbInterestOnlyPeriod']"), top.eBankit.Presentation.GetResource("InvalidRangeValue").concat(jsonObj.LoanGracePeriodMin).concat(top.eBankit.Presentation.GetResource("InvalidRangeValue2")).concat(jsonObj.LoanGracePeriodMax));
                    ret = false;
                }
                else {
                    eBankit.Presentation.RemoveValidateMsg($("input[id*='tbInterestOnlyPeriod']"));
                }
            }
        }
        else {
            eBankit.Presentation.InsertValidateMsg($("input[id*='tbInterestOnlyPeriod']"), top.eBankit.Presentation.GetResource("FillData"));
            ret = false;
        }
    }
    return ret;
}

//control of initial payment amount
controlInitialPayment = function () {
    var ret = true;
    if ($("[id*='tbInitialPayment']").length && hdnmaxInitialVar.length) {
        //control if amount is less than relative inital amount
        if ($("input[id*='tbInitialPayment']").val() != '' && $("input[id*='hdnmaxInitialVar']").val() != '') {
            var initialPaymentRelativeMax = eval(parseCurrency($("input[id*='tbLoanAmount']").val(), numberDecimalSeparator, numberGroupSeparator) * (parseCurrency($("input[id*='hdnmaxInitialVar']").val(), numberDecimalSeparator, numberGroupSeparator) / 100));
            if (parseCurrency($("input[id*='tbInitialPayment']").val(), numberDecimalSeparator, numberGroupSeparator) > parseCurrency(initialPaymentRelativeMax, numberDecimalSeparator, numberGroupSeparator)) {
                eBankit.Presentation.InsertValidateMsg($("input[id*='tbInitialPayment']"), top.eBankit.Presentation.GetResource("InvalidInitialValue").concat(initialPaymentRelativeMax));
                ret = false;
            }
                //control if amount is in fixed range, between fix max and min
            else if (!checkIfInRange(jsonObj.LoanInitialPaymentFixedMin, jsonObj.LoanInitialPaymentFixedMax, $("input[id*='tbInitialPayment']").val())) {

                eBankit.Presentation.InsertValidateMsg($("input[id*='tbInitialPayment']"), top.eBankit.Presentation.GetResource("InvalidRangeValue").concat(jsonObj.LoanInitialPaymentFixedMax).concat(top.eBankit.Presentation.GetResource("InvalidRangeValue2")).concat(jsonObj.LoanInitialPaymentFixedMin));
                ret = false;

            }
            else {
                eBankit.Presentation.RemoveValidateMsg($("input[id*='tbInitialPayment']"));
            }
        }
    }
    return ret;
}

//check wheter value exists in range
checkIfInRange = function (min, max, value) {
    var result = true;
    if (parseCurrency(min, numberDecimalSeparator, numberGroupSeparator) > parseCurrency(value, numberDecimalSeparator, numberGroupSeparator) || parseCurrency(value, numberDecimalSeparator, numberGroupSeparator) > parseCurrency(max, numberDecimalSeparator, numberGroupSeparator)) {
        result = false;
    }
    return result;

}