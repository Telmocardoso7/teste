eBankit.Presentation.Register2 = {};

eBankit.Presentation.Register2.ValidateName = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(txtName, elem)) {
        ret = false;
    } else {
        if (!IsValidName(txtName.val())) {
            eBankit.Presentation.InsertValidateMsg(txtName, top.eBankit.Presentation.GetResource("InvalidName"));
            ret = false;
        }
    }
    return ret;
};

eBankit.Presentation.Register2.ValidateAccount = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(txtAccount, elem)) {
        ret = false;
    } else {
        if (!IsValidAccount(txtAccount.val())) {
            eBankit.Presentation.InsertValidateMsg(txtAccount, top.eBankit.Presentation.GetResource("InvalidAccount"));
            ret = false;
        }
    }
    return ret;
};

eBankit.Presentation.Register2.ValidateTaxId = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(txtTaxID, elem)) {
        ret = false;
    } else {
        if (!IsValidAccount(txtTaxID.val())) {
            eBankit.Presentation.InsertValidateMsg(txtTaxID, top.eBankit.Presentation.GetResource("InvalidNIF"));
            ret = false;
        }
    }
    return ret;
};

eBankit.Presentation.Register2.ValidateId = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(txtID, elem)) {
        ret = false;
    } else {
        if (!IsValidAccount(txtID.val())) {
            eBankit.Presentation.InsertValidateMsg(txtID, top.eBankit.Presentation.GetResource("InvalidID"));
            ret = false;
        }
    }
    return ret;
};

eBankit.Presentation.Register2.ValidatePassport = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(txtPassport, elem)) {
        ret = false;
    } else {
        if (!IsValidAccount(txtPassport.val())) {
            eBankit.Presentation.InsertValidateMsg(txtPassport, top.eBankit.Presentation.GetResource("InvalidPassport"));
            ret = false;
        }
    }
    return ret;
};

eBankit.Presentation.Register2.ValidateEmail = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(txtEmail, elem)) {
        ret = false;
    } else {
        if (!IsValidEmail(txtEmail.val())) {
            eBankit.Presentation.InsertValidateMsg(txtEmail, top.eBankit.Presentation.GetResource("InvalidEmail"));
            ret = false;
        }
    }
    return ret;
};


eBankit.Presentation.Register2.ValidatePhone = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(txtPhone, elem)) {
        ret = false;
    } else {
        if (!IsValidEmail(txtPhone.val())) {
            eBankit.Presentation.InsertValidateMsg(txtPhone, top.eBankit.Presentation.GetResource("InvalidPhone"));
            ret = false;
        }
    }
    return ret;
};


eBankit.Presentation.Register2.ValidateRegister = function (elem) {
    var ret = true;
    ///VALIDATE INPUTS
    this.ValidateName();
    this.ValidateAccount();
    this.ValidateTaxId();
    this.ValidateId();
    this.ValidatePassport();
    this.ValidateEmail();
    this.ValidatePhone();

    if (this.ValidateName() && this.ValidateAccount() && this.ValidateTaxId() && (this.ValidateId() || this.ValidatePassport()) && this.ValidateEmail() && this.ValidatePhone())
        ret = true
    else
        ret = false;
    var dtIDValidate = $('[id$=dtIDValidate_txField]');
    var dtPassport = $('[id$=dtPassport_txField]');

    var d = new Date();

    //var dID = eBankit.Presentation.Register2.toDate(dtIDValidate.val());
    //var dPassport = eBankit.Presentation.Register2.toDate(dtPassport.val());

    var dID = new Date(eBankit.dateJS.getDateFromFormat(dtIDValidate.val(), dateJSFormat));
    var dPassport = new Date(eBankit.dateJS.getDateFromFormat(dtPassport.val(), dateJSFormat));

    var dNow = eBankit.Presentation.Register2.toDate(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate());

    if (dtIDValidate.is(":visible") && dID < dNow) {
        eBankit.Presentation.InsertValidateMsg(dtIDValidate, top.eBankit.Presentation.GetResource("dtIDDateErroMsg"));
        ret = false;
    }
    else {
        eBankit.Presentation.RemoveValidateMsg(dtIDValidate);
    }

    if (dtPassport.is(":visible") && dPassport < dNow) {
        eBankit.Presentation.InsertValidateMsg(dtPassport, top.eBankit.Presentation.GetResource("dPassportDateErroMsg"));
        ret = false;
    }
    else {
        eBankit.Presentation.RemoveValidateMsg(dtPassport);
    }

    if (txtPhone.val().length < 16) {
        eBankit.Presentation.InsertValidateMsg(txtPhone, top.eBankit.Presentation.GetResource("CellPhoneInvalidMsg"));
        ret = false;
    }
    else {
        eBankit.Presentation.RemoveValidateMsg(txtPhone);
    }


    return ret;
};

eBankit.Presentation.Register2.ToogleDocumentType = function (divId, divToHideId) {
    div = $("#" + divId);
    div.show();
    div.removeClass("hidden");
    $("#" + divToHideId).hide();
};

eBankit.Presentation.Register2.toDate = function (date) {
    var arr = date.split("-");
    return new Date(arr[2], arr[1] - 1, arr[0]);
};

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

eBankit.Presentation.Register2.SetInitPhoneNumber = function () {
    if (txtPhone.val() == "")
        txtPhone.val("+351");
};


txtEmail.on('blur', function (e) {
    if (!eBankit.Presentation.ValidateEmailExp(txtEmail.val())) {
        eBankit.Presentation.InsertValidateMsg(txtEmail, top.eBankit.Presentation.GetResource("InvalidEmail")); ret = false;
    }
});

$(document).ready(function () {
    var pnUserData = $('[id$=pnUserData]');

    txtPhone.mask("+999 999 999 999 999", {
        placeholder: "+351 _____ _____ _____"
    });

    eBankit.Presentation.Register2.SetInitPhoneNumber();

    var $calendPickerDateName1 = $calendPickerDate1.attr("name");
    var $calendPickerDateName2 = $calendPickerDate2.attr("name");

    var $params = {
        debug: false, rules: {}, messages: {}, success: function (label) {
            label.addClass("valid");
        }
    };
    $params['rules'][$calendPickerDateName1] = {
        "ValidateDateFormat": true
    };
    $params['rules'][$calendPickerDateName2] = {
        "ValidateDateFormat": true
    };

    $params['messages'][$calendPickerDateName1] = {
        ValidateDateFormat: function () {
            return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg");
        }
    };
    $params['messages'][$calendPickerDateName2] = {
        ValidateDateFormat: function () {
            return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg");
        }
    };

    $('#aspnetForm input').keypress(function (e) {
        if (e.keyCode == '13') {
            $("[id*=btnNextStep]").click();
            return false;
        }
    });

    $('#aspnetForm').submit(function (e) {
        $("input").blur();
        $("textarea").blur();
    });
});

function IsValidName(name) {
    return true;
}

function IsValidAccount(acc) {
    return true;
}

function IsValidNIF(nif) {
    return true;
}
function IsNumeric(ObjVal) {
    return /^\d+$/.test(ObjVal);
}
function IsValidID(id) {
    return true;
}

function IsValidPassport(passport) {
    return true;
}

function IsValidEmail(email) {
    return true;
}

