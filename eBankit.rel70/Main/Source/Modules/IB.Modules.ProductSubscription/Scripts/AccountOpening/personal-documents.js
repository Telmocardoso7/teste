var eBankit = eBankit || {};
eBankit.AccountOpening = eBankit.AccountOpening || {};

if (eBankit.AccountOpening.PersonalDocuments == undefined) {
    $(document).ready(function () {
        eBankit.AccountOpening.PersonalDocuments = (function () {
            var ValidateDocumentStep = function () {
                var result = true;
                var container = $("[id$=UploadDocumentsContainer]");
                if (eBankit.DocumentList.UploadedAllFiles(container)) {
                    eBankit.DocumentList.HideErrorMessage(container);
                } else {
                    eBankit.DocumentList.DisplayErrorMessage(container, container.data("required-message"));
                    container.closest(".validation-file-container").addClass("error");
                    result = false;
                }
                return result;
            };
            return {
                ValidateDocumentStep: ValidateDocumentStep
            };
        }());
    });
}

AccountOpeningPersonalDocumentsAcessibility = function () {
    $(document).ready(function () {
        $("span[id*=LblFileDownload_], span[id*=LblFileUpload_], span[id*=LblFileUploadCancel_]").on('keydown', function (e) {
            if (e.keyCode === 32) {
                e.preventDefault();
                $(this).click();
            }
        });
    });
};