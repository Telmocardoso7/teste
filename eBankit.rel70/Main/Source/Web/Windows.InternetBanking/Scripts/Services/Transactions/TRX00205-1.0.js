eBankit.Presentation.TRX00205 = {}


eBankit.Presentation.TRX00205.EndRequest = function () {
    var hdnIsCredit = $("[id$=hdnValidCard]");
    var commands = $(".trs_buttons");
    if (hdnIsCredit.val() == "1") {
        commands.show();
    }
    else {
        commands.hide();
    }
}

$(document).ready(function () {
    var hdnIsCredit = $("[id$=hdnValidCard]");
    var commands = $(".trs_buttons");
    if (hdnIsCredit.val() == "1") {
        commands.show();
    }
    else {
        commands.hide();
    }
});

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX00205.EndRequest);