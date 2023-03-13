var control = {};

control.Init = function () {
    $("[data-delete-singular]").on("click", function (event) {
        var elem = $(this);
        event.preventDefault();
        itcore_ui.ShowTopPopupConfirm_V3(
            "",
            elem.attr("data-modal-title"),
            elem.attr("data-modal-description"),
            elem.attr("href"), '',
            elem.attr("data-modal-btn-reject"),
            elem.attr("data-modal-btn-accept"));

        return false;
    });
    $("[data-delete-second]").on("click", function (event) {
        var elem = $(this);
        event.preventDefault();
        itcore_ui.ShowTopPopupConfirm_V3(
            "",
             elem.attr("data-modal-title"),
            elem.attr("data-modal-description"),
            elem.attr("href"), '',
            elem.attr("data-modal-btn-reject"),
            elem.attr("data-modal-btn-accept"));

        return false;
    });
    $('[data-toggle="tooltip"]').tooltip({ trigger: 'hover' });
}

$(document).ready(function () {
    control.Init();
});

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
    control.Init();
});