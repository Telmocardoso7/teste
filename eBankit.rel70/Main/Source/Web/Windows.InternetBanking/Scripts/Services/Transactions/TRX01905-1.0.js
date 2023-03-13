
$(document).ready(function () {
    var link = "javascript: eBankit.document.location.href = '/Controls/KYC/UpdateDataInformation.aspx'";
    $("[id*=btnBackFlowItem]").attr("onclick", link);
    $("[id*=btnBackFlowItem]").attr("href", null);

});


eBankit.Presentation.TRX01905 = {}


eBankit.Presentation.TRX01905.EndRequest = function () {
    //   
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01905.EndRequest);
