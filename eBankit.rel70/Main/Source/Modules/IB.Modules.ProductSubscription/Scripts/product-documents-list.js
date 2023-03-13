var eBankit = eBankit || {};

function readCookie(name) {
    var i, c, ca, nameEQ = name + "=";
    ca = document.cookie.split(';');
    for (i = 0; i < ca.length; i++) {
        c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1, c.length);
        }
        if (c.indexOf(nameEQ) === 0) {
            return c.substring(nameEQ.length, c.length);
        }
    }
    return '';
}

if (eBankit.DocumentList == undefined) {
    eBankit.DocumentList = (function () {
        var constants = {
            queryStringDocumentId: "docId",
            documentIdProperty: "document",
            selectorInputLabel: "[data-document-input-label='true']"
        };

        // Used by the upload component, this will remove animations and display error messages when the upload has ben unsuccessfull
        function UploadError(sender, args) {
            var inputFile = $(sender.get_inputFile());
            ToggleAnimation(true);
            var container = $("#" + inputFile.data("container"));
            if (container) {
                var errorMessage = "";
                if (args._errorMessage === "Invalid size") {
                    errorMessage = container.data("invalid-file-size");
                } else {
                    errorMessage = container.data("invalid-message")
                }
                DisplayErrorMessage(container, errorMessage);
                document.getElementById("aspnetForm").target = '';
            }
        };

        /* 
         * Used by the upload component, this will start the ajax request to upload the respective file.
         * Here all the validations to the file are made before the request.
         * The current url is updated with the respective document id to be processed in server side and all residual eventtarget and arguments are cleared
        */
        function StartUpload(sender, args) {
            var inputFile = $(sender.get_inputFile());

            if (inputFile.data("size") && !isNaN(inputFile.data("size"))) {
                var fileSize = sender.get_inputFile().files[0].size;
                if (fileSize > inputFile.data("size")) {
                     throw (new Error("Invalid size"));
                }
            }
            if (inputFile.data("format-types")) {
                var filename = args.get_fileName();
                var ext = filename.substring(filename.lastIndexOf("."));

                if (jQuery.inArray(ext, inputFile.data("format-types")) === -1) {
                    throw (new Error("Invalid Format"));
                }
            }

            ToggleAnimation();
            $("#__EVENTTARGET").val("");
            $("#__EVENTARGUMENT").val("");
            sender.set_postBackUrl(updateQueryStringParameter(sender.get_postBackUrl(), constants.queryStringDocumentId, inputFile.data(constants.documentIdProperty)));
        };

        // Used by the upload component, this will update the filename and hide the upload button when upload has been successfull
        function UploadComplete(sender, args) {
            var inputFile = $(sender.get_inputFile());
            var documentId = inputFile.data(constants.documentIdProperty);
            ToggleAnimation(true);
            UpdateFileName(documentId, args.get_fileName());
            inputFile.val("");
            HideErrorMessage($("#" + inputFile.data("container")));
        };

        function Load() {
            //WebForms form has to be multipart/form-data to process the upload file
            $("#aspnetForm").attr("enctype", "multipart/form-data");

            //Load all validations to input:file (types, size and respective messages)
            $(".file-input-container").not(".loaded").each(function () {
                var main = $(this);
                main.addClass("loaded");
                var input = main.find("input:file");
                if (input) {
                    if (main.data("accept")) {
                        input.attr("accept", main.data("accept"));
                    }
                    if (main.data("size")) {
                        input.data("size", main.data("size"));
                    }
                    if (main.data("format-types")) {
                        input.data("format-types", main.data("format-types"));
                    }
                    if (main.siblings("[id$=UploadDocumentsContainer]").length) {
                        input.data("container", main.siblings("[id$=UploadDocumentsContainer]").attr("id"));
                    }

                    var validationContainer = main.closest(".validation-file-container");
                    if (validationContainer) {
                        input.data("target-validation", validationContainer.attr("id"));
                    }
                }
            });

            //Bind click event for upload file and cancel file
            $(constants.selectorInputLabel).unbind("click");
            $(constants.selectorInputLabel).click(function () {
                var elem = $(this);
                elem.addClass("loaded");
                if (elem.data("target-cancel") !== undefined) {
                    ToggleAnimation();
                    eBankit.Presentation.NoLoading = true;
                    __doPostBack(elem.data("target-cancel"));
                }
                else {
                    var target = $("#" + elem.data("target") + " input:file");
                    target.data("document", elem.data("document-id"));
                    target.click();

                }
            });

            //Function for loading animation in downloading a file
            var downloadTimeout;
            var checkDownloadCookie = function () {
                if (!readCookie("loadedfile")) {
                    createCookie("loadedfile", "", -1);
                    ToggleAnimation(true);
                } else {
                    downloadTimeout = setTimeout(checkDownloadCookie, 1000); //Re-run this function in 1 second.
                }
            };

            //Bind click event for download file
            $("[data-document-download]").unbind("click");
            $("[data-document-download]").click(function (e) {
                var elem = $(this);
                elem.addClass("loaded");
                ToggleAnimation();
                createCookie("loadedfile", "0", 1);
                setTimeout(checkDownloadCookie, 1000); //Initiate the loop to check the cookie.
                eBankit.Presentation.NoLoading = true;
                __doPostBack(elem.data("document-download"));
            });

        };

        //Update file name method to all upload elements
        function UpdateFileName(documentId, fileName) {
            var label = $("[data-document-filename-id='" + documentId + "']");
            if (label) {
                label.html(fileName);
                var action = $("[data-document-id='" + documentId + "'].action-button");
                if (action) {
                    action.parent().addClass("loaded");
                    action.hide();
                    action.siblings(".action-cancel").show();
                    $("[name$=hdnUploaded][data-document-id='" + documentId + "']").val("TRUE");

                }
            }
        };

        //Animation toggle for all document components, this will prevent the trigger of actions when a upload/download/cancel event is been processed
        function ToggleAnimation(hide) {
            var elem = $(".document-list");
            if (elem) {
                if (hide) {
                    elem.parent().unblock();
                    eBankit.Presentation.NoLoading = false;
                } else {
                    elem.parent().unblock();
                    elem.parent().block({
                        css: { padding: "0px", margin: "0px", top: "0px", left: "0px", position: "absolute", background: "#f6f6f6", border: 0, width: "100%", height: "100%", opacity: 0.6 },
                        message: '<div class=\"loading-image\" style=\"top:calc(50% - 40px);margin:auto;opacity:1;\"></div>',
                        overlayCSS: { opacity: 0 }
                    });
                }
            }
        };

        //Method to verify if all the files of a certain component had been uploaded
        function UploadedAllFiles(elem) {
            if (elem) {
                var fields = elem.find("[name$=hdnUploaded]");
                var list = [];
                fields.each(function () {
                    if (this.value === "TRUE")
                        list.push(this);
                });
                if (list.length === fields.length) { return true; }
            }
            return false;
        }

        //Displays an error message on the main container of a specific document list
        function DisplayErrorMessage(elem, message) {
            var container = elem.closest(".validation-file-container");
            if (container) {
                container.addClass("error");
                if (message) {
                    var label = container.parent().find("> .label-error");
                    if (label.length) {
                        label.text(message).show();
                    }
                    else {
                        container.parent().append("<label class=\"label-error\">" + message + "</label>");
                    }
                }
            }
        }

        //Hides the error message on the main container of a specific document list
        function HideErrorMessage(elem) {

            var container = elem.closest(".validation-file-container");
            if (container) {
                container.removeClass("error");
                var label = container.parent().find("> .label-error");
                if (label) {
                    label.hide();
                }
            }
        }

        //Util for updating querystring of an url
        function updateQueryStringParameter(uri, key, value) {
            var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
            var separator = uri.indexOf('?') !== -1 ? "&" : "?";
            if (uri.match(re)) {
                return uri.replace(re, '$1' + key + "=" + value + '$2');
            }
            else {
                return uri + separator + key + "=" + value;
            }
        }

        return {
            UploadComplete: UploadComplete,
            StartUpload: StartUpload,
            UploadError: UploadError,
            Load: Load,
            UploadedAllFiles: UploadedAllFiles,
            DisplayErrorMessage: DisplayErrorMessage,
            HideErrorMessage: HideErrorMessage

        };

    }());
}
$(document).ready(function () {
    eBankit.DocumentList.Load();

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        eBankit.DocumentList.Load();
    });
});