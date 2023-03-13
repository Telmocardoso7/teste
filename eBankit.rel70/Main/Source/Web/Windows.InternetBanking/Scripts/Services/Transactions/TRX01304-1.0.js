
eBankit.Presentation.TRX01304 = {}
			

eBankit.Presentation.TRX01304.EndRequest = function () {
    //   
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01304.EndRequest);


$(document).ready(function () {
    eBankit.Presentation.TRX01304.EndRequest();
    eBankit.Presentation.TRX01304.Accessibility();
});

function pageLoad() {
    eBankit.Presentation.TRX01304.Accessibility();
} 


eBankit.Presentation.TRX01304.Accessibility = function () {
    $("img[id*='_pendingOperationImage_']").each(function () {
        if ($(this).attr("alt") === undefined)
            $(this).attr("alt", "");
    });

    $("[id*=_pendingOperationImage_]").each(function (index) {
        var ariaLabel = "";
        $(this).parent().parent().siblings('div').children().children().each(function (index) {
            var thisP = $(this)[0];
            if (thisP.className !== "action-buttons") {
                if (thisP.classList.contains('key')) {
                    ariaLabel += thisP.innerText + ": ";
                }
                else {
                    ariaLabel += thisP.innerText + ". ";
                }
            }
        });
        $(this)[0].ariaLabel = ariaLabel;
        $(this)[0].tabIndex = "0";
    });

    $("[id*=_pendingOperationImageExpires_]").each(function (index) {
        var ariaLabel = "";
        $(this).parent().parent().parent().siblings('div').children().children().each(function (index) {
            var thisP = $(this)[0];
            if (thisP.className !== "action-buttons") {
                if (thisP.classList.contains('key')) {
                    ariaLabel += thisP.innerText + ": ";
                }
                else {
                    ariaLabel += thisP.innerText + ". ";
                }
            }
        });
        $(this)[0].ariaLabel = ariaLabel;
        $(this)[0].tabIndex = "0";
    });
}

