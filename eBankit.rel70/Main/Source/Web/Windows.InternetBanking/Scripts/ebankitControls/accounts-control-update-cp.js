eBankit.Presentation.AccountsControl.ShowScroll = function () {
    //
}
$(window).resize(function () {
    ReziseAccountsControlCP();
});

METRO_AUTO_REINIT = true;

$(document).ready(function () {
    $(".txtSearchText").val($(".txtSearchText").attr('title'));
    ReziseAccountsControlCP();
});
function ReziseAccountsControlCP() {
    var contentWidth = $("#scroolContentCorporate").width();
    var accountWidth = $("div[id*='divAccountType']").first().width() + 30;
    var nrAccounts = $("div[id*='divAccountType']").length;

    if (contentWidth > (nrAccounts * parseFloat(accountWidth)))
        $("div[id*='divExpandIcon']").hide();
    else
        $("div[id*='divExpandIcon']").show();
}
function ResizeAccountsControl() {
    if ($(".scrollContainerAccountsCorp").css("height") == "170px") {
        $("#scroolContentCorporate").css("height", "auto");
        $(".scrollContainerAccountsCorp").css("height", "auto");
        $("#scroolContentCorporate").slideDown();
        $(".scrollContainerAccountsCorp").slideDown();
        $(".CorpExpandButton").css("background-image", 'url("/content/themes/ebankit/images/icon/ico_arrow_dropdown_close.png")');
    }
    else {
        $(".scrollContainerAccountsCorp").css("height", "170px");
        $("#scroolContentCorporate").css("height", "120px");
        $(".scrollContainerAccountsCorp").slideDown();
        $("#scroolContentCorporate").slideDown();
        $(".CorpExpandButton").css("background-image", 'url("/content/themes/ebankit/images/icon/ico_arrow_dropdown.png")');
    }
};

$(".txtSearchText").on('keydown', function (e) {
    if (e.keyCode == 13) {
        $(".txtSearchText").blur();
    }
});

$(".txtSearchText").blur(function () {
    if ($(this).val() == '' && $(this).attr('title') != '') {
        $(this).val($(this).attr('title'));
    }
});

function WebForm_TextBoxKeyHandler(event) {
    return true;
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
    var showTransactionContent = $("[id$='displayTransactionContent']");
    if (showTransactionContent != undefined && showTransactionContent != null && showTransactionContent.val() == "0") {
        $(".trx-container").hide();
    }
    else {
        $(".trx-container").show();
    }
    ReziseAccountsControlCP();
});
