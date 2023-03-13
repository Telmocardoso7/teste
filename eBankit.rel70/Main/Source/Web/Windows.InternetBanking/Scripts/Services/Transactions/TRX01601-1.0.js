eBankit.Presentation.TRX01601 = {}
eBankit.Presentation.TRX01601.ValidateCustom = function () {
    var ret = true;

    if ($('[id$=TabImportFile]').hasClass("select")) {
        if ($('[id$=hiddenField]').val() == "") {
            eBankit.Presentation.InsertValidateMsg_V2($('[id$=txtUploadFile_txField]'), top.eBankit.Presentation.GetResource("RequiredField"));
            ret = false;
        } else {
            eBankit.Presentation.RemoveValidateMsg($('[id$=txtUploadFile_txField]'));
        }
    }
    else if ($('[id$=TabManualUpload]').hasClass("select")) {
        if ($('[id$=hdnTableOpen]').val() == "0" && $('[id$=hdnGridWithData]').val() == "0") {
            ret = false;
        }
    }

    return ret;
}

$(document).ready(function () {
    _loadFile();
});

function _loadFile() {
    $('input[type=file]').change(function () {
        var rowcheck = 0;
        /// Load the input into an jquery object
        var $inputFile = $(this);
        /// Set label value using control's index attribute
        var row = $inputFile.attr("index");

        var nameFile = $inputFile.val().split('\\').reverse()[0];

        hiddenField.val(nameFile);
        __doPostBack(btnUploadFileValidate, '');
    });
}

function ReloadPage() {
    location.reload();
}

