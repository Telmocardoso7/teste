
eBankit.Presentation.CredentialAuthorization = {}


eBankit.Presentation.CredentialAuthorization.EndRequest = function () {
    $(".resend-msg").on("click", function () {
        smsWasSuccess = false;
        tokenWasSuccess = false;
        matrixWasSuccess = false;
        smsRetry = true;

        GetSMSClick(divSmsToken, SessionGUID, InteractionId, null, transactionId, collapseSmsToken, collapseMatrixCard, collapseHardToken);
    });

    $(".resend-msg").keyup(function (e) {
        if (e.keyCode === 13) {
            $(this).click();
            e.preventDefault();
        }
    });
    $(".resend-msg").attr('aria-label', $(".resend-msg").parent()[0].innerText);
    $(".resend-msg").attr('tabindex', '0');

    $('input:password').keydown(function (e) {
        if (e.which === 13) {
            $('[id$=btnNextFlowItem]')[0].click();
            e.preventDefault();
        }
    });

    var hdnShowSMSPanel = $('[id$=hdnShowSMSPanel]');
    var hdnShowHardTokenPanel = $('[id$=hdnShowHardTokenPanel]');
    //alert("hdnShowSMSPanel: "+hdnShowSMSPanel.val()+"\nhdnShowHardTokenPanel: "+hdnShowHardTokenPanel.val());

    if (hdnShowSMSPanel.val() === "1") {
        smsWasSuccess = true;
        var openContainer = $("#" + collapseSmsToken);
        var closeContainer = $("#" + collapseMatrixCard);
        var closeContainer2 = $("#" + collapseHardToken);
        var mainContainer = $("#" + transactionId);

        ToogleArrowLeftDownIcon(collapseSmsTokenIcon.id);
        if (openContainer.is(":hidden")) {
            openContainer.slideDown('fast');

            if (closeContainer.is(":visible")) {
                //ToogleArrowLeftDownIcon(collapseMatrixCardIcon.id);
                ToogleArrowLeftDownIcon(collapseHardTokenIcon.id);
                closeContainer.slideUp('fast');
            }
            if (closeContainer2.is(":visible")) {
                //ToogleArrowLeftDownIcon(collapseHardTokenIcon.id);
                //ToogleArrowLeftDownIcon(collapseMatrixCardIcon.id);
                closeContainer2.slideUp('fast');
            }
        }
        else {
            //closeContainer.slideDown('fast');
            //openContainer.slideUp('fast');
        }

        $('.trs_buttons').show();
        $('.trs_buttons-action').show();

        authentFormSMS.show();
        $("[id$=tabcontentinfo]").hide();

        $.unblockUI();
    }
    else if (hdnShowHardTokenPanel.val() === "1") {
        tokenWasSuccess = true;
        var openContainer = $("#" + collapseHardToken);
        var closeContainer = $("#" + collapseMatrixCard);
        var closeContainer2 = $("#" + collapseSmsToken);
        var mainContainer = $("#" + transactionId);
        //alert("collapseHardToken: "+collapseHardToken+"\ncollapseMatrixCard: "+collapseMatrixCard+"\ncollapseSmsToken: "+collapseSmsToken);

        ToogleArrowLeftDownIcon(collapseHardTokenIcon.id);
        if (openContainer.is(":hidden")) {
            openContainer.slideDown('fast');

            if (closeContainer.is(":visible")) {
                ToogleArrowLeftDownIcon(collapseSmsTokenIcon.id);
                closeContainer.slideUp('fast');
            }
            if (closeContainer2.is(":visible")) {
                //ToogleArrowLeftDownIcon(collapseSmsTokenIcon.id);
                closeContainer2.slideUp('fast');
            }
        }
        else {
            //closeContainer.slideDown('fast');
            //openContainer.slideUp('fast');
        }

        $('.trs_buttons').show();
        $('.trs_buttons-action').show();

        authentFormHardToken.show();
        $("[id$=tabcontentinfo]").hide();

        $.unblockUI();
    }
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.CredentialAuthorization.EndRequest);


$(document).ready(function () {
    eBankit.Presentation.CredentialAuthorization.EndRequest();

    if (contractId != null) {

        var link = "javascript: eBankit.document.location.href = '/Controls/Contract/ContractDetails.aspx?contract=" + contractId + "'";

        $("[id*=btnBackFlowItem]").attr("onclick", link);
        $("[id*=btnBackFlowItem]").attr("href", null);
    }

});

var smsWasSuccess = false;
var tokenWasSuccess = false;
var matrixWasSuccess = false;
var smsRetry = false;
var position1, position2, position3;

function GetSMSClick(anchorId, idg, interactionid, labels, trid, openDivId, closeDivId, closeDivId2) {
    var divErrorSMS = $('#divErrorSMS');
    divErrorSMS.hide();
    var divErrorHardToken = $('#divErrorHardToken');
    divErrorHardToken.hide();
    var divErrorPositions = $('#divErrorPositions');
    divErrorPositions.hide();
    var divErrorPassword = $('#divErrorPassword');
    divErrorPassword.hide();
    matrixWasSuccess = false;

    var openContainer = $("#" + openDivId);
    var closeContainer = $("#" + closeDivId);
    var closeContainer2 = $("#" + closeDivId2);
    var mainContainer = $("#" + trid);


    if (smsWasSuccess === false) {
        var sendBtn = $('[id$=btnSendSMS]');

        if (sendBtn.data("modal-display") == true) {
            var template = $(".js-deliveryType-container").clone();
            var dropdown = template.find(".js-deliveryType-dropdown");
            if (dropdown) {
                dropdown.removeAttr("for");
                dropdown.find("select").removeAttr("id");
            }

            var msg = template.html();
            var header = sendBtn.data("modal-title");
            var btnYesDescription = sendBtn.data("modal-accept-btn");
            var btnNoDescription = sendBtn.data("modal-cancel-btn");
            var onYes = "CloseDeliveryTypeModal();";
            var otherOptions = {
                beforeShow: PrepareDeliveryTypeModal
            };

            itcore_ui.ShowTopPopupConfirm(msg, header, onYes, btnYesDescription, btnNoDescription, otherOptions);
        } else {
            RequestNewSMS();
        }
    }
    else {
        $('.trs_buttons-action').show();
        ToogleArrowLeftDownIcon(collapseSmsTokenIcon.id);
        if (openContainer.is(":hidden")) {
            openContainer.slideDown('fast');

            if (closeContainer.is(":visible")) {
                ToogleArrowLeftDownIcon(collapseMatrixCardIcon.id);
                closeContainer.slideUp('fast');
            }
            if (closeContainer2.is(":visible")) {
                ToogleArrowLeftDownIcon(collapseHardTokenIcon.id);
                closeContainer2.slideUp('fast');
            }
        }
        else {
            //closeContainer.slideDown('fast');
            openContainer.slideUp('fast');
        }
    }
}

function RequestNewSMS() {
    authentFormSMS.hide();

    var hdnGetPositions = $('[id$=hdnGetPositions]');
    hdnGetPositions.val(2);

    eBankit.Presentation.BlockPageForAjaxRequest();

    var sendBtn = $('[id$=btnSendSMS]');
    sendBtn.click();
}

function CloseDeliveryTypeModal() {
    var dropdown = window.top.$(".topModalcontainer").find(".js-deliveryType-dropdown select");
    var input = $(".js-deliveryType-value");
    if (dropdown && input) {
        input.val(dropdown.val());
    }
    RequestNewSMS();
}

function PrepareDeliveryTypeModal() {
    var modal = this.find(".modal");
    if (modal) {
        modal.addClass("modal-form");
    }
}

function GetHardToken(anchorId, idg, interactionid, labels, trid, openDivId, closeDivId, closeDivId2) {
    var divErrorSMS = $('#divErrorSMS');
    divErrorSMS.hide();
    var divErrorHardToken = $('#divErrorHardToken');
    divErrorHardToken.hide();
    var divErrorPositions = $('#divErrorPositions');
    divErrorPositions.hide();
    var divErrorPassword = $('#divErrorPassword');
    divErrorPassword.hide();

    var openContainer = $("#" + openDivId);
    var closeContainer = $("#" + closeDivId);
    var closeContainer2 = $("#" + closeDivId2);
    var mainContainer = $("#" + trid);

    matrixWasSuccess = false;

    if (tokenWasSuccess === false) {
        var anchor = $("#" + anchorId);
        authentFormHardToken.hide();

        var hdnGetPositions = $('[id$=hdnGetPositions]');
        hdnGetPositions.val(3);

        eBankit.Presentation.BlockPageForAjaxRequest();

        $('[id$=btnRequestToken]').click();
    }
    else {
        $('.trs_buttons-action').show();
        ToogleArrowLeftDownIcon(collapseHardTokenIcon.id);
        if (openContainer.is(":hidden")) {
            openContainer.slideDown('fast');

            if (closeContainer.is(":visible")) {
                ToogleArrowLeftDownIcon(collapseSmsTokenIcon.id);
                closeContainer.slideUp('fast');
            }

            if (closeContainer2.is(":visible")) {
                ToogleArrowLeftDownIcon(collapseMatrixCardIcon.id);
                closeContainer2.slideUp('fast');
            }
        }
        else {
            //closeContainer.slideDown('fast');
            openContainer.slideUp('fast');
        }
    }
}

function GetSMS(anchorId, idg, interactionid, labels, trid, openDivId, closeDivId, closeDivId2) {
    var divErrorSMS = $('#divErrorSMS');
    divErrorSMS.hide();
    var divErrorHardToken = $('#divErrorHardToken');
    divErrorHardToken.hide();
    var divErrorPositions = $('#divErrorPositions');
    divErrorPositions.hide();
    var divErrorPassword = $('#divErrorPassword');
    divErrorPassword.hide();

    var openContainer = $("#" + openDivId);
    var closeContainer = $("#" + closeDivId);
    var closeContainer2 = $("#" + closeDivId2);
    var mainContainer = $("#" + trid);

    matrixWasSuccess = false;

    if (smsWasSuccess === false) {
        var anchor = $("#" + anchorId);
        authentFormSMS.hide();

        var hdnGetPositions = $('[id$=hdnGetPositions]');
        hdnGetPositions.val(2);

        eBankit.Presentation.BlockPageForAjaxRequest();

        $('[id$=btnSendSMS]').click();
    }
    else {
        $('.trs_buttons-action').show();
        ToogleArrowLeftDownIcon(collapseSmsTokenIcon.id);
        if (openContainer.is(":hidden")) {
            openContainer.slideDown('fast');

            if (closeContainer.is(":visible")) {
                ToogleArrowLeftDownIcon(collapseMatrixCardIcon.id);
                closeContainer.slideUp('fast');
            }

            if (closeContainer2.is(":visible")) {
                ToogleArrowLeftDownIcon(collapseHardTokenIcon.id);
                closeContainer2.slideUp('fast');
            }
        }
        else {
            //closeContainer.slideDown('fast');
            openContainer.slideUp('fast');
        }
    }
}

function GetPositionsMatrix(anchorId, idg, interactionid, openDivId, closeDivId, closeDivId2) {
    var divErrorSMS = $('#divErrorSMS');
    divErrorSMS.hide();
    var divErrorHardToken = $('#divErrorHardToken');
    divErrorHardToken.hide();
    var divErrorPositions = $('#divErrorPositions');
    divErrorPositions.hide();
    var divErrorPassword = $('#divErrorPassword');
    divErrorPassword.hide();
    smsWasSuccess = false;
    tokenWasSuccess = false;

    var anchor = $("#" + anchorId);

    var openContainer = $("#" + openDivId);
    var closeContainer = $("#" + closeDivId);
    var closeContainer2 = $("#" + closeDivId2);
    var mainContainer = $("#" + interactionid);

    var hdnShowSMSPanel = $('[id$=hdnShowSMSPanel]');
    hdnShowSMSPanel.val("0");

    var hdnShowHardTokenPanel = $('[id$=hdnShowHardTokenPanel]');
    hdnShowHardTokenPanel.val("0");

    //anchor.prop("onclick", null);
    if (matrixWasSuccess === false) {
        authentFormMatrix.hide();

        var hdnGetPositions = $('[id$=hdnGetPositions]');
        hdnGetPositions.val(1);

        eBankit.Presentation.BlockPageForAjaxRequest();

        url = "services.axd?Method=GetPositions";
        var listData = "&g=" + idg + "&InteractionId=" + interactionid;
        $.ajax({
            type: "POST",
            url: url + listData,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "text/javascript, application/javascript, */*, text/javascript,application/javascript,text/html");
                xhr.setRequestHeader("Content-type", "application/json; charset=utf-8");
            },
            success: function (ret) {
                matrixWasSuccess = true;

                var positions = ret;

                //lblPositionMatrix_1.text(positions[0]);
                //lblPositionMatrix_2.text(positions[1]);
                //lblPositionMatrix_3.text(positions[2]);

                lblPositionMatrix_1.text(positions[0].split(".")[0] + ", " + positions[0].split(".")[1] + top.eBankit.Presentation.GetResource("Position"));
                lblPositionMatrix_2.text(positions[1].split(".")[0] + ", " + positions[1].split(".")[1] + top.eBankit.Presentation.GetResource("Position"));
                lblPositionMatrix_3.text(positions[2].split(".")[0] + ", " + positions[2].split(".")[1] + top.eBankit.Presentation.GetResource("Position"));

                position1 = positions[0].split(".")[0];
                position2 = positions[1].split(".")[0];
                position3 = positions[2].split(".")[0];

                lblPositionMatrix_1.focus();

                for (var i = 0; i < positions.length; i++) {
                    var strPos = "---";
                    var strOldPos = "---";
                    var codePos = parseInt(positions[i].split('.')[1]);

                    if (codePos > 0 && codePos < 4) {

                        switch (codePos) {
                            case 1:
                                strPos = "? - -";
                                break;
                            case 2:
                                strPos = "- ? -";
                                break;
                            case 3:
                                strPos = "- - ?";
                                break;
                        }
                        strOldPos = eval("$('#p" + positions[i].split(".")[0] + " span').text();");
                        if (strOldPos !== '') {
                            switch (strOldPos) {
                                case "? - -":
                                    if (codePos === 2)
                                        strPos = "? ? -";
                                    else if (codePos === 3)
                                        strPos = "? - ?";
                                    break;
                                case "- ? -":
                                    if (codePos === 1)
                                        strPos = "? ? -";
                                    else if (codePos === 3)
                                        strPos = "- ? ?";
                                    break;
                                case "- - ?":
                                    if (codePos === 1)
                                        strPos = "? - ?";
                                    else if (codePos === 2)
                                        strPos = "- ? ?";
                                    break;
                            }
                        }
                        eval("$('#p" + positions[i].split(".")[0] + " span').text('" + strPos + "');");
                        eval("$('#p" + positions[i].split(".")[0] + " span').addClass('pos-sel');");
                    }
                }

                ToogleArrowLeftDownIcon(collapseMatrixCardIcon.id);
                if (openContainer.is(":hidden")) {
                    openContainer.slideDown('fast');

                    if (closeContainer.is(":visible")) {
                        ToogleArrowLeftDownIcon(collapseSmsTokenIcon.id);
                        closeContainer.slideUp('fast');
                    }

                    if (closeContainer2.is(":visible")) {
                        ToogleArrowLeftDownIcon(collapseSmsTokenIcon.id);
                        closeContainer2.slideUp('fast');
                    }
                }
                else {
                    //closeContainer.slideDown('fast');
                    openContainer.slideUp('fast');
                }

                $('.trs_buttons').show();
                $('.trs_buttons-action').show();

                authentFormMatrix.show();
                $("[id$=tabcontentinfo]").hide();


                $.unblockUI();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                //
                if (closeContainer.is(":visible")) {
                    ToogleArrowLeftDownIcon(collapseSmsTokenIcon.id);
                    closeContainer.slideUp('fast');
                }
                if (closeContainer2.is(":visible")) {
                    closeContainer2.slideUp('fast');
                }

                divErrorPositions.show();
                $('.trs_buttons').show();
                $('.trs_buttons-action').hide();

                $.unblockUI();
            }
        });
    }
    else {
        $('.trs_buttons-action').show();
        ToogleArrowLeftDownIcon(collapseMatrixCardIcon.id);
        if (openContainer.is(":hidden")) {
            openContainer.slideDown('fast');

            if (closeContainer.is(":visible")) {
                ToogleArrowLeftDownIcon(collapseSmsTokenIcon.id);
                closeContainer.slideUp('fast');
            }
            if (closeContainer2.is(":visible")) {
                ToogleArrowLeftDownIcon(collapseHardTokenIcon.id);
                closeContainer2.slideUp('fast');
            }
        }
        else {
            //closeContainer.slideDown('fast');
            openContainer.slideUp('fast');
        }
    }

}


function ToogleArrowLeftDownIcon(iconID) {
    var iconArrow = $('[id$=' + iconID + ']');
    if (iconArrow.hasClass("icon-right-arrow")) {
        iconArrow.removeClass("icon-right-arrow");
        iconArrow.addClass("icon-down-arrow");
    }
    else {
        iconArrow.removeClass("icon-down-arrow");
        iconArrow.addClass("icon-right-arrow");
    }
}

