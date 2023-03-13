
eBankit.Presentation.TRX01018 = {}
			

eBankit.Presentation.TRX01018.EndRequest = function () {
    var allTooltipElem = document.getElementsByClassName('isAlias');
    for (var i = 0; i < allTooltipElem.length; i = i + 1) {

        $(allTooltipElem[i]).bind('mouseenter', function () {
            var $this = $(this);

            if (this.parentElement.offsetWidth - 20 < this.offsetWidth) {
                $this.attr('data-original-title', $this.text());               
            }
        });
    }
};

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01018.EndRequest);

$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();    
    eBankit.Presentation.TRX01018.EndRequest();    
});


