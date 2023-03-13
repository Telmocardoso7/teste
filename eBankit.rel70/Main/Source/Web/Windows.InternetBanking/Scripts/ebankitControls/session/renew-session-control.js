eBankit = eBankit || {};
eBankit.Presentation = eBankit.Presentation || {};
eBankit.Presentation.RenewSessionControl = (function () {
    var Renew = function () {
        var renewBtn = $(".btn-renew");
        if (renewBtn.length > 0) {
            var name = renewBtn.attr("name");
            setTimeout(function () { __doPostBack(name) }, 0);
        }
    };

    return {
        Renew: Renew
    };
})();

$(document).ready(function () {
    eBankit.Presentation.RenewSessionControl.Renew();
});