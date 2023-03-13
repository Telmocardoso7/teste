eBankit.Presentation.TRX01302 = {};

eBankit.Presentation.TRX01302.EndRequest = function () {
    if ($("a[id$='btnNextFlowItemAuthorizePending']").length === 0) {
        $("div[id$='MainContent_TransactionMainContent_upHeader']").css('display', 'none');
    }
    else {
        $('MainContent_TransactionMainContent_upHeader').css('display', 'inline');
    }
};

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01302.EndRequest);

$(document).ready(function () {

    $("img[id*='imgUser']").each(function () {
        if ($(this).attr("alt") === undefined)
            $(this).attr("alt", "");
    });

    $('[data-toggle="tooltip"]').tooltip();
    
    eBankit.Presentation.TRX01302.EndRequest();
});
