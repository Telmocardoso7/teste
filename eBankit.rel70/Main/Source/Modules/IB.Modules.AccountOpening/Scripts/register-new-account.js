eBankit.Presentation.RegisterAccount = {}

var txtPhone = $("input[id*='txtPhone']");
var txtPhoneAlternative = $("input[id*='txtPhoneAlternative']");
var hdnMinAgeOfHolder = $("[id*='hdnMinAgeOfHolder']");

eBankit.Presentation.RegisterAccount.ValidateRegister = function () {
    var ret = true;

    ///VALIDATE INPUTS
    $("strong.req").parent().parent().next(".centerField-wrapper.req").children().children().each(function () {
        if (!AddRequiredFieldValidator($(this))) {
            ret = false;
        }
    });

    /*
    $('.centerField-wrapper.req').children().children().each(function () {
        if (!AddRequiredFieldValidator($(this))) {
            ret = false;
        }
    });
    */

    //validate min age of first holder
    if (hdnMinAgeOfHolder.val() != '') {
        if ($("[id*='dtDateBirth_0']").length) {
            var elem = $("input[id*='dtDateBirth_0']");

            if ($("input[id*='dtDateBirth_0']").val() == '') {
                eBankit.Presentation.InsertValidateMsg($("input[id*='dtDateBirth_0']"), top.eBankit.Presentation.GetResource("RequiredField"));
                ret = false;
            }
            else {

                eBankit.Presentation.RemoveValidateMsg($("input[id*='dtDateBirth_0']"));
                   
                //var from = $("input[id*='dtDateBirth_0']").val().split("-");
                //var chosenDate = new Date(from[2], from[1] - 1, from[0]);
                var from = $("input[id*='dtDateBirth_0']").val();
                var chosenDate = eBankit.Presentation.RegisterAccount.toDateWithFormat(from, dateJSFormat)

                var now = new Date();
                var maxDate =  new Date();
                maxDate.setFullYear(now.getFullYear() - hdnMinAgeOfHolder.val());

                if (chosenDate > maxDate) {
                    eBankit.Presentation.InsertValidateMsg($("input[id*='dtDateBirth_0']"), top.eBankit.Presentation.GetResource("InvalidDateTimeMsgMinAgeHolder").replace("{0}", hdnMinAgeOfHolder.val()));
                    ret = false;
                }
                else {
                    eBankit.Presentation.RemoveValidateMsg($("input[id*='dtDateBirth_0']"));
                }
            }
            
        }
    }

    //dates of birth and emission document date should be later than today
    $("input[id*='dtDateBirth_1'], input[id*='dtDateBirth_2'], input[id*='dtDateBirth_3'], input[id*='dtEmmisionDocument']").each(function (index) {
        var elem = $(this);
        if (elem.val() == '') {
            eBankit.Presentation.InsertValidateMsg(elem, top.eBankit.Presentation.GetResource("RequiredField"));
            ret = false;
        }
        else {
            eBankit.Presentation.RemoveValidateMsg(elem);

            //var from = $(this).val().split("-");
            //var chosenDate = new Date(from[2], from[1] - 1, from[0]);
            var from = $(this).val();
            var chosenDate = eBankit.Presentation.RegisterAccount.toDateWithFormat(from, dateJSFormat)

            var now = new Date();
            if (chosenDate > now) {
                eBankit.Presentation.InsertValidateMsg(elem, top.eBankit.Presentation.GetResource("InvalidDateTimeMsg"));
                ret = false;
            }
            else {
                eBankit.Presentation.RemoveValidateMsg(elem);
            }
        }
    });

    // date of document expiration should be after current datetime
    $("input[id*='DateExpiredDocument']").each(function (index) {
        var elem = $(this);
        if (elem.val() == '') {
            eBankit.Presentation.InsertValidateMsg(elem, top.eBankit.Presentation.GetResource("RequiredField"));
            ret = false;
        }
        else {
            eBankit.Presentation.RemoveValidateMsg(elem);
            //var from = $(this).val().split("-");
            //var chosenDate = new Date(from[2], from[1] - 1, from[0]);
            var from = $(this).val();
            var chosenDate = eBankit.Presentation.RegisterAccount.toDateWithFormat(from, dateJSFormat)

            var now = new Date();

            if (chosenDate < now) {
                eBankit.Presentation.InsertValidateMsg(elem, top.eBankit.Presentation.GetResource("InvalidDateTimeMsg"));
                ret = false;
            }

            else {
                eBankit.Presentation.RemoveValidateMsg(elem);
            }
        }
    });
    
    if ($("[id*='txtNifNumber']").length && !IsValidNIF($("[id*='txtNifNumber']").val())) {
            eBankit.Presentation.InsertValidateMsg(txtTaxID, top.eBankit.Presentation.GetResource("InvalidNIF")); 
            ret = false;
        }
    //if ($("[id*='txtNifNumber']").length && !IsDocumentNrValid($("[id*='txtNifNumber']").val())) {
    //}
    if ($("input[id*='txtPhone']").length && $("input[id*='txtPhone']").val() != '' && !isPhone($("input[id*='txtPhone']").val()))
    {
        eBankit.Presentation.InsertValidateMsg($("input[id*='txtPhone']"), top.eBankit.Presentation.GetResource("InvalidPhone")); ret = false;
    }
    if ($("input[id*='txtEmail']").length && !isEmail($("input[id*='txtEmail']").val())) {
        eBankit.Presentation.InsertValidateMsg($("input[id*='txtEmail']"), top.eBankit.Presentation.GetResource("InvalidEmail")); ret = false;
    }

    var hdnHoldersOpt = $("[id*='hdnSelectedHolderOption']");
    if (hdnHoldersOpt.length && $("[id*='hdnSelectedHolderOption']").val() == "1")
    {
        if (!AddRequiredFieldValidator($("[id*='numberOfHolders']"))) {
            ret = false;
        }

        if (parseInt($("[id*='numberOfHolders']").val()) > 4) {
            eBankit.Presentation.InsertValidateMsg($("[id*='numberOfHolders']"), top.eBankit.Presentation.GetResource("MaxHoldersExceeded"));
            ret = false;
        }
    }

    //if there is an error 
    if (ret == false)
    {
        var flagUnvisibleError = false;
        //search for all tabs for holders
        $("div[id*='entityData']").each(function () {
           
            //and find that which is active
            if ($(this).css("display") == "block" && $(this).find(".has-error").length == 0 && !flagUnvisibleError) {
                //if there is no error in that tab and it's some error it's means it's in other tabs
                //so get out from loop foreach and find where is it
                flagUnvisibleError = true;
                return false;
            }

        });
        if (flagUnvisibleError) {
            $("[id*='entityData']").each(function () {
                if ($(this).css("display") == "none" && $(this).find(".has-error").length) {
                    var idElem = $(this).attr("id");
                    var activeTabNum = idElem.substr(idElem.length - 1);
                    var btnActive = $("[id*='tabCollateralizedDetail_" + activeTabNum + "']");
                    SelectTab(btnActive, activeTabNum);
                    return false;
                }
            });
        }
    }
    return ret;
}

function isPhone(phone) {
   phone = phone.replace(/\s/g, '');
    //var regex = /^([+])+(([0-9]{12,18}))+$/;
   var regex = /^([+])+(([0-9]{8,18}))+$/;
    return regex.test(phone);
}
function isEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

function AddRequiredFieldValidator(controlElement) {
    var v = true;
    
        if (controlElement.is("input") && controlElement.val() == '') {
            eBankit.Presentation.InsertValidateMsg(controlElement, top.eBankit.Presentation.GetResource("RequiredField"));
            v = false;
        }
        else if (controlElement.is("select") && $("option:selected", controlElement).val() == '')
        {
            eBankit.Presentation.InsertValidateMsg(controlElement, top.eBankit.Presentation.GetResource("RequiredField"));
            v = false;
        }
    else if (controlElement.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(controlElement);
        controlElement.popover('hide');
    }

    return v;
}

function IsValidNIF(nif) {
    //var c;
    //var checkDigit = 0;
    ////Check if is not null, is numeric and if has 9 numbers
    //if (nif != null && IsNumeric(nif) && nif.length == 9) {
    //    //Get the first number of NIF
    //    c = nif.charAt(0);
    //    //Check firt number is (1, 2, 5, 6, 8 or 9)
    //    if (c == '1' || c == '2' || c == '5' || c == '6' || c == '8' || c == '9') {
    //        //Perform CheckDigit calculations
    //        checkDigit = c * 9;
    //        var i = 0;
    //        for (i = 2; i <= 8; i++) {
    //            checkDigit += nif.charAt(i - 1) * (10 - i);
    //        }
    //        checkDigit = 11 - (checkDigit % 11);
    //        //if checkDigit is higher than ten set it to zero
    //        if (checkDigit >= 10)
    //            checkDigit = 0;
    //        //Compare checkDigit with the last number of NIF
    //        //If equal the NIF is Valid.
    //        if (checkDigit == nif.charAt(8))
    //            return true;
    //    }
    //}
    //return false;
    return true;
}


eBankit.Presentation.RegisterAccount.toDateWithFormat = function (date, format)
{
    return new Date(eBankit.dateJS.getDateFromFormat(date, format));
}


eBankit.Presentation.RegisterAccount.toDate = function (date) {
    var arr = date.split("-");
    return new Date(arr[2], arr[1] - 1, arr[0]);
}

function IsDocumentNrValid(nr) {
    var ret = true;
    //var dtIDValidate = $('[id$=dtIDValidate_txField]');
    //var dtPassport = $('[id*=DateExpiredDocument]');
    var docType = $('select[id*=ddlDocumentType');
    if (docType.length) {

        var dtValidate = $('input[id*=DateExpiredDocument');
        var d = new Date();

        //var dID = eBankit.Presentation.RegisterAccount.toDate(dtValidate.val());
        var dID = eBankit.Presentation.RegisterAccount.toDateWithFormat(dtValidate.val(), dateJSFormat);

        //var dPassport = eBankit.Presentation.Register2.toDate(dtPassport.val());

        var dNow = eBankit.Presentation.RegisterAccount.toDate(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate());

        if (dID != '' && dID < dNow) {
            eBankit.Presentation.InsertValidateMsg(dtIDValidate, top.eBankit.Presentation.GetResource("dtIDDateErroMsg"));
            ret = false;
        }
        else {
            eBankit.Presentation.RemoveValidateMsg(dtValidate);
        }

        if ($("option:selected", docType).val() == 'BI')
        {
        }
        else if ($("option:selected", docType).val() == 'CRE') {
        }
        if ( $("option:selected", docType).val() == 'CD') {
        }
        if ($("option:selected", docType).val() == 'PA') {
            if (/^[0-9]{9}[vVxX]$/.test(nr)) {
                return false;
            } else {
                return true;
            };
        }
    }
    return ret;
}

eBankit.Presentation.RegisterAccount.HideElement = function (elementClass) {
    $('.' + elementClass).each(function (index) {
        $(this).hide();
    });
}

eBankit.Presentation.RegisterAccount.ShowElement = function (elementClass) {
    $('.' + elementClass).each(function (index) {
        $(this).show();
    });
}

eBankit.Presentation.RegisterAccount.ToogleGender = function (radioValue, hiddenFieldId) {
    var hdnGenderRadio = $('#' + hiddenFieldId);
    hdnGenderRadio.val(radioValue);
}

eBankit.Presentation.RegisterAccount.Toogle = function (radioValue, hiddenFieldId) {
    var radio = $('#' + hiddenFieldId);
    radio.val(radioValue);
}

eBankit.Presentation.RegisterAccount.SetVisibility = function (visibility, elementClass) {
    $('.' + elementClass).each(function (index) {
        $(this).css('visibility', visibility);
    });
}

eBankit.Presentation.RegisterAccount.CheckRadioList = function (radiolist) {
    $("#" + radiolist + " input[value=Y]").prop('checked', true);
    $("#" + radiolist + " input[value=N]").prop('checked', false);
}

eBankit.Presentation.RegisterAccount.UnCheckRadioList = function (radiolist) {
    $("#" + radiolist + " input[value=Y]").prop('checked', false);
    $("#" + radiolist + " input[value=N]").prop('checked', true);
}

eBankit.Presentation.RegisterAccount.SetInitPhoneNumber = function (indicative) {
    if (!$("input[id*='txtPhone']").val()) {
        $("input[id*='txtPhone']").val(indicative + " ");
    }
}

eBankit.Presentation.RegisterAccount.SetInitPhoneAlternativeNumber = function (indicative) {
    if (!$("input[id*='txtPhoneAlternative']").val()) {
        $("input[id*='txtPhoneAlternative']").val(indicative + " ");
    }
}

eBankit.Presentation.RegisterAccount.InsertMask = function (element, maskvalue) {
    $("#" + element).mask(maskvalue);
}

loadPhoneInputs = function (indicative) {

    eBankit.Presentation.RegisterAccount.SetInitPhoneNumber(indicative);
    eBankit.Presentation.RegisterAccount.SetInitPhoneAlternativeNumber(indicative);

    /*
    txtPhone.mask(mask, {
        placeholder: indicative + " _____ _____ _____"
    });

    txtPhoneAlternative.mask(mask, {
        placeholder: indicative + " _____ _____ _____"
    });
    */

    /*
    $("input[id*='txtPhone']").keypress(function (e) {
        return isNumber(e, this) || e.keyCode == 43;
    });

    $("input[id*='txtPhoneAlternative']").keypress(function (e) {
        return isNumber(e, this) || e.keyCode == 43;
    });
    */
}

setDefaulValue = function (isClear, elem)
{
    if (hdnMinAgeOfHolder.val() != '' && elem.length) {

        var maxDate = new Date();
        var now = new Date();
        maxDate.setFullYear(now.getFullYear() - hdnMinAgeOfHolder.val());
        elem.datepicker('setValue', maxDate);
        if (isClear) {
            elem.val('');
        }

    }
}

setDefaulValueAll = function () {
    if (hdnMinAgeOfHolder.val() != '' && $("input[id*='dtDateBirth']").length) {

        var maxDate = new Date();
        var now = new Date();
        maxDate.setFullYear(now.getFullYear() - hdnMinAgeOfHolder.val());
        $("input[id*='dtDateBirth']").datepicker('setValue', maxDate);

        $("input[id*='dtDateBirth']").val('');


    }
}


loadSlider = function () {
    var txtAmount = $("[id*='txtAmount']");

    var stepLoanAmount = 1;
    var currProvisingAmount = $("[id*='txtAmount']").val();
    var minProvisingAmount = parseFloat('0,00');
    var maxProvisingAmount = parseFloat('9999,99');

    CreateSlider(txtAmount, "#sliderProvisingAmount", currProvisingAmount, minProvisingAmount, maxProvisingAmount, stepLoanAmount);
}

CreateSlider = function (targetObj, sliderId, cur, min, max, step) {

    $(sliderId).slider({
        range: "min",
        value: cur,
        min: min,
        max: max,
        step: step,
        //change: function (event, ui) {

        //},
        slide: function (event, ui) {
            targetObj.val(ui.value + "€");
        },
        create: function (event, ui) {
            targetObj.val(cur + "€");
        }
    });

    //targetObj.val(cur);

    targetObj.focus(function () {
        //targetObj.select();
    });

    targetObj.keypress(function (evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        return !(charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57));
    });

    targetObj.change(function () {
        if (targetObj.val().replace("€", "") < $(sliderId).slider("option", "min")) {
            $(sliderId).slider({ value: $(sliderId).slider("option", "min") });
            targetObj.val($(sliderId).slider("option", "min") + "€");
        }

        if (targetObj.val().replace("€", "") <= $(sliderId).slider("option", "max")) {
            $(sliderId).slider({ value: targetObj.val().replace("€", "") });
        }
        else {
            $(sliderId).slider({ value: $(sliderId).slider("option", "max") });
            targetObj.val($(sliderId).slider("option", "max") + "€");
        }
    });
}

SelectDepositTypeByElement = function (elem) {

    $(".chosenNrHolders").each(function () {
        $(this).removeClass("chosenNrHolders");
        $(this).text("");
    });

    $(elem).addClass("chosenNrHolders");
    $(elem).html("&#10003");

    $("[id*='hdnDepositType']").val($(elem).attr("data-value"));
}

SelectDepositTypeByValue = function (datavalue) {

    var elem = $(".tickChosen[data-value='" + datavalue + "']");

    $(".chosenNrHolders").each(function () {
        $(this).removeClass("chosenNrHolders");
        $(this).text("");
    });

    $(elem).addClass("chosenNrHolders");
    $(elem).html("&#10003");
}


AddAmount = function () {
    var amount = parseInt($("[id*='txtAmount']").val().replace("€", "")) + 1;
    $("[id*='txtAmount']").val(amount + "€");
}

RemoveAmount = function () {
    var amount = parseInt($("[id*='txtAmount']").val().replace("€", "")) - 1;
    $("[id*='txtAmount']").val(amount + "€");
}

PrepareInvalidControls = function () {

    var inputTextControls = "input[type=text].has-error";

    $(inputTextControls).keypress(function (e) {
        eBankit.Presentation.RemoveValidateMsg($(this));
    });

    var selectControls = "select.has-error";

    $(selectControls).change(function (e) {
        eBankit.Presentation.RemoveValidateMsg($(this));
    });
}

OnlinePassCheck = function(){

    var pass = $("input[id*='txtPassword']");
    var confirmpass = $("input[id*='txtPasswordConfirm']");


    eBankit.Presentation.RemoveValidateMsg(pass);
    eBankit.Presentation.RemoveValidateMsg(confirmpass);

    if (pass.val() == '') {
        eBankit.Presentation.InsertValidateMsg(pass, top.eBankit.Presentation.GetResource("RequiredField"));
         if (confirmpass.val() == '') {
            eBankit.Presentation.InsertValidateMsg(confirmpass, top.eBankit.Presentation.GetResource("RequiredField")); 
         }
        return false;
    }

    if (confirmpass.val() == '') {
        eBankit.Presentation.InsertValidateMsg(confirmpass, top.eBankit.Presentation.GetResource("RequiredField"));
        return false;
    }
    

    if(pass.val().length !=7 || confirmpass.val().length !=7){
        //TODO
        //Escrever mensagem de erro tamanho diferente de 7
        eBankit.Presentation.InsertValidateMsg(pass.val().length != 7 ? pass : confirmpass, top.eBankit.Presentation.GetResource("InvalidLengthMsg"));
        return false;

    }

    if(pass.val() != confirmpass.val()){
        //TODO
        // Escrever mensagem de erro no match
        eBankit.Presentation.InsertValidateMsg(confirmpass, top.eBankit.Presentation.GetResource("NoMatchPasswordsMsg"));
        return false;
    }

    return true;
}

    


