var eBankit = eBankit || {};
eBankit.AccountOpening = eBankit.AccountOpening || {};

if (eBankit.AccountOpening.TermsAndConditions == undefined) {
    $(document).ready(function () {
        eBankit.AccountOpening.TermsAndConditions = (function () {
            var ValidateDocumentStep = function () {
                var result = true;
                var checkbox = $("[id$=ckbAcceptTerms]");

                if (checkbox) {
                    var label = $("#lblCheckError");
                    if (label) {
                        if (!checkbox.is(":checked")) {
                            label.show();
                            result = false;
                        }
                        else {
                            label.hide();
                        }
                    }
                }

                return result;
            };

            var RemoveDocumentValidationCheckbox = function () {
                $("[id$=ckbAcceptTerms]").on("change", function () {
                    if (this.checked) {
                        var label = $("#lblCheckError");
                        if (label) {
                            label.hide();
                        }
                    }
                });
            };

            return {
                ValidateDocumentStep: ValidateDocumentStep,
                RemoveDocumentValidationCheckbox: RemoveDocumentValidationCheckbox
            };
        }());

        eBankit.AccountOpening.TermsAndConditions.RemoveDocumentValidationCheckbox();

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(eBankit.AccountOpening.TermsAndConditions.RemoveDocumentValidationCheckbox);
    });
}

AccountOpeningTermsAndConditionsAcessibility = function () {
    $(document).ready(function () {
        $("label[id$=lblAcceptTerms]").attr('tabindex', '0');
        $("label[id$=lblAcceptTerms], span[id*=LblFileDownload]").on('keydown', function (e) {
            if (e.keyCode === 32) {
                e.preventDefault();
                $(this).click();
            }
        });
    });
};