
eBankit.Presentation.TRX01150 = {}
			

eBankit.Presentation.TRX01150.EndRequest = function () {
    //   
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01150.EndRequest);

eBankit.Presentation.TRX01150.ValidateCustom = function () {
    var ret = true;

    return ret;
}

$(document).ready(function () {
    eBankit.Presentation.TRX01150.EndRequest();
});

