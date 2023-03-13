

$(document).ready(function () {
    var contractId = $("[id*=OldContractId]").val();
    var link = "javascript: eBankit.document.location.href = '/Controls/Contract/ContractDetails.aspx?contract=" + contractId + "'";
    $("[id*=btnBackFlowItem]").attr("onclick", link);
    $("[id*=btnBackFlowItem]").attr("href", null);

    $('.panel-heading').on('click', function () {
        if (!$(this).hasClass('collapsed')) {
            //closed
            var actionButton = $(this).find('.step-muc-actions .muc-exp-col');
            actionButton.removeClass('muc-details-collapse');
            actionButton.addClass('muc-details-expand');
            actionButton.attr('data-original-title', textForExpand);
            actionButton.attr('aria-label', textForExpand);
            actionButton.mouseleave();
        }
        else {
            //open
            $('.muc-exp-col').removeClass('muc-details-collapse');
            $('.muc-exp-col').addClass('muc-details-expand');
            $('.muc-exp-col').attr('data-original-title', textForExpand);

            var actionButton = $(this).find('.step-muc-actions .muc-exp-col');
            actionButton.removeClass('muc-details-expand');
            actionButton.addClass('muc-details-collapse');
            actionButton.attr('data-original-title', textForCollapse);
            actionButton.attr('aria-label', textForCollapse);
            actionButton.mouseleave();
        }
    });

    $('[data-toggle="tooltip"]').tooltip({ trigger: 'hover' });
});


eBankit.Presentation.TRX01902 = {}
			

eBankit.Presentation.TRX01902.EndRequest = function () {
    //   
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01902.EndRequest);

