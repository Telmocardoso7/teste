
var eBankit = eBankit || {};
eBankit.Presentation = eBankit.Presentation || {};
eBankit.Presentation.EditDelegate = eBankit.Presentation.EditDelegate || {};


eBankit.Presentation.EditDelegate.EndRequest = function () {

    let ddlDocumentType = $("[id$=ddlDocumentType_dlField]");
    if (ddlDocumentType) {

        if (ddlDocumentType.find("option:selected").val() !== '')
            $("[id$=divTxtDocumentNumber]").removeClass("hidden-panel");

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

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.EditDelegate.EndRequest);

$(document).ready(function () {
    eBankit.Presentation.EditDelegate.EndRequest();
});