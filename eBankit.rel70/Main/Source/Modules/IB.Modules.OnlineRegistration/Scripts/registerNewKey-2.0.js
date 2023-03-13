eBankit.Presentation.RegisterNewKey = {};


eBankit.Presentation.RegisterNewKey.ValidateName = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(TextBoxUserName, elem)) {
        ret = false;
    } else {
        if (!IsValidAccount(TextBoxUserName.val())) {
            eBankit.Presentation.InsertValidateMsg(TextBoxUserName, top.eBankit.Presentation.GetResource("InvalidName"));
            ret = false;
        }
    }
    return ret;
};


eBankit.Presentation.RegisterNewKey.ValidateNewKey = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(TextBoxNewKey, elem)) {
        ret = false;
    } else {
        if (!IsValidAccount(TextBoxNewKey.val())) {
            eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("InvalidKey"));
            ret = false;
        }
    }
    return ret;
};

eBankit.Presentation.RegisterNewKey.ValidateConfirmNewKey = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(TextBoxConfirmNewKey, elem)) {
        ret = false;
    } else {
        if (!IsValidAccount(TextBoxConfirmNewKey.val())) {
            eBankit.Presentation.InsertValidateMsg(TextBoxConfirmNewKey, top.eBankit.Presentation.GetResource("InvalidKey"));
            ret = false;
        }
    }
    return ret;
};

eBankit.Presentation.RegisterNewKey.ValidateHardToken = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(TextboxHardToken, elem)) {
        ret = false;
    } else {
        if (!IsValidAccount(TextboxHardToken.val())) {
            eBankit.Presentation.InsertValidateMsg(TextboxHardToken, top.eBankit.Presentation.GetResource("InvalidKey"));
            ret = false;
        }
    }
    return ret;
};

eBankit.Presentation.RegisterNewKey.ValidateCustomToken = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(TextBoxCustomToken, elem)) {
        ret = false;
    } else {
        if (!IsValidAccount(TextBoxCustomToken.val())) {
            eBankit.Presentation.InsertValidateMsg(TextboxHardToken, top.eBankit.Presentation.GetResource("InvalidKey"));
            ret = false;
        }
    }
    return ret;
};


eBankit.Presentation.RegisterNewKey.ValidateInputsConfirm = function (elem) {
    var regex = /(\W|_)/;
    ret = false;

    this.ValidateName();
    this.ValidateNewKey();
    this.ValidateConfirmNewKey();
    this.ValidateHardToken();
    this.ValidateCustomToken();

    if (this.ValidateName() && this.ValidateNewKey() && this.ValidateConfirmNewKey() && this.ValidateHardToken() && this.ValidateCustomToken())
        ret = true;
    else
        ret = false;

    if (TextBoxNewKey == null || !ret) {
        return false;
    }
    else {
        if (TextBoxNewKey.val() == "1234567" || TextBoxNewKey.val() == "7654321") {
            eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("InvalidKeyDiferent"));
            return false;
        }

        if ((hdnCredentialType.val() == "5" && (TextBoxNewKey.val().length < 6 || TextBoxNewKey.val().length > 48)) || (hdnCredentialType.val() == "0" && TextBoxNewKey.val().length != 7)) {
            eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("InvalidKey"));
            return false;
        }
        else if (regex.test(TextBoxNewKey.val())) {
            eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("InvalidKey"));
            return false;
        }

        return eBankit.Presentation.RegisterNewKey.ValidateConfirmNewKey();
    }

    return true;
};

$(document).ready(function () {
    TextBoxUserName.keydown(function (e) {
        if (e.keyCode == 32)
            return false;
    });

    TextBoxUserName.change(function (evt) {
        $(this).val(function (i, v) { return v.replace(/ /g, ""); });
    });
});


function AddRequiredFieldValidator(controlElement, elem) {

    var v = true;

    if (controlElement.val() == '' && (elem == undefined || elem.id == controlElement[0].id)) {
        eBankit.Presentation.InsertValidateMsg(controlElement, top.eBankit.Presentation.GetResource("RequiredField"));
        v = false;
    }
    else if (controlElement.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(controlElement);
        controlElement.popover('hide');
    }

    return v;
}