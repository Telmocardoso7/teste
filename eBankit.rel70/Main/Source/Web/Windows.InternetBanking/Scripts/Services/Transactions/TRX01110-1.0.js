eBankit.Presentation.TRX01110 = {};

AddNewLimit = function () {
    eBankit.Presentation.SetBlockPageCommon();
    $('body').block();
    eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX01111' + projId;
};

FilterSearch = function () {
    return $("#aspnetForm").valid();
};