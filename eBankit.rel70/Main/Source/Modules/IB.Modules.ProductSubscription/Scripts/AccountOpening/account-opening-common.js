var eBankit = eBankit || {};
eBankit.AccountOpening = eBankit.AccountOpening || {};
eBankit.AccountOpening = (function () {

    function Load() {
        var elem = $("[data-process-id]");
        if (elem && elem.data("process-id") && !isNaN(elem.data("process-id"))) {
            var url = updateQueryStringParameter(window.location.href, "ProcessId", elem.data("process-id"));
            window.history.pushState(url, "", url);
        }
    }

    function updateQueryStringParameter(uri, key, value) {
        var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
        var separator = uri.indexOf('?') !== -1 ? "&" : "?";
        if (uri.match(re)) {
            return uri.replace(re, '$1' + key + "=" + value + '$2');
        }
        else {
            return uri + separator + key + "=" + value;
        }
    }

    function CancelPopup(elem) {
        itcore_ui.ShowTopPopupConfirm(top.eBankit.Presentation.GetResource("AccountOpeningCancelPopupDescription"), top.eBankit.Presentation.GetResource("AccountOpeningCancelPopupTitle"), elem.href, top.eBankit.Presentation.GetResource("AccountOpeningCancelPopupConfirmButton"), top.eBankit.Presentation.GetResource("AccountOpeningCancelPopupCancelButton"));
        return false;
    }

    return {
        Load: Load,
        CancelPopup: CancelPopup
    };

}());


$(document).ready(function () {
    eBankit.AccountOpening.Load();
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(eBankit.AccountOpening.Load);
});




