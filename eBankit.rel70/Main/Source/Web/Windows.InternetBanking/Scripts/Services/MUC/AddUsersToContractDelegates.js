eBankit.Presentation.AddUsersToContractDelegates = {};

eBankit.Presentation.AddUsersToContractDelegates.ValidateCustom = function () {
    var txtUserName = $("[id$=txtUserName_txField]");
    var txtExternalUserKey = $("[id$=txtExternalUserKey_txField]");
    let txtEmail = $("input[id*=txtEmail]");
    let txtPhone = $("input[id*=txtPhone]");
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
    } else {
        $("input[id*=txtAccessCodeValue]:visible").each(function () { ret = ret && eBankit.Presentation.AddUsersToContractDelegates.ValidatePattern($(this)) });
    }

    var isBlackListed = $('[id$=isInBlackList]').val();
    if (txtUserName.val().length > 0 && isBlackListed === 'false') {
        eBankit.Presentation.RemoveCustomValidateMsg(txtUserName);
        eBankit.Presentation.RemoveValidateMsg(txtUserName);
        eBankit.Presentation.InsertCustomValidateMsg(txtUserName, top.eBankit.Presentation.GetResource("ValidationInvalidInputChangeUsernameMessage"));
        var available = $('[id$=spnUserNameActive]');
        available.addClass("hidden");
        return false;
    }
    else if (txtUserName.val().length == 0) {
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

eBankit.Presentation.AddUsersToContractDelegates.UserNameEvent = function () {
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

eBankit.Presentation.AddUsersToContractDelegates.ExternalUserKeyEvent = function () {
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

eBankit.Presentation.AddUsersToContractDelegates.UserNameCheckSpacesEvent = function (evt) {
    if (evt.keyCode == 32) {
        evt.preventDefault();
        return false;
    }
};

eBankit.Presentation.AddUsersToContractDelegates.UserNameClearSpacesEvent = function () {
    $(this).val(function (i, v) { return v.replace(/ /g, ""); });
};

eBankit.Presentation.AddUsersToContractDelegates.ToogleActiveSwitch = function (codeId, isDisabled) {
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

eBankit.Presentation.AddUsersToContractDelegates.ToogleAccessCodeSettings = function (elem) { //elem = $("input[id*=chkActive]")
    var parentContainer = elem.closest("[id*=divAccessCodeInputs]");
    var settingsContainer = parentContainer.find("[id*=divAccessCodeSettings]");

    if (elem.is(":checked")) {
        settingsContainer.show();
        var chkAutogenerate = settingsContainer.find("input[id*=chkAutogenerated]");
        if (chkAutogenerate.length > 0)
            eBankit.Presentation.AddUsersToContractDelegates.ToogleAccessCodeInputs(chkAutogenerate);
        else
            settingsContainer.find(".conditional-content").show();
        eBankit.Presentation.AddUsersToContractDelegates.ToogleActiveSwitch(settingsContainer.data("code-id"), false);
    } else {
        settingsContainer.hide();
        eBankit.Presentation.AddUsersToContractDelegates.ToogleActiveSwitch(settingsContainer.data("code-id"), true);
    }
};

eBankit.Presentation.AddUsersToContractDelegates.ToogleAccessCodeInputs = function (elem) { //elem = $("input[id*=chkAutogenerated]")
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

eBankit.Presentation.AddUsersToContractDelegates.ValidatePattern = function (elem) { //elem = $("input[id*=txtAccessCodeValue]")
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

eBankit.Presentation.AddUsersToContractDelegates.EndRequest = function () {
    var txtUserName = $("[id$=txtUserName_txField]");
    var txtExternalUserKey = $("[id$=txtExternalUserKey_txField]");
    if (txtUserName.length > 0) {
        txtUserName[0].addEventListener("blur", eBankit.Presentation.AddUsersToContractDelegates.UserNameEvent, false);
        txtUserName[0].addEventListener("keydown", eBankit.Presentation.AddUsersToContractDelegates.UserNameCheckSpacesEvent, false);
        txtUserName[0].addEventListener("change", eBankit.Presentation.AddUsersToContractDelegates.UserNameClearSpacesEvent, false);
    }

    if (txtExternalUserKey.length > 0) {
        txtExternalUserKey[0].addEventListener("blur", eBankit.Presentation.AddUsersToContractDelegates.ExternalUserKeyEvent, false);
        txtExternalUserKey[0].addEventListener("keydown", eBankit.Presentation.AddUsersToContractDelegates.UserNameCheckSpacesEvent, false);
        txtExternalUserKey[0].addEventListener("change", eBankit.Presentation.AddUsersToContractDelegates.UserNameClearSpacesEvent, false);
    } else {
        $("input[id*='chkActiveLogin']").prop("disabled", false);
        $("input[id*=chkActive]").each(function () { eBankit.Presentation.AddUsersToContractDelegates.ToogleAccessCodeSettings($(this)); });
        $("input[id*=chkAutogenerated]").each(function () { eBankit.Presentation.AddUsersToContractDelegates.ToogleAccessCodeInputs($(this)); });

        $("input[id*=chkActive]").on("change", function () { eBankit.Presentation.AddUsersToContractDelegates.ToogleAccessCodeSettings($(this)); });
        $("input[id*=chkAutogenerated]").on("change", function () { eBankit.Presentation.AddUsersToContractDelegates.ToogleAccessCodeInputs($(this)); });
        $("input[id*=txtAccessCodeValue]").on("input", function () { eBankit.Presentation.AddUsersToContractDelegates.ValidatePattern($(this)); });
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

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.AddUsersToContractDelegates.EndRequest);

$(document).ready(function () {
    var txtUserName = $("[id$=txtUserName_txField]");
    var $txtUserNameName = txtUserName.attr("name");
    var pattern = new RegExp(patternValueSettings.val());

    jQuery.validator.setDefaults({
        onkeyup: function (element) { $(element).valid() },
        onfocusout: function (element) { $(element).valid(); }
    });

    eBankit.Presentation.AddUsersToContractDelegates.EndRequest();

    jQuery('input[id*=txtPhone_txField]').keyup(function () {
        this.value = this.value.replace(/[^0-9]/g, '');
    });



    $("input[id*=txtAdherentName]").attr("required", "required");
    $("input[id*=txtAdherentName]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtAdherentName]").text().replace("*", ""));
    $("input[id*=txtDocumentNumber]").attr("required", "required");
    $("input[id*=txtDocumentNumber]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtDocumentNumber]").text().replace("*", ""));
    $("input[id*=txtUserName]").attr("required", "required");
    $("input[id*=txtUserName]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtUserName]").text().replace("*", ""));
    $("input[id*=txtExternalUserKey]").attr("required", "required");
    $("input[id*=txtExternalUserKey]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtExternalUserKey]").text().replace("*", ""));
    $("option[value='0']").attr("value", "");


    $("input[id*=txtAccessCodeValue_0]").attr("required", "required");
    $("input[id*=txtAccessCodeValue_0]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtAccessCodeValue_0]").text().replace("*", ""));
    $("[id*=txtAccessCodeValue_1]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtAccessCodeValue_1]").text().replace("*", ""));
    $("[id*=txtAccessCodeValue_1]").attr("required", "required");
    $("[id*=txtAccessCodeValue_2]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtAccessCodeValue_2]").text().replace("*", ""));
    $("[id*=txtAccessCodeValue_2]").attr("required", "required");
    $("[id*=txtAccessCodeValue_3]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtAccessCodeValue_3]").text().replace("*", ""));
    $("[id*=txtAccessCodeValue_3]").attr("required", "required");
    $("[id*=ddlDeliveryType]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=ddlDeliveryType]").text().replace("*", ""));
    $("[id*=ddlDeliveryType]").attr("required", "required");


    document.querySelector(".btnAddUser").addEventListener('click', function (event) {
        if (!$("#aspnetForm").valid()) {
            event.preventDefault();
            return
        }
    });
    jQuery.extend(jQuery.validator.messages, {
        email: $("#fieldRequiredEmailJs").val(),
        minlength: $("#fieldRequiredMobileJs").val()
    });

    let rules = {};
    let txtEmail = $("input[id*=txtEmail]");
    let txtPhone = $("input[id*=txtPhone]");

    if (txtEmail && txtEmail.attr("required") === "required") {
        $("input[id*=txtEmail]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("label[id*=txtEmail]").text().replace("*", ""));
        rules.ctl00$ctl00$MainContent$TransactionMainContent$flwUserData$txtEmail$txField = {
            required: true,
            email: true
        };
    }
    if (txtPhone && txtPhone.attr("required") === "required") {
        $("input[id*=txtPhone]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("label[id*=txtPhone]").text().replace("*", ""));
        rules.ctl00$ctl00$MainContent$TransactionMainContent$flwUserData$txtPhone$txField = {
            required: true,
                minlength: 9
        };
    }

    $("#aspnetForm").validate(rules);
});