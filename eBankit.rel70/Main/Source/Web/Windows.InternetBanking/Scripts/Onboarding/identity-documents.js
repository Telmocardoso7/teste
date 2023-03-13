var eBankit = eBankit || {};
eBankit.Onboarding = eBankit.Onboarding || {};

if (eBankit.Onboarding.IdentityDocs == undefined) {
    eBankit.Onboarding.IdentityDocs = (function () {
        var LoadDocumentTabs = function () {
            $(".content-tabs [data-value-input][data-value]").on("click", function () {
                var elem = $(this);
                var input = $(elem.data("value-input"));
                if (input)
                    input.val(elem.data("value"));
            });
        }

        return {
            LoadDocumentTabs: LoadDocumentTabs
        };
    }());

    $(document).ready(function () {
        eBankit.Onboarding.IdentityDocs.LoadDocumentTabs();

        $(".content-tabs [data-value-input][data-value]").attr('tabindex', '0');
        $(".content-tabs [data-value-input][data-value]").on('keyup', function (e) {
            if (e.keyCode === 32) {
                $(this).click();
            }      
        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(eBankit.Onboarding.IdentityDocs.LoadDocumentTabs);
    });
}