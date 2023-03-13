var SimulatorServices = (function () {

    function error(_error) {
        closePartialView();
        console.log('_error', _error);
        return _error;
    }



    //Services for MDC Controller
    function ignoreCall(identifier) {
        if (identifier === null || identifier === undefined) {
            identifier = $('#interactionIdCall').val();
        }

        $.ajax({
            url: "/CTI/MediaBarManager/IgnoreCall",
            type: "POST",
            data: { identifier: identifier },
            success: function () {
                $("#answerCallModal")[0].style.display = "none";
                $('#simulatorBodyId').load(document.URL + ' #simulatorBodyId');
            },
            error: error
        });
    }

    function answerCall(identifier) {
        if (identifier === null || identifier === undefined) {
            identifier = $('#interactionIdCall').val();
        }

        $.ajax({
            url: "/CTI/MediaBarManager/ConfirmAnswerCall",
            type: "POST",
            data: { identifier: identifier },
            success: function () {
                $("#answerCallModal")[0].style.display = "none";
                $('#simulatorBodyId').load(document.URL + ' #simulatorBodyId');
            },
            error: error
        });
    }



    //Services for Silent Controller


    function autenticateOperator() {
        var username = $("#operatorUsername").val();

        var urlModel = {
            url: "/CTI/SilenceManager/AutenticateUser",
            type: "POST",
            data: { username: username }
        };

        ajaxCall(urlModel, $('#simulatorBodyId'));
    }

    function logoutOperator(username, forceLogout) {
        var urlModel = {
            url: "/CTI/SilenceManager/LogoutUser",
            type: "POST",
            data: { username: username, forceLogout: forceLogout }
        };

        ajaxCall(urlModel, $('#simulatorBodyId'));
    }

    function selectUser(username) {
        var urlModel = {
            url: "/CTI/SilenceManager/SelectUser",
            type: "POST",
            data: { username: username }
        };

        ajaxCall(urlModel, $('#simulatorBodyId'));
    }

    function generateNewinteraction(interactionType) {
        var _url = "";
        var urlModel = "";
        if (interactionType === 'call') {
            _url = "/CTI/SilenceManager/NewCall";
            urlModel = {
                url: _url,
                type: "GET"
            };
            getView(urlModel);
        } else {
            _url = "/CTI/SilenceManager/NewEmail";
            urlModel = {
                url: _url,
                type: "POST"
            };

            ajaxCall(urlModel, $('#simulatorBodyId'));
        }
    }

    function assignToOperator(identifier) {

        var urlModel = {
            url: "/CTI/SilenceManager/Assign",
            data: { identifier: identifier }
        };
        getView(urlModel);
    }

    function confirmAssignToOperator(identifier) {
        var extension = $('#extension').val();
        var emailFrom = $('#emailFrom').val();
        var emailSubject = $('#emailSubject').val();
        var emailBody = $('#emailBody').val();


        var urlModel = {
            url: "/CTI/SilenceManager/ConfirmAssign",
            type: "POST",
            data: { extension: extension, identifier: identifier, emailFrom: emailFrom, emailSubject: emailSubject, emailBody: emailBody }
        };

        ajaxCall(urlModel, $('#divPartialViewContent'));
    }

    function callStart(username, identifier) {
        var extraParams = $('[id*="ExtraParameters"]');
        var extraParamsDictionary = [];
        if (extraParams.length > 0) {
            for (var i = 0; i < extraParams.length; i++) {
                extraParamsDictionary.push({
                    key: extraParams[i].name,
                    value: extraParams[i].value
                });
            }
        } else {
            extraParamsDictionary = null;
        }

        var urlModel = {
            url: "/CTI/SilenceManager/StartCall",
            type: "POST",
            data: { username: username, identifier: identifier, ExtraParameters: extraParamsDictionary }
        };

        ajaxCall(urlModel, $('#simulatorBodyId'));
    }

    function callEnd(username, identifier) {

        var urlModel = {
            url: "/CTI/SilenceManager/EndCall",
            type: "POST",
            data: { username: username, identifier: identifier }
        };

        ajaxCall(urlModel, $('#simulatorBodyId'));
    }

    function closeInteraction(identifier) {

        var urlModel = {
            url: "/CTI/SilenceManager/CloseCall",
            type: "POST",
            data: {identifier: identifier }
        };

        ajaxCall(urlModel, $('#simulatorBodyId'));
    }

    function closeEmail(identifier) {
        var urlModel = {
            url: "/CTI/SilenceManager/CloseEmail",
            type: "POST",
            data: { identifier: identifier }
        };

        ajaxCall(urlModel, $('#simulatorBodyId'));
    }

    function identifyCall(identifier) {

        var urlModel = {
            url: "/CTI/SilenceManager/IdentifyCall",
            data: { identifier: identifier }
        };
        getView(urlModel);
    }

    function confirmIdentifyCall(identifier, outbound) {
        var clientNumber = $('#clientNumberToIdentifyCall').val();

        var urlModel = {
            url: "/CTI/SilenceManager/ConfirmIdentifyCall",
            type: "POST",
            data: { identifier: identifier, clientNumber: clientNumber, interactionType: outbound }
        };

        if (outbound) {
            ajaxCallOutbound(urlModel);
        } else {
            ajaxCall(urlModel, $('#divPartialViewContent'));
        }
    }

    function authenticateCall(identifier) {
        var urlModel = {
            url: "/CTI/SilenceManager/AuthenticateCall",
            data: { identifier: identifier }
        };
        getView(urlModel);
    }

    function impersonateCall(identifier) {
        var urlModel = {
            url: "/CTI/SilenceManager/ImpersonateCall",
            data: { identifier: identifier }
        };
        getView(urlModel);
    }

    function confirmAuthenticateCall(identifier, outbound) {
        var clientNumber = $('#clientNumberToAuthenticate').val();
        var accessCodeInput = $('#accessCodeToAuthenticate');
        var accessCode = "";

        if (accessCodeInput !== null) {
            accessCode = accessCodeInput.val();
        }

        var urlModel = {
            url: "/CTI/SilenceManager/ConfirmAuthenticateCall",
            type: "POST",
            data: { identifier: identifier, clientNumber: clientNumber, accessCode: accessCode, interactionType: outbound }
        };

        if (outbound) {
            ajaxCallOutbound(urlModel);
        } else {
            ajaxCall(urlModel, $('#divPartialViewContent'));
        }
    }

    function transferMoney(identifier) {
        var urlModel = {
            url: "/CTI/SilenceManager/DoTransferMoney",
            data: { identifier: identifier }
        };
        getView(urlModel);
    }

    function confirmTransferMoney(identifier) {
        var accountNumber = $('#AccountNumberOfTransfer').val();
        var destinationAccountNumber = $('#DestinationAccountNumberOfTransfer').val();
        var amountToTransfer = $('#AmountOfTransfer').val();
        var currency = $('#CurrencyOfTransfer').val();
        var description = $('#DescriptionOfTransfer').val();

        var urlModel = {
            url: "/CTI/SilenceManager/CofirmDoTransferMoney",
            type: "POST",
            data: { interactionId: identifier, accountNumber: accountNumber, destinationAccountNumber: destinationAccountNumber, amount: amountToTransfer, currency: currency, description: description }
        };

        ajaxCall(urlModel, $('#divPartialViewContent'));
    }


    function transferCall(username, identifier) {
        var urlModel = {
            url: "/CTI/SilenceManager/TransferCall",
            data: { identifier: identifier, username: username }
        };
        getView(urlModel);
    }

    function confirmTransferCall(identifier, username) {
        var toExtension = $('#ExtensionToTransfer').val();

        var urlModel = {
            url: "/CTI/SilenceManager/ConfirmTransferCall",
            type: "POST",
            data: { identifier: identifier, username: username, toExtension: toExtension }
        };

        ajaxCall(urlModel, $('#divPartialViewContent'));
    }

    function transferCallToIvr(username, identifier) {
        var urlModel = {
            url: "/CTI/SilenceManager/TransferToIvr",
            type: "POST",
            data: { username: username, identifier: identifier }
        };

        ajaxCall(urlModel, $('#simulatorBodyId'));
    }

    function transferCallFromIvr(identifier) {
        var urlModel = {
            url: "/CTI/SilenceManager/TransferFromIvr",
            type: "POST",
            data: { identifier: identifier }
        };

        ajaxCall(urlModel, $('#simulatorBodyId'));
    }

    function getView(urlModel) {
        $.ajax({
            url: urlModel.url,
            data: urlModel.data,
            success: function (result) {
                $('#partialViewContainer')[0].style.display = "block";
                $('#partialViewBody').append(result);
            },
            error: error
        });
    }

    function ajaxCallOutbound(urlModel) {
        $.ajax({
            url: urlModel.url,
            type: urlModel.type,
            data: urlModel.data,
            success: function () {
                window.open("/CTI/SilenceManager", "_self");
            },
            error: error
        });
    }

    function ajaxCall(urlModel, container) {
        $.ajax({
            url: urlModel.url,
            beforeSend: function () {
                $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());
            },
            type: urlModel.type,
            data: urlModel.data,
            success: function () {
                $.LoadingSpin("hide", 'body');
                closePartialView();
            },
            error: error
        });
    }

    function closePartialView() {
        var popUp = $("#partialViewContainer");
        popUp[0].style.display = "none";
        $('#partialViewBody').empty();

        $('#simulatorBodyId').load(document.URL + ' #simulatorBodyId');
    }

    return {
        ignoreCall: ignoreCall,
        answerCall: answerCall,
        autenticateOperator: autenticateOperator,
        logoutOperator: logoutOperator,
        selectUser: selectUser,
        generateNewinteraction: generateNewinteraction,
        assignToOperator: assignToOperator,
        confirmAssignToOperator: confirmAssignToOperator,
        callStart: callStart,
        callEnd: callEnd,
        closeInteraction: closeInteraction,
        closeEmail: closeEmail,
        identifyCall: identifyCall,
        confirmIdentifyCall: confirmIdentifyCall,
        authenticateCall: authenticateCall,
        confirmAuthenticateCall: confirmAuthenticateCall,
        impersonateCall: impersonateCall,
        transferMoney: transferMoney,
        confirmTransferMoney: confirmTransferMoney,
        transferCall: transferCall,
        confirmTransferCall: confirmTransferCall,
        transferCallToIvr: transferCallToIvr,
        transferCallFromIvr: transferCallFromIvr
    };

}());
