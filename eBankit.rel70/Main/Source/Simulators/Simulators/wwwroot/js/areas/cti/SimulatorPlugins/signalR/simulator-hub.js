

function SimulatorHub() {

    var setAuthUser = function (connectionId) {
        var tS = new Date().getTime();
        console.log("Registering on platform");

        $.get("/CTI/MediaBarManager/RegisterAuthUser/" + connectionId + "?t=" + tS, function (data) {

            console.log("user :" + data + " established ");

        });
    };

    var callIncoming = function (extension, interactionId, toNumber) {
        $("#extensionCall").text(extension);
        $("#callToNumber").text(toNumber);
        $("#interactionid").text(interactionId);
        $("#modalTittle").text("New Call Incoming");
        $("#interactionIdCall").val(interactionId);

        $("#closePopUp").css("display", "none");
        $("#divInformation").css("display", "none");
        $("#answerCallModal")[0].style.display = "block";
    };

    var callAnswered = function (interactionId) {
        $("#divExtensionCall").css("display", "none");
        $("#divCallToNumber").css("display", "none");
        $("#closePopUp").css("display", "inline-block");
        $("#answerCall").css("display", "none");
        $("#ignoreCall").css("display", "none");

        $("#interactionid").text(interactionId);
        $("#modalTittle").text("Call Answered");
        $("#information").text("Call answered on contact center!");
        $("#answerCallModal")[0].style.display = "block";
    };

    var callTransfered = function (fromExtension, toExtension, interactionId) {
        $("#divExtensionCall").css("display", "none");
        $("#divCallToNumber").css("display", "none");
        $("#closePopUp").css("display", "inline-block");
        $("#answerCall").css("display", "none");
        $("#ignoreCall").css("display", "none");

        $("#interactionid").text(interactionId);
        $("#modalTittle").text("Call Transfer");
        $("#information").text("Call transfered from extension " + fromExtension + " to " + toExtension);
        $("#answerCallModal")[0].style.display = "block";
    };

    var showMessage = function (message) {
        openGenericMessagePopUp(message);
    }

    var updateSimulator = function () {
        $('#simulatorBodyId').load(document.URL + ' #simulatorBodyId');
    };

    return {
        callIncoming: callIncoming,
        updateSimulator: updateSimulator,
        callAnswered: callAnswered,
        callTransfered: callTransfered,
        setAuthUser: setAuthUser,
        showMessage: showMessage
    };
}

const simulatorHubConnection = new signalR.HubConnectionBuilder()
    .withUrl("/signalr/simulator")
    .withAutomaticReconnect()
    .configureLogging(signalR.LogLevel.Error)
    .build();

var simulatorHub = new SimulatorHub();
simulatorHubConnection.on("callIncoming", simulatorHub.callIncoming);
simulatorHubConnection.on("updateSimulator", simulatorHub.updateSimulator);
simulatorHubConnection.on("callAnswered", simulatorHub.callAnswered);
simulatorHubConnection.on("transferCall", simulatorHub.callTransfered);
simulatorHubConnection.on("setAuthUser", simulatorHub.setAuthUser);
simulatorHubConnection.on("showMessage", simulatorHub.showMessage);

simulatorHubConnection.onclose(function (err) {
    console.log("Disconnected. Reason: " + err);
});

simulatorHubConnection.onreconnecting((error) => {
    console.log('Connection lost due to error "' + error + '". Reconnecting.');
});

simulatorHubConnection.onreconnected((connectionId) => {
    console.log('Connection reestablished. Connected.');
});

$(document).ready(function () {
    simulatorHubConnection.start()
        .then(function () {
            console.log("now connected to simulator");
        })
        .catch(err => console.log("could not connect!" + err));
});
