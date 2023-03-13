
eBankit.Presentation.TRX02101 = {}


eBankit.Presentation.TRX02101.EndRequest = function () {
    //   
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX02101.EndRequest);


$(document).ready(function () {
    eBankit.Presentation.TRX02101.EndRequest();
});


var prm = Sys.WebForms.PageRequestManager.getInstance();

prm.add_pageLoaded(function () {
    $(".panel-search-toggle").on("click", function () {
        $(".panel-search").slideToggle();
    });
    eBankit.Presentation.TRX02101.EndRequest();
});

prm.add_pageLoaded(function () {
    var btnSelectBanks = $("[id$='btnSelectBank']");
    $('.bankBox').each(function () {

        $(this).on("click", function () {
            $(this).toggleClass('toggle-selected');
            $('.bankBox').not(this).removeClass('toggle-selected');
            if ($(this).hasClass('toggle-selected')) {
                btnSelectBanks.removeClass('disabled');
                btnSelectBanks.removeAttr('disabled');
            }
            else {
                btnSelectBanks.addClass('disabled');
                btnSelectBanks.attr('disabled', 'disabled');
            }
        });
    });
});




