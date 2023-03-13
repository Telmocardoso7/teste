var divWait = "<div id=\"DivWait\" style=\"width: 50px; height: 100px; margin-left: auto; margin-right: auto; margin-top:100px; margin-bottom: auto; background-color: transparent;\"><div class=\"loading-image\"></div></div>";
var modalCustom_v1 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"dialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div class=\"modal-dialog\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") +"\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div style=\"min-height:150px\">" +
    "#CONTENT#" +
    divWait +
    "</div>" +
    "<div class=\"modal-footer\">#FOOTER#</div>" +
    "</div>" +
    "</div>" +
    "</div>";

var modalCustom_v2 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"dialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div class=\"modal-dialog\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body\">#CONTENT#</div>" +
    "<div class=\"modal-footer\">#FOOTER#</div>" +
    "</div>" +
    "</div>" +
    "</div>";

var modalFavoritsImage_v1 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"dialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div class=\"modal-dialog\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body\">#CONTENT#</div>" +
    "<div class=\"metro\">" +
    "<div class=\"listview\">" +
    "<a href=\"#\" class=\"list\">" +
    "<div class=\"list-content\">" +
    "<img src=\"images/excel2013icon.png\" class=\"icon\">" +

    "</div>" +
    "</a>" +
    "<a href=\"#\" class=\"list selected\">" +
    "<div class=\"list-content\">" +
    "<img src=\"images/onenote2013icon.png\" class=\"icon\">" +

    "</div>" +
    "</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>";

var modalIframePopup_v1 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"dialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div tabindex=\"0\"></div>" +
    "<div class=\"modal-dialog\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body\" style=\"overflow:hidden;padding:0px;\">" +
    "<iframe name=\"PopupIframe\" id=\"PopupMainIframe\" src=\"#LINK#\" frameborder=\"0\"  marginheight=\"0\"" +
    "marginwidth=\"0\"   onprerender=\"eBankit.Presentation.AutoResizeIFrame(this);\"  scrolling=\"no\" style=\"display:none;height:auto;width:100%;background-color: white;\" onload=\"this.style.display='block';eBankit.Presentation.AutoResizeIFrame(this); \"" +
    "role=\"presentation\"" +
    "></iframe>" +
    divWait +
    "</div>" +
    "<div class=\"modal-footer #SHOW_FOOTER#\">" +
    "<a href=\"#\" onclick=\"itcore_ui.HideModal();\" class=\"btn btn-primary\">" + top.eBankit.Presentation.GetResource("Close") + "</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "<div tabindex=\"0\"></div>" +
    "</div>";

var modalIframeClassPopup_v1 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"dialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div tabindex=\"0\"></div>" +
    "<div class=\"modal-dialog\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body\" style=\"overflow:hidden;padding:0px;\">" +
    "<iframe name=\"PopupIframe\" id=\"PopupMainIframe\" class=\"#IFRAME_CLASS#\" src=\"#LINK#\" frameborder=\"0\"  marginheight=\"0\"" +
    "marginwidth=\"0\"   onprerender=\"eBankit.Presentation.AutoResizeIFrame(this);\"  scrolling=\"no\" style=\"display:none;height:auto;width:100%;background-color: white;\" onload=\"this.style.display='block';eBankit.Presentation.AutoResizeIFrame(this); \"" +
    "></iframe>" +
    divWait +
    "</div>" +
    "<div class=\"modal-footer #SHOW_FOOTER#\">" +
    "<a href=\"#\" onclick=\"itcore_ui.HideModal();\" class=\"btn btn-primary\">" + top.eBankit.Presentation.GetResource("Close") + "</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "<div tabindex=\"0\"></div>" +
    "</div>";

var modalPopup_v1 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"alertdialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" aria-describedby=\"dialog_desc\" tabindex=\"-1\">" +
    "<div tabindex=\"0\"></div>" +
    "<div class=\"modal-dialog\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body\">" +
    "<p id=\"dialog_desc\">#CONTENT#</p>" +
    "</div>" +
    "<div class=\"modal-footer\">" +
    "<a href=\"#\" onclick=\"itcore_ui.HideModal();\" class=\"btn btn-primary\">" + eBankit.Presentation.GetResource("Close") + "</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "<div tabindex=\"0\"></div>" +
    "</div>";

var modalConfirmPopup_v1 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"alertdialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" aria-describedby=\"dialog_desc\" tabindex=\"-1\">" +
    "<div tabindex=\"0\"></div>" +
    "<div class=\"modal-dialog\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body\">" +
    "<p id=\"dialog_desc\">#CONTENT#</p>" +
    "</div>" +
    "<div class=\"modal-footer\">" +
    "<a href=\"#\" onclick=\"itcore_ui.HideModal();\" class=\"btn btn-default\">#BUTTON_NO#</a>" +
    "<a href=\"#\" id=\"btnyes\" onclick=\"#CALLBACKMETHOD;itcore_ui.HideModal();\" class=\"btn btn-primary\">#BUTTON_YES#</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "<div tabindex=\"0\"></div>" +
    "</div>";

var modalConfirmPopup_v2 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"alertdialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" aria-describedby=\"dialog_desc\" tabindex=\"-1\">" +
    "<div tabindex=\"0\"></div>" +
    "<div class=\"modal-dialog\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body\">" +
    "<p id=\"dialog_desc\">#CONTENT#</p>" +
    "</div>" +
    "<div class=\"modal-footer\">" +
    "<a href=\"#\" onclick=\"#CALLBACKNOMETHOD;itcore_ui.HideModal();\" class=\"btn btn-default\">" + eBankit.Presentation.GetResource("No") + "</a>" +
    "<a href=\"#\" id=\"btnyes\" onclick=\"#CALLBACKMETHOD;itcore_ui.HideModal();\" class=\"btn btn-primary\">" + eBankit.Presentation.GetResource("Yes") + "</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "<div tabindex=\"0\"></div>" +
    "</div>";

var modalConfirmPopup_v3 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"alertdialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div tabindex=\"0\"></div>" +
    "<div class=\"modal-dialog modal-dialog-v2\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header modal-header-v2\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body modal-body-v2\">" +
    "<div class=\"modal-body-icon text-center\"><i class=\"message-icon message-warning\"></i></div>" +
    "<div class=\"modal-subtitle\">" +
    "<h3>#SUBTITLE#</h3>" +
    "</div >" +
    "<p>#CONTENT#</p>" +
    "</div>" +
    "<div class=\"modal-footer row\">" +
    "<div class=\"col-sm-6 modal-col\">" +
    "<a href=\"#\" id=\"btnno_v2\" onclick=\"#CALLBACKNOMETHOD;itcore_ui.HideModal();\" class=\"btn btn-default modal-button\">#BUTTONNOTEXT#</a>" +
    "</div>" +
    "<div class=\"col-sm-6 modal-col \">" +
    "<a href=\"#\" id=\"btnyes_v2\" onclick=\"#CALLBACKMETHOD;itcore_ui.HideModal();\" class=\"btn btn-default modal-button\">#BUTTONYESTEXT#</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "<div tabindex=\"0\"></div>" +
    "</div>";

var modalConfirmPopup_v4 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"alertdialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div tabindex=\"0\"></div>" +
    "<div class=\"modal-dialog modal-dialog-v2\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header modal-header-v2\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body modal-body-v2\">" +
    "<div class=\"modal-body-icon text-center\"><i class=\"message-icon message-warning\"></i></div>" +
    "<div class=\"modal-subtitle\">" +
    "<h3>#SUBTITLE#</h3>" +
    "</div >" +
    "<p>#CONTENT#</p>" +
    "</div>" +
    "<div class=\"modal-footer row\">" +
    "<div class=\"col-sm-6 modal-col\">" +
    "<a href=\"#\" id=\"btnno_v2\" onclick=\"#CALLBACKNOMETHOD;itcore_ui.HideModal();\" class=\"btn btn-default\">#BUTTONNOTEXT#</a>" +
    "</div>" +
    "<div class=\"col-sm-6 modal-col \">" +
    "<a href=\"#\" id=\"btnyes_v2\" onclick=\"#CALLBACKMETHOD;itcore_ui.HideModal();\" class=\"btn btn-primary\">#BUTTONYESTEXT#</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "<div tabindex=\"0\"></div>" +
    "</div>";

var modalLogoutPopup = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"alertdialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" aria-describedby=\"dialog_desc\" tabindex=\"-1\">" +
    "<div tabindex=\"0\"></div>" +
    "<div class=\"modal-dialog modal-dialog-v2\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header modal-header-v2\">" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body modal-body-v2\">" +
    "<div class=\"modal-body-icon text-center\"><i class=\"message-icon message-warning\"></i></div>" +
    "<p id=\"dialog_desc\">#CONTENT#</p>" +
    "</div>" +
    "<div class=\"modal-footer row\">" +
    "<div class=\"col-sm-8 modal-col modal-logoutPopupBtn\">" +
    "<a href=\"#\" id=\"btnConfirm\" onclick=\"#CALLBACKMETHOD;itcore_ui.HideModal();\" class=\"btn btn-default modal-button\">#BUTTONCONFIRMTEXT#</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "<div tabindex=\"0\"></div>" +
    "</div>";

var modalRemoveConsentPopup = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"dialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div class=\"modal-dialog modal-dialog-v2\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header modal-header-v2\">" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body modal-body-v2\">" +
    "<div class=\"modal-body-icon text-center\"><i class=\"message-icon message-warning\"></i></div>" +
    "<p>&nbsp;</p>" +
    "<p>#CONTENT#</p>" +
    "</div>" +
    "<div class=\"modal-footer row\">" +
    "<div class=\"col-sm-8 modal-col modal-logoutPopupBtn\">" +
    "<a href=\"#\" id=\"btnConfirm\" onclick=\"#CALLBACKMETHOD;itcore_ui.HideModal();\" class=\"btn btn-default modal-button\">#BUTTONCONFIRMTEXT#</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>";



var modalProofPopup_v1 = "<div id=\"divModalProofV1\" class=\"modal\" data-focus-on=\"input:first\" " +
    "role=\"dialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div class=\"modal-dialog\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">" + top.eBankit.Presentation.GetResource("ProofHeader") + "</h3>" +
    "</div>" +
    "<div id=\"divProofSucess\" class=\"alert alert-success alert-login alert-margin\">" +
    " <div>" + top.eBankit.Presentation.GetResource("ProofSucessfulMessage") + "</div>" +
    "</div>" +
    "<div id=\"divWaitProof\" style=\"width: 50px; height: 50px; margin-left: auto; margin-right: auto; margin-top: 20px; margin-bottom: auto; background-color: transparent;\">" +
    "<img src=\"/eBankit.Channels.Sites/eBankit.Ui.iWeb/Content/images/ajax-loader.gif\" alt=\"\" />" +
    "</div>" +
    "<div id=\"divProofContainer\" class=\"modal-body form-horizontal\">" +
    "<input type=\"hidden\" id=\"hdnProofSessionGuid\" />" +
    "<input type=\"hidden\" id=\"hdnProofInteractionId\" />" +
    "<input type=\"hidden\" id=\"hdnProofType\" />" +
    "<div class=\"control-group\" id=\"divGroupProofEmail\">" +
    "<label class=\"control-label\" for=\"txtProofEmail\">" + top.eBankit.Presentation.GetResource("ProofEmail") + "</label>" +
    "<div class=\"controls\"><input id=\"txtProofEmail\" onkeyup=\"itcore_ui.ResetControl('divGroupProofEmail');\" onblur=\"itcore_ui.ValidateEmail(this);\" type=\"text\" class=\"input-xlarge\" />" +
    "</div>" +
    "</div>" +
    "<div class=\"control-group\" id=\"divGroupProofSMS\">" +
    "<label class=\"control-label\" for=\"txtProofSMS\">" + top.eBankit.Presentation.GetResource("ProofSMS") + "</label>" +
    "<div class=\"controls\"><input id=\"txtProofSMS\" onkeyup=\"itcore_ui.ResetControl('divGroupProofSMS');\" onblur=\"itcore_ui.ValidateNumber(this);\" type=\"text\" class=\"input-xlarge\" />" +
    "</div>" +
    "</div>" +
    "<p id=\"pnProofMessage\"></p>" +
    "</div>" +
    "<div class=\"modal-footer\">" +
    "<a id=\"lnkcloseproof\" href=\"#\" onclick=\"itcore_ui.HideModal();\" class=\"btn\">" + top.eBankit.Presentation.GetResource("Close") + "</a>" +
    "<a id=\"lnkproof\" href=\"#\" onclick=\"itcore_ui.SendProof();\" class=\"btn btn-primary\">" + top.eBankit.Presentation.GetResource("Send") + "</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>";


var modalConfirmDdlPopup_v1 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"dialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div class=\"modal-dialog\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body form-horizontal\">" +
    "<p>#CONTENT#</p>" +

    "<div class=\"control-group\" id=\"divGroupReason\" >" +
    "<label class=\"control-label\" for=\"ddlCheckCancelReason_dlField\">" + top.eBankit.Presentation.GetResource("lblChooseCancelReason") + "</label>" +
    "<div class=\"controls field metro\">" +
    "<select name=\"ddlCheckCancelReason\" id=\"ddlCheckCancelReason_dlField\" class=\"cd-select valid has-error\" onchange=\"itcore_ui.RemoveErrorMessage();\" style=\"width: 100%;\">#OPTIONS#</select>" +
    "<label for=\"ddlCheckCancelReason_dlField\" class=\"error valid\" style=\"left:inherit; width:inherit;\"></label>" +
    "</div>" +
    "</div>" +
    "</div>" +

    "<div class=\"modal-footer\">" +
    "<a href=\"#\" onclick=\"itcore_ui.HideModal();\" class=\"btn btn-default\">" + top.eBankit.Presentation.GetResource("No") + "</a>" +
    "<a href=\"#\" id=\"btnyes\" onclick=\"#CALLBACKMETHOD;\" class=\"btn btn-primary\">" + top.eBankit.Presentation.GetResource("Yes") + "</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>";

var modalConfirmWithTextAreaPopup_v1 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"dialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div class=\"modal-dialog modal-dialog-v2\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header modal-header-v2\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body modal-body-v2\">" +

    "<div class=\"modal-subtitle-textarea\">" +
    "<p>#CONTENT#</p>" +
    "<div class=\"modal-text-area\">" +
    "<div class=\"modal-textarea-text\">" +
    "<span>#TEXTAREATEXT#</span>" +
    "</div>" +
    "<div class=\"modal-textarea\">" +
    "<textarea id=\"modalTxtArea\" maxlength=\"250\"></textarea>" +
    "</div > " +
    "</div > " +
    "</div >" +
    "</div>" +
    "<div class=\"modal-footer row\">" +
    "<div class=\"col-sm-6 modal-col\">" +
    "<a href=\"#\" id=\"btnno_v2\" onclick=\"#CALLBACKNOMETHOD;itcore_ui.HideModal();\" class=\"btn btn-default modal-button\">#BUTTONNOTEXT#</a>" +
    "</div>" +
    "<div class=\"col-sm-6 modal-col \">" +
    "<a href=\"#\" id=\"btnyes_v2\" onclick=\"#CALLBACKMETHOD;itcore_ui.HideModal();\" class=\"btn btn-default modal-button\">#BUTTONYESTEXT#</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>";

var modalConfirmWithTextAreaPopup_v2 = "<div id=\"divModalAlertV1\" class=\"modal\" " +
    "role=\"dialog\" aria-modal=\"true\" aria-labelledby=\"dialog_label\" tabindex=\"-1\">" +
    "<div class=\"modal-dialog modal-dialog-v2\">" +
    "<div class=\"modal-content\">" +
    "<div class=\"modal-header modal-header-v2\">" +
    "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"" + eBankit.Presentation.GetResource("Close") + "\">&times;</button>" +
    "<h3 id=\"dialog_label\">#TITLE#</h3>" +
    "</div>" +
    "<div class=\"modal-body modal-body-v2\">" +
    "<div class=\"modal-subtitle\">" +
    "<h3>#SUBTITLE#</h3>" +
    "</div >" +
    "<div class=\"modal-subtitle-textarea\">" +
    "<p>#CONTENT#</p>" +
    "<div class=\"modal-text-area\">" +
    "<div class=\"modal-textarea-text\">" +
    "<span>#TEXTAREATEXT#</span>" +
    "</div>" +
    "<div class=\"modal-textarea\">" +
    "<textarea id=\"modalTxtArea\" maxlength=\"250\"></textarea>" +
    "</div > " +
    "</div > " +
    "</div >" +
    "</div>" +
    "<div class=\"modal-footer row\">" +
    "<div class=\"col-sm-6 modal-col\">" +
    "<a href=\"#\" id=\"btnno_v2\" onclick=\"#CALLBACKNOMETHOD;itcore_ui.HideModal();\" class=\"btn btn-default modal-button\">#BUTTONNOTEXT#</a>" +
    "</div>" +
    "<div class=\"col-sm-6 modal-col \">" +
    "<a href=\"#\" id=\"btnyes_v2\" onclick=\"#CALLBACKMETHOD;itcore_ui.HideModal();\" class=\"btn btn-default modal-button\">#BUTTONYESTEXT#</a>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>";

(function ($) {
    $.fn.GetScrollXY = function () {
        var x = 0, y = 0;
        if (typeof (window.pageYOffset) == 'number') {
            // Netscape
            x = window.top.pageXOffset;
            y = window.top.pageYOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            // DOM
            x = document.body.scrollLeft;
            y = document.body.scrollTop;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            // IE6 standards compliant mode
            x = document.documentElement.scrollLeft;
            y = document.documentElement.scrollTop;
        }
        return [x, y];
    };
    $.fn.resizeCount = 0;
    $.fn.ShowModalProof = function (idg, interactionid, proofmessage, type) {
        var modalDiv = '#divModalProofV1';
        var maxHeight = 600;

        var sessionGuidObjectID = '#hdnProofSessionGuid';
        var interactionObjectID = '#hdnProofInteractionId';
        var proofTypeID = '#hdnProofType';

        window.top.$(sessionGuidObjectID).val(idg);
        window.top.$(interactionObjectID).val(interactionid);
        window.top.$(proofTypeID).val(type);

        if (type == 'email') {
            window.top.$("#divGroupProofEmail").show();
            window.top.$("#divGroupProofSMS").hide();
        }
        else {
            window.top.$("#divGroupProofEmail").hide();
            window.top.$("#divGroupProofSMS").show();
        }

        window.top.$('#pnProofMessage').html(proofmessage);
        window.top.$('#divProofSucess').hide();
        window.top.$('#divWaitProof').hide();

        window.top.$(modalDiv).modal({ keyboard: true, show: true });//.on('hide', callback);
        window.top.$(modalDiv).css("top", $(document).scrollTop() + 20);
        $(".undefined").hide();

    };

    $.fn.IgnoreUtilFocusChanges = false;

    $.fn.IsFocusable = function (element) {
        if (element.tabIndex > 0 || (element.tabIndex === 0 && element.getAttribute('tabIndex') !== null)) {
            return true;
        }

        if (element.disabled) {
            return false;
        }

        switch (element.nodeName) {
            case 'A':
                return !!element.href && element.rel != 'ignore';
            case 'INPUT':
                return element.type != 'hidden' && element.type != 'file';
            case 'BUTTON':
            case 'SELECT':
            case 'TEXTAREA':
                return true;
            default:
                return false;
        }
    };

    $.fn.AttemptFocus = function (element) {
        if (!$(this).IsFocusable(element)) {
            return false;
        }

        $(this).IgnoreUtilFocusChanges = true;
        try {
            element.focus();
        }
        catch (e) {
        }
        $(this).IgnoreUtilFocusChanges = false;
        return (document.activeElement === element);
    }; // end attemptFocus


    $.fn.FocusFirstDescendant = function (element) {
        for (var i = 0; i < element.childNodes.length; i++) {
            var child = element.childNodes[i];
            if ($(this).AttemptFocus(child) ||
                $(this).FocusFirstDescendant(child)) {
                return true;
            }
        }
        return false;
    };

    $.fn.ShowModalAlert = function (onTop, callback, onYes, onNo) {
        var modalDiv = '#divModalAlertV1';
        var maxHeight = 500;

        var top = $(this).GetScrollXY()[1];
        top = top + 50;
        // console.info("passou 1");
        if (onTop == true) {
            // console.info("passou 2");
            //window.top.$(modalDiv).css("top", top);
            window.top.$(modalDiv).modal({ keyboard: true, show: true });
            window.top.$(modalDiv).find('#btnyes').unbind().on('click', onYes);
            window.top.$(modalDiv).find('#btnno').unbind().on('click', onNo);
            window.top.$(modalDiv).find('.close').unbind().on('click', callback);

            //console.info("passou 4");
            //window.top.$(".undefined").hide();
            //console.info("passou 5");
            //window.top.$(modalDiv).find('#txtInputVal').focus();
            //console.info("passou 6");
        }
        else {
            // console.info("passou 3");
            $(modalDiv).css("top", top);
            $(modalDiv).modal({ keyboard: true, show: true });
            $(modalDiv).find('#btnyes').unbind().on('click', onYes);
            $(modalDiv).find('#btnno').unbind().on('click', onNo);
            $(modalDiv).find('.close').unbind().on('click', callback);

            //$(".undefined").hide();
        }
    };

    $.fn.HasScrollBar = function () {
        return this.get(0).scrollHeight > this.innerHeight();
    }

    $.fn.ResizeModal = function (opts) {

        $(this).contents().find('.no-dialog').hide();
        var options = $.extend({}, $.fn.ResizeModal.defaults, opts);
        var frameWidth = "";
        if (options.Width == "")
            frameWidth = window.innerWidth;// $(this).contents().width();
        else
            frameWidth = options.Width;

        if (typeof frameWidth === "undefined")
            frameWidth = $(this).contents().width();

        var frameHeight = $(this).contents().height();
        if ($(this).contents().find('body').height() > 0)
            frameHeight = $(this).contents().find('body').height();

        var parentHeight = frameHeight;

        if (frameWidth > options.maxWidth) {
            frameWidth = options.maxWidth;
        }


        if (frameHeight > 0) {

            $(this).css({
                height: frameHeight + parseInt(options.iframeMargin),
                opacity: 1
            });
        }

        var top = $(this).GetScrollXY()[1];
        top = top + 50;

        // console.info("ResizeModal#frameHeight:" + frameHeight);

        if (frameWidth > 0) {
            //$(this).width(frameWidth + 'px');
            var fullWidth = parseInt(frameWidth);// + parseInt(options.iframeMargin);

            //$(this).css('margin-left', parseInt(options.iframeMargin) / 2 + "px");
            $(this).closest(options.modalId).animate({
                width: 'auto',
                opacity: 1
                //marginLeft: "-" + fullWidth / 2 + "px",
                //top: 50
                //left: '50%'
            }, 1);
        }
    }

    $.fn.ResizeModal.defaults = {
        maxWidth: "500",
        maxHeight: "500",
        maxTries: 5,
        modalId: "#divModalAlertV1",
        iframeMargin: 0,
        isCustom: 0,
        Width: ""
    }

})(jQuery);

var itcore_ui = {

    DIV_MODAL: "#divModalAlertV1",
    INPUT_USERNAME: "#txtUserNameLogin",
    INPUT_PASSWORD: "#txtPasswordLogin",
    REPLACE_TAG_BUTTONNOTEXT: "#BUTTONNOTEXT#",
    REPLACE_TAG_BUTTONYESTEXT: "#BUTTONYESTEXT#",
    REPLACE_TAG_BUTTONCONFIRM: "#BUTTONCONFIRMTEXT#",
    REPLACE_TAG_CONTENT: "#CONTENT#",
    REPLACE_TAG_TITLE: "#TITLE#",
    REPLACE_TAG_SUBTITLE: "#SUBTITLE#",
    REPLACE_TAG_LINK: "#LINK#",
    REPLACE_TAG_SHOW_FOOTER: "#SHOW_FOOTER#",
    REPLACE_TAG_FOOTER: "#FOOTER#",
    REPLACE_TAG_OPTIONS: "#OPTIONS#",
    REPLACE_TAG_BUTTON_YES: "#BUTTON_YES#",
    REPLACE_TAG_BUTTON_NO: "#BUTTON_NO#",
    CALLBACKMETHOD: "#CALLBACKMETHOD",
    CALLBACKNOMETHOD: "#CALLBACKNOMETHOD",
    CALLBACKMETHOD2: "#CALLBACKMETHOD2",
    DIV_MODAL_PROOF: "#divModalProofV1",
    PROOF_MESSAGE: "#pnProofMessage",
    INPUT_EMAIL: "#txtProofEmail",
    INPUT_SMS: "#txtProofSMS",
    INPUT_CONFIRM: "#txtInputVal",
    REPLACE_IFRAME_CLASS: "#IFRAME_CLASS#",
    REPLACE_TAG_TEXTAREA_TEXT: "#TEXTAREATEXT#",


    ShowTopPopupProof: function (idg, idInteraction, message, type) {
        try {
            window.top.$(".topModalcontainer").html(modalProofPopup_v1.toString());
            $(this).ShowModalProof(idg, idInteraction, message, type);
        }
        catch (ex) {
            alert("itcore_ui.ShowTopPopupProof Error: " + ex.message);
        }
    },

    ShowCustom: function (message, title, footer, onYes, onNo, ocClose, autoResize, ifHeight, ifWidth, noblock) {
        try {
            message = unescape(message);
            if (message.indexOf("<iframe") != -1) {
                window.top.$(".topModalcontainer").html(modalCustom_v1.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, title).replace(itcore_ui.REPLACE_TAG_FOOTER, footer));
                $("#divModalAlertV1").find("iframe").hide();
            }
            else {
                window.top.$(".topModalcontainer").html(modalCustom_v2.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, title).replace(itcore_ui.REPLACE_TAG_FOOTER, footer));
            }
            if (!footer) {
                $(".modal-footer").remove();
            }

            $(this).ShowModalAlert(true, ocClose, onYes, onNo);

            $("#divModalAlertV1 iframe").on("load", function () {
                $("#divModalAlertV1").find("#DivWait").hide('fast');
                $("#divModalAlertV1").find("iframe").show();

                if (autoResize == 0) {
                    if (ifHeight) $(this).ResizeModal.defaults.maxHeight = ifHeight;
                    if (ifWidth) $(this).ResizeModal.defaults.maxWidth = ifWidth;
                }
                else {
                    $(this).ResizeModal.defaults.maxHeight = "500";
                    $(this).ResizeModal.defaults.maxWidth = "1200";
                }

                $(this).ResizeModal();

                ////if (noblock && top.interactionIframe != null && top.interactionIframe.MainIframeInner != null) {
                ////    top.interactionIframe.MainIframeInner.$.unblockUI();
                ////}
            });

        }
        catch (ex) {
            alert("itcore_ui.ShowCustom Error: " + ex.message);
        }
    },

    ShowFavoritImagev1: function (title, content, onCloseDelegate) {
        try {
            window.top.$(".topModalcontainer").html(modalFavoritsImage_v1.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, content).replace(itcore_ui.REPLACE_TAG_TITLE, title));
            $(this).ShowModalAlert(true, onCloseDelegate);
        }
        catch (ex) {
            alert("itcore_ui.ShowCustom Error: " + ex.message);
        }
    },

    ShowTopPopupWarning: function (message, headerTitle, onCloseDelegate) {
        // console.info("show top popup!");
        try {
            // console.info(eBankit.Presentation.GetResource("Close"));
            //console.info(modalPopup_v1.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle));
            window.top.$(".topModalcontainer").html(modalPopup_v1.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle));
            $(this).ShowModalAlert(true, onCloseDelegate);
        }
        catch (ex) {
            alert("itcore_ui.ShowTopPopupWarning Error: " + ex.message);
        }
    },

    ShowTopPopupConfirm: function (message, headerTitle, onYes, btnYesDescription, btnNoDescription, otherOptions) {
        try {
            if (btnYesDescription == undefined) {
                btnYesDescription = eBankit.Presentation.GetResource("Yes");
            }
            if (btnNoDescription == undefined) {
                btnNoDescription = eBankit.Presentation.GetResource("No");
            }
            window.top.$(".topModalcontainer").html(modalConfirmPopup_v1.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.CALLBACKMETHOD, onYes).replace(itcore_ui.REPLACE_TAG_BUTTON_NO, btnNoDescription).replace(itcore_ui.REPLACE_TAG_BUTTON_YES, btnYesDescription));

            if (otherOptions) {
                if (otherOptions.beforeShow instanceof Function) {
                    otherOptions.beforeShow.call(window.top.$(".topModalcontainer"));
                }
            }

            $(this).ShowModalAlert(true);
        }
        catch (ex) {
            alert("itcore_ui.ShowTopPopupConfirm Error: " + ex.message);
        }
    },

    ShowTopPopupConfirm_V2: function (message, headerTitle, onYes, onNo) {
        try {
            window.top.$(".topModalcontainer").html(modalConfirmPopup_v2.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.CALLBACKMETHOD, onYes).replace(itcore_ui.CALLBACKNOMETHOD, onNo));
            $(this).ShowModalAlert(true);
        }
        catch (ex) {
            alert("itcore_ui.ShowTopPopupConfirm Error: " + ex.message);
        }
    },

    ShowTopPopupConfirm_V3: function (message, headerTitle, subtitle, onYes, onNo, noBtnText, yesBtnText) {
        try {
            window.top.$(".topModalcontainer").html(modalConfirmPopup_v3.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.REPLACE_TAG_SUBTITLE, subtitle).replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.CALLBACKMETHOD, onYes).replace(itcore_ui.CALLBACKNOMETHOD, onNo).replace(itcore_ui.REPLACE_TAG_BUTTONYESTEXT, yesBtnText).replace(itcore_ui.REPLACE_TAG_BUTTONNOTEXT, noBtnText));
            $(this).ShowModalAlert(true);
        }
        catch (ex) {
            alert("itcore_ui.ShowTopPopupConfirm Error: " + ex.message);
        }
    },

    ShowTopPopupConfirm_V4: function (message, headerTitle, subtitle, onYes, onNo, noBtnText, yesBtnText) {
        try {
            window.top.$(".topModalcontainer").html(modalConfirmPopup_v4.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.REPLACE_TAG_SUBTITLE, subtitle).replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.CALLBACKMETHOD, onYes).replace(itcore_ui.CALLBACKNOMETHOD, onNo).replace(itcore_ui.REPLACE_TAG_BUTTONYESTEXT, yesBtnText).replace(itcore_ui.REPLACE_TAG_BUTTONNOTEXT, noBtnText));
            $(this).ShowModalAlert(true);
        }
        catch (ex) {
            alert("itcore_ui.ShowTopPopupConfirm Error: " + ex.message);
        }
    },

    ShowTopPopupConfirmWithTextArea_V1: function (headerTitle, message, textAreaText, onNo, onYes, noBtnText, yesBtnText) {
        try {
            window.top.$(".topModalcontainer").html(modalConfirmWithTextAreaPopup_v1.toString().replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TEXTAREA_TEXT, textAreaText).replace(itcore_ui.CALLBACKMETHOD, onNo).replace(itcore_ui.CALLBACKNOMETHOD, onYes).replace(itcore_ui.REPLACE_TAG_BUTTONYESTEXT, yesBtnText).replace(itcore_ui.REPLACE_TAG_BUTTONNOTEXT, noBtnText));
            $(this).ShowModalAlert(true);
        }
        catch (ex) {
            alert("itcore_ui.ShowTopPopupConfirm Error: " + ex.message);
        }
    },

    ShowTopPopupConfirmWithTextArea_V2: function (headerTitle, message, subtitle, textAreaText, onNo, onYes, noBtnText, yesBtnText) {
        try {
            window.top.$(".topModalcontainer").html(modalConfirmWithTextAreaPopup_v2.toString().replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_SUBTITLE, subtitle).replace(itcore_ui.REPLACE_TAG_TEXTAREA_TEXT, textAreaText).replace(itcore_ui.CALLBACKMETHOD, onNo).replace(itcore_ui.CALLBACKNOMETHOD, onYes).replace(itcore_ui.REPLACE_TAG_BUTTONYESTEXT, yesBtnText).replace(itcore_ui.REPLACE_TAG_BUTTONNOTEXT, noBtnText));
            $(this).ShowModalAlert(true);
        }
        catch (ex) {
            alert("itcore_ui.ShowTopPopupConfirm Error: " + ex.message);
        }
    },

    ShowTopPopupConfirmDropDownList: function (message, headerTitle, optionsList, selectedOptIndex, onYes) {
        try {
            var optionsString = "";
            if (Array.isArray(optionsList)) {
                for (i = 0; i < optionsList.length; ++i) {
                    optionsString = optionsString.concat("<option value=\"" + optionsList[i].value + "\" class=\"optionitem\"" + ((selectedOptIndex != null && selectedOptIndex == i) ? " selected=\"selected\"" : "") + ">" + optionsList[i].name + "</option>");
                }
            }

            window.top.$(".topModalcontainer").html(modalConfirmDdlPopup_v1.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.REPLACE_TAG_OPTIONS, optionsString).replace(itcore_ui.CALLBACKMETHOD, onYes));
            $(this).ShowModalAlert(true);
        }
        catch (ex) {
            alert("itcore_ui.ShowTopPopupConfirm Error: " + ex.message);
        }
    },

    ShowPopupWarning: function (message, headerTitle, onCloseDelegate) {
        try {
            if (window.$(".topModalcontainer").length == 0)
                window.$('<div class="topModalcontainer" />').appendTo("body");
            window.$(".topModalcontainer").html(modalPopup_v1.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle));
            window.$(this).ShowModalAlert(false, onCloseDelegate);
        }
        catch (ex) {
            alert("itcore_ui.Show Error: " + ex.message);
        }
    },

    ShowPopupWarning_V2: function (message, headerTitle, onConfirm, confirmBtnText) {
        try {
            if (window.$(".topModalcontainer").length == 0)
                window.$('<div class="topModalcontainer" />').appendTo("body");

            window.top.$(".topModalcontainer").html(modalLogoutPopup.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.CALLBACKMETHOD, onConfirm).replace(itcore_ui.REPLACE_TAG_BUTTONCONFIRM, confirmBtnText));
            $(this).ShowModalAlert(true);

            $('#divModalAlertV1').data('bs.modal').options.backdrop = 'static';
            $('#divModalAlertV1').data('bs.modal').options.keyboard = false;

        }
        catch (ex) {
            alert("itcore_ui.Show Error: " + ex.message);
        }
    },

    ShowPopupWarning_V2WS: function (message, headerTitle, onConfirm, confirmBtnText) {
        try {
            if (window.$(".topModalcontainer").length == 0)
                window.$('<div class="topModalcontainer" />').appendTo("body");

            window.top.$(".topModalcontainer").html(modalRemoveConsentPopup.toString().replace(itcore_ui.REPLACE_TAG_CONTENT, message).replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.CALLBACKMETHOD, onConfirm).replace(itcore_ui.REPLACE_TAG_BUTTONCONFIRM, confirmBtnText));
            $(this).ShowModalAlert(true);

            $('#divModalAlertV1').data('bs.modal').options.backdrop = 'static';
            $('#divModalAlertV1').data('bs.modal').options.keyboard = false;

        }
        catch (ex) {
            alert("itcore_ui.Show Error: " + ex.message);
        }
    },


    ShowPopupIframe: function (link, headerTitle, onClose, showFooter) {
        try {
            //$(this).ResizeModal.defaults.maxHeight = "500";
            //$(this).ResizeModal.defaults.maxWidth = "1200";

            if (window.$(".topModalcontainer").length == 0)
                window.$('<div class="topModalcontainer" />').appendTo("body");
            if (showFooter != true) {
                window.$(".topModalcontainer").html(modalIframePopup_v1.toString().replace(itcore_ui.REPLACE_TAG_SHOW_FOOTER, ""));
            }

            window.$("#PopupMainIframe").unbind("load");
            // console.info(window.$(".topModalcontainer").html());

            window.$(".topModalcontainer").html(modalIframePopup_v1.toString().replace(itcore_ui.REPLACE_TAG_SHOW_FOOTER, "undefined").replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.REPLACE_TAG_LINK, link));

            window.$(this).ShowModalAlert(false, onClose);

            window.$("#PopupMainIframe").one("load", function () {
                $(this).ResizeModal();
            });
        }

        catch (ex) {
            alert("ShowPopupIframe Error: " + ex.message);
        }
    },


    OpenSimpleWindow: function (url, extension) {
        setTimeout($.unblockUI, 500);

        if (extension == 'pdf' || extension == 'png') {
            window.open(url, '', 'statusbar=0 ,resizable=0,scrollbars=1,titlebar=0,personalbar=0,status=0,menubar=0, toolbar=0');
        }
        else {
            window.location.href = url;
        }
    },

    ShowTopPopupIframe: function (link, headerTitle, onClose, showFooter, mheight) {
        try {

            //$(this).ResizeModal.defaults.maxHeight = "600";
            //if (cwidth != undefined && cwidth != "undefined") {
            //    $(this).ResizeModal.defaults.maxWidth = cwidth;
            //    $(this).ResizeModal.defaults.Width = cwidth;
            //}
            //else
            //    $(this).ResizeModal.defaults.maxWidth = "1200";

            var height = '500px';
            if (mheight != null) {
                height = mheight;
            }

            if (showFooter === true) {
                top.$(".topModalcontainer").html(modalIframePopup_v1.toString().replace(itcore_ui.REPLACE_TAG_SHOW_FOOTER, ""));
            }

            top.$("#PopupMainIframe").unbind("load");

            top.$(".topModalcontainer").html(modalIframePopup_v1.toString().replace(itcore_ui.REPLACE_TAG_SHOW_FOOTER, "undefined").replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.REPLACE_TAG_LINK, link));
            top.$("#divModalAlertV1").find("iframe").hide();
            if (showFooter === true) {
            } else {
                top.$(".topModalcontainer").find(".modal-footer").remove();
            }

            $(this).ShowModalAlert(true, onClose);


            top.$("#PopupMainIframe").on("load", function () {
                //setTimeout(function () {
                //$(this).ResizeModal();
                top.$("#divModalAlertV1").find("#DivWait").hide('fast');
                top.$("#divModalAlertV1").find("iframe").show();
                top.$("#divModalAlertV1").find("iframe").css({
                    minHeight: height
                });
                $(this).ResizeModal();
                //}, 100);
            });
        }
        catch (ex) {
            alert("itcore_ui.Show Error: " + ex.message);
        }
    },



    ShowResizeTopPopupIframe: function (link, headerTitle, onClose, showFooter, iframeClass) {
        try {

            //$(this).ResizeModal.defaults.maxHeight = "600";
            //if (cwidth != undefined && cwidth != "undefined") {
            //    $(this).ResizeModal.defaults.maxWidth = cwidth;
            //    $(this).ResizeModal.defaults.Width = cwidth;
            //}
            //else
            //    $(this).ResizeModal.defaults.maxWidth = "1200";

            if (showFooter === true) {
                top.$(".topModalcontainer").html(modalIframeClassPopup_v1.toString().replace(itcore_ui.REPLACE_TAG_SHOW_FOOTER, ""));
            }

            top.$("#PopupMainIframe").unbind("load");

            top.$(".topModalcontainer").html(modalIframeClassPopup_v1.toString().replace(itcore_ui.REPLACE_TAG_SHOW_FOOTER, "undefined").replace(itcore_ui.REPLACE_TAG_TITLE, headerTitle).replace(itcore_ui.REPLACE_TAG_LINK, link).replace(itcore_ui.REPLACE_IFRAME_CLASS, iframeClass));
            top.$("#divModalAlertV1").find("iframe").hide();
            if (showFooter === true) {
            } else {
                top.$(".topModalcontainer").find(".modal-footer").remove();
            }

            $(this).ShowModalAlert(true, onClose);


            top.$("#PopupMainIframe").on("load", function () {
                //setTimeout(function () {
                //$(this).ResizeModal();
                top.$("#divModalAlertV1").find("#DivWait").hide('fast');
                top.$("#divModalAlertV1").find("iframe").show();
                $(this).ResizeModal();
                //}, 100);
            });
        }
        catch (ex) {
            alert("itcore_ui.Show Error: " + ex.message);
        }
    },


    ConfirmOkPress: function (e) {
        if (e.which != 13) {
            // console.info("keypress: " + e.which);
            return false;
        }
        else {
            // console.info("keypress: " + e.which);
            return true;
        }
    },

    HideModal: function () {
        $(itcore_ui.DIV_MODAL).modal('hide');
        $(itcore_ui.DIV_MODAL_PROOF).modal('hide');
    },

    PasswordLoginPress: function (e) {
        if (e.which == 13) {
            itcore_ui.Login();
        }
    },

    SendProof: function () {
        //
        // console.info("send 1");
        var ret = false;
        var email = $(itcore_ui.INPUT_EMAIL);
        var sms = $(itcore_ui.INPUT_SMS);
        var sessionid = $("#hdnProofSessionGuid");
        var interactionid = $("#hdnProofInteractionId");
        var proofType = $("#hdnProofType");
        var divWaitProof = $('#divWaitProof');
        var lnkcloseproof = $("#lnkcloseproof");
        var lnkproof = $("#lnkproof");
        // console.info("send 2");
        var divProofContainer = $("#divProofContainer");
        var divProofSuccess = $("#divProofSucess");

        // console.info("send type:" + proofType.val());
        if (proofType.val() == 'email') {
            if (email.val() == "") {
                $("#divGroupProofEmail").addClass("error");
                ret = false;
            }
            else {
                ret = window.top.eBankit.Presentation.ValidateEmailExp(email.val());
                if (ret == false) {
                    $("#divGroupProofEmail").addClass("error");
                    //window.top.eBankit.Presentation.InsertValidateMsg(email, top.eBankit.Presentation.GetResource("InvalidEmailMessage"));
                }
                else {
                    $("#divGroupProofEmail").removeClass("error");
                    //window.top.eBankit.Presentation.RemoveValidateMsg(email);
                }
            }
        }
        else if (proofType.val() == 'sms') {
            if (sms.val() == "") {
                $("#divGroupProofSMS").addClass("error");
                ret = false;
            }
            else {
                ret = window.top.eBankit.Presentation.ValidateNumeric(sms.val());
                if (ret == false) {
                    $("#divGroupProofSMS").addClass("error");
                    //window.top.eBankit.Presentation.InsertValidateMsg(sms, top.eBankit.Presentation.GetResource("InvalidPhoneMessage"));
                }
                else {
                    $("#divGroupProofSMS").removeClass("error");
                    //window.top.eBankit.Presentation.RemoveValidateMsg(sms);
                }
            }
        }
        if (!ret)
            return;
        else {
            window.top.eBankit.Presentation.Send(proofType.val(), email.val(), sessionid.val(), interactionid.val(), lnkproof, lnkcloseproof, divProofContainer, divProofSuccess, divWaitProof);
        }
    },

    ValidateEmail: function (elem) {
        var email = $("#" + elem.id);
        ret = window.top.eBankit.Presentation.ValidateEmailExp(email.val());
        if (ret == false) {
            $("#divGroupProofEmail").addClass("error");
            //window.top.eBankit.Presentation.InsertValidateMsg(email, top.eBankit.Presentation.GetResource("InvalidEmailMessage"));
        }
        else {
            $("#divGroupProofEmail").removeClass("error");
            //window.top.eBankit.Presentation.RemoveValidateMsg(email);
        }
    },

    ValidateNumber: function (elem) {
        var number = $("#" + elem.id);
        ret = window.top.eBankit.Presentation.ValidateNumeric(number.val());
        if (ret == false) {
            $("#divGroupProofSMS").addClass("error");
            //window.top.eBankit.Presentation.InsertValidateMsg(number, top.eBankit.Presentation.GetResource("InvalidPhoneMessage"));
        }
        else {
            $("#divGroupProofSMS").addClass("error");
            //window.top.eBankit.Presentation.RemoveValidateMsg(number);
        }
    },

    CallBackConfirm: function (funct) {
        var inconfirm = $(itcore_ui.INPUT_CONFIRM);
        var f = funct + "('" + inconfirm.val() + "');";
        eval(f);
    },

    ResetControl: function (groupId) {
        var group = $("#" + groupId);
        if (group != undefined) {
            group.removeClass("error");
        }
    },

    GetSelectedReasonValue: function () {
        var divGroupReason = $("#divGroupReason");
        var ddlCheckCancelReason = $("#ddlCheckCancelReason_dlField");
        var selectedNumber = ddlCheckCancelReason.val();

        ret = (selectedNumber != "-1");
        if (ret == false) {
            selectedNumber = null;
            window.top.eBankit.Presentation.InsertValidateMsg(ddlCheckCancelReason, top.eBankit.Presentation.GetResource("InvalidCancelReason"));
        }
        else {
            window.top.eBankit.Presentation.RemoveValidateMsg(ddlCheckCancelReason);
        }

        return selectedNumber;
    },

    RemoveErrorMessage: function () {
        var ddlCheckCancelReason = $("#ddlCheckCancelReason_dlField");

        window.top.eBankit.Presentation.RemoveValidateMsg(ddlCheckCancelReason);
    }
}

