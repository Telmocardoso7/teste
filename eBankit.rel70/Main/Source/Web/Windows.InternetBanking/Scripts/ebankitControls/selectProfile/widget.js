var selectProfileControl = selectProfileControl || {};

selectProfileControl.widgetInit = function () {
    $(".profile-selector-container").not(".read-only").on("mouseover keypress", function () {
        var elem = $(this);
        elem.find(".profile-selector").addClass("active");
        elem.find(".profile-search > .search-container").show();
    });

    $(".profile-selector-container").not(".read-only").on("mouseleave", function () {
        var elem = $(this);
        elem.find(".profile-selector").removeClass("active");
        elem.find(".profile-search > .search-container").hide();
    });

    $(".profile-control-container").on("click", ".changes-profile", function (event) {
        var elem = $(this);

        if (elem.parents(".profile-control-container").hasClass("show-modal-popup")) {
            event.preventDefault();
            var contractId = elem.siblings(".contract-id").text();
            if (contractId === undefined || contractId == '')
                contractId = elem.siblings().find(".contract-id").text();


            itcore_ui.ShowTopPopupConfirm(selectProfileControl.ConfirmMsg, selectProfileControl.ConfirmTitle, "__doPostBack('SelectProfile'," + contractId + ")");
            return false;
        }
        return true;
    });
};


$(document).ready(function () {
    selectProfileControl.widgetInit();
});

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
    selectProfileControl.widgetInit();
});
