
eBankit.Presentation.TRX01019 = {}
			

eBankit.Presentation.TRX01019.EndRequest = function () {
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

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01019.EndRequest);


$(document).ready(function () {
    eBankit.Presentation.TRX01019.EndRequest();
});


