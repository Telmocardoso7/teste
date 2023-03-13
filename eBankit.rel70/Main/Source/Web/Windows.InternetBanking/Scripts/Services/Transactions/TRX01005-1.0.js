eBankit.Presentation.TRX01005 = {};

eBankit.Presentation.TRX01005.ValidateCustom = function () {
    var txtUserName = $("[id$=txtUserName_txField]");
    var txtExternalUserKey = $("[id$=txtExternalUserKey_txField]");

    var externalValidation = true;
    if (txtExternalUserKey.length > 0) {
        var isExternalBlackListed = $('[id$=isInExternalBlackList]').val();
        if (txtExternalUserKey.val().length > 0 && isExternalBlackListed === 'false') {
            eBankit.Presentation.RemoveCustomValidateMsg(txtExternalUserKey);
            eBankit.Presentation.RemoveValidateMsg(txtExternalUserKey);
            eBankit.Presentation.InsertCustomValidateMsg(txtExternalUserKey, top.eBankit.Presentation.GetResource("ValidationInvalidInputChangeExternalUserKeyMessage"));
            $('[id$=spnExternalUserNameActive]').addClass("hidden");
            externalValidation = false;
        }
        else if (txtExternalUserKey.val().length == 0) {
            $('[id$=spnExternalUserNameActive]').addClass("hidden");
            externalValidation = false;
        }
    }
    else {
        let accesscodesValidation = true;
        $("input[id*=txtAccessCodeValue]:visible").each(function () {
            if (accesscodesValidation) {
                accesscodesValidation = eBankit.Presentation.TRX01005.ValidatePattern($(this));
            }
        });
    }

    var isBlackListed = $('[id$=isInBlackList]').val();
    if (txtUserName.val().length > 0 && isBlackListed === 'false') {
        eBankit.Presentation.RemoveCustomValidateMsg(txtUserName);
        eBankit.Presentation.RemoveValidateMsg(txtUserName);
        eBankit.Presentation.InsertCustomValidateMsg(txtUserName, top.eBankit.Presentation.GetResource("ValidationInvalidInputChangeUsernameMessage"));
        $('[id$=spnUserNameActive]').addClass("hidden");
        return false;
    }
    else if (txtUserName.val().length == 0)
    {
        $('[id$=spnUserNameActive]').addClass("hidden");
        return false;
    }

    var pattern = new RegExp(patternValueSettings.val());
    var valid = pattern.test(txtUserName.val());
    if (!valid && txtUserName.val().length > 0) {
        eBankit.Presentation.RemoveCustomValidateMsg(txtUserName);
        eBankit.Presentation.RemoveValidateMsg(txtUserName);
        eBankit.Presentation.InsertCustomValidateMsg(txtUserName, top.eBankit.Presentation.GetResource("ValidationInvalidInputChangeUsernameMessage"));
        return false;
    }

    if (externalValidation == false)
        return false;

    return true;
};


eBankit.Presentation.TRX01005.UserNameEvent = function () {
    var isValid = false;
    var username = $(this).val().replace(" ", "");
    
    if (username.length > 0) {
        $(this).siblings('.custom-error').remove();   
        var pattern = new RegExp(patternValueSettings.val());
        var valid = pattern.test(username);
        if (!valid) {
            var available = $('[id$=spnUserNameActive]');
            available.addClass("hidden");
            eBankit.Presentation.InsertValidateMsg($(this), top.eBankit.Presentation.GetResource("ValidationInvalidInputChangeUsernameMessage"));            
            isValid = false;
            
        }
        else {
            if ($(this).valid()) {
                eBankit.Presentation.RemoveCustomValidateMsg($(this));
                eBankit.Presentation.RemoveValidateMsg($(this));

                var btn = $("[id$=btnVerifyUserName]");
                __doPostBack(btn.attr("name"), username);
                isValid = true;
            } else {     
                
                isValid = false;
            }
        }
    } else {        
        isValid = false;
        $(this).siblings('.custom-error').remove();        
        var available = $('[id$=spnUserNameActive]');
        available.addClass("hidden");
    } 
    return isValid;
};

eBankit.Presentation.TRX01005.ExternalUserKeyEvent = function () {
    var isValid = false;
    var username = $(this).val().replace(" ", "");

    if (username.length > 0) {
        $(this).siblings('.custom-error').remove();
        if ($(this).valid()) {
            eBankit.Presentation.RemoveCustomValidateMsg($(this));
            eBankit.Presentation.RemoveValidateMsg($(this));

            var btn = $("[id$=btnVerifyExternalUserKey]");
            __doPostBack(btn.attr("name"), username);
            isValid = true;
        } else {
            isValid = false;
        }
    } else {
        isValid = false;
        $(this).siblings('.custom-error').remove();
        var available = $('[id$=spnExternalUserNameActive]');
        available.addClass("hidden");
    }
    return isValid;
};

eBankit.Presentation.TRX01005.UserNameCheckSpacesEvent = function (evt) {
    if (evt.keyCode == 32) {
        evt.preventDefault();
        return false;
    }
};

eBankit.Presentation.TRX01005.UserNameClearSpacesEvent = function () {
    $(this).val(function (i, v) { return v.replace(/ /g, ""); });
};

eBankit.Presentation.TRX01005.ToogleActiveSwitch = function (codeId, isDisabled) {
    var container = $("[data-code-id='" + codeId + "'] ").filter("div[id*='divAccessCodeLoginSettings']");
    var activeCheck = container.find("input[id*='chkActiveLogin']");
    activeCheck.prop("disabled", isDisabled);
    if (isDisabled === true) {
        activeCheck.prop('checked', false);
    }
    else {
        activeCheck.prop('checked', true);
    }
};

eBankit.Presentation.TRX01005.ToogleAccessCodeSettings = function (elem) { //elem = $("input[id*=chkActive]")
    var parentContainer = elem.closest("[id*=divAccessCodeInputs]");
    var settingsContainer = parentContainer.find("[id*=divAccessCodeSettings]");

    if (elem.is(":checked")) {
        settingsContainer.show();
        var chkAutogenerate = settingsContainer.find("input[id*=chkAutogenerated]");
        if (chkAutogenerate.length > 0)
            eBankit.Presentation.TRX01005.ToogleAccessCodeInputs(chkAutogenerate);
        else
            settingsContainer.find(".conditional-content").show();
        eBankit.Presentation.TRX01005.ToogleActiveSwitch(settingsContainer.data("code-id"), false);
    } else {
        settingsContainer.hide();
        eBankit.Presentation.TRX01005.ToogleActiveSwitch(settingsContainer.data("code-id"), true);
    }
};

eBankit.Presentation.TRX01005.ToogleAccessCodeInputs = function (elem) { //elem = $("input[id*=chkAutogenerated]")
    var parentContainer = elem.closest("[id*=divAccessCodeSettings]");
    var inputContainers = parentContainer.find(".conditional-content");
    var accessValue = inputContainers.has("input[id*=txtAccessCodeValue]");
    var deliveryType = inputContainers.has("select[id*=ddlDeliveryType]");

    if (elem.is(":checked")) { // autogenerate == true then show delivery type, otherwise allow user input
        accessValue.hide();
        accessValue.find("input[id*=txtAccessCodeValue]").val("");
        deliveryType.show();
    } else {
        accessValue.show();
        deliveryType.hide();
        deliveryType.find("select[id*=ddlDeliveryType]").val("");
    }
};


eBankit.Presentation.TRX01005.ValidatePattern = function (elem) { //elem = $("input[id*=txtAccessCodeValue]")
    var isValid = false;
    eBankit.Presentation.RemoveCustomValidateMsg(elem);

    if (elem.val().length > 0) {
        var parentContainer = elem.closest("[id*=divAccessCodeSettings]");
        var pattern = new RegExp(parentContainer.data("code-pattern"));
        isValid = pattern.test(elem.val());

        if (!isValid) {
            eBankit.Presentation.InsertCustomValidateMsg(elem, top.eBankit.Presentation.GetResource("InvalidAccessCode_" + parentContainer.data("code-id")));
        }
    }

    return isValid;
};

eBankit.Presentation.TRX01005.EndRequest = function () {
    var txtUserName = $("[id$=txtUserName_txField]");
    var txtExternalUserKey = $("[id$=txtExternalUserKey_txField]");
    if (txtUserName.length > 0) {
        txtUserName[0].addEventListener("blur", eBankit.Presentation.TRX01005.UserNameEvent, false);
        txtUserName[0].addEventListener("keydown", eBankit.Presentation.TRX01005.UserNameCheckSpacesEvent, false);
        txtUserName[0].addEventListener("change", eBankit.Presentation.TRX01005.UserNameClearSpacesEvent, false);        
    }

    if (txtExternalUserKey.length > 0) {
        txtExternalUserKey[0].addEventListener("blur", eBankit.Presentation.TRX01005.ExternalUserKeyEvent, false);
        txtExternalUserKey[0].addEventListener("keydown", eBankit.Presentation.TRX01005.UserNameCheckSpacesEvent, false);
        txtExternalUserKey[0].addEventListener("change", eBankit.Presentation.TRX01005.UserNameClearSpacesEvent, false);
    } else {
        $("input[id*='chkActiveLogin']").prop("disabled", false);
        $("input[id*=chkActive]").each(function () { eBankit.Presentation.TRX01005.ToogleAccessCodeSettings($(this)); });
        $("input[id*=chkAutogenerated]").each(function () { eBankit.Presentation.TRX01005.ToogleAccessCodeInputs($(this)); });

        $("input[id*=chkActive]").on("change", function () { eBankit.Presentation.TRX01005.ToogleAccessCodeSettings($(this)); });
        $("input[id*=chkAutogenerated]").on("change", function () { eBankit.Presentation.TRX01005.ToogleAccessCodeInputs($(this)); });
        $("input[id*=txtAccessCodeValue]").on("input", function () { eBankit.Presentation.TRX01005.ValidatePattern($(this)); });
    }

    let ddlDocumentType = $("[id$=ddlDocumentType_dlField]");
    if (ddlDocumentType) {
        ddlDocumentType.change(function () {
            if ($(this).find("option:selected").val() === '') {
                $("[id$=divTxtDocumentNumber]").addClass("hidden-panel");
            }
            else {
                $("[id$=divTxtDocumentNumber]").removeClass("hidden-panel");
            }
        });
    }

}



Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01005.EndRequest);


$(document).ready(function () {
    var txtUserName = $("[id$=txtUserName_txField]");
    var txtExternalUserKey = $("[id$=txtExternalUserKey_txField]");
    var $txtUserNameName = txtUserName.attr("name");
    var pattern = new RegExp(patternValueSettings.val()); 

    jQuery.validator.setDefaults({
        onkeyup: function (element) { $(element).valid() },
        onfocusout: function (element) { $(element).valid(); }
    });


    eBankit.Presentation.TRX01005.EndRequest();
});