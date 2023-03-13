var eBankit = eBankit || {};
eBankit.Onboarding = eBankit.Onboarding || {};

if (eBankit.Onboarding.Documents == undefined) {
    eBankit.Onboarding.Documents = (function () {

        var bodyContainerSelector = ".orchestrator-container";
        var actionSubmitClassSelector = ".btn_action_1";

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

        var Load = function () {
            $(document).on('keypress', function (event) {
                var inputs = $(bodyContainerSelector).find(":input:checkbox");
                if (inputs.length === 1 && inputs.is(':checked')) {
                    if (event.keyCode === 13) {
                        event.preventDefault();
                        var btn = $(actionSubmitClassSelector);
                        if (btn) {
                            btn.get(0).click();
                        }
                    }
                }
            });
        };

        return {
            ValidateDocumentStep: ValidateDocumentStep,
            RemoveDocumentValidationCheckbox: RemoveDocumentValidationCheckbox,
            Load: Load
        };
    }());

    $(document).ready(function () {
        eBankit.Onboarding.Documents.RemoveDocumentValidationCheckbox();
        eBankit.Onboarding.Documents.Load();

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(eBankit.Onboarding.Documents.RemoveDocumentValidationCheckbox);
    });
}


eBankit.Onboarding.Acessibility = function () {
    $(document).ready(function () {
        $(".document-item-container.selectable").attr('tabindex', '0');
        $(".document-item-container.selectable").on('keyup', function (e) {
            if (e.keyCode === 32) {
                $(this).click();
            }
        });
        $("label[id$='lblAcceptTerms']").attr('tabindex', '0');
        $("label[id$='lblAcceptTerms']").on('keyup', function (e) {
            if (e.keyCode === 32) {
                $(this).click();
            }
        });
    });
};
