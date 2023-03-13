var eBankit = eBankit || {};
eBankit.pendingProductWidget = eBankit.pendingProductWidget || {};
$(document).ready(function () {

    if (eBankit.pendingProductWidget.Init == undefined) {
        eBankit.pendingProductWidget.Init = function () {
            $(".btn-process-cancel").on("click", function (event) {
                event.stopPropagation();
                event.preventDefault();

                var elem = $(this);
                var postbackRequest = "eBankit.Presentation.Dashboard.triggerPostBack($('#" + elem.attr("id") + "'), " + elem.data("process-id") + ");";
                itcore_ui.ShowTopPopupConfirm(
                    eBankit.pendingProductWidget.ConfirmMsg,
                    eBankit.pendingProductWidget.ConfirmTitle,
                    postbackRequest,
                    eBankit.pendingProductWidget.ConfirmButton,
                    eBankit.pendingProductWidget.CancelButton
                );
            });

            $(".btn-more").on("click", function (event) {
                var elem = $(this);

                if ($(".pending-product-container.extra-item:visible").length > 0) {
                    $(".pending-product-container.extra-item").slideUp();
                    elem.html("<h4>" + eBankit.pendingProductWidget.ShowMore +"</h4>");
                } else {
                    $(".pending-product-container.extra-item").slideDown();
                    elem.html("<h4>" + eBankit.pendingProductWidget.ShowLess + "</h4>");
                }
            });
        };
    };

    eBankit.pendingProductWidget.Init();
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.pendingProductWidget.Init);
});