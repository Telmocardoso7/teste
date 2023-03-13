eBankit.Presentation.AccountsControl.ShowScroll = function () {
    //
}

METRO_AUTO_REINIT = true;

$(document).ready(function () {
    $(".txtSearchText").val($(".txtSearchText").attr('title'));
    $(".ddlCorpGroups").change(function () {
        $(".txtSearchText").val('');
    });
    var showTransactionContent = $("[id$='displayTransactionContent']");
    if (showTransactionContent != undefined && showTransactionContent != null && showTransactionContent.val() == "0") {
        $(".trx-container").hide();
        $(".favorit-container").hide();
        $(".favorit-top-container").hide();
    }
    else {
        $(".trx-container").show();
        $(".favorit-container").show();
        $(".favorit-top-container").show();
    }
});

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
    $(".ddlCorpGroups").change(function () {
        $(".txtSearchText").val('');
    });
    var showTransactionContent = $("[id$='displayTransactionContent']");
    if (showTransactionContent != undefined && showTransactionContent != null && showTransactionContent.val() == "0") {
        $(".trx-container").hide();
        $(".favorit-container").hide();
        $(".favorit-top-container").hide();
    }
    else {
        $(".trx-container").show();
        $(".favorit-container").show();
        $(".favorit-top-container").show();
    }
});
