eBankit.Presentation.TRX00101 = {}

eBankit.Presentation.TRX00101.EndRequest = function () {
    $('.icon-document').each(function () {
        $(this).on("click", function () {
            var key = $(this).attr('key');
            eBankit.Presentation.TRX00101.ExportToPdf(key);
        });
    });
}

eBankit.Presentation.TRX00101.ExportToPdf = function (documentid) {
    document.getElementById("iframeControlDocument").src = '/DigitalDocument.aspx?transactionId=' + documentid;
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX00101.EndRequest);

$(document).ready(function () {
    eBankit.Presentation.TRX00101.EndRequest();
});

function pageLoad() {
    eBankit.Presentation.TRX00101.Accessibility();
} 

eBankit.Presentation.TRX00101.Accessibility = function () {
    var searchTable = $('div[id=pnSearchHeader]');
    var searchTableImg = searchTable.children('.img-search-panel').children('img');
    var detailsTable = $('table[id$=gridData]');

    searchTable.attr("tabindex", "0");
    searchTableImg.css('margin-top', '-14px');
    searchTable.on('keydown', function (e) {
        if (e.keyCode === 32) {
            e.preventDefault();
            $(this).click();
        }
    });

    if (detailsTable.length > 0) {
        var tableRows = detailsTable.children('tbody').children('tr.item');
        tableRows.each(function () {
            var pdfLink = $(this).children('td').last().prev();
            $(this).attr("tabindex", "0");
            pdfLink.attr("tabindex", "0");

            $(this).on('keydown', function (e) {
                if (e.keyCode === 32) {
                    e.preventDefault();
                    $(this).children('td')[0].click();
                }
            });

            pdfLink.on('keydown', function (e) {
                if (e.keyCode === 32) {
                    e.preventDefault();
                    $(this).children('span').click();
                }
            });
        });
    }
}