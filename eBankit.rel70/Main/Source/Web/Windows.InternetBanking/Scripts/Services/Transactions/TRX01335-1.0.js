
eBankit.Presentation.TRX01335 = {}
			

$(document).ready(function () {
    $(".btn-process-cancel").on("click", function (event) {
        event.stopPropagation();
        event.preventDefault();

        var elem = $(this);
        var btnCancelProc = $(this).siblings('.btnCancelProcess');

        var functionToCancel = "$('#" + $(btnCancelProc).attr('id') + "').trigger('click')";

        itcore_ui.ShowTopPopupConfirm(
            eBankit.pendingProductWidget.ConfirmMsg,
            eBankit.pendingProductWidget.ConfirmTitle,
            functionToCancel,
            eBankit.pendingProductWidget.ConfirmButton,
            eBankit.pendingProductWidget.CancelButton
        );
    });
});