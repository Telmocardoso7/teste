$(document).ready(function () {
    $('img[id$=imgWarningExportedData]').attr('alt', '');
    $('.btnDownload').on('keydown', function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            $(this).click();
        }
    });

    $('.btnDownload').on('click', function () {
        exportPDF(this);
    });


    function exportPDF(elem) {
        var documentId = $(elem).next('input[type=hidden]').val();
        document.getElementById('iframeControlProof').contentWindow.GenerateDocumentAudit(documentId);
    }
});