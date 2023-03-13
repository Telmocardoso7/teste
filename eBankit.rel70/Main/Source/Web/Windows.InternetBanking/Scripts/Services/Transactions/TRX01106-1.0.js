eBankit.Presentation.TRX01106 = {};

eBankit.Presentation.TRX01106.UserNameCheckSpacesEvent = function (evt) {
    eBankit.Presentation.RemoveCustomValidateMsg($('[id$=txtnewCodeAlias_txField]'));
    var regex = new RegExp("^[a-zA-Z0-9_.]$");
    if (!(regex.test(evt.key) || evt.key === "Backspace" || evt.key === "Delete") || evt.keyCode == 32) {
        evt.preventDefault();
        return false;
    }
};

eBankit.Presentation.TRX01106.UserNameClearSpacesEvent = function () {
    $(this).val(function (i, v) { return v.replace(/ /g, ""); });
};

eBankit.Presentation.TRX01106.UserNameEvent = function () {
    var elem = $('[id$=txtnewCodeAlias_txField]');
    var username = $(this).val().replace(" ", "");
    if (username.length > 0) {
        var pattern = new RegExp("^[a-zA-Z0-9_.]{6,48}$");
        var valid = pattern.test(username);
        if (!valid) {
            eBankit.Presentation.InsertCustomValidateMsg(elem, top.eBankit.Presentation.GetResource("ValidationInvalidInputMessage"));
            var available = $('[id$=spnUserNameActive]');
            available.addClass("hidden");
        }
        else {
            var btn = $("[id$=btnVerifyUserName]");
            __doPostBack(btn.attr("name"), username);
        }
    }
};

$(document).ready(function () {
    var txtnewCodeAlias = $('[id$=txtnewCodeAlias_txField]');
    if (txtnewCodeAlias.length > 0) {
        txtnewCodeAlias[0].addEventListener("blur", eBankit.Presentation.TRX01106.UserNameEvent, false);
        txtnewCodeAlias[0].addEventListener("keydown", eBankit.Presentation.TRX01106.UserNameCheckSpacesEvent, false);
        txtnewCodeAlias[0].addEventListener("change", eBankit.Presentation.TRX01106.UserNameClearSpacesEvent, false);
    }
});

eBankit.Presentation.TRX01106.EndRequest = function () {
    var txtnewCodeAlias = $('[id$=txtnewCodeAlias_txField]');
    if (txtnewCodeAlias.length > 0) {
        txtnewCodeAlias[0].addEventListener("blur", eBankit.Presentation.TRX01106.UserNameEvent, false);
        txtnewCodeAlias[0].addEventListener("keydown", eBankit.Presentation.TRX01106.UserNameCheckSpacesEvent, false);
        txtnewCodeAlias[0].addEventListener("change", eBankit.Presentation.TRX01106.UserNameClearSpacesEvent, false);
    }
};
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01106.EndRequest);

eBankit.Presentation.TRX01106.ValidateCustom = function () {
    var isValid = true;

    var txtnewCodeAlias = $('[id$=txtnewCodeAlias_txField]').val();
    var hdnCurrentLoginAlias = $('[id$=hdnCurrentLoginAlias]').val();
    var lblcurrentCodeAlias = $('[id$=lblcurrentCodeAlias_lblRightIn]').text();
    var pattern = new RegExp("^[a-zA-Z0-9_.]{6,48}$");

    //Prevent user to change alternative login alias logged in with that alternative login alias
    if (hdnCurrentLoginAlias == lblcurrentCodeAlias) {
        isValid = false;
        eBankit.Presentation.InsertValidateMsg_V2($('[id$=txtnewCodeAlias_txField]'), top.eBankit.Presentation.GetResource("OnlyWithMainAlias"));
        return false;
    }

    //Check if the current user alternative login alias is equal to the new one
    if (lblcurrentCodeAlias == txtnewCodeAlias) {
        isValid = false;
        eBankit.Presentation.InsertValidateMsg_V2($('[id$=txtnewCodeAlias_txField]'), top.eBankit.Presentation.GetResource("SameCode"));
        return false;
    }


    if (!pattern.test(txtnewCodeAlias) && txtnewCodeAlias.length > 0) {
        var elem = $('[id$=txtnewCodeAlias_txField]');
        eBankit.Presentation.InsertCustomValidateMsg(elem, top.eBankit.Presentation.GetResource("ValidationInvalidInputMessage"));
        isValid = false;
    }

    return isValid;
};
