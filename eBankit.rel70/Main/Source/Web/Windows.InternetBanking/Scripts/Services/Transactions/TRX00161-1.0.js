function reloadOnClose() { 
    var url = baseUrl + 'Security/Transactions/Transactions.aspx?trxid=TRX00161' + eBankit.Presentation.TRX00161.Vars.projectId;
    var selectedAcc = eBankit.Presentation.TRX00161.Vars.selectedAcc();
    var urlWithAcc = selectedAcc != null ? url + "&acc=" + selectedAcc : url;
    window.location.replace(urlWithAcc);  
};

function preventClosePopupOnClickOut() {    
    $('#divModalAlertV1').data('bs.modal').options.backdrop = 'static';
    $('#divModalAlertV1').data('bs.modal').options.keyboard = false;
};