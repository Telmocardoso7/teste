function addExtra(elem) {
    //Get the nodes of td 
    var tableTd = elem.parentNode;
    //Finds the div container, wich will have the inputs
    var container = tableTd.querySelector("#extras");

    //Creates a div container to add a span to close input and to input
    var div = document.createElement("div");
    div.style.display = "inline-flex";

    //Create span
    var span = document.createElement("span");
    span.classList.add("closeIcon");
    span.setAttribute("onclick", "closeInput(this)");

    //Creates the input
    count = parseInt(container.childElementCount) + 1;   //Just for generate a diferent "key" of previous
    var input = document.createElement("input");
    input.type = "text";
    input.name = "ExtraParameters." + count;
    input.id = "ExtraParameters" + count;
    input.classList.add("extrasInput");

    //Append elements to div
    div.appendChild(span);
    div.appendChild(input);
    div.appendChild(document.createElement("br"));

    //Append the input to container
    container.appendChild(div);
}

function closePopUp() {
    var popUp = $("#answerCallModal");
    popUp[0].style.display = "none";
    $('#simulatorBodyId').load(document.URL + ' #simulatorBodyId');
}

function openGenericMessagePopUp(message) {
    $('#genericMessageModalText').text(message);
    var popUp = $("#genericMessageModal");
    popUp[0].style.display = "block";
}

function closeGenericMessagePopUp() {
    var popUp = $("#genericMessageModal");
    popUp[0].style.display = "none";
    $('#simulatorBodyId').load(document.URL + ' #simulatorBodyId');
}

function closePartialView() {
    var popUp = $("#partialViewContainer");
    popUp[0].style.display = "none";
    $('#partialViewBody').empty();

    $('#simulatorBodyId').load(document.URL + ' #simulatorBodyId');
}

function closeInput(elem) {
    var divExtraContainer = elem.parentNode;
    var divContainer = divExtraContainer.parentNode;

    divContainer.removeChild(divExtraContainer);
}

function CallStart(username, identifier) {
    SimulatorServices.callStart(username, identifier);
}

function AnswerCall(identifier) {
    SimulatorServices.answerCall(identifier);
}

function IgnoreCall(identifier) {
    SimulatorServices.ignoreCall(identifier);
}

function AssignToOperator(identifier) {
    SimulatorServices.assignToOperator(identifier);
}

function ConfirmAssignToOperator(identifier) {
    SimulatorServices.confirmAssignToOperator(identifier);
}

function CallEnd(username, identifier) {
    SimulatorServices.callEnd(username, identifier);
}

function GenerateNewInteraction(interactionType) {
    SimulatorServices.generateNewinteraction(interactionType);
}

function CloseInteraction(identifier) {
    SimulatorServices.closeInteraction(identifier);
}

function AutenticateOperator() {
    SimulatorServices.autenticateOperator();
}

function LogoutOperator(username, forceLogout) {
    SimulatorServices.logoutOperator(username, forceLogout);
}

function SelectUser(username) {
    SimulatorServices.selectUser(username);
}

function CloseEmail(identifier) {
    SimulatorServices.closeEmail(identifier);
}

function IdentifyCall(identifier) {
    SimulatorServices.identifyCall(identifier);
}

function ConfirmIdentifyCall(identifier, outbound) {
    SimulatorServices.confirmIdentifyCall(identifier, outbound);
}

function AuthenticateCall(identifier) {
    SimulatorServices.authenticateCall(identifier);
}

function ImpersonateCall(identifier) {
    SimulatorServices.impersonateCall(identifier);
}

function ConfirmAuthenticateCall(identifier, outbound) {
    SimulatorServices.confirmAuthenticateCall(identifier, outbound);
}

function TransferMoney(identifier) {
    SimulatorServices.transferMoney(identifier);
}

function ConfirmTransferMoney(identifier) {
    SimulatorServices.confirmTransferMoney(identifier);
}

function TransferCall(username, identifier) {
    SimulatorServices.transferCall(username, identifier);
}

function ConfirmTransferCall(identifier, username) {
    SimulatorServices.confirmTransferCall(identifier, username);
}

function TransferCallToIvr(identifier, username) {
    SimulatorServices.transferCallToIvr(identifier, username);
}

function TransferCallFromIvr(identifier) {
    SimulatorServices.transferCallFromIvr(identifier);
}

function ForceEndCall(event) {
    event.preventDefault();
    $('input[name=forceEndCall]').val('S');
    $('#form_user_call').submit();
}
