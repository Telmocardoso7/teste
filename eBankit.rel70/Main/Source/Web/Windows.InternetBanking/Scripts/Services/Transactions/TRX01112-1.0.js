
eBankit.Presentation.TRX01112 = {};


eBankit.Presentation.TRX01112.EndRequest = function () {

    //PREVENT WHITE SPACES ON OLD PASSWORD INPUT
    txtoldKey.on("keydown", eBankit.Presentation.TRX01112.PwdCheckSpacesEvent);

    //PREVENT WHITE SPACES ON NEW PASSWORD INPUT
    txtnewKey.on("keydown", eBankit.Presentation.TRX01112.PwdCheckSpacesEvent);

    //PREVENT WHITE SPACES ON CONFIRM PASSWORD INPUT
    txtconfirmKey.on("keydown", eBankit.Presentation.TRX01112.PwdCheckSpacesEvent);

    txtnewKey.on("input", function (e) {
        if (txtconfirmKey.val() != "") { txtconfirmKey.valid(); }
    });

    txtoldKey.on("input", function (e) {
        if (txtnewKey.val() != "") { txtnewKey.valid(); }
    });
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01112.EndRequest);


$(document).ready(function () {
   
    //SET ONKEYUP TO TRUE FOR PASSWORD INPUTS VALIDATION
    jQuery.validator.setDefaults({
        onkeyup: function (element) { $(element).valid() },
        onfocusout: function (element) { $(element).valid(); }        
    });

    //REGEX VALUES FOR INVALID NEW PASSWORD AND ALL PASSWRODS VERIFICATION
    var repeatedChar = new RegExp("^(.)\1+$");
    var pattern = new RegExp(patternValueSettings.val());

    var $txtoldKeyName = txtoldKey.attr("name");
    var $txtnewKeyName = txtnewKey.attr("name");
    var $txtconfirmKeyName = txtconfirmKey.attr("name");

    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };

    //ADD RULES TO VALIDATOR
    $params['rules'][$txtoldKeyName] = { "required": true, "regx": pattern };
    $params['rules'][$txtnewKeyName] = { "required": true, "regx": pattern, "invalidKey": repeatedChar, "samekey": txtoldKey };
    $params['rules'][$txtconfirmKeyName] = { "required": true, "regx": pattern, "differentKey": txtnewKey };


    //ADD ERROR MESSAGES TO VALIDATOR
    //-------------------------------MESSAGES FOR OLD PASSWORD
    $params['messages'][$txtoldKeyName] = {
        regx: function () { return top.eBankit.Presentation.GetResource("InvalidAccessCode_1"); },
        required: function () {
            eBankit.Presentation.RemoveCustomValidateMsg(txtoldKey);
            eBankit.Presentation.RemoveValidateMsg(txtoldKey); 

            if (txtnewKey.val() != '') {
                eBankit.Presentation.RemoveCustomValidateMsg(txtnewKey);
                eBankit.Presentation.RemoveValidateMsg(txtnewKey);
            }
            return top.eBankit.Presentation.GetResource("MandatoryFieldOldPassword");
        },
        samekey: function () { return top.eBankit.Presentation.GetResource("sameKey"); }
    };

    //-------------------------------MESSAGES FOR NEW PASSWORD
    $params['messages'][$txtnewKeyName] = {
        regx: function () { return top.eBankit.Presentation.GetResource("InvalidAccessCode_1"); },
        required: function () {           
            eBankit.Presentation.RemoveCustomValidateMsg(txtnewKey);
            eBankit.Presentation.RemoveValidateMsg(txtnewKey);

            if (txtoldKey.val() != '') {
                eBankit.Presentation.RemoveCustomValidateMsg(txtoldKey);
                eBankit.Presentation.RemoveValidateMsg(txtoldKey);
            }
           
            return top.eBankit.Presentation.GetResource("MandatoryFieldNewPassword");
        },
        invalidKey: function () { return top.eBankit.Presentation.GetResource("InvalidKey"); },
        differentKey: function () { return top.eBankit.Presentation.GetResource("differentKey"); },
        samekey: function () { return top.eBankit.Presentation.GetResource("sameKey"); }
    };

    //-------------------------------MESSAGES FOR CONFIRM PASSWORD
    $params['messages'][$txtconfirmKeyName] = {
        regx: function () { return top.eBankit.Presentation.GetResource("InvalidAccessCode_1"); },
        required: function () { return top.eBankit.Presentation.GetResource("MandatoryFieldConfirmPassword"); },
        differentKey: function () { return top.eBankit.Presentation.GetResource("differentKey");
        }
    };

    //ADD METHODS TO VALIDATOR
    //-------------------------------METHOD TO VALIDATE IF ALL PASSWORD INPUTS ARE IN THE APP SETTINGS REGEX
    jQuery.validator.addMethod("regx", function (value, element, regx) {
        return regx.test(value);
    }, top.eBankit.Presentation.GetResource("InvalidAccessCode_1"));

    //-------------------------------METHOD TO VALIDATE IF NEW AND OLD PASSWORDS ARE THE SAME
    jQuery.validator.addMethod("samekey", function (value, element, txtOtherInput) {
        return eBankit.Presentation.TRX01112.VerifyOldAndNew(value, txtOtherInput);
    }, top.eBankit.Presentation.GetResource("sameKey"));

    //-------------------------------METHOD TO VALIDATE IF NEW AND CONFIRM PASSWORDS ARE EQUALS
    jQuery.validator.addMethod("differentKey", function (value, element, txtOtherInput) {
        return eBankit.Presentation.TRX01112.VerifyNewAndConfirm(value, txtOtherInput);
    }, top.eBankit.Presentation.GetResource("differentKey"));

    //-------------------------------METHOD TO VALIDATE NEW PASSWORD IF NOT ONLY REPEAT CHARACTERS
    jQuery.validator.addMethod("invalidKey", function (value, element) {
        return eBankit.Presentation.TRX01112.VerifyInvalid(value);
    }, top.eBankit.Presentation.GetResource("InvalidKey"));

    var validator = $("#aspnetForm").validate($params);
    eBankit.Presentation.TRX01112.EndRequest();
});


//VALIDATE NEW PASSWORD IF NOT ONLY REPEAT CHARACTERS
eBankit.Presentation.TRX01112.VerifyInvalid = function (value) {
    return !(/^(.)\1+$/.test(value));
}


//VALIDATE NEW AND CONFIRM PASSWORD IF THEY ARE DIFERENTS OR NOT
eBankit.Presentation.TRX01112.VerifyNewAndConfirm = function (value, txtOtherInput) {
    return txtOtherInput.val() == "" || value == txtOtherInput.val() ;
}


//VALIDATE OLD AND NEW PASSWORD FORMS IF THEY ARE THE SAME OR NOT
eBankit.Presentation.TRX01112.VerifyOldAndNew = function (value, txtOtherInput) {
    return txtOtherInput.val() == "" || value != txtOtherInput.val();
}


//METHOD TO BLOCK WHITE SPACES IN ALL PASSWORD INPUTS
eBankit.Presentation.TRX01112.PwdCheckSpacesEvent = function (evt) {
    if (evt.keyCode == 32) {
        evt.preventDefault();
    }
};


// VALIDATE FORM FIELDS ON SUBMIT
eBankit.Presentation.TRX01112.ValidateForm = function () {
    return $("#aspnetForm").valid();  
}

